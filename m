Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F9955361B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 17:31:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS9Tg0GLmz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 01:31:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5TR0sbm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5TR0sbm;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS9Sz2sn0z3bWD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 01:30:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LEpoSe012158;
	Tue, 21 Jun 2022 15:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=RTT1Y8ES+3bjxSpfKROU/jDExd7CKEbmwwN/SK49wHY=;
 b=W5TR0sbmZqUheB9uwFzP17zoGFqh4p5mQ7x2Xj0NaI6o+CjEF5PTVrb6PAQpV08lXFIT
 Ex3MdcchPq04bv2kKVTooZAab6UNeN4QKJkcEGNRgv+JiYfxB5ORVj41gJWDH90PFHLL
 GZjC5u2dM2F5UiFJ+AaR9ppD/psqoG3HwXzMsss4SUcnvmp7bA1MjLDFDMi/JCakl8xj
 gxNQPhu3FDkEK+ZG/BZax+2WKVe1CXp7bCUOXNolBVcxgXwlNhoogunFRHBPIGZHu1go
 MK+60oZBWkUP6ZA4sb6hZIUn2XehGw0C7OvetJkLNoh/AQ/R9UGELVCXQEz2BRkME0vc mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gug489755-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 15:30:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25LEqSBo013808;
	Tue, 21 Jun 2022 15:30:37 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gug48974r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 15:30:36 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LF5v3W023147;
	Tue, 21 Jun 2022 15:30:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma02dal.us.ibm.com with ESMTP id 3gt0091u04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 15:30:36 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25LFUYGT22610292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 15:30:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B44D96A04F;
	Tue, 21 Jun 2022 15:30:34 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91E276A047;
	Tue, 21 Jun 2022 15:30:34 +0000 (GMT)
Received: from localhost (unknown [9.211.80.5])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jun 2022 15:30:34 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 3/4] powerpc/pseries: register pseries-wdt device
 with platform bus
In-Reply-To: <20220602175353.68942-4-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-4-cheloha@linux.ibm.com>
Date: Tue, 21 Jun 2022 10:30:34 -0500
Message-ID: <874k0enied.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k9K7XvCCLRo-XJy3yGYER2beW5bVK6DQ
X-Proofpoint-ORIG-GUID: xtw56Gn0FhImEExhwux94D5jC_nM_Ptz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210065
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
Cc: wvoigt@us.ibm.com, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Cheloha <cheloha@linux.ibm.com> writes:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> guest control of one or more virtual watchdog timers.
>
> These timers do not conform to PowerPC device conventions.  They are
> not affixed to any extant bus, nor do they have full representation in
> the device tree.
>
> As a workaround we represent them as platform devices.
>
> This patch registers a single platform device, "pseries-wdt", with the
> platform bus if the FW_FEATURE_WATCHDOG flag is set.
>
> A driver for this device, "pseries-wdt", will be introduced in a
> subsequent patch.
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/setup.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index afb074269b42..233c64f59815 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/cpu.h>
>  #include <linux/errno.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched.h>
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
> @@ -169,6 +170,22 @@ static void __init fwnmi_init(void)
>  #endif
>  }
>  
> +/*
> + * Affix a device for the first timer to the platform bus if
> + * we have firmware support for the H_WATCHDOG hypercall.
> + */
> +static struct platform_device *pseries_wdt_pdev;
> +
> +static __init int pseries_wdt_init(void)
> +{
> +	if (!firmware_has_feature(FW_FEATURE_WATCHDOG))
> +		return 0;
> +	pseries_wdt_pdev = platform_device_register_simple("pseries-wdt",
> +							   0, NULL, 0);
> +	return 0;
> +}
> +machine_subsys_initcall(pseries, pseries_wdt_init);
> +

Seems like we don't need pseries_wdt_pdev as it's unused elsewhere? But
that's quite minor.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
