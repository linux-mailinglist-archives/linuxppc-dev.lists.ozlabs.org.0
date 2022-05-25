Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B85337D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 09:52:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7NbF4kw7z3blB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 17:52:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UvxVt3Ye;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33;
 helo=mail-oa1-x33.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UvxVt3Ye; dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7NZX15BCz3029
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 17:52:18 +1000 (AEST)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-f2c8c0d5bdso289054fac.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 00:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=+2rGeimR/3S5wMgHJVWvTfnPjpfvVw52PictJDh9AJ4=;
 b=UvxVt3Ye+h9I/FrImaSXKi0+IVYiWn9K2tw2/zFAj98js0Ofx9vUm8PobqwFyWSSvK
 yJ9JPYBLs67DsFAiHaf3TGXa99R1ajsk62pmeQ87beZoh1QBQ3mBlNRH21IBb6o7k1dU
 Ax+Kra8jPlsB+i2KDmp+4z7L7giAhGCRZwjL6toidrjM3k/U8llrKvUAyMRlOLeQf83m
 Irl7jUCziK4rUiyRYNa6KtVG8WT8RcZtr1FL7ay9Cxh7A87k7PYxtLSaXGKDxsthzbsG
 JxGth88vcR/FgU1b/41fPpFX3JPAyDjQ7TiBJCQmwR9nwoVCJNSQlwOLRac+EovFmGH7
 iJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=+2rGeimR/3S5wMgHJVWvTfnPjpfvVw52PictJDh9AJ4=;
 b=mfIVWxhVHZLI0AeF4WQYgPIypV50Gkdp8BKI4dC3Md8aiqtsV13RyxucaHn6IX9Ao5
 AcVnHearI8k9d+le6FmwA6T2d3B8zME7Fvcp7VTpFmM017lHi1cQP/TtUGGATG0HVoOa
 8hvy5E/jgfBk9iI9/QHr9dBim2LC7wAHFAkfyp74I/xfgJ+9fd+P7Sb/6Cz8yWOsJMs0
 0AxyEZ/jJXbKvcDnbyZxlRmu32mxZ4xJXV1nUAbCt+EFmOQAezwSX0P6y+fpoj+UzJsR
 rFgvt8ZHg+0iF3WhGAKQJgWW/4n2krqjqA6B6aJ+do/NxUgHZK73zCHuIz8rAYRlge+e
 dzjg==
X-Gm-Message-State: AOAM530b2i61UvesUYn9PjrTQwFPxkoOPKuNDjtuL9TyWn73Bcaneetg
 JArt/FdEWvdbpHOLCK3P/UY=
X-Google-Smtp-Source: ABdhPJx5Kz7wszkQEPBb6WdL+ck/Vjy0HWpifNZx7pyYn5FtF1FY7oWzdUbA/YMaI8PbxSE3tPHvaA==
X-Received: by 2002:a05:6870:9694:b0:f1:9f96:d653 with SMTP id
 o20-20020a056870969400b000f19f96d653mr4658230oaq.74.1653465132409; 
 Wed, 25 May 2022 00:52:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056870d34300b000f193e656c5sm5726098oag.15.2022.05.25.00.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 00:52:11 -0700 (PDT)
Message-ID: <1f007ad5-8367-9593-bb80-d3564f3cf997@roeck-us.net>
Date: Wed, 25 May 2022 00:52:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
 <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
In-Reply-To: <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, vaishnavi@linux.ibm.com,
 npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/24/22 23:35, Alexey Kardashevskiy wrote:
> 
> 
> On 5/21/22 04:35, Scott Cheloha wrote:
>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
>> guest control of one or more virtual watchdog timers.  The timers have
>> millisecond granularity.  The guest is terminated when a timer
>> expires.
>>
>> This patch adds a watchdog driver for these timers, "pseries-wdt".
>>
>> pseries_wdt_probe() currently assumes the existence of only one
>> platform device and always assigns it watchdogNumber 1.  If we ever
>> expose more than one timer to userspace we will need to devise a way
>> to assign a distinct watchdogNumber to each platform device at device
>> registration time.
> 
> 
> This one should go before 4/4 in the series for bisectability.
> 
> What is platform_device_register_simple("pseries-wdt",...) going to do without the driver?
> 
>>
>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>> ---
>>   .../watchdog/watchdog-parameters.rst          |  12 +
>>   drivers/watchdog/Kconfig                      |   8 +
>>   drivers/watchdog/Makefile                     |   1 +
>>   drivers/watchdog/pseries-wdt.c                | 337 ++++++++++++++++++
>>   4 files changed, 358 insertions(+)
>>   create mode 100644 drivers/watchdog/pseries-wdt.c
>>
>> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
>> index 223c99361a30..4ffe725e796c 100644
>> --- a/Documentation/watchdog/watchdog-parameters.rst
>> +++ b/Documentation/watchdog/watchdog-parameters.rst
>> @@ -425,6 +425,18 @@ pnx833x_wdt:
>>   -------------------------------------------------
>> +pseries-wdt:
>> +    action:
>> +    Action taken when watchdog expires: 1 (power off), 2 (restart),
>> +    3 (dump and restart). (default=2)
>> +    timeout:
>> +    Initial watchdog timeout in seconds. (default=60)
>> +    nowayout:
>> +    Watchdog cannot be stopped once started.
>> +    (default=kernel config parameter)
>> +
>> +-------------------------------------------------
>> +
>>   rc32434_wdt:
>>       timeout:
>>       Watchdog timeout value, in seconds (default=20)
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index c4e82a8d863f..06b412603f3e 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1932,6 +1932,14 @@ config MEN_A21_WDT
>>   # PPC64 Architecture
>> +config PSERIES_WDT
>> +    tristate "POWER Architecture Platform Watchdog Timer"
>> +    depends on PPC_PSERIES
>> +    select WATCHDOG_CORE
>> +    help
>> +      Driver for virtual watchdog timers provided by PAPR
>> +      hypervisors (e.g. PowerVM, KVM).
>> +
>>   config WATCHDOG_RTAS
>>       tristate "RTAS watchdog"
>>       depends on PPC_RTAS
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index f7da867e8782..f35660409f17 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
>>   obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>>   # PPC64 Architecture
>> +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
>>   obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
>>   # S390 Architecture
>> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
>> new file mode 100644
>> index 000000000000..f41bc4d3b7a2
>> --- /dev/null
>> +++ b/drivers/watchdog/pseries-wdt.c
>> @@ -0,0 +1,337 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2022 International Business Machines, Inc.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/kernel.h>
>> +#include <linux/limits.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/watchdog.h>
>> +
>> +#define DRV_NAME "pseries-wdt"
>> +
>> +/*
>> + * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
>> + * defining bitfields as described in the PAPR without needing to
>> + * transpose values to the more C-like 63->0 ordering.
>> + */
>> +#define SETFIELD(_v, _b, _e)    \
>> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
>> +#define GETFIELD(_v, _b, _e)    \
>> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
>> +
>> +/*
>> + * H_WATCHDOG Hypercall Input
>> + *
>> + * R4: "flags":
>> + *
>> + *     A 64-bit value structured as follows:
>> + *
>> + *         Bits 0-46: Reserved (must be zero).
>> + */
>> +#define PSERIES_WDTF_RESERVED    PPC_BITMASK(0, 46)
>> +
>> +/*
>> + *         Bit 47: "leaveOtherWatchdogsRunningOnTimeout"
>> + *
>> + *             0  Stop outstanding watchdogs on timeout.
>> + *             1  Leave outstanding watchdogs running on timeout.
>> + */
>> +#define PSERIES_WDTF_LEAVE_OTHER    PPC_BIT(47)
>> +
>> +/*
>> + *         Bits 48-55: "operation"
>> + *
>> + *             0x01  Start Watchdog
>> + *             0x02  Stop Watchdog
>> + *             0x03  Query Watchdog Capabilities
>> + *             0x04  Query Watchdog LPM Requirement
>> + */
>> +#define PSERIES_WDTF_OP(op)        SETFIELD((op), 48, 55)
>> +#define PSERIES_WDTF_OP_START        PSERIES_WDTF_OP(0x1)
>> +#define PSERIES_WDTF_OP_STOP        PSERIES_WDTF_OP(0x2)
>> +#define PSERIES_WDTF_OP_QUERY        PSERIES_WDTF_OP(0x3)
>> +#define PSERIES_WDTF_OP_QUERY_LPM    PSERIES_WDTF_OP(0x4)
>> +
>> +/*
>> + *         Bits 56-63: "timeoutAction"
>> + *
>> + *             0x01  Hard poweroff
>> + *             0x02  Hard restart
>> + *             0x03  Dump restart
>> + */
>> +#define PSERIES_WDTF_ACTION(ac)            SETFIELD(ac, 56, 63)
>> +#define PSERIES_WDTF_ACTION_HARD_POWEROFF    PSERIES_WDTF_ACTION(0x1)
>> +#define PSERIES_WDTF_ACTION_HARD_RESTART    PSERIES_WDTF_ACTION(0x2)
>> +#define PSERIES_WDTF_ACTION_DUMP_RESTART    PSERIES_WDTF_ACTION(0x3)
> 
>> +
>> +/*
>> + * R5: "watchdogNumber":
>> + *
>> + *     The target watchdog.  Watchdog numbers are 1-based.  The
>> + *     maximum supported watchdog number may be obtained via the
>> + *     "Query Watchdog Capabilities" operation.
>> + *
>> + *     This input is ignored for the "Query Watchdog Capabilities"
>> + *     operation.
>> + *
>> + * R6: "timeoutInMs":
>> + *
>> + *     The timeout in milliseconds.  The minimum supported timeout may
>> + *     be obtained via the "Query Watchdog Capabilities" operation.
>> + *
>> + *     This input is ignored for the "Stop Watchdog", "Query Watchdog
>> + *     Capabilities", and "Query Watchdog LPM Requirement" operations.
>> + */
>> +
>> +/*
>> + * H_WATCHDOG Hypercall Output
>> + *
>> + * R3: Return code
>> + *
>> + *     H_SUCCESS    The operation completed.
>> + *
>> + *     H_BUSY        The hypervisor is too busy; retry the operation.
>> + *
>> + *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
>> + *                  "operation" or "timeoutAction" is invalid, or a
>> + *                  reserved bit is set.
>> + *
>> + *     H_P2         The given "watchdogNumber" is zero or exceeds the
>> + *                  supported maximum value.
>> + *
>> + *     H_P3         The given "timeoutInMs" is below the supported
>> + *                  minimum value.
>> + *
>> + *     H_NOOP       The given "watchdogNumber" is already stopped.
>> + *
>> + *     H_HARDWARE   The operation failed for ineffable reasons.
>> + *
>> + *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
>> + *                  hypervisor.
>> + *
>> + * R4:
>> + *
>> + * - For the "Query Watchdog Capabilities" operation, a 64-bit
>> + *   value structured as follows:
>> + *
>> + *       Bits  0-15: The minimum supported timeout in milliseconds.
>> + *       Bits 16-31: The number of watchdogs supported.
>> + *       Bits 32-63: Reserved.
>> + */
>> +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)    GETFIELD((cap), 0, 15)
>> +#define PSERIES_WDTQ_MAX_NUMBER(cap)    GETFIELD((cap), 16, 31)
>> +#define PSERIES_WDTQ_RESERVED        PPC_BITMASK(32, 63)
> 
> PSERIES_WDTQ_RESERVED is not needed as there is a comment above.
> 
>> +
>> +/*
>> + * - For the "Query Watchdog LPM Requirement" operation:
>> + *
>> + *       1  The given "watchdogNumber" must be stopped prior to
>> + *          suspending.
>> + *
>> + *       2  The given "watchdogNumber" does not have to be stopped
>> + *          prior to suspending.
>> + */
>> +#define PSERIES_WDTQL_MUST_STOP        1
>> +#define PSERIES_WDTQL_NEED_NOT_STOP    2
>> +
>> +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
>> +
>> +static int action_get(char *buf, const struct kernel_param *kp)
>> +{
>> +    int val;
>> +
>> +    switch (action) {
>> +    case PSERIES_WDTF_ACTION_HARD_POWEROFF:
>> +        val = 1;
>> +        break;
>> +    case PSERIES_WDTF_ACTION_HARD_RESTART:
>> +        val = 2;
>> +        break;
>> +    case PSERIES_WDTF_ACTION_DUMP_RESTART:
>> +        val = 3;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +    return sprintf(buf, "%d\n", val);
>> +}
>> +
>> +static int action_set(const char *val, const struct kernel_param *kp)
>> +{
>> +    int choice;
>> +
>> +    if (kstrtoint(val, 10, &choice))
>> +        return -EINVAL;
>> +    switch (choice) {
>> +    case 1:
>> +        action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
>> +        return 0;
>> +    case 2:
>> +        action = PSERIES_WDTF_ACTION_HARD_RESTART;
>> +        return 0;
>> +    case 3:
>> +        action = PSERIES_WDTF_ACTION_DUMP_RESTART;
>> +        return 0;
>> +    }
>> +    return -EINVAL;
>> +}
>> +
>> +static const struct kernel_param_ops action_ops = {
>> +    .get = action_get,
>> +    .set = action_set,
>> +};
>> +module_param_cb(action, &action_ops, NULL, 0444);
> 
> 
> 0644 here and below?
> 

That would make the module parameters have to be runtime
configurable, which does not make sense at least for
the two parameters below. I don't know though if it is
really valuable to have all the above code instead of just
storing the action numbers and doing the conversion to action
once in the probe function. The above code really only
makes sense if the action is changeable during runtime and more
is done that just converting it to another value.

>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires (default=2)");
>> +
>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>> +module_param(nowayout, bool, 0444);
>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>> +         __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>> +
>> +#define WATCHDOG_TIMEOUT 60
>> +static unsigned int timeout = WATCHDOG_TIMEOUT;
>> +module_param(timeout, uint, 0444);
>> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
>> +         __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>> +
>> +struct pseries_wdt {
>> +    struct watchdog_device wd;
>> +    unsigned long num;        /* Watchdog numbers are 1-based */
>> +};
>> +
>> +static int pseries_wdt_start(struct watchdog_device *wdd)
>> +{
>> +    struct device *dev = wdd->parent;
>> +    struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
>> +    unsigned long flags, msecs;
>> +    long rc;
>> +
>> +    flags = action | PSERIES_WDTF_OP_START;
>> +    msecs = wdd->timeout * 1000UL;
>> +    rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
>> +    if (rc != H_SUCCESS) {
>> +        dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
>> +             rc, pw->num);
>> +        return -EIO;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int pseries_wdt_stop(struct watchdog_device *wdd)
>> +{
>> +    struct device *dev = wdd->parent;
>> +    struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
>> +    long rc;
>> +
>> +    rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
>> +    if (rc != H_SUCCESS && rc != H_NOOP) {
>> +        dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
>> +             rc, pw->num);
>> +        return -EIO;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static struct watchdog_info pseries_wdt_info = {
>> +    .identity = DRV_NAME,
>> +    .options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
>> +        | WDIOF_PRETIMEOUT,
>> +};
>> +
>> +static const struct watchdog_ops pseries_wdt_ops = {
>> +    .owner = THIS_MODULE,
>> +    .start = pseries_wdt_start,
>> +    .stop = pseries_wdt_stop,
>> +};
>> +
>> +static int pseries_wdt_probe(struct platform_device *pdev)
>> +{
>> +    unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
>> +    unsigned long cap, min_timeout_ms;
>> +    long rc;
>> +    struct pseries_wdt *pw;
>> +    int err;
>> +
>> +    rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
>> +    if (rc != H_SUCCESS)
>> +        return rc == H_FUNCTION ? -ENODEV : -EIO;
> 
> Nit:
> 
> if (rc == H_FUNCTION)
>      return -ENODEV;
> if (rc != H_SUCCESS)
>      return -EIO;
> 
> ?
> 
>> +    cap = ret[0];
>> +
>> +    pw = devm_kzalloc(&pdev->dev, sizeof(*pw), GFP_KERNEL);
>> +    if (!pw)
>> +        return -ENOMEM;
>> +
>> +    /*
>> +     * Assume watchdogNumber 1 for now.  If we ever support
>> +     * multiple timers we will need to devise a way to choose a
>> +     * distinct watchdogNumber for each platform device at device
>> +     * registration time.
>> +     */
>> +    pw->num = 1;
>> +
>> +    pw->wd.parent = &pdev->dev;
>> +    pw->wd.info = &pseries_wdt_info;
>> +    pw->wd.ops = &pseries_wdt_ops;
>> +    min_timeout_ms = PSERIES_WDTQ_MIN_TIMEOUT(cap);
>> +    pw->wd.min_timeout = roundup(min_timeout_ms, 1000) / 1000;

Any reason for not using min_hw_heartbeat_ms (or, for that matter,
at least DIV_ROUND_UP) ?

>> +    pw->wd.max_timeout = UINT_MAX;

This will overflow on builds with sizeof(int) == sizeof(long).


>> +    watchdog_init_timeout(&pw->wd, timeout, NULL);
> 
> 
> If PSERIES_WDTF_OP_QUERY returns 2min and this driver's default is 1min, watchdog_init_timeout() returns an error, don't we want to handle it here? Thanks,
> 

Normally one would set pw->wd.timeout to WATCHDOG_TIMEOUT
and pre-initialize the module parameter with 0. That would
take care of the problem and at the same time permit the
use of the timeout-sec devicetree property on dt systems
(which I guess isn't a concern here).

> 
>> +    watchdog_set_nowayout(&pw->wd, nowayout);
>> +    watchdog_stop_on_reboot(&pw->wd);
>> +    watchdog_stop_on_unregister(&pw->wd);
>> +    watchdog_set_drvdata(&pw->wd, pw);
>> +
>> +    err = devm_watchdog_register_device(&pdev->dev, &pw->wd);
>> +    if (err)
>> +        return err;
>> +
>> +    platform_set_drvdata(pdev, &pw->wd);
>> +
>> +    return 0;
>> +}
>> +
>> +static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
>> +{
>> +    struct watchdog_device *wd = platform_get_drvdata(pdev);
>> +
>> +    if (watchdog_active(wd))
>> +        return pseries_wdt_stop(wd);
>> +    return 0;
>> +}
>> +
>> +static int pseries_wdt_resume(struct platform_device *pdev)
>> +{
>> +    struct watchdog_device *wd = platform_get_drvdata(pdev);
>> +
>> +    if (watchdog_active(wd))
>> +        return pseries_wdt_start(wd);
>> +    return 0;
>> +}
>> +
>> +static const struct platform_device_id pseries_wdt_id[] = {
>> +    { .name = "pseries-wdt" },
>> +    {}
>> +};
>> +MODULE_DEVICE_TABLE(platform, pseries_wdt_id);
>> +
>> +static struct platform_driver pseries_wdt_driver = {
>> +    .driver = {
>> +        .name = DRV_NAME,
>> +        .owner = THIS_MODULE,
>> +    },
>> +    .id_table = pseries_wdt_id,
>> +    .probe = pseries_wdt_probe,
>> +    .resume = pseries_wdt_resume,
>> +    .suspend = pseries_wdt_suspend,
>> +};
>> +module_platform_driver(pseries_wdt_driver);
>> +
>> +MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
>> +MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
>> +MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
>> +MODULE_LICENSE("GPL");
> 

