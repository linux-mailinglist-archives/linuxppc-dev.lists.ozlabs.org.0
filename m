Return-Path: <linuxppc-dev+bounces-13921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8AC3EDB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 09:01:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2s2K1Qykz3bt9;
	Fri,  7 Nov 2025 19:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762502473;
	cv=none; b=Eb6CkkPAjall7sjCr26rhzf+dvWE0ZvnRbY6ufQxP6owupWSrRBuwK1v2S1hMutEUWg7MEH4s0bAWYjwgW+N3kbQ2qJRJtc9WFlU+WcDjnCl7Lj2bsrfb91M0S8+m6RuFBg+GlhCS0GX5UkrRReLIIKmE7O0RlZ0ngM/+jgVkO/jcZ6Wzhe2jflhNuI3fBMDMLr6zsdg6U9DrNNTKrb/VMgTGGc0O2uSBzerpHLqWT8obP3eIyeX0iZu/cXo9xsS7J0vf3j4LUoJEfCVZxXRTDVWqDh0pzUvcX7/nNAT/aruRRu6uyLUCGLxSlvqv/Ruvq5foRInkDqJiZEKny9+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762502473; c=relaxed/relaxed;
	bh=HFe7VSm32n3rupz4aNUkfekRamRjQvJQRcQNZ0wc2KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoGVIqPrqj3eigASmlXtNbCft/dwQm4Qd0SDWWQofiE/xviAhgkuFBcgvLABgvk6pi6YhFynvZyGCrNiZPdgYadwMdbnVTDImaiO0472Aj/1Zgu+GEIJBP6GAeGL6K8SKaJsQ/47Hpw1WsER/0M10lE0CvdIKHM9Tu8pHD3As1wzNXFGIMZFYLUX8e5+vFJCfViqs19o/R3nDwik55uy0qMnFt03/GKsnWFHgpO+rPDqY2RDAtJPYvPVnmZKouVN3uNvCdqG51sRbt/NTqEFqr2z/SXZPVFXfMaJKxS4jCLS9UZPoGP/l8kVMPm/OO7KwuoCoHGdbmA0MUMfQmBBuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TpussRQ4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TpussRQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2s2J07zGz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 19:01:11 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A6IePZB007984;
	Fri, 7 Nov 2025 08:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HFe7VS
	m32n3rupz4aNUkfekRamRjQvJQRcQNZ0wc2KM=; b=TpussRQ415i4dRJx5UIw+i
	RTzsgVFp6vVHTHCN4jgedkIYjdxh5XiaG1H8DsrEUQ8UmV8YBgdv6wqjTonyuMuI
	mpT4Akhu2jJ6Rbfr4zRhouGXTaWHxH0DYGOKZHgyrcQ5GKlTF/Wk8i1ha0uMgyC/
	YT7iHhmmHVGLt0HB/Q2h33YI2YNnA7vyEj5E7V6MdBj6CSsZv7au/v5JpDzZPf5B
	qjiruo3ajckKlkJ92S2AOIO/y0f7bvgT0nhV7LQRP3x5Uw2BoPFycVDkN74RXYe0
	82tP1NgFrDCNLzTEsxM+FYVNr2EZRWd+0zQqDDlBpWbMDjgroz0r3ppS7xWGnixw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xcbgn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:01:02 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A77fSfI016652;
	Fri, 7 Nov 2025 08:01:02 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xcbgn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:01:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A780lmD018784;
	Fri, 7 Nov 2025 08:01:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5whnsmyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 08:01:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A780vJl28770730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 08:00:57 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14F8C20043;
	Fri,  7 Nov 2025 08:00:57 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C91220040;
	Fri,  7 Nov 2025 08:00:51 +0000 (GMT)
Received: from [9.124.216.224] (unknown [9.124.216.224])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 08:00:50 +0000 (GMT)
Message-ID: <e93e3a1b-5cf1-4d2a-9b2c-5049e211f593@linux.ibm.com>
Date: Fri, 7 Nov 2025 13:30:49 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfXwXwiw5XkAnMN
 E4iz0D4XMTtpXTW+ttC2gbbj4DJDGZjIUoSV7NG933maJAHITQG6Zd2XLWN2oL2IgNHpX5bJyqM
 o6DtamlU9zP5JAPiR2Fsxt3SCFV8nzsD60YVzwXyBQ+9r91q+/vlh0ZyTKcCwbYLGjyf5RqxxNH
 +DmyK2JXxkXRX7Bwtf+LPXBK9ca6IdFq7+HrK9nMUJ7nOmcPiUdFIuJHEXqc4TeiIfxCq38KIwm
 9z00G1SGXQ/Ntrhs008kR3oxL2lLh9rjznk9Hc6Cte+pTmy1ses8U++69HFQcTE7vsbsTuCCmfC
 u8uXzt4HCsGjjYCKdep1eQn5M35IZ4v0QGNxqrsz5E/VhfA59tTBeZ9CitsyfXCbV7jyY3/W31Z
 den7v3peg+NKGbC47RMH9ELxNtoJnQ==
X-Proofpoint-GUID: R3aJPhoTvTn0abvlRp-sXvps_FZTHb5i
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690da73e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=YMD8eA4n9cmAyVnVb-4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kelqwCqIquxNrS6cErwFBzSajhtYP5zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 06/11/25 20:32, David Hildenbrand (Red Hat) wrote:
>>> Yes, we discussed that in [1].
>>>
>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>> have even larger hugetlb sizes than PUDs.
>>>
>>> @Cristophe, I was under the impression that you would send a fix. Do 
>>> you
>>> want me to prepare something and send it out?
>>
>> Indeed I would have liked to better understand the implications of all
>> this, but I didn't have the time.
>
> Indeed, too me longer than it should to understand and make up my mind 
> as well.
>
>>
>> By the way, you would describe the fix better than me so yes if you can
>> prepare and send a fix please do.
>
> I just crafted the following. I yet have to test it more, some early
> feedback+testing would be appreciated!
>
> From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
> Date: Thu, 6 Nov 2025 11:31:45 +0100
> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with 
> hugetlb

b4 did not detect this patch, and manually copying the patch text from this
reply also did not apply cleanly on upstream master and linuxppc 
master/next.

- Sourabh Jain

>
> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
> into a generic way for the architecture to state that it supports
> gigantic hugetlb folios.
>
> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
> have folios larger than what the buddy can handle. In the context of
> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
> when dumping tail pages of folios. Before that commit, we assumed that
> we cannot have folios larger than the highest buddy order, which was
> obviously wrong.
>
> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
> when registering hstate"), we used MAX_FOLIO_ORDER to detect
> inconsistencies, and in fact, we found some now.
>
> Powerpc allows for configs that can allocate gigantic folio during boot
> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
> exceed PUD_ORDER.
>
> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE for
> all 64bit configs, and increase the maximum folio size to P4D_ORDER.
>
> Ideally, we'd have a better way to obtain a maximum value. But this 
> should
> be good enough for now fix the issue and now mostly states "no real folio
> size limit".
>
> While at it, handle gigantic DAX folios more clearly: DAX can only
> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>
> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
> HUGETLB_PAGE.
>
> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on PPC64, we will now
> also allow for runtime allocations of folios in some more powerpc 
> configs.
> I don't think this is a problem, but if it is we could handle it through
> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
>
> While __dump_page()/__dump_folio was also problematic (not handling 
> dumping
> of tail pages of such gigantic folios correctly), it doesn't relevant
> critical enough to mark it as a fix.
>
> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes 
> when registering hstate")
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>  arch/powerpc/Kconfig                   | 1 +
>  arch/powerpc/platforms/Kconfig.cputype | 1 -
>  include/linux/mm.h                     | 4 ++--
>  include/linux/pgtable.h                | 1 +
>  mm/Kconfig                             | 7 +++++++
>  5 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885ae..55c3626c86273 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>      select ARCH_HAS_DMA_OPS            if PPC64
>      select ARCH_HAS_FORTIFY_SOURCE
>      select ARCH_HAS_GCOV_PROFILE_ALL
> +    select ARCH_HAS_GIGANTIC_PAGE        if PPC64
>      select ARCH_HAS_KCOV
>      select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>      select ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/arch/powerpc/platforms/Kconfig.cputype 
> b/arch/powerpc/platforms/Kconfig.cputype
> index 7b527d18aa5ee..4c321a8ea8965 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>  config PPC_RADIX_MMU
>      bool "Radix MMU Support"
>      depends on PPC_BOOK3S_64
> -    select ARCH_HAS_GIGANTIC_PAGE
>      default y
>      help
>        Enable support for the Power ISA 3.0 Radix style MMU. Currently 
> this
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d16b33bacc32b..4842edc875185 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const 
> struct folio *folio)
>      return folio_large_nr_pages(folio);
>  }
>
> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>  /*
>   * We don't expect any folios that exceed buddy sizes (and consequently
>   * memory sections).
> @@ -2092,7 +2092,7 @@ static inline unsigned long folio_nr_pages(const 
> struct folio *folio)
>   * There is no real limit on the folio size. We limit them to the 
> maximum we
>   * currently expect (e.g., hugetlb, dax).
>   */
> -#define MAX_FOLIO_ORDER        PUD_ORDER
> +#define MAX_FOLIO_ORDER        P4D_ORDER
>  #endif
>
>  #define MAX_FOLIO_NR_PAGES    (1UL << MAX_FOLIO_ORDER)
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 32e8457ad5352..09fc3c2ba39e2 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -7,6 +7,7 @@
>
>  #define PMD_ORDER    (PMD_SHIFT - PAGE_SHIFT)
>  #define PUD_ORDER    (PUD_SHIFT - PAGE_SHIFT)
> +#define P4D_ORDER    (P4D_SHIFT - PAGE_SHIFT)
>
>  #ifndef __ASSEMBLY__
>  #ifdef CONFIG_MMU
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 0e26f4fc8717b..ca3f146bc7053 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
>  config PGTABLE_HAS_HUGE_LEAVES
>      def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
>
> +#
> +# We can end up creating gigantic folio.
> +#
> +config HAVE_GIGANTIC_FOLIOS
> +    def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> +         (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +
>  # TODO: Allow to be enabled without THP
>  config ARCH_SUPPORTS_HUGE_PFNMAP
>      def_bool n


