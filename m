Return-Path: <linuxppc-dev+bounces-5982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A30A2D3CB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 05:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqdFV457Yz30Vs;
	Sat,  8 Feb 2025 15:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738981766;
	cv=none; b=WwsvmGnbfTz5fmAlqz97p5RZmwWMGy/GE6RaJcqDCqmnkat9AYzUdYxQa7Bc7yLmeW735IKommujq8eocWDYKIaI/yZWN2rIxAVMKC8Um8/8m2ynNuB4XUVUk1gxnFQ2kdkN0a4kuP0Z6ta/CejE4GJB/49Z06jmLWr13O3CyF/tFk2zPOi8oX+iNY1Jnv7pDRQzABwYxYnOBZ8hyf+K3bZMofSjH15jOjpq3DGVtJWyPpZt5a6xmoG9d+/84auwBYo+Tv9XqLxQ8IbomFoc7XoMokUBRnWjqHqEi3M+4oO9uW19oLKi4OZbOmy+gMQL9PNKRhyczG0tPZYFLe3qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738981766; c=relaxed/relaxed;
	bh=Ail4CJU3TJFbpAwgmrAR4hkQyy247w6qY6sp7QwAy4I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=CwM5h/2G2FASSibPfyPrO5/svVeBxKLt/HudgT+C27r5Ec04UWkUXfGaHtpyjZfgIxnstuKMgE5b5dpjo6yQSEJwCXsXz2h4qEoimDazQRiXCveEWo2otoUx0qweIkjxVU7srpGOqB23/iOjVhlEDjBOpjWhT27t0ohcksx/Z0gHj5C7OSkt3G+RcVLt9EXFcIR/iThBdjjEeGnc7Ji5oyMGGgCAdoOq3Kz1bT+xBaWRwojFFtSuC8hRmGiIUiWu7bMGswuAUmMLXDnxgxPkRSHl1meAS+7k2YT4Ndp/VTGZAe2UPahwREnOCgV7GaWNDvffuJ6+O8U7fcKZKh5rxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZwS2XMl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aboorvad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZwS2XMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aboorvad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqZY14fXWz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 13:29:25 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5182Hn86001311;
	Sat, 8 Feb 2025 02:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ail4CJ
	U3TJFbpAwgmrAR4hkQyy247w6qY6sp7QwAy4I=; b=gZwS2XMlLlbjhNBWSFMSlC
	vvqAoLam1WpPRS3jrTc0ifn/AsqgUFrt4HnHyDPEK8kZ33pC4y0WaOZkS344rctk
	23sKv4VOwd0LNUVBkRV8gcsRemGstN2wLQa7DWSB1C0nijD4fy08RB5su5GhUnHw
	szArfHcwwPyhZ5R05JuW/XOMmjLf3EztDpVEkzAVe8QAqwepB1DAKsYj9Bae1Sdu
	yd6oV3cOY12vHb/IZS8g1pa9jHF/z4GECa5YPpR5HqF3wq/PD1btkhxT4KktWzu5
	cpRRyS9uzf/vhDwGrQ7roCBx8rmzRF9kIJpeMpFRvs3DX4uobx/O4pHSK0CXAtIQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44nc08nfqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:29:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5180N9Dk024493;
	Sat, 8 Feb 2025 02:29:19 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxnpema-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:29:19 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5182TGFn29819554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 02:29:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D348558059;
	Sat,  8 Feb 2025 02:29:16 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D55B58043;
	Sat,  8 Feb 2025 02:29:13 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com (unknown [9.171.30.135])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Feb 2025 02:29:13 +0000 (GMT)
Message-ID: <019d7c10173cd0db81f497e3cfa39491fa8cd2ee.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/time: Export boot_tb and log initial
 timebase at boot
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kajol Jain
	 <kjain@linux.ibm.com>, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com,
        adubey@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date: Sat, 08 Feb 2025 07:59:11 +0530
In-Reply-To: <1394492b-0e18-4b47-b5d7-3b8744eeb897@csgroup.eu>
References: <20250204063948.643852-1-kjain@linux.ibm.com>
	 <1394492b-0e18-4b47-b5d7-3b8744eeb897@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-26.el8_10) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0GFRnCRQS8ROGc6YHVNwdc9GGS7Btt9w
X-Proofpoint-GUID: 0GFRnCRQS8ROGc6YHVNwdc9GGS7Btt9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080017
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 2025-02-04 at 11:28 +0100, Christophe Leroy wrote:

Hi Christophe,

> 
> Le 04/02/2025 à 07:39, Kajol Jain a écrit :
> > From: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > 
> > - Export `boot_tb` for external use, this is useful in perf vpa-dtl
> >    interface, where `boot_tb` can be used to convert raw timebase
> >    values to it's relative boot timestamp.
> 
> A modification of boot_tb can be catastrophic. I would not export it as 
> is as it doesn't need to be modified, would be better to provide it 
> through an accessor, for instance a function called get_boot_tb()
> 
> By the way, it is only modified by time_init() which is an __init 
> function, so boot_tb should be marked __ro_after_init instead of 
> __read_mostly, then in that case it would be more acceptable to export it.


Thanks for the review and suggestions. Yes `boot_tb` is just initialized once
and is never updated again, I’ll update the patch to mark it __ro_after_init.
I’ll also use an accessor function (get_boot_tb()) instead of exporting it,
as it will be clean and maintainable.

Will send a v3 with the updates.

Regards,
Aboorva

> 
> > - Log the initial timebase at `time_init` as it is a useful
> >    information which can be referred to as needed.
> > 
> > Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/time.h | 1 +
> >   arch/powerpc/kernel/time.c      | 4 +++-
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> > index 9bdd8080299b..b6fc5df01d53 100644
> > --- a/arch/powerpc/include/asm/time.h
> > +++ b/arch/powerpc/include/asm/time.h
> > @@ -23,6 +23,7 @@ extern u64 decrementer_max;
> >   extern unsigned long tb_ticks_per_jiffy;
> >   extern unsigned long tb_ticks_per_usec;
> >   extern unsigned long tb_ticks_per_sec;
> > +extern u64 boot_tb;
> >   extern struct clock_event_device decrementer_clockevent;
> >   extern u64 decrementer_max;
> >   
> > diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> > index 0727332ad86f..6e8548f0e48f 100644
> > --- a/arch/powerpc/kernel/time.c
> > +++ b/arch/powerpc/kernel/time.c
> > @@ -137,7 +137,8 @@ EXPORT_SYMBOL_GPL(rtc_lock);
> >   
> >   static u64 tb_to_ns_scale __read_mostly;
> >   static unsigned tb_to_ns_shift __read_mostly;
> > -static u64 boot_tb __read_mostly;
> > +u64 boot_tb __read_mostly;
> > +EXPORT_SYMBOL_GPL(boot_tb);
> >   
> >   extern struct timezone sys_tz;
> >   static long timezone_offset;
> > @@ -943,6 +944,7 @@ void __init time_init(void)
> >   	tb_to_ns_shift = shift;
> >   	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
> >   	boot_tb = get_tb();
> > +	pr_debug("%s: timebase at boot: %llu\n", __func__, (unsigned long long)boot_tb);
> >   
> >   	/* If platform provided a timezone (pmac), we correct the time */
> >   	if (timezone_offset) {


