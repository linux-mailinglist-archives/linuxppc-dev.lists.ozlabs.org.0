Return-Path: <linuxppc-dev+bounces-13890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B724C3C12D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 16:34:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2R7b0rdRz2ySP;
	Fri,  7 Nov 2025 02:34:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762443258;
	cv=none; b=eOMQu227AcJmwsFCDELFkSdX+AnWIRreSKj/8xmADrMQzSPPPEzUB0vwNJA3xFeVJo7HiMSysGT48KXhY9UuTGcvpkQCo9byHadQZZukFDMgRFhgXAmgC59YYwkoSspMFeHTO+P9EUV4fQHk60UbTDmSBqABJizOngrnBTKAEHhegVouNhiTi51NYmNNxjHe8D2kFw/i06glKnCA8t0dGopgaUDLVYIihOaHQik2iFXsW76d1B1OHj2UkdH0BeHJbpuUO4lnHPemGfa7PEMEv/ivnSWBLQ26Sw+bwXQW/gAL+q0bypwigVS/Bk5nX7SUIsVV1R63ZRjRSFNDvm6v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762443258; c=relaxed/relaxed;
	bh=USDQ8ElKabVeXvYmFW0YLq1tEPCwDR9lnFGrXCv6r44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WORcKidbY24eyC236/bUuZkBreuHowH9u0dI46BU6kTy4LJo2YUCuAbccOu6zq3LNTYhJiVy/qaJpOJO7zOggG+/1R/kPCkbVgD654sAkZV1bGwl6G6Y2tJhT7QjI0OwW1lAHAtVq38kaLUKOv5k23S0tRBbGrtBwkD85LydK60XpxVVzOm+Hy7aPXdUKjPsjXWqa0e3sHL5+cwjXO7WM6BCzhhpZahIuwiqJCHeyPCs7+Ysqlb2s0nPF3JFHtbdUYcHnNai3NRG82VeTu9QPrCNW0SjNncTkHHqQWapdGpEeZQ/rPodM0qtoxceWvJg5EQ5qJcdn+9mExw9rKivLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ud1ezlZu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ud1ezlZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2R7Z1GtBz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 02:34:17 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A673rWV004542;
	Thu, 6 Nov 2025 15:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=USDQ8ElKabVeXvYmFW0YLq1tEPCwDR
	9lnFGrXCv6r44=; b=Ud1ezlZulJ19pMoMC9cV2Puhpc6xfvY5kH8l9lzJzReHWw
	mKEvGrCq+8tKTYQ2MxDxhIU69JV0pOnXy39LBfKHxozegDXvBfvTmpds52s5U6cE
	/B8hVE2W8NjEjWAswsJNBdI1NjgMAEZpxAZmQ2gRLaUTDivnAluHG4qYTu7XsDwF
	Vsk72wk+IJjAz3KWLN/C9Bbd92H7vh+BDHU0ZjrBqUI/zYCcM9fmOWIHGJocsLRR
	RFqfscnpogqSAjX1viBd8MZh0c3dOnzgnvPYX0MV5maeP1AFCCwYIoJhH103h2O4
	ttiB6tX1e7rVFmgT6CXyJjvDJ+Kc6/eoN7Ra3efQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc7x4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 15:33:33 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A6FXWW0020778;
	Thu, 6 Nov 2025 15:33:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc7x4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 15:33:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A6FSEis009863;
	Thu, 6 Nov 2025 15:33:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kp3cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 15:33:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A6FXSer15008248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 15:33:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8439B20043;
	Thu,  6 Nov 2025 15:33:28 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90CA520040;
	Thu,  6 Nov 2025 15:33:27 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Nov 2025 15:33:27 +0000 (GMT)
Date: Thu, 6 Nov 2025 16:33:26 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
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
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
Message-ID: <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <87ms5050g0.ritesh.list@gmail.com>
 <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
 <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
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
In-Reply-To: <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX/YZyxmYrnrJ9
 xCd4ujIZq7y0lim+YrboYNwl5TsRqk1oOoSjjpPrN2bdS3Yj8+BGw0eDwtF58nU1AxMxpNChFIt
 kjix63Qwyja0jEYGMpU1W2106lg0/CJxII5rA6IH8ca9YKwDy28POrrS/UliHt5WUxWiY4RvYvK
 KvjB7Q8W206gTc1ADhSmWj/G5k8ScNY8TzY3EvQXr/BVbxmytuyeX5wifFN5ALnc+chrAMwW/6j
 QnaXo4exfOcjHuuvP3Y/8qCuhkp//Cj/oqysiN8ehC/uU7vBozF7kWjRZh1pps/+U+PuMO1myX5
 CRiCQpqgahhrliHsenckRMbSmwXbtqSltJhRXk0UqsG5hBu7Va14xA+ZT8E/Z1xVt8mLCpJRj/v
 zoQNd/ElbUWMuQJeG/kbcYXCoAfCRQ==
X-Proofpoint-GUID: TFOhjUGUwcHF-txd3JWs84wNA_RrcFJO
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690cbfcd cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=ENMs_uJo8d3F8rUHHo4A:9 a=CjuIK1q_8ugA:10
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: 0GlCJX74XkrUHHpzFp_J9wLdkqJNwiej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 10:51:43AM +0000, Kevin Brodsky wrote:
> On 05/11/2025 16:12, Alexander Gordeev wrote:
> > On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
> >>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> >>> + * currently enabled.
> >>>   */
> >>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> >>>  static inline void lazy_mmu_mode_enable(void)
> >>>  {
> >>> -	arch_enter_lazy_mmu_mode();
> >>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> >>> +
> >>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
> >>> +	/* enable() must not be called while paused */
> >>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> >>> +
> >>> +	if (state->nesting_level++ == 0) {
> >>> +		state->active = true;
> >>> +		arch_enter_lazy_mmu_mode();
> >>> +	}
> >>>  }
> >> Some architectures disables preemption in their
> >> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
> >> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
> > Do you have some scenario in mind that could cause an issue?
> > IOW, what could go wrong if the process is scheduled to another
> > CPU before preempt_disable() is called?
> 
> I'm not sure I understand the issue either.
> 
> >>   static inline void lazy_mmu_mode_enable(void)
> >>   {
> >>  -	arch_enter_lazy_mmu_mode();
> >>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> >>  +
> >>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
> >>  +	/* enable() must not be called while paused */
> >>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> >>  +
> >>  +	if (state->nesting_level++ == 0) {
> >>  +		arch_enter_lazy_mmu_mode();
> >>  +		state->active = true;
> >>  +	}
> >>   }
> >>
> >> ... I think it make more sense to enable the state after the arch_**
> >> call right.
> > But then in_lazy_mmu_mode() would return false if called from
> > arch_enter_lazy_mmu_mode(). Not big problem, but still..
> 
> The ordering of nesting_level/active was the way you expected in v3, but
> the conclusion of the discussion with David H [1] is that it doesn't
> really matter so I simplified the ordering in v4 - the arch hooks
> shouldn't call in_lazy_mmu_mode() or inspect lazy_mmu_state.
> arch_enter()/arch_leave() shouldn't need it anyway since they're called
> once per outer section (not in nested sections). arch_flush() could
> potentially do something different when nested, but that seems unlikely.
> 
> - Kevin
> 
> [1]
> https://lore.kernel.org/all/af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com/

I might be misunderstand this conversation, but it looked to me as a discussion
about lazy_mmu_state::nesting_level value, not lazy_mmu_state::active.

I do use in_lazy_mmu_mode() (lazy_mmu_state::active) check from the arch-
callbacks. Here is the example (and likely the only case so far) where it hits:

static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
				      void *_data)
{
	lazy_mmu_mode_pause();
	...
	if (likely(pte_none(ptep_get(ptep)))) {

		/* Here set_pte() checks whether we are in lazy_mmu mode */
		set_pte_at(&init_mm, addr, ptep, pte);	<--- calls set_pte()
		data->pages[index] = NULL;
	}
	...
	lazy_mmu_mode_resume();
	...
}

So without in_lazy_mmu_mode() check above the arch-specific set_pte()
implementation enters a wrong branch, which ends up in:

[  394.503134] Call Trace:
[  394.503137]  [<00007fffe01333f4>] dump_stack_lvl+0xbc/0xf0 
[  394.503143]  [<00007fffe010298c>] vpanic+0x1cc/0x418 
[  394.503149]  [<00007fffe0102c7a>] panic+0xa2/0xa8 
[  394.503154]  [<00007fffe01e7a8a>] check_panic_on_warn+0x8a/0xb0 
[  394.503160]  [<00007fffe082d122>] end_report+0x72/0x110 
[  394.503166]  [<00007fffe082d3e6>] kasan_report+0xc6/0x100 
[  394.503171]  [<00007fffe01b9556>] ipte_batch_ptep_get+0x146/0x150 
[  394.503176]  [<00007fffe0830096>] kasan_populate_vmalloc_pte+0xe6/0x1e0 
[  394.503183]  [<00007fffe0718050>] apply_to_pte_range+0x1a0/0x570 
[  394.503189]  [<00007fffe07260fa>] __apply_to_page_range+0x3ca/0x8f0 
[  394.503195]  [<00007fffe0726648>] apply_to_page_range+0x28/0x40 
[  394.503201]  [<00007fffe082fe34>] __kasan_populate_vmalloc+0x324/0x340 
[  394.503207]  [<00007fffe076954e>] alloc_vmap_area+0x31e/0xbf0 
[  394.503213]  [<00007fffe0770106>] __get_vm_area_node+0x1a6/0x2d0 
[  394.503218]  [<00007fffe07716fa>] __vmalloc_node_range_noprof+0xba/0x260 
[  394.503224]  [<00007fffe0771970>] __vmalloc_node_noprof+0xd0/0x110 
[  394.503229]  [<00007fffe0771a22>] vmalloc_noprof+0x32/0x40 
[  394.503234]  [<00007fff604eaa42>] full_fit_alloc_test+0xb2/0x3e0 [test_vmalloc] 
[  394.503241]  [<00007fff604eb478>] test_func+0x488/0x760 [test_vmalloc] 
[  394.503247]  [<00007fffe025ad68>] kthread+0x368/0x630 
[  394.503253]  [<00007fffe01391e0>] __ret_from_fork+0xd0/0x490 
[  394.503259]  [<00007fffe24e468a>] ret_from_fork+0xa/0x30 

I could have cached lazy_mmu_state::active as arch-specific data
and check it, but then what is the point to have it generalized?

Thanks!

