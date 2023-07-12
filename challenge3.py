def get_nested_value(obj, key):
    keys = key.split('/')
    value = obj
    try:
        for k in keys:
            if isinstance(value, dict):
                value = value[k]
            elif isinstance(value, list):
                value = value[int(k)]
            else:
                return None
    except (KeyError, IndexError, TypeError):
        return None

    return value