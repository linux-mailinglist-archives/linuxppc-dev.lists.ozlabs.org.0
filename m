Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B36B2676
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 15:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXWQX5F3fz3f3y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 01:14:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tFHiCvgG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tFHiCvgG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXWPY4gr3z3bg5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 01:13:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329E3H8A032239;
	Thu, 9 Mar 2023 14:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=88cqJrICubQtrwmKZOseMZ2pac3tyX3eyxZH8gf5a6w=;
 b=tFHiCvgGDXCdKdtJUwOcdSitT8h1nkkkloFkQ2WhEzkCUGobH8UsEriIcn6yOTsIVmGI
 0x4G1jOVnTMzkFGIIvAdCHLNXKlh64daft21bK074YdSUteS9IfLMGxyD1naFhNc7Q99
 SFaoCbGfrdd6BjGJAHhw65qqLWXjIEgIxAIAhyWFdjPAkflcOqhmzlUSC1C5PTlb8OR5
 hFpmD3uH9eFPWagi4AV5pfwd/Jf0uo7yoLW14+i8BZWHIpeQXD35PRtgZnVldHBFqEF4
 qH4oQQ0BrQKhvmQRn9PuV5T0I7tJjEDit8905rg39YylD2Udoisu+sE29eK0i8oKSS3k WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7gvrg9mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 14:13:11 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 329E42xQ002273;
	Thu, 9 Mar 2023 14:13:11 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7gvrg9ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 14:13:11 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329D0AN3022807;
	Thu, 9 Mar 2023 14:13:10 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3p6fkxuwwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 14:13:10 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329ED9UE50135510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 14:13:09 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2378858052;
	Thu,  9 Mar 2023 14:13:09 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDBC958050;
	Thu,  9 Mar 2023 14:13:08 +0000 (GMT)
Received: from localhost (unknown [9.163.67.89])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 14:13:08 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] powerpc/pseries: Select the generic memory allocator.
In-Reply-To: <20230309135110.uAxhqRFk@linutronix.de>
References: <20230309135110.uAxhqRFk@linutronix.de>
Date: Thu, 09 Mar 2023 08:13:08 -0600
Message-ID: <87h6uu813f.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cp6XYbUsODsXx8_YKs5ENrDT8w9Z4a6S
X-Proofpoint-ORIG-GUID: 6hZdyke2VeHgddLEEJZ44fsvmyW0gSKD
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=713 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090112
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
Cc: rdunlap@infradead.org, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
> The RTAS work area allocator is using the generic memory allocator and
> as such it must select it.
>
> Select the generic memory allocator on pseries.
>
> Fixes: 43033bc62d349 ("powerpc/pseries: add RTAS work area allocator")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks. Randy already sent the same fix:

https://lore.kernel.org/linuxppc-dev/20230223070116.660-4-rdunlap@infradead.org/

> ---
>  arch/powerpc/platforms/pseries/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index b481c5c8bae11..1c23f2d4ed557 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -2,6 +2,7 @@
>  config PPC_PSERIES
>  	depends on PPC64 && PPC_BOOK3S
>  	bool "IBM pSeries & new (POWER5-based) iSeries"
> +	select GENERIC_ALLOCATOR
>  	select HAVE_PCSPKR_PLATFORM
>  	select MPIC
>  	select OF_DYNAMIC
> -- 
> 2.39.2
