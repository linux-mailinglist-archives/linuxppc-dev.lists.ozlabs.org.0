Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CC559A54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTyc86tmZz3dQd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 23:28:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jhiQhweM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTybX2c6Jz2xCB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 23:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jhiQhweM;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTybN0l8pz4xZj;
	Fri, 24 Jun 2022 23:27:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656077250;
	bh=2yrv1QDh2qCwgqq4o5r6WcPiFkY8lEaMXXvXRN6nlw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jhiQhweMVn0AytfY0jnYLZ+dKerJb9PycXel2CeAc5m+9VAJTcviZPeLbgLX9NRzu
	 9nDml6C9nPNJ4RhFhawKXHSdZlG4NmHEWHI/QFw03kt7wOeVT7YmSs4w/KMrk3lfwn
	 46cFGxJA1Qoxd93fR1kq24kYPL8WtUwZos2oj6xLPF8b4OaHg6Y6ffizppOQDwbdJn
	 dEnsG2lqpd69z49or3qlcjcOUPVmQENaoL+xj0pJ4Jngq6soC4wHRo/JTBE0iTv50W
	 juAqz99lXa/hwzJqpnAskT8YE2+UC2xeITgyMyWsWlF5dPMSnmIjoKoJ9UZUQqYi4E
	 aLiSvjXimk3cw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
In-Reply-To: <20220602175353.68942-5-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-5-cheloha@linux.ibm.com>
Date: Fri, 24 Jun 2022 23:27:24 +1000
Message-ID: <87wnd642f7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

A few comments below ...

Scott Cheloha <cheloha@linux.ibm.com> writes:
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
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>  .../watchdog/watchdog-parameters.rst          |  12 +
>  drivers/watchdog/Kconfig                      |   8 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/pseries-wdt.c                | 264 ++++++++++++++++++
>  4 files changed, 285 insertions(+)
>  create mode 100644 drivers/watchdog/pseries-wdt.c
>
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 223c99361a30..29153eed6689 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -425,6 +425,18 @@ pnx833x_wdt:
>  
>  -------------------------------------------------
>  
> +pseries-wdt:
> +    action:
> +	Action taken when watchdog expires: 0 (power off), 1 (restart),
> +	2 (dump and restart). (default=1)

I doesn't look like these values match what other drivers use to any
great extent.

So why not use the values from PAPR directly?

ie. 1 = power off, 2 = hard reset, 3 = dump & restart.

It seems like it would be easier to follow if the values map directly.

It's possible in future PAPR adds 247 to mean something, in which case
maybe we'd want to map that to a less silly value, but at least for now
the PAPR values are sensible enough.

> +    timeout:
> +	Initial watchdog timeout in seconds. (default=60)

That seems like a pretty common value, I don't see any guidance in PAPR.
Do we have any input from PowerVM on whether that's a good value?

> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> new file mode 100644
> index 000000000000..cfe53587457d
> --- /dev/null
> +++ b/drivers/watchdog/pseries-wdt.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2022 International Business Machines, Inc.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/math.h>
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

This will probably sound like a cranky maintainer rant, but ...,
I really dislike these GETFIELD/SETFIELD macros.

I know you didn't invent them, but I would be much happier if you didn't
use them.

I know they (slightly) simplify things when you're transcribing values
from PAPR into the source, but that happens only once.

And then for the rest of eternity the source is harder to read because
there's this ridiculous level of indirection through insane macros just
to define some constants.

Anyone trying to use a debugger against this code will see a value in
memory like 0x200 and have to sit down and work out which SETFIELD()
macro it corresponds to.

> +/*
> + * The H_WATCHDOG hypercall first appears in PAPR v2.12 and is
> + * described fully in sections 14.5 and 14.15.6.
> + *
> + *
> + * H_WATCHDOG Input
> + *
> + * R4: "flags":
> + *
> + *         Bits 48-55: "operation"
> + *
> + *             0x01  Start Watchdog
> + *             0x02  Stop Watchdog
> + *             0x03  Query Watchdog Capabilities
> + */
> +#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
> +#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
> +#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
> +#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
 
eg, IMHO these are much more reader friendly:

#define PSERIES_WDTF_OP_START		(1 << 8)
#define PSERIES_WDTF_OP_STOP		(2 << 8)
#define PSERIES_WDTF_OP_QUERY		(3 << 8)

> +/*
> + *         Bits 56-63: "timeoutAction" (for "Start Watchdog" only)
> + *
> + *             0x01  Hard poweroff
> + *             0x02  Hard restart
> + *             0x03  Dump restart
> + */
> +#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
> +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
> +#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
> +#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)

These are a slam dunk:

#define PSERIES_WDTF_ACTION_HARD_POWEROFF	1
#define PSERIES_WDTF_ACTION_HARD_RESTART	2
#define PSERIES_WDTF_ACTION_DUMP_RESTART	3

> +
> +/*
> + * H_WATCHDOG Output
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

This one is less obviously better, but I still think it's clearer as all
the logic is there in front of you, rather than hidden in the macro. It
is clearer that we're only returning a 16-bit value.

#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	(((cap) >> 48) & 0xffff)

> +#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)

That's unused.

I guess we're assuming at least one timer is always supported? Seems
reasonable.

> +
> +static const unsigned long pseries_wdt_action[] = {
> +	[0] = PSERIES_WDTF_ACTION_HARD_POWEROFF,
> +	[1] = PSERIES_WDTF_ACTION_HARD_RESTART,
> +	[2] = PSERIES_WDTF_ACTION_DUMP_RESTART,
> +};

If we used the PAPR values we wouldn't need that ^

> +#define WATCHDOG_ACTION 1

DEFAULT_ACTION ?

> +static unsigned int action = WATCHDOG_ACTION;
> +module_param(action, uint, 0444);
> +MODULE_PARM_DESC(action, "Action taken when watchdog expires (default="
> +		 __MODULE_STRING(WATCHDOG_ACTION) ")");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0444);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +#define WATCHDOG_TIMEOUT 60

DEFAULT_TIMEOUT ?

> +static unsigned int timeout = WATCHDOG_TIMEOUT;
> +module_param(timeout, uint, 0444);
> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
> +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> +
> +struct pseries_wdt {
> +	struct watchdog_device wd;
> +	unsigned long action;
> +	unsigned long num;		/* Watchdog numbers are 1-based */

num can just be an int.

But do we even need it, do we anticipate supporting multiple timers?
Should we just hard code '1' ?

> +};
> +
> +static int pseries_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct device *dev = wdd->parent;
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	unsigned long flags, msecs;
> +	long rc;
> +
> +	flags = pw->action | PSERIES_WDTF_OP_START;

We set pw->action at probe time based on the module param action, but
this is the only place we use it.

If we use the PAPR values, this could just be:

      flags = (pw->action << 8) | PSERIES_WDTF_OP_START;

And is there any benefit in storing action in pseries_wdt, we could just
use the module param value here.

> +	msecs = wdd->timeout * 1000UL;
 
Using MSEC_PER_SEC makes it clearer what that conversion is doing.

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

I don't know the watchdog code to know if those make sense.

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
> +	unsigned long cap;
> +	long rc;
> +	struct pseries_wdt *pw;
> +	int err;

Try to use reverse xmas tree for new code please.

> +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> +	if (rc == H_FUNCTION)
> +		return -ENODEV;
> +	if (rc != H_SUCCESS)
> +		return -EIO;
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
> +	if (action >= ARRAY_SIZE(pseries_wdt_action))
> +		return -EINVAL;
> +	pw->action = pseries_wdt_action[action];
> +
> +	pw->wd.parent = &pdev->dev;
> +	pw->wd.info = &pseries_wdt_info;
> +	pw->wd.ops = &pseries_wdt_ops;
> +	pw->wd.min_timeout = DIV_ROUND_UP(PSERIES_WDTQ_MIN_TIMEOUT(cap), 1000);

MSEC_TO_SEC again?

> +	pw->wd.max_timeout = UINT_MAX / 1000;
 
Where does that value come from?

> +	pw->wd.timeout = timeout;
> +	if (watchdog_init_timeout(&pw->wd, 0, NULL))
> +		return -EINVAL;

It's late so maybe I'm misreading it, but does watchdog_init_timeout()
actually clamp the values if we don't pass a timeout?

It looks like basically a nop when we pass timeout_param=0 and dev=NULL.

Which makes me think we aren't checking anywhere that the timeout we are
using >= what firmware will accept.

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

I don't see any handling of the possible requirement to suspend timers
across LPM. I don't think just wiring these up is enough?

> +};
> +module_platform_driver(pseries_wdt_driver);
> +
> +MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
> +MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");

I'd prefer the module authors were just the names, email addresses
inevitably bitrot.

Your email address is in the change log.

cheers

> +MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.27.0
