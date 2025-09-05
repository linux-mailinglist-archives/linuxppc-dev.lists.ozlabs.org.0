Return-Path: <linuxppc-dev+bounces-11800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FAB45D13
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 17:53:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJLVZ0jkvz3dJn;
	Sat,  6 Sep 2025 01:53:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757087621;
	cv=none; b=ImlZMfpk7/3fT1PV+h/yRCzyJiFsjICz9BKxkS8QFCVoU2HRzfv4aLyXKBWtGsn59rACYfhViDbmR3DiEpJgZKPFu2+7cRzLmRkch/RhFSxSW4QBZWWKCZDk1airkIoe4Hx3lmA5LYCjLs3deAKEUMp8CqfT7QrcSYJlEuPWEgJ7Kz88A0R9r5eL+uGIhM/1IVuAsMm8P6bXqOGOEHrCfn9An/hgOtGxhUL2YdAHYMm9kmbkulqEV/6OtM5fywbcJ9PRt7kdpYHLHRm/Ouyurs5OBItmStNyH8N4aD3ja16ZQxf3WrNmUfxUik8Y4ZprhCwYg/7qmuM9rz3mHXGXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757087621; c=relaxed/relaxed;
	bh=yrKzRKvPlqc1QwFwyTNKlG24n0S3B0erGWAU2bVkVqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB3PUBfhd5pRrOxdGr+U0F9WeJYdV5NMZ9erifH6AkPXKoEy1AR8AyCHbg+YHkvG20cslcJ9NqxHzfQkDa51XNfChsU5gxuGMhGh1l3cCqLFsHcA/50eKXqq1Km5UZ0yteyXqd8KFv2mPUoHIkTUY/dLfGlbT9a452fiJtw0zawCm3wamtICDWExp+FwxHaLzJoyHakPLa9jingEnkDb9qBdvEzraSLMrtpHyqnPvTeUIcooUDK8HISZq3NwEqJYF86+KlWvYd/yAJ82VZjR9+yAVYR0ZT95qeVjJLLISS/6ft/A4gB2YFMbGwZDkPlqV1t/ebObnqoLfCv9cm0/Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qnifUl96; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qnifUl96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJLVY1SjMz3dJR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 01:53:40 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858qiX8001199;
	Fri, 5 Sep 2025 15:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yrKzRKvPlqc1QwFwyTNKlG24n0S3B0
	erGWAU2bVkVqg=; b=qnifUl96cq8S6mdWIUWZY6BIWU8yF2upNweBx/YvMVrUqk
	RurxzzOfjdHTO1vZruHBUGw3vkJ3WeEmWzLy0ib2dt0fUdi9302JluZSn5voqpb9
	tt+K2LZopne4AXw3OGAsBjWP8De3MBm1hwH4/INAMOLsTRAjDmX8jUJ/gKxB4XAc
	KrIlZNUzwzjCaqkU+ZOpln4XrPIJTWESS5y/saIRobaltfDoOVm72NdzSHeS2nKf
	hGMYLo6HZzSBX5xdzjXsfqIsGIlRMWccKTKAhN9S2rP+bQ/qPKUMPRNpVA8A/v6E
	L8fXKTqpSJEYDa6i80pdzLQ72TamFaiRukB8PM0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshfcpx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:52:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 585Fmcsp012235;
	Fri, 5 Sep 2025 15:52:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshfcpwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:52:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 585FmxfV019937;
	Fri, 5 Sep 2025 15:52:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vbmujcy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:52:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 585Fqke750659768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Sep 2025 15:52:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C56520043;
	Fri,  5 Sep 2025 15:52:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DCE620040;
	Fri,  5 Sep 2025 15:52:45 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.48.240])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  5 Sep 2025 15:52:45 +0000 (GMT)
Date: Fri, 5 Sep 2025 17:52:43 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
Message-ID: <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-6-kevin.brodsky@arm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-6-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lCd6YOMsS3DuDBadSx3AqoWK9sgWIwBw
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68bb0752 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=j0AthGTrb4EvYsEn83oA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: f87PfJay9odLOn37oqVwjr2CAlcWWHn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX6sVQx3QDeZVb
 n0/AHQXDAd1IPDvrbQDAZqWNvYoji1vUEPP9JAjcx2sdZwqxFNT8P6jKDiqCdhkxMnGuyNq6xN0
 S8g8X6OMzE3gSb6sI+vSPcwT7zIQgnHlzsA9jiitgokDLD2w11I2lobQd0RzFFdQVPBFq7gLH2W
 w3OGrenK+wBn0voMSBbmNjp1Fjlqy/CSo5Vh9PvP5VNsOgQXuA9fqz0KJ8mfFGOfUfce75STf2p
 eu65lI0DTVxqmjYKeyaFdLRjc3SxwtmZeh1Pe6KdSGdqawAHM6zOfs0r4Yils+ob60NU/kRnAup
 7+9DLLEmBuvBzuYqwqF9czbkIes2bGJOe8p5YqMQ0X/8i+oJ9lIUH4tj2BythK5q2hT0kmdi9nq
 KtlUPSlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 01:57:34PM +0100, Kevin Brodsky wrote:
...
>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> +	int lazy_mmu_nested;
>  
>  	if (radix_enabled())
>  		return LAZY_MMU_DEFAULT;
> @@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  	 */
>  	preempt_disable();
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
> -	batch->active = 1;
> +	lazy_mmu_nested = batch->active;
>  
> -	return LAZY_MMU_DEFAULT;
> +	if (!lazy_mmu_nested) {

Why not just?

	if (!batch->active) {

> +		batch->active = 1;
> +		return LAZY_MMU_DEFAULT;
> +	} else {
> +		return LAZY_MMU_NESTED;
> +	}
>  }
>  
>  static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
> @@ -54,7 +60,10 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  
>  	if (batch->index)
>  		__flush_tlb_pending(batch);
> -	batch->active = 0;
> +
> +	if (state != LAZY_MMU_NESTED)
> +		batch->active = 0;
> +
>  	preempt_enable();
>  }

Thanks!

