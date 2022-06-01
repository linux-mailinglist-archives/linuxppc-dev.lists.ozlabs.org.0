Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54353AA93
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCv0f5dvQz3dqb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 01:57:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkI1OIWN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkI1OIWN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCtzx0LxSz3bkr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 01:56:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251EuRne029886;
	Wed, 1 Jun 2022 15:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=1QmtR+/oBnsOjp/G0pmWMmsWs7KUzk6cguOjqVX3Tj4=;
 b=bkI1OIWNIvx1wEFaL2YMdI93tNmoculAVwfzPTgm4diSVAw45hpJLJFysNy8IyqiH77w
 WEb0F5j9nlv1o1MkPNlBhjbhUeRDGNy7VI1Du2To5JzpjZrdHFjE1GL++tNK8LlyK/Bh
 Vdf35toK2GbEbHmbtX54pg147/+A+D0qM6g42IoHDgmhQnQCrdOP7jetJe0vLPhyPMkW
 8Vi5FZJ8hiOOpYvybCy18MimD58/hhCisW+Mb+52Gb8XPE/2Us2u8yidJMxCNMJKZbxO
 WTOVLSefMK1QrrOn2C1nlWYww9989pRd8j9vo9vf9h1YYZiG/TSxeE6/2zZELaUXbZYJ WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3geaap9cmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 15:56:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 251FK1mJ003080;
	Wed, 1 Jun 2022 15:56:23 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3geaap9cmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 15:56:23 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 251FdtvJ021485;
	Wed, 1 Jun 2022 15:56:22 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma01dal.us.ibm.com with ESMTP id 3gcxt5jrgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 15:56:22 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 251FuL8O27263268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 15:56:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 333A8B206E;
	Wed,  1 Jun 2022 15:56:21 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E662B2066;
	Wed,  1 Jun 2022 15:56:21 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 15:56:20 +0000 (GMT)
Date: Wed, 1 Jun 2022 10:56:20 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
Message-ID: <YpeMJGLDnSK6c7RT@rascal-austin-ibm-com>
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
 <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
 <1f007ad5-8367-9593-bb80-d3564f3cf997@roeck-us.net>
 <YpeArFvOWtk6TQ5r@rascal-austin-ibm-com>
 <a6090ef3-f597-e10b-010b-cc32bff08c93@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6090ef3-f597-e10b-010b-cc32bff08c93@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EP2IHfWpC4RNEv34j2bYDMx4PCfjfY1U
X-Proofpoint-GUID: tMvfRn4o10rhNAy0eQSF0EvDN0ZE6KnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_05,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206010072
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 08:45:03AM -0700, Guenter Roeck wrote:
> On 6/1/22 08:07, Scott Cheloha wrote:
> [ ... ]
> > > > > +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
> > > > > +
> > > > > +static int action_get(char *buf, const struct kernel_param *kp)
> > > > > +{
> > > > > +    int val;
> > > > > +
> > > > > +    switch (action) {
> > > > > +    case PSERIES_WDTF_ACTION_HARD_POWEROFF:
> > > > > +        val = 1;
> > > > > +        break;
> > > > > +    case PSERIES_WDTF_ACTION_HARD_RESTART:
> > > > > +        val = 2;
> > > > > +        break;
> > > > > +    case PSERIES_WDTF_ACTION_DUMP_RESTART:
> > > > > +        val = 3;
> > > > > +        break;
> > > > > +    default:
> > > > > +        return -EINVAL;
> > > > > +    }
> > > > > +    return sprintf(buf, "%d\n", val);
> > > > > +}
> > > > > +
> > > > > +static int action_set(const char *val, const struct kernel_param *kp)
> > > > > +{
> > > > > +    int choice;
> > > > > +
> > > > > +    if (kstrtoint(val, 10, &choice))
> > > > > +        return -EINVAL;
> > > > > +    switch (choice) {
> > > > > +    case 1:
> > > > > +        action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
> > > > > +        return 0;
> > > > > +    case 2:
> > > > > +        action = PSERIES_WDTF_ACTION_HARD_RESTART;
> > > > > +        return 0;
> > > > > +    case 3:
> > > > > +        action = PSERIES_WDTF_ACTION_DUMP_RESTART;
> > > > > +        return 0;
> > > > > +    }
> > > > > +    return -EINVAL;
> > > > > +}
> > > > > +
> > > > > +static const struct kernel_param_ops action_ops = {
> > > > > +    .get = action_get,
> > > > > +    .set = action_set,
> > > > > +};
> > > > > +module_param_cb(action, &action_ops, NULL, 0444);
> > > > 
> > > > 
> > > > 0644 here and below?
> > > > 
> > > 
> > > That would make the module parameters have to be runtime
> > > configurable, which does not make sense at least for
> > > the two parameters below.
> > 
> > Agreed.
> > 
> > > I don't know though if it is really valuable to have all the
> > > above code instead of just
> > > storing the action numbers and doing the conversion to action
> > > once in the probe function. The above code really only
> > > makes sense if the action is changeable during runtime and more
> > > is done that just converting it to another value.
> > 
> > Having a setter that runs exactly once during module attach is
> > obvious.  We need a corresponding .get() method to convert on the way
> > out anyway.
> > 
> 
> Why would a get method be needed if the module parameter is just kept as-is ?

In my original plan they weren't kept as-is.  They were converted on
the way in and on the way out.

> > I don't see any upside to moving the action_set() code into
> > pseries_wdt_probe() aside from maybe shaving a few SLOC.  The module
> > is already very compact.
> 
> I disagree. The get method is unnecessary. The module parameter values (1..3)
> add unnecessary complexity. It could as well be 0..2, making it easier to convert.

Yes, we could do that.

> The actual action could be stored in struct pseries_wdt, or converted using something
> like
> 
> u8 pseries_actions[] = {
> 	PSERIES_WDTF_ACTION_HARD_POWEROFF,
> 	PSERIES_WDTF_ACTION_HARD_RESTART,
> 	PSERIES_WDTF_ACTION_DUMP_RESTART
> };
> 
> 	flags = pseries_actions[action] | PSERIES_WDTF_OP_START;
> 
> or, alternatively, in probe
> 
> 	if (action > 2)
> 		return -EINVAL;
> 	pw->action = pseries_actions[action];
> and, in the start function,
> 	flags = pw->action | PSERIES_WDTF_OP_START;

I like this, we'll go with this.

> That not only reduces code size but also improves readability.
> get/set methods are useful, but should be limited to cases where they
> are really needed, ie do something besides converting values. You could argue
> that you want to be able to change the reboot method on the fly, by making
> the module parameter writeable, but then the .set method should actually
> change the method accordingly and not just convert values. And even then
> I'd argue that it would be better not to convert the 'action' value itself
> but to keep it at 0, 1, 2 (or 1, 2, 3 if you prefer) and use param_get_uint
> (or param_get_ulong) for the get method.

Okay, that makes sense.

> Regarding max_timeout, we have calculations such as
> 
> 	unsigned int t = wdd->timeout * 1000;
> 
> in the assumption that timeouts larger than UINT_MAX/1000 seconds (or ~50 days)
> don't really make much sense. watchdog_timeout_invalid() will also return -EINVAL
> if the provided timeout value is larger than UINT_MAX / 1000.

Oh, I see.  Changed in v2.
