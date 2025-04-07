Return-Path: <linuxppc-dev+bounces-7495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3FA7E7B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 19:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWbCB4zldz2ywR;
	Tue,  8 Apr 2025 03:03:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744045430;
	cv=none; b=FjhrNUBDbDcvay0rlefDRzkvlf3BR7JJOu0Pkmc7QQ2Wsd34cxgfOu1H1QV/N0z6sbH51oYZC+yjG3pETqL7dQ7TmKdXiL9J3CNZ7hlztedo+q70Vof6dZc/NSMGuw0iQuH0JLZ1Y0GpZVuaQX5My0uZ2Kdvsu+e/wnL61eKWmkk9YeNKt/vwyN6No1uXEi2eWaPukNlObm8hhUke1tDxPSiF6QZ08yvWNG7ueP8GWiUZ60jR469HbIYo5w2yWRceu2EaO6aqEajoY+sGIjwz1UWRVG6BgkKeZeoqFzocc+51SMEHkVI6BYknxIEXrSNq130xIEBDS5emXC/KrBIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744045430; c=relaxed/relaxed;
	bh=dckmjxpu56Wa9tflT33OSyH8dZNmobK5eYJULmKIvTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gm/6yGJgGfQwxqCBtM23P6Cx0EJxAnP2Pl4RBsjS8jh8NDB3QWYCsnPFHjdrGqPGQRYOIRVnevDGpIcZ9k+MX2kb2sl/ks60NRkTfoD8PhAOGR01SgnHG7xX8g15nyIU2a2EoPfMrDzafdG1Dz9qzz8m8++KqPsmhbMUxp9zSCT9RMkRIB7dAHsx2udqJbAgb8a9pS5w1uQ3PZJFNjO5dhmqJU/Ib8KdKLS59/K3sX+xdOMht0iF98miBQBIQXtrGELO779fcFYLPA/+no3PMALVHuE1ZM0UNUqzJeJugtqm4L8jW2plfFOzg4NDrLsUmHvbg38fDDLWl4qDiC7DhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ROXVjC51; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ROXVjC51;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWbC93KNHz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 03:03:49 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5379HqAR020630;
	Mon, 7 Apr 2025 17:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dckmjx
	pu56Wa9tflT33OSyH8dZNmobK5eYJULmKIvTM=; b=ROXVjC51lO8BwJFjsytLDr
	eyOFb551dm+D/AI7Pi46cC9WEpz5pkbgGx2gY7dPBC7ABObvMYby7UB/I7aMeHOI
	BdHZ0yZoyccLQcMPSYG1mVZivaxkMCb3om7d9yv4eSJODYwjjllp320q1pnOIePR
	0io9xyEGeq6FeJTVRUBUYmK2doPfR8oD6NjB8KCicUxmNPUHul8AYQZyQSyCg2zT
	DW+XNZDaRrhf7AY/zLH6EJ/Ysuu6/JVrFgVdC0WeDnrRZ4FzDW6qckXPvOl1zfL0
	pYeye/UZ4g/O9L30VJq9O7S8kL6sSLX/MvRsYcsEyAsVnLuQFQaA5rm1/kUFu6Jg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0u0msks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 17:03:28 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537Gq1tM010391;
	Mon, 7 Apr 2025 17:03:27 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0u0mskq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 17:03:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537FASbq017702;
	Mon, 7 Apr 2025 17:03:27 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2keknj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 17:03:27 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537H3QTw29622900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 17:03:26 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E11B58055;
	Mon,  7 Apr 2025 17:03:26 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 129905804B;
	Mon,  7 Apr 2025 17:03:22 +0000 (GMT)
Received: from [9.61.245.238] (unknown [9.61.245.238])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 17:03:21 +0000 (GMT)
Message-ID: <898dce36-06fa-447a-92bb-bdd4fedd65f0@linux.ibm.com>
Date: Mon, 7 Apr 2025 22:33:20 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] powerpc: Add check to select
 PPC_RADIX_BROADCAST_TLBIE
Content-Language: en-GB
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, paulus@ozlabs.org
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        kernel test robot <lkp@intel.com>
References: <20250407084029.357710-1-maddy@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250407084029.357710-1-maddy@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cZFKoXoWmbOVmCcE8rKEpuHUCaMif1pj
X-Proofpoint-GUID: 3RYCnXJTxm4sPN-LIOWEbNDETi4U_1dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxlogscore=975 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070118
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07/04/25 2:10 pm, Madhavan Srinivasan wrote:
> Commit 3d45a3d0d2e6 ("powerpc: Define config option for processors with broadcast TLBIE")
> added a config option PPC_RADIX_BROADCAST_TLBIE to support processors with
> broadcast TLBIE. Since this option is relevant only for RADIX_MMU, add
> a check as a dependency to enable PPC_RADIX_BROADCAST_TLBIE in both
> powernv and pseries configs. This fixes the unmet config dependency
> warning reported
>
>     WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
>       Depends on [n]: PPC_RADIX_MMU [=n]
>       Selected by [y]:
>       - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504051857.jRqxM60c-lkp@intel.com/
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Tested this on pseries LPAR and the patch fixes the reported issue. Hence,

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

> ---
>   arch/powerpc/platforms/powernv/Kconfig | 2 +-
>   arch/powerpc/platforms/pseries/Kconfig | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 3fbe0295ce14..95d7ba73d43d 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -17,7 +17,7 @@ config PPC_POWERNV
>   	select MMU_NOTIFIER
>   	select FORCE_SMP
>   	select ARCH_SUPPORTS_PER_VMA_LOCK
> -	select PPC_RADIX_BROADCAST_TLBIE
> +	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
>   	default y
>   
>   config OPAL_PRD
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index a934c2a262f6..fa3c2fff082a 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -23,7 +23,7 @@ config PPC_PSERIES
>   	select FORCE_SMP
>   	select SWIOTLB
>   	select ARCH_SUPPORTS_PER_VMA_LOCK
> -	select PPC_RADIX_BROADCAST_TLBIE
> +	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
>   	default y
>   
>   config PARAVIRT

With out this patch:

  make olddefconfig
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/kconfig/conf.o
   HOSTCC  scripts/kconfig/confdata.o
   HOSTCC  scripts/kconfig/expr.o
   LEX     scripts/kconfig/lexer.lex.c
   YACC    scripts/kconfig/parser.tab.[ch]
   HOSTCC  scripts/kconfig/lexer.lex.o
   HOSTCC  scripts/kconfig/menu.o
   HOSTCC  scripts/kconfig/parser.tab.o
   HOSTCC  scripts/kconfig/preprocess.o
   HOSTCC  scripts/kconfig/symbol.o
   HOSTCC  scripts/kconfig/util.o
   HOSTLD  scripts/kconfig/conf

WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
   Depends on [n]: PPC_RADIX_MMU [=n]
   Selected by [y]:
   - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
#
# configuration written to .config
#


With this patch:

make olddefconfig
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/kconfig/conf.o
   HOSTCC  scripts/kconfig/confdata.o
   HOSTCC  scripts/kconfig/expr.o
   LEX     scripts/kconfig/lexer.lex.c
   YACC    scripts/kconfig/parser.tab.[ch]
   HOSTCC  scripts/kconfig/lexer.lex.o
   HOSTCC  scripts/kconfig/menu.o
   HOSTCC  scripts/kconfig/parser.tab.o
   HOSTCC  scripts/kconfig/preprocess.o
   HOSTCC  scripts/kconfig/symbol.o
   HOSTCC  scripts/kconfig/util.o
   HOSTLD  scripts/kconfig/conf
#
# No change to .config
#

Regards,

Venkat.


