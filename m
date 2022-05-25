Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9935336CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 08:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7LtW5xlpz3bfr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 16:36:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=CX5bsQ+a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=CX5bsQ+a; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Lsp1XjKz2ypR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 16:35:23 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id g184so18153093pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6RbBDc3EKDxCJAFxOVfwzyl9+sIyxVFnU84xiwb6G9Y=;
 b=CX5bsQ+aKz/I9ndYItxMLJA+i/1TIveTbcD5o3PuwUdJ/0BB3VQCKACaZEhHLwr/IB
 VaqMXgtk/JSxD6OAWnACaE2Q3OR6xPfxBveJXamTWV1ori9y0/lAdYpYd7Lm5NSSgoUt
 ORQiljRBJdvxPGM3ne8EqlZpmP6Vy2UzW0XcAW4hsiEJo9HYxXdsDsL2fDUjANuTCYbo
 H9AgJN5zVu9jtoIaDQoeyTUEM4juNkLEayrtzbO/0SBnNpJILlLtXtAtrzDjMQftEIn7
 Hj2nPhgt3cwqUlVHRRT7YgqLWVq3qTJ3JviY9ZZOcbrG49OZBZCVJo/GvhvG9iBIQyD5
 0obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6RbBDc3EKDxCJAFxOVfwzyl9+sIyxVFnU84xiwb6G9Y=;
 b=p+dhwiZfm/CUpBWJGnDM1GJovzNV3UqkWg0c0ruTKjJGAb0f9OkEKH/Pk/nIU2d6Yv
 UY4IpgiSB1umyGqEjqbXIBnxsk4coUGVKFQdYaTi8eXgn0E2H9+mmEcLpbEEHNT9YXeJ
 Fx8qzgucVzftA4vced2Ffx2ug74fECqG1ksjVxcKTD8jTlIzut1Sl5SCMyK0ApNab4Ii
 EPFchOL2GEudB58dX7hI+0XaGGVUfjjN1XO+TK/AC+pX9Dv+YD2vc29VLHhHvvsb6YZc
 20yURIqEzAcsN0xfMmeGzJSQXMCc3OkYqc+PNhWnTLuTLxQj+DveKHuUOV4AVXE8bNAZ
 oXuQ==
X-Gm-Message-State: AOAM532RPlsbr6rmkzZSstLtLMmZrap1G3iy7moi2mg2jEHznoyIlUJe
 3ve+TdPKwJ+Mq4q8U8MI4waxuA==
X-Google-Smtp-Source: ABdhPJzi4DszV5ghijO5ccUy7E8/XMsWiim/gGTCzKEvAI4ulfHg/ne4MTiodXNQs+ypx3i6tmJ/XA==
X-Received: by 2002:a63:1163:0:b0:3fa:5e1c:f86f with SMTP id
 35-20020a631163000000b003fa5e1cf86fmr11075618pgr.543.1653460518739; 
 Tue, 24 May 2022 23:35:18 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 d73-20020a63364c000000b003f70a4445bfsm7701194pga.28.2022.05.24.23.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 23:35:18 -0700 (PDT)
Message-ID: <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
Date: Wed, 25 May 2022 16:35:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:101.0) Gecko/20100101
 Thunderbird/101.0
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
Content-Language: en-US
To: Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220520183552.33426-5-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/21/22 04:35, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> guest control of one or more virtual watchdog timers.  The timers have
> millisecond granularity.  The guest is terminated when a timer
> expires.
> 
> This patch adds a watchdog driver for these timers, "pseries-wdt".
> 
> pseries_wdt_probe() currently assumes the existence of only one
> platform device and always assigns it watchdogNumber 1.  If we ever
> expose more than one timer to userspace we will need to devise a way
> to assign a distinct watchdogNumber to each platform device at device
> registration time.


This one should go before 4/4 in the series for bisectability.

What is platform_device_register_simple("pseries-wdt",...) going to do 
without the driver?

> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>   .../watchdog/watchdog-parameters.rst          |  12 +
>   drivers/watchdog/Kconfig                      |   8 +
>   drivers/watchdog/Makefile                     |   1 +
>   drivers/watchdog/pseries-wdt.c                | 337 ++++++++++++++++++
>   4 files changed, 358 insertions(+)
>   create mode 100644 drivers/watchdog/pseries-wdt.c
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 223c99361a30..4ffe725e796c 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -425,6 +425,18 @@ pnx833x_wdt:
>   
>   -------------------------------------------------
>   
> +pseries-wdt:
> +    action:
> +	Action taken when watchdog expires: 1 (power off), 2 (restart),
> +	3 (dump and restart). (default=2)
> +    timeout:
> +	Initial watchdog timeout in seconds. (default=60)
> +    nowayout:
> +	Watchdog cannot be stopped once started.
> +	(default=kernel config parameter)
> +
> +-------------------------------------------------
> +
>   rc32434_wdt:
>       timeout:
>   	Watchdog timeout value, in seconds (default=20)
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c4e82a8d863f..06b412603f3e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1932,6 +1932,14 @@ config MEN_A21_WDT
>   
>   # PPC64 Architecture
>   
> +config PSERIES_WDT
> +	tristate "POWER Architecture Platform Watchdog Timer"
> +	depends on PPC_PSERIES
> +	select WATCHDOG_CORE
> +	help
> +	  Driver for virtual watchdog timers provided by PAPR
> +	  hypervisors (e.g. PowerVM, KVM).
> +
>   config WATCHDOG_RTAS
>   	tristate "RTAS watchdog"
>   	depends on PPC_RTAS
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index f7da867e8782..f35660409f17 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
>   obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>   
>   # PPC64 Architecture
> +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
>   obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
>   
>   # S390 Architecture
> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> new file mode 100644
> index 000000000000..f41bc4d3b7a2
> --- /dev/null
> +++ b/drivers/watchdog/pseries-wdt.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2022 International Business Machines, Inc.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define DRV_NAME "pseries-wdt"
> +
> +/*
> + * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
> + * defining bitfields as described in the PAPR without needing to
> + * transpose values to the more C-like 63->0 ordering.
> + */
> +#define SETFIELD(_v, _b, _e)	\
> +	(((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
> +#define GETFIELD(_v, _b, _e)	\
> +	(((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
> +
> +/*
> + * H_WATCHDOG Hypercall Input
> + *
> + * R4: "flags":
> + *
> + *     A 64-bit value structured as follows:
> + *
> + *         Bits 0-46: Reserved (must be zero).
> + */
> +#define PSERIES_WDTF_RESERVED	PPC_BITMASK(0, 46)
> +
> +/*
> + *         Bit 47: "leaveOtherWatchdogsRunningOnTimeout"
> + *
> + *             0  Stop outstanding watchdogs on timeout.
> + *             1  Leave outstanding watchdogs running on timeout.
> + */
> +#define PSERIES_WDTF_LEAVE_OTHER	PPC_BIT(47)
> +
> +/*
> + *         Bits 48-55: "operation"
> + *
> + *             0x01  Start Watchdog
> + *             0x02  Stop Watchdog
> + *             0x03  Query Watchdog Capabilities
> + *             0x04  Query Watchdog LPM Requirement
> + */
> +#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
> +#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
> +#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
> +#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
> +#define PSERIES_WDTF_OP_QUERY_LPM	PSERIES_WDTF_OP(0x4)
> +
> +/*
> + *         Bits 56-63: "timeoutAction"
> + *
> + *             0x01  Hard poweroff
> + *             0x02  Hard restart
> + *             0x03  Dump restart
> + */
> +#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
> +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
> +#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
> +#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)

> +
> +/*
> + * R5: "watchdogNumber":
> + *
> + *     The target watchdog.  Watchdog numbers are 1-based.  The
> + *     maximum supported watchdog number may be obtained via the
> + *     "Query Watchdog Capabilities" operation.
> + *
> + *     This input is ignored for the "Query Watchdog Capabilities"
> + *     operation.
> + *
> + * R6: "timeoutInMs":
> + *
> + *     The timeout in milliseconds.  The minimum supported timeout may
> + *     be obtained via the "Query Watchdog Capabilities" operation.
> + *
> + *     This input is ignored for the "Stop Watchdog", "Query Watchdog
> + *     Capabilities", and "Query Watchdog LPM Requirement" operations.
> + */
> +
> +/*
> + * H_WATCHDOG Hypercall Output
> + *
> + * R3: Return code
> + *
> + *     H_SUCCESS    The operation completed.
> + *
> + *     H_BUSY	    The hypervisor is too busy; retry the operation.
> + *
> + *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
> + *                  "operation" or "timeoutAction" is invalid, or a
> + *                  reserved bit is set.
> + *
> + *     H_P2         The given "watchdogNumber" is zero or exceeds the
> + *                  supported maximum value.
> + *
> + *     H_P3         The given "timeoutInMs" is below the supported
> + *                  minimum value.
> + *
> + *     H_NOOP       The given "watchdogNumber" is already stopped.
> + *
> + *     H_HARDWARE   The operation failed for ineffable reasons.
> + *
> + *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
> + *                  hypervisor.
> + *
> + * R4:
> + *
> + * - For the "Query Watchdog Capabilities" operation, a 64-bit
> + *   value structured as follows:
> + *
> + *       Bits  0-15: The minimum supported timeout in milliseconds.
> + *       Bits 16-31: The number of watchdogs supported.
> + *       Bits 32-63: Reserved.
> + */
> +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
> +#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
> +#define PSERIES_WDTQ_RESERVED		PPC_BITMASK(32, 63)

PSERIES_WDTQ_RESERVED is not needed as there is a comment above.

> +
> +/*
> + * - For the "Query Watchdog LPM Requirement" operation:
> + *
> + *       1  The given "watchdogNumber" must be stopped prior to
> + *          suspending.
> + *
> + *       2  The given "watchdogNumber" does not have to be stopped
> + *          prior to suspending.
> + */
> +#define PSERIES_WDTQL_MUST_STOP		1
> +#define PSERIES_WDTQL_NEED_NOT_STOP	2
> +
> +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
> +
> +static int action_get(char *buf, const struct kernel_param *kp)
> +{
> +	int val;
> +
> +	switch (action) {
> +	case PSERIES_WDTF_ACTION_HARD_POWEROFF:
> +		val = 1;
> +		break;
> +	case PSERIES_WDTF_ACTION_HARD_RESTART:
> +		val = 2;
> +		break;
> +	case PSERIES_WDTF_ACTION_DUMP_RESTART:
> +		val = 3;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return sprintf(buf, "%d\n", val);
> +}
> +
> +static int action_set(const char *val, const struct kernel_param *kp)
> +{
> +	int choice;
> +
> +	if (kstrtoint(val, 10, &choice))
> +		return -EINVAL;
> +	switch (choice) {
> +	case 1:
> +		action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
> +		return 0;
> +	case 2:
> +		action = PSERIES_WDTF_ACTION_HARD_RESTART;
> +		return 0;
> +	case 3:
> +		action = PSERIES_WDTF_ACTION_DUMP_RESTART;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static const struct kernel_param_ops action_ops = {
> +	.get = action_get,
> +	.set = action_set,
> +};
> +module_param_cb(action, &action_ops, NULL, 0444);


0644 here and below?

> +MODULE_PARM_DESC(action, "Action taken when watchdog expires (default=2)");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0444);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +#define WATCHDOG_TIMEOUT 60
> +static unsigned int timeout = WATCHDOG_TIMEOUT;
> +module_param(timeout, uint, 0444);
> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
> +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> +
> +struct pseries_wdt {
> +	struct watchdog_device wd;
> +	unsigned long num;		/* Watchdog numbers are 1-based */
> +};
> +
> +static int pseries_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct device *dev = wdd->parent;
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	unsigned long flags, msecs;
> +	long rc;
> +
> +	flags = action | PSERIES_WDTF_OP_START;
> +	msecs = wdd->timeout * 1000UL;
> +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
> +	if (rc != H_SUCCESS) {
> +		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
> +			 rc, pw->num);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static int pseries_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct device *dev = wdd->parent;
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	long rc;
> +
> +	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
> +	if (rc != H_SUCCESS && rc != H_NOOP) {
> +		dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
> +			 rc, pw->num);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static struct watchdog_info pseries_wdt_info = {
> +	.identity = DRV_NAME,
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
> +	    | WDIOF_PRETIMEOUT,
> +};
> +
> +static const struct watchdog_ops pseries_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pseries_wdt_start,
> +	.stop = pseries_wdt_stop,
> +};
> +
> +static int pseries_wdt_probe(struct platform_device *pdev)
> +{
> +	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	unsigned long cap, min_timeout_ms;
> +	long rc;
> +	struct pseries_wdt *pw;
> +	int err;
> +
> +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> +	if (rc != H_SUCCESS)
> +		return rc == H_FUNCTION ? -ENODEV : -EIO;

Nit:

if (rc == H_FUNCTION)
	return -ENODEV;
if (rc != H_SUCCESS)
	return -EIO;

?

> +	cap = ret[0];
> +
> +	pw = devm_kzalloc(&pdev->dev, sizeof(*pw), GFP_KERNEL);
> +	if (!pw)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Assume watchdogNumber 1 for now.  If we ever support
> +	 * multiple timers we will need to devise a way to choose a
> +	 * distinct watchdogNumber for each platform device at device
> +	 * registration time.
> +	 */
> +	pw->num = 1;
> +
> +	pw->wd.parent = &pdev->dev;
> +	pw->wd.info = &pseries_wdt_info;
> +	pw->wd.ops = &pseries_wdt_ops;
> +	min_timeout_ms = PSERIES_WDTQ_MIN_TIMEOUT(cap);
> +	pw->wd.min_timeout = roundup(min_timeout_ms, 1000) / 1000;
> +	pw->wd.max_timeout = UINT_MAX;
> +	watchdog_init_timeout(&pw->wd, timeout, NULL);


If PSERIES_WDTF_OP_QUERY returns 2min and this driver's default is 1min, 
watchdog_init_timeout() returns an error, don't we want to handle it 
here? Thanks,


> +	watchdog_set_nowayout(&pw->wd, nowayout);
> +	watchdog_stop_on_reboot(&pw->wd);
> +	watchdog_stop_on_unregister(&pw->wd);
> +	watchdog_set_drvdata(&pw->wd, pw);
> +
> +	err = devm_watchdog_register_device(&pdev->dev, &pw->wd);
> +	if (err)
> +		return err;
> +
> +	platform_set_drvdata(pdev, &pw->wd);
> +
> +	return 0;
> +}
> +
> +static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct watchdog_device *wd = platform_get_drvdata(pdev);
> +
> +	if (watchdog_active(wd))
> +		return pseries_wdt_stop(wd);
> +	return 0;
> +}
> +
> +static int pseries_wdt_resume(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wd = platform_get_drvdata(pdev);
> +
> +	if (watchdog_active(wd))
> +		return pseries_wdt_start(wd);
> +	return 0;
> +}
> +
> +static const struct platform_device_id pseries_wdt_id[] = {
> +	{ .name = "pseries-wdt" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, pseries_wdt_id);
> +
> +static struct platform_driver pseries_wdt_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.owner = THIS_MODULE,
> +	},
> +	.id_table = pseries_wdt_id,
> +	.probe = pseries_wdt_probe,
> +	.resume = pseries_wdt_resume,
> +	.suspend = pseries_wdt_suspend,
> +};
> +module_platform_driver(pseries_wdt_driver);
> +
> +MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
> +MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
> +MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
> +MODULE_LICENSE("GPL");

-- 
Alexey
