Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0B56B26C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 07:52:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfMqx5c18z3c6D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 15:52:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+6BN87S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+6BN87S;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfMqB5z0dz3blD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 15:51:50 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2685Gmn2021738;
	Fri, 8 Jul 2022 05:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=bGIyqHtXJeWH/VyF3aWzKheqYMWhw/xbekUjiI7iI5o=;
 b=X+6BN87S6jqnrFTWiRLLDKN1Kpak+xotj7wqYxqZFpkJYJsIzPyLAd+tb00UzzRdWsV8
 bcYK4TIFpv1FMNpf6phNMWghL9+ujyFbt/DrtlxzApItd/sMniXxP4fCSNXuc+Gw7fH3
 AeLT8PpJvwDdx95Gs9x3iwLKe/GlMPbp50BmZRONDh8F4DIxCWZAUqJVULqUp/YAo+3C
 Ijh5zYuDwjebM5gpX/vj9Typk6zHkBH6is/BKtOIz9bgxcujLG/ONNV6S2emNfH1tUC+
 UOWnz7RAYu2fqY42O24uTGvWYDnwUK2L77OMfyt3l/UO9xH629O/9MMXKydnSpUMIa0d WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6e9ygr4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Jul 2022 05:51:38 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2685aNDR017078;
	Fri, 8 Jul 2022 05:51:37 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6e9ygr46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Jul 2022 05:51:37 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2685pE8l012908;
	Fri, 8 Jul 2022 05:51:36 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma02wdc.us.ibm.com with ESMTP id 3h4ucy0my7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Jul 2022 05:51:36 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2685pa6r65733100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Jul 2022 05:51:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1601F112061;
	Fri,  8 Jul 2022 05:51:36 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF98A112064;
	Fri,  8 Jul 2022 05:51:35 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  8 Jul 2022 05:51:35 +0000 (GMT)
Date: Fri, 8 Jul 2022 00:51:35 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Message-ID: <YsfF53LpfmxXD5I5@rascal-austin-ibm-com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-5-cheloha@linux.ibm.com>
 <87wnd642f7.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnd642f7.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r-lfF5N8HDaNppx0Vu4PLd9vE8Awx92a
X-Proofpoint-ORIG-GUID: BwX92cW7z_afquM3A-hV1Ib3enrldFWH
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080018
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 11:27:24PM +1000, Michael Ellerman wrote:
> Hi Scott,
> 
> A few comments below ...
> 
> Scott Cheloha <cheloha@linux.ibm.com> writes:
> > 
> > [...]
> > 
> > diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> > index 223c99361a30..29153eed6689 100644
> > --- a/Documentation/watchdog/watchdog-parameters.rst
> > +++ b/Documentation/watchdog/watchdog-parameters.rst
> > @@ -425,6 +425,18 @@ pnx833x_wdt:
> >  
> >  -------------------------------------------------
> >  
> > +pseries-wdt:
> > +    action:
> > +	Action taken when watchdog expires: 0 (power off), 1 (restart),
> > +	2 (dump and restart). (default=1)
> 
> I doesn't look like these values match what other drivers use to any
> great extent.
> 
> So why not use the values from PAPR directly?
> 
> ie. 1 = power off, 2 = hard reset, 3 = dump & restart.
> 
> It seems like it would be easier to follow if the values map directly.
> 
> It's possible in future PAPR adds 247 to mean something, in which case
> maybe we'd want to map that to a less silly value, but at least for now
> the PAPR values are sensible enough.

I tried using 1-2-3 in Patch v1 but Guenter objected and we switched:

https://lore.kernel.org/linux-watchdog/a6090ef3-f597-e10b-010b-cc32bff08c93@roeck-us.net/

I think the code is fine to read as-is.  We're not expecting the
administrator to read the PAPR, right?  So 1-2-3 is not any more
intuitive for the user than 0-1-2.

Given that it's all arbitrary and there aren't any hard rules for
module parameters outside of general programmer "that seems
fine"-ness, I would really like to leave the numbers as-is.

> > +    timeout:
> > +	Initial watchdog timeout in seconds. (default=60)
> 
> That seems like a pretty common value, I don't see any guidance in PAPR.
> Do we have any input from PowerVM on whether that's a good value?

Currently the minimum timeout is 500ms on all the builds I've tried.
I doubt the minimum will ever be anywhere near as large as 60s on a
practical H_WATCHDOG implementation, so I don't think there is any
risk of the driver failing to probe.

Real software using the watchdog API will set a timeout to a smaller
value if it needs to.

60 seconds gives userland ample time to reconfigure the watchdog
without risk of it expiring in the midst of a bunch of ioctl(2) calls
before they reach the main loop.

> > diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> > new file mode 100644
> > index 000000000000..cfe53587457d
> > --- /dev/null
> > +++ b/drivers/watchdog/pseries-wdt.c
> > @@ -0,0 +1,264 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2022 International Business Machines, Inc.
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/kernel.h>
> > +#include <linux/limits.h>
> > +#include <linux/math.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define DRV_NAME "pseries-wdt"
> > +
> > +/*
> > + * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
> > + * defining bitfields as described in the PAPR without needing to
> > + * transpose values to the more C-like 63->0 ordering.
> > + */
> > +#define SETFIELD(_v, _b, _e)	\
> > +	(((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
> > +#define GETFIELD(_v, _b, _e)	\
> > +	(((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
> 
> This will probably sound like a cranky maintainer rant, but ...,
> I really dislike these GETFIELD/SETFIELD macros.
> 
> I know you didn't invent them, but I would be much happier if you didn't
> use them.
> 
> I know they (slightly) simplify things when you're transcribing values
> from PAPR into the source, but that happens only once.
> 
> And then for the rest of eternity the source is harder to read because
> there's this ridiculous level of indirection through insane macros just
> to define some constants.
> 
> Anyone trying to use a debugger against this code will see a value in
> memory like 0x200 and have to sit down and work out which SETFIELD()
> macro it corresponds to.

Don't look at me, I never would have come up with them.  I got them
from Alexey :)

I will drop them.

> > +/*
> > + * The H_WATCHDOG hypercall first appears in PAPR v2.12 and is
> > + * described fully in sections 14.5 and 14.15.6.
> > + *
> > + *
> > + * H_WATCHDOG Input
> > + *
> > + * R4: "flags":
> > + *
> > + *         Bits 48-55: "operation"
> > + *
> > + *             0x01  Start Watchdog
> > + *             0x02  Stop Watchdog
> > + *             0x03  Query Watchdog Capabilities
> > + */
> > +#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
> > +#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
> > +#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
> > +#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
>  
> eg, IMHO these are much more reader friendly:
> 
> #define PSERIES_WDTF_OP_START		(1 << 8)
> #define PSERIES_WDTF_OP_STOP		(2 << 8)
> #define PSERIES_WDTF_OP_QUERY		(3 << 8)
> 
> > +/*
> > + *         Bits 56-63: "timeoutAction" (for "Start Watchdog" only)
> > + *
> > + *             0x01  Hard poweroff
> > + *             0x02  Hard restart
> > + *             0x03  Dump restart
> > + */
> > +#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
> > +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
> > +#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
> > +#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)
> 
> These are a slam dunk:
> 
> #define PSERIES_WDTF_ACTION_HARD_POWEROFF	1
> #define PSERIES_WDTF_ACTION_HARD_RESTART	2
> #define PSERIES_WDTF_ACTION_DUMP_RESTART	3

Yes, yes they are.

> > +
> > +/*
> > + * H_WATCHDOG Output
> > + *
> > + * R3: Return code
> > + *
> > + *     H_SUCCESS    The operation completed.
> > + *
> > + *     H_BUSY	    The hypervisor is too busy; retry the operation.
> > + *
> > + *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
> > + *                  "operation" or "timeoutAction" is invalid, or a
> > + *                  reserved bit is set.
> > + *
> > + *     H_P2         The given "watchdogNumber" is zero or exceeds the
> > + *                  supported maximum value.
> > + *
> > + *     H_P3         The given "timeoutInMs" is below the supported
> > + *                  minimum value.
> > + *
> > + *     H_NOOP       The given "watchdogNumber" is already stopped.
> > + *
> > + *     H_HARDWARE   The operation failed for ineffable reasons.
> > + *
> > + *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
> > + *                  hypervisor.
> > + *
> > + * R4:
> > + *
> > + * - For the "Query Watchdog Capabilities" operation, a 64-bit
> > + *   value structured as follows:
> > + *
> > + *       Bits  0-15: The minimum supported timeout in milliseconds.
> > + *       Bits 16-31: The number of watchdogs supported.
> > + *       Bits 32-63: Reserved.
> > + */
> > +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
> 
> This one is less obviously better, but I still think it's clearer as all
> the logic is there in front of you, rather than hidden in the macro. It
> is clearer that we're only returning a 16-bit value.
> 
> #define PSERIES_WDTQ_MIN_TIMEOUT(cap)	(((cap) >> 48) & 0xffff)
> 
> > +#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
> 
> That's unused.
> 
> I guess we're assuming at least one timer is always supported? Seems
> reasonable.

There is a distinction between "we have support for this hypercall"
and "you have a timer available to you".  We should double-check.

I can't imagine it ever being an issue on a practical, working
implementation, but it might save us some debugging if there is ever a
hypervisor bug where somehow they allocate us zero timers to work
with.

> > +
> > +static const unsigned long pseries_wdt_action[] = {
> > +	[0] = PSERIES_WDTF_ACTION_HARD_POWEROFF,
> > +	[1] = PSERIES_WDTF_ACTION_HARD_RESTART,
> > +	[2] = PSERIES_WDTF_ACTION_DUMP_RESTART,
> > +};
> 
> If we used the PAPR values we wouldn't need that ^
> 
> > +#define WATCHDOG_ACTION 1
> 
> DEFAULT_ACTION ?

The idiom for the default timeout is "WATCHDOG_TIMEOUT" so I went with
"WATCHDOG_ACTION".

> > +static unsigned int action = WATCHDOG_ACTION;
> > +module_param(action, uint, 0444);
> > +MODULE_PARM_DESC(action, "Action taken when watchdog expires (default="
> > +		 __MODULE_STRING(WATCHDOG_ACTION) ")");
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0444);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> > +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +#define WATCHDOG_TIMEOUT 60
> 
> DEFAULT_TIMEOUT ?

"WATCHDOG_TIMEOUT" is the idiomatic name for the default timeout in
drivers/watchdog/.

> > +static unsigned int timeout = WATCHDOG_TIMEOUT;
> > +module_param(timeout, uint, 0444);
> > +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
> > +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> > +
> > +struct pseries_wdt {
> > +	struct watchdog_device wd;
> > +	unsigned long action;
> > +	unsigned long num;		/* Watchdog numbers are 1-based */
> 
> num can just be an int.

It's an argument to the hypercall, which takes an unsigned long.  Do
we need to save 4 bytes?

I guess if we wanted to be precise it should be a 16-bit value.

> But do we even need it, do we anticipate supporting multiple timers?
> Should we just hard code '1' ?

We have not had a serious discussion about whether more timers in
userspace make sense.  This code let's us experiment with it, though.

> > +};
> > +
> > +static int pseries_wdt_start(struct watchdog_device *wdd)
> > +{
> > +	struct device *dev = wdd->parent;
> > +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> > +	unsigned long flags, msecs;
> > +	long rc;
> > +
> > +	flags = pw->action | PSERIES_WDTF_OP_START;
> 
> We set pw->action at probe time based on the module param action, but
> this is the only place we use it.
> 
> If we use the PAPR values, this could just be:
> 
>       flags = (pw->action << 8) | PSERIES_WDTF_OP_START;
> 
> And is there any benefit in storing action in pseries_wdt, we could just
> use the module param value here.

That was Guenter's idea and I went with it.

> > +	msecs = wdd->timeout * 1000UL;
>  
> Using MSEC_PER_SEC makes it clearer what that conversion is doing.

Done.

> > +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
> > +	if (rc != H_SUCCESS) {
> > +		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
> > +			 rc, pw->num);
> > +		return -EIO;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int pseries_wdt_stop(struct watchdog_device *wdd)
> > +{
> > +	struct device *dev = wdd->parent;
> > +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> > +	long rc;
> > +
> > +	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
> > +	if (rc != H_SUCCESS && rc != H_NOOP) {
> > +		dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
> > +			 rc, pw->num);
> > +		return -EIO;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static struct watchdog_info pseries_wdt_info = {
> > +	.identity = DRV_NAME,
> > +	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
> > +	    | WDIOF_PRETIMEOUT,
> 
> I don't know the watchdog code to know if those make sense.

It makes sense.

> > +};
> > +
> > +static const struct watchdog_ops pseries_wdt_ops = {
> > +	.owner = THIS_MODULE,
> > +	.start = pseries_wdt_start,
> > +	.stop = pseries_wdt_stop,
> > +};
> > +
> > +static int pseries_wdt_probe(struct platform_device *pdev)
> > +{
> > +	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
> > +	unsigned long cap;
> > +	long rc;
> > +	struct pseries_wdt *pw;
> > +	int err;
> 
> Try to use reverse xmas tree for new code please.

Is it not good practice to keep declarations of a particular type
adjacent?

It feels... correct-ish to keep the longs together.

In this case there is no downside to doing "reverse xmas tree"
because sizeof(long) is the same as sizeof(void *), but this looks
odd to me:

	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
	struct pseries_wdt *pw;
	unsigned long cap;
	long rc;
	int err;

> > +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> > +	if (rc == H_FUNCTION)
> > +		return -ENODEV;
> > +	if (rc != H_SUCCESS)
> > +		return -EIO;
> > +	cap = ret[0];
> > +
> > +	pw = devm_kzalloc(&pdev->dev, sizeof(*pw), GFP_KERNEL);
> > +	if (!pw)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Assume watchdogNumber 1 for now.  If we ever support
> > +	 * multiple timers we will need to devise a way to choose a
> > +	 * distinct watchdogNumber for each platform device at device
> > +	 * registration time.
> > +	 */
> > +	pw->num = 1;
> > +
> > +	if (action >= ARRAY_SIZE(pseries_wdt_action))
> > +		return -EINVAL;
> > +	pw->action = pseries_wdt_action[action];
> > +
> > +	pw->wd.parent = &pdev->dev;
> > +	pw->wd.info = &pseries_wdt_info;
> > +	pw->wd.ops = &pseries_wdt_ops;
> > +	pw->wd.min_timeout = DIV_ROUND_UP(PSERIES_WDTQ_MIN_TIMEOUT(cap), 1000);
> 
> MSEC_TO_SEC again?

MSEC_PER_SEC, sure.

> > +	pw->wd.max_timeout = UINT_MAX / 1000;
>  
> Where does that value come from?

It's just the maximum value the watchdog framework will accept.  It's
in one of the watchdog headers.

> > +	pw->wd.timeout = timeout;
> > +	if (watchdog_init_timeout(&pw->wd, 0, NULL))
> > +		return -EINVAL;
> 
> It's late so maybe I'm misreading it, but does watchdog_init_timeout()
> actually clamp the values if we don't pass a timeout?
> 
> It looks like basically a nop when we pass timeout_param=0 and dev=NULL.
> 
> Which makes me think we aren't checking anywhere that the timeout we are
> using >= what firmware will accept.

No, watchdog_init_timeout() checks that

	min_timeout <= timeout <= max_timeout

and returns an error if not.  If somehow the minimum timeout exceeds
the default 60 seconds we will catch it here and fail the probe.

> > +	watchdog_set_nowayout(&pw->wd, nowayout);
> > +	watchdog_stop_on_reboot(&pw->wd);
> > +	watchdog_stop_on_unregister(&pw->wd);
> > +	watchdog_set_drvdata(&pw->wd, pw);
> > +
> > +	err = devm_watchdog_register_device(&pdev->dev, &pw->wd);
> > +	if (err)
> > +		return err;
> > +
> > +	platform_set_drvdata(pdev, &pw->wd);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
> > +{
> > +	struct watchdog_device *wd = platform_get_drvdata(pdev);
> > +
> > +	if (watchdog_active(wd))
> > +		return pseries_wdt_stop(wd);
> > +	return 0;
> > +}
> > +
> > +static int pseries_wdt_resume(struct platform_device *pdev)
> > +{
> > +	struct watchdog_device *wd = platform_get_drvdata(pdev);
> > +
> > +	if (watchdog_active(wd))
> > +		return pseries_wdt_start(wd);
> > +	return 0;
> > +}
> > +
> > +static const struct platform_device_id pseries_wdt_id[] = {
> > +	{ .name = "pseries-wdt" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(platform, pseries_wdt_id);
> > +
> > +static struct platform_driver pseries_wdt_driver = {
> > +	.driver = {
> > +		.name = DRV_NAME,
> > +		.owner = THIS_MODULE,
> > +	},
> > +	.id_table = pseries_wdt_id,
> > +	.probe = pseries_wdt_probe,
> > +	.resume = pseries_wdt_resume,
> > +	.suspend = pseries_wdt_suspend,
> 
> I don't see any handling of the possible requirement to suspend timers
> across LPM. I don't think just wiring these up is enough?

I talked to Brian King about this and we decided that leaving the
watchdog running across an LPM might lead to some potentially
confusing behavior.

For example, if the watchdog expires while we're suspeded and the
machine is hard reset the instant we come out of it on the other side.

Unless there is an ask by downstream software to actually leave the
timer running over an LPM I think it is safest to err on the side of
caution and unconditionally stop running timers before suspend.

> > +};
> > +module_platform_driver(pseries_wdt_driver);
> > +
> > +MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
> > +MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
> 
> I'd prefer the module authors were just the names, email addresses
> inevitably bitrot.
> 
> Your email address is in the change log.

Dropped.
