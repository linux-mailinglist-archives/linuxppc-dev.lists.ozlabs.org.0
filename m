Return-Path: <linuxppc-dev+bounces-14081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C9C4C3AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 09:02:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5JtL10yNz3dXM;
	Tue, 11 Nov 2025 19:02:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762848170;
	cv=none; b=blqtfYWJOzDS6tGy17hajPk1uumjHQPo7b9Vu6mqM24dxnS2oFiIUsDyVpTamXBdWNjafdnzF+Tr2btwUuUqk+NvoQpvC/qmI6Zuyg995Bj47SrvxMUD2byGXVReRf4e4uQEBKojKHczbIhpJHPS3DS/7NHr+ridlMynVO4ViCQ0pnmd59GjBLhEyq3r7h7SJVWyO/mmvkZ1/vKudbLK9WnKpgzcPGgYvq3nzGsGGgnEnc2msaq5oLFt+MCMVSc8XNHLd1L2PJjpZI6hHkSaWSqc03QCq3EIBNZSRmZNqMUGhpcNfQLhJJ4vXk3+7Uyda1XXr2ngSEDdY6K4UCzs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762848170; c=relaxed/relaxed;
	bh=a9W0L6CfK0bWdTLm9fJi4xkSwBtlng03J+x1NVveACU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQp3pbWmQgoEBFX7cbmqDj0K66oLrvAINaOrDUlS2eoSlgrdfRIV/2kZoEqIDn9+zebC8DaCqnmEcSpnlL8MIszaHUrO+DuaAiDuP5ymAcodCe1bJhb2oQnzc6hPfb0xYO4boAqFkHdPa9M6wfUWwR8B35kgDGn+yDjZ6cnCfCONID0hqmwLNe1QgLe70zLKf7oTODmaqfCIrgirXZ1J9X8w65UrYbwn7PJCsPkrkCbmHEmBC8rTWUTSeaff8m3Q0BFKv61XCkNs1XH9B60jBaH2QIUu2A2M12yyWTMjDsIO68idAEel/F37QFvWbt8Hy86noBqtHc6qDMpyM+REzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qdo1txQg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qdo1txQg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5JtJ6Mpqz3bt1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 19:02:48 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AALY1xc017402;
	Tue, 11 Nov 2025 08:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a9W0L6
	CfK0bWdTLm9fJi4xkSwBtlng03J+x1NVveACU=; b=qdo1txQgzgOvIHTmCzU7HB
	Gn+DrVuskN48MqA/40OYsz0tP49ocEYlsaI4/lyOl87fxVMg8ZYDJ6WfohfxUa2H
	sCIXGOdWkVT7byFFSSNba85ql3Jovzbu3vHW6s+6oA+dceJ5xhYy0xmHLma5lXwH
	lco3Z991ZRYlMBrC8ph0/LJ1Vvt/e3RGPvY6qNS+2DRsPg2MSEcRVFMIwTtKS8WI
	KYdt+tIQ5ETwHVz86a6K28vbtfyBvCD2F1E+28XuqeV3bN6vX0T9xvwyMQDiSz6P
	IcBBYG90bfN/z8xaZDRdprnl55ftC0Cnz9ls8W5PCCk0f7PgPqbw7DMxKYlyocBw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwtumd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 08:02:00 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AB7kG37026652;
	Tue, 11 Nov 2025 08:01:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwtumb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 08:01:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB5Gbhj014853;
	Tue, 11 Nov 2025 08:01:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aahpk1q0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 08:01:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AB81uo343188530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Nov 2025 08:01:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80F072004B;
	Tue, 11 Nov 2025 08:01:56 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ADFB20040;
	Tue, 11 Nov 2025 08:01:54 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.64.50])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 11 Nov 2025 08:01:54 +0000 (GMT)
Date: Tue, 11 Nov 2025 09:01:52 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
Message-ID: <92eca53f-eb5d-4bd0-ad6c-56c65fdcea86-agordeev@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
 <645178fd-df4e-42fe-b55e-97d9506499be@arm.com>
 <413b2c49-f124-4cda-8fea-a6cc165f6326-agordeev@linux.ibm.com>
 <e428b1d5-65a8-49bc-92dc-ec4a4d933dec@arm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e428b1d5-65a8-49bc-92dc-ec4a4d933dec@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6zTX9ZOrNUJdIPkZTpOF6inwbKLmfWMW
X-Proofpoint-ORIG-GUID: LChZoM8zrhHNbPBL-El76cxb9g1AeKQe
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=6912ed78 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=8nJEP1OIZ-IA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8 a=RmnHjvQuIkE0_jnVAnoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfXyGhka9ktVQcp
 NtumBxw6X433jOZ6hxU7cflzh+FFuYKWWKnULzVPcUOjZXQmkTAqOCdXlHIsHv1lpUX47VickOd
 +ymisGDp/K22Lqycx3j2XXMo0XpqaRXvqkKxvBKvJKxPXuUfuzt3AXkbSqNOdA4ImI9C+Xq1kxt
 TEOnl7KKGrGzBnDhvUHkdpLWQe2Lh5ecd2l9m9sQhLcN/N7oBhjXJoRqt609HdHHCQ8kIUpq28s
 Sh00eZmpM+PD2+npNB09KeaWuLe3d4wgMIavWSzMSuvE62y1vEOzjS8GZEWtbBR0nfeizZ8kPEd
 goqFEPPBTD0yzYfjqEub6US2xXlbVyhasXpHCLWJWgCsNJJetNjX1OgXN6mLcI9N0yKOs9EGAVS
 77b7qIhDEPM4ZI6Q7fzDt9a5okKZvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 09:19:40AM +0000, Ryan Roberts wrote:
> On 10/11/2025 08:11, Alexander Gordeev wrote:
> > On Fri, Nov 07, 2025 at 03:22:54PM +0000, Ryan Roberts wrote:
> > 
> > Hi Ryan,
> > 
> >> On 07/11/2025 14:34, David Hildenbrand (Red Hat) wrote:
> >>>>>   #ifndef pte_batch_hint
> >>>>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> >>>>> index 5d2a876035d6..c49b029d3593 100644
> >>>>> --- a/mm/kasan/shadow.c
> >>>>> +++ b/mm/kasan/shadow.c
> >>>>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep,
> >>>>> unsigned long addr,
> >>>>>       pte_t pte;
> >>>>>       int index;
> >>>>>   -    arch_leave_lazy_mmu_mode();
> >>>>> +    lazy_mmu_mode_pause();
> >>>>
> >>>> I wonder if there really are use cases that *require* pause/resume? I think
> >>>> these kasan cases could be correctly implemented using a new nest level instead?
> >>>> Are there cases where the effects really need to be immediate or do the effects
> >>>> just need to be visible when you get to where the resume is?
> >>>>
> >>>> If the latter, that could just be turned into a nested disable (e.g. a flush).
> >>>> In this case, there is only 1 PTE write so no benefit, but I wonder if other
> >>>> cases may have more PTE writes that could then still be batched. It would be
> >>>> nice to simplify the API by removing pause/resume if we can?
> >>>
> >>> It has clear semantics, clearer than some nest-disable IMHO.
> >>>
> >>> Maybe you can elaborate how you would change ("simplify") the API in that
> >>> regard? What would the API look like?
> >>
> >> By simplify, I just meant can we remove lazy_mmu_mode_pause() and
> >> lazy_mmu_mode_resume() ?
> >>
> >>
> >> We currently have:
> >>
> >> apply_to_page_range
> >>   lazy_mmu_mode_enable()
> >>     kasan_populate_vmalloc_pte()
> >>       lazy_mmu_mode_pause()
> >>       <code>
> >>       lazy_mmu_mode_resume()
> >>   lazy_mmu_mode_disable()
> >>
> >> Where <code> is setting ptes. But if <code> doesn't need the effects to be
> >> visible until lazy_mmu_mode_resume(), then you could replace the block with:
> >>
> >> apply_to_page_range
> >>   lazy_mmu_mode_enable()
> >>     kasan_populate_vmalloc_pte()
> >>       lazy_mmu_mode_enable()
> >>       <code>
> >>       lazy_mmu_mode_disable()
> >>   lazy_mmu_mode_disable()
> >>
> >> However, looking at this more closely, I'm not really clear on why we need *any*
> >> special attention to lazy mmu inside of kasan_populate_vmalloc_pte() and
> >> kasan_depopulate_vmalloc_pte().
> >>
> >> I *think* that the original concern was that we were doing ptep_get(ptep) inside
> >> of a lazy_mmu block? So we need to flush so that the getter returns the most
> >> recent value? But given we have never written to that particular ptep while in
> >> the lazy mmu block, there is surely no hazard in the first place?
> > 
> > There is, please see:
> > https://lore.kernel.org/linux-mm/cover.1755528662.git.agordeev@linux.ibm.com/
> 
> I've stared at this for a while, but I'm afraid I still don't see the problem.
> This all looks safe to me. Could you explain exactly what this issue is?
> 
> If I've understood correctly, kasan_populate_vmalloc() is called during virtual
> range allocation by vmalloc. This is not in a nested lazy mmu block (but it
> wouldn't matter if it was once we have Kevin's nested changes to ensure flush
> when exiting the nested scope). kasan_populate_vmalloc() calls
> apply_to_page_range(), which will walk the set of ptes, calling
> kasan_populate_vmalloc_pte() for each one. kasan_populate_vmalloc_pte() does a
> ptep_get() then, if none, calls set_pte_at().
> 
> That's not a hazard since you're calling get before the set and you only visit
> each pte once for the apply_to_page_range() lazy mmu block.

I have to admit I do not remember every detail and would have to recreate
the issue - which is specific to s390 lazy_mmu implementation I think.
Both kasan_populate_vmalloc_pte() and kasan_depopulate_vmalloc_pte() do:

apply_to_page_range()
{
    arch_enter_lazy_mmu_mode();

    kasan_de|populate_vmalloc_pte()
    {
        arch_leave_lazy_mmu_mode();             <--- remove?

        spin_lock(&init_mm.page_table_lock);
        <PTE update>
        spin_unlock(&init_mm.page_table_lock);	<--- PTE store should be done

        arch_enter_lazy_mmu_mode();             <--- remove?
    }

    arch_leave_lazy_mmu_mode();
}

Upon return from spin_unlock() both kasan callbacks expect the PTE contains
an updated value to be stored to pgtable. That is true unless we remove
arch_leave|enter_lazy_mmu_mode() brackets. If we do the value is continued
to be cached and only stored when the outer arch_leave_lazy_mmu_mode() is
called. That results in a race between concurrent PTE updaters.

> >> apply_to_existing_page_range() will only call kasan_depopulate_vmalloc_pte()
> >> once per pte, right? So given we read the ptep before writing it, there should
> >> be no hazard? If so we can remove pause/resume.
> > 
> > Unfortunately, we rather not, please see:
> > https://lore.kernel.org/linux-mm/d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com/
> 
> Sorry but I don't see anything relavent to my point in this mail. Perhaps there
> is some s390-specific detail that I'm failing to understand?

Sorry, with this message I meant the branch where it was discussed,
I will try to C&P some excerpts and summarize it here.

* lazy_mmu_mode_enable()

This helper is parameter-free, assuming the MMU unit does not need any
configuration other than turning it on/off. That is currently true, but
(as I noted in my other mail) I am going to introduce a friend enable
function that accepts parameters, creates an arch-specific state and
uses it while the lazy mmu mode is active:

static inline void arch_enter_lazy_mmu_mode_pte(struct mm_struct *mm,
						unsigned long addr,
						unsigned long end,
						pte_t *ptep)
{
	...
}

* lazy_mmu_mode_resume() -> arch_enter_lazy_mmu_mode()

Conversely, this needs to be -> arch_resume_lazy_mmu_mode(). And it can not
be arch_enter_lazy_mmu_mode(), since a lazy_mmu_mode_resume() caller does
not know the parameters passed to the original lazy_mmu_mode_enable(...)-
friend.

> 
> Thanks,
> Ryan

Thanks!

> > 
> > The problem is kasan code invokes apply_to_page_range(), which enters lazy_mmu
> > mode unconditionally. I would claim that is rather an obstacle for the kasan
> > code, not a benefit. But it needs to be tackled.
> > > Should apply_to_page_range() had an option not to enter the lazy_mmu mode
> > (e.g. an extra "bool skip_lazy" parameter) - the pause/resume could have
> > been avoided.
> > 
> >> Thanks,
> >> Ryan
> > 
> > Thanks!

