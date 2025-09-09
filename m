Return-Path: <linuxppc-dev+bounces-11971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B266FB4FFAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 16:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLmgM1nqqz30N8;
	Wed, 10 Sep 2025 00:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757428783;
	cv=none; b=EmOUUM7qrYI/YKu70VHGvQwLyHWorvMwKtw7/zoLoBHiByuHqlcGXaElVTnHpjDh6jFlpNjX/sSRnhCwDabGRgz5GN2g828EU2/9Z1J8UaJqV1m/D/iHSGzKF3nQ/VF5Qsrb7KmkfE+kNLyEpWMF8taUsS6fB/m+1qsQJftEDQ92FL96h/dwKFHPDJlOD5iKf/30/FXywa8HjWGzuPPX2uYwaOFyhPMo0S4XNQpYcAtfYiCaIZ4H3lIOZzjS3/W0DwsRwghvoBR0oq0qJXJwlH0Yujcmv0g4Nt+QylEmKURWIv1EaP3L2ZLpUQ/u+GF4YeD76CmTkfmvEGukzza5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757428783; c=relaxed/relaxed;
	bh=PZxnElgXfWNXHVRkPVUlwCfE0YEzKBATAK/iNRyCHno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjRSqh6gzMQDkbLqTiRNd3WYWDBbZMseXn1rNCNt2dbvdkXcgEANipou7PEJ6MhMuPlmbFZ01UA/8U/Dc1r1divYgiNQ5OLzQuIrqC9ABvGQkeHkH5924NRLlbIIUOg3+jRObNwe91KXCCN6sP4HuhniZpjUvCNXQM4hSRsxzoirkt/HtkSUcnmHI/QqxzvruJFUy9dAUw1cF1t7jd17kY0f0zgxxegGiTtXhHAo1Y2wp9SfIwouF8xoxKizMWu4LmduqQ8hU5ImDl5Ci3LkPIh3HjiQhxIVywCXP2rC/6F/wKIOrW9gGXx1TPeJrUAgyQqs5sVhCepKKopiBaCn5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eAw85XMT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eAw85XMT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLmgL0lMYz30FR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 00:39:41 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589BBEbn028671;
	Tue, 9 Sep 2025 14:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PZxnEl
	gXfWNXHVRkPVUlwCfE0YEzKBATAK/iNRyCHno=; b=eAw85XMTzWR9vGa1/hE9vj
	mydHz5ZGmT77GHt0U64/1YAtQ+lSFTmIp9CIEXj9AqCB1xpfIW94Ks0mq2SdgDpJ
	0FPArRwybEixPfZaOslsDAe44oIe3Tm1gRsGZY/RLa+8mT3lM30D87vp64U0OPcE
	AyEhpKjxohjXf8zMTSl45uNLe+xdcC+WMRvNiK8F4OVX4+mUboi1o5W9xWOJyuG4
	YBGbdgCpU8wPxsq98ebD9TZKO89s1xp8D5BcFUSvtxMjUPUOH9oIgZBJ+OTTT7hW
	3ZKsxlOOkqxL4/35WGGIhaGdo6h3UOz5oPnEPsFraOl5KI9HlFyrZTNClQjrf38A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycw9r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 14:38:52 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 589EUjFv007959;
	Tue, 9 Sep 2025 14:38:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycw9r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 14:38:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 589AvumM017218;
	Tue, 9 Sep 2025 14:38:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gmbdxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 14:38:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 589EcnS049545616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 14:38:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0279320043;
	Tue,  9 Sep 2025 14:38:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2791F2004B;
	Tue,  9 Sep 2025 14:38:48 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  9 Sep 2025 14:38:48 +0000 (GMT)
Date: Tue, 9 Sep 2025 16:38:46 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
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
In-Reply-To: <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w3un9YJFAnj-nx4lP2drAL9l1yJOP1En
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX5AD3L9SkswSm
 yrVgoGtIISKP604rm8z2wlBI+9ePIXNFYQAYLSzjXIjHlXrJz/N5CyEoKiLBFH0S6cAaacNg8MI
 /uqSqt+AyIfCoA2W1PycTsyoA9dnPphhk2M6Dy7RNUKN5o43iFF9IXyIGVBQKdc5LYc5Tqn/OPM
 HPGZJ2R+BrI/nWN/OrWkeMYz3esjc3UK9kdBknkAwa1vw44DfXe2kcF7OMH8RK37Zmyzfk8ftAT
 Mah9tj2mXv8ZZFGcLXNuNYIctcCpzvNgMf9Y+RDBJM2AEQkCBcXflTuYScwL6Aa0Fdpz3OLg/9L
 oof/OuMSKGRkSalY70FlPW8UQK4wZ6ys9K9DbelwH72mhkNMfgbwQ1G8LikJGVg3ZsfCHBBKKvz
 o+6LVfHA
X-Proofpoint-GUID: kEu557zaNP3aZma9JIWXWvvSIckTRd-u
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68c03bfc cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=yJojWOMRYYMA:10 a=0nQrape7h3WL6H1kZSkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 09, 2025 at 03:49:46PM +0200, Kevin Brodsky wrote:
> On 09/09/2025 13:54, David Hildenbrand wrote:
> > On 09.09.25 13:45, Alexander Gordeev wrote:
> >> On Tue, Sep 09, 2025 at 12:09:48PM +0200, David Hildenbrand wrote:
> >>> On 09.09.25 11:40, Alexander Gordeev wrote:
> >>>> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
> >>>>> On 08.09.25 09:39, Kevin Brodsky wrote:
> >>>>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> >>>>>> (taking and returning no value). This is proving problematic in
> >>>>>> situations where leave() needs to restore some context back to its
> >>>>>> original state (before enter() was called). In particular, this
> >>>>>> makes it difficult to support the nesting of lazy_mmu sections -
> >>>>>> leave() does not know whether the matching enter() call occurred
> >>>>>> while lazy_mmu was already enabled, and whether to disable it or
> >>>>>> not.
> >>>>>>
> >>>>>> This patch gives all architectures the chance to store local state
> >>>>>> while inside a lazy_mmu section by making enter() return some value,
> >>>>>> storing it in a local variable, and having leave() take that value.
> >>>>>> That value is typed lazy_mmu_state_t - each architecture defining
> >>>>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> >>>>>> For now we define it as int everywhere, which is sufficient to
> >>>>>> support nesting.
> >>>> ...
> >>>>>> {
> >>>>>> + lazy_mmu_state_t lazy_mmu_state;
> >>>>>> ...
> >>>>>> - arch_enter_lazy_mmu_mode();
> >>>>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> >>>>>> ...
> >>>>>> - arch_leave_lazy_mmu_mode();
> >>>>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> >>>>>> ...
> >>>>>> }
> >>>>>>
> >>>>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
> >>>>>>      lazy_mmu is already enabled, and it temporarily disables it by
> >>>>>>      calling leave() and then enter() again. Here we want to ensure
> >>>>>>      that any operation between the leave() and enter() calls is
> >>>>>>      completed immediately; for that reason we pass
> >>>>>> LAZY_MMU_DEFAULT to
> >>>>>>      leave() to fully disable lazy_mmu. enter() will then
> >>>>>> re-enable it
> >>>>>>      - this achieves the expected behaviour, whether nesting
> >>>>>> occurred
> >>>>>>      before that function was called or not.
> >>>>>>
> >>>>>> Note: it is difficult to provide a default definition of
> >>>>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
> >>>>>> that definition would need to be available in
> >>>>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
> >>>>>>     #include there is very tricky due to the existing header soup.
> >>>>>
> >>>>> Yeah, I was wondering about exactly that.
> >>>>>
> >>>>> In particular because LAZY_MMU_DEFAULT etc resides somewehere
> >>>>> compeltely
> >>>>> different.
> >>>>>
> >>>>> Which raises the question: is using a new type really of any
> >>>>> benefit here?
> >>>>>
> >>>>> Can't we just use an "enum lazy_mmu_state" and call it a day?
> >>>>
> >>>> I could envision something completely different for this type on s390,
> >>>> e.g. a pointer to a per-cpu structure. So I would really ask to stick
> >>>> with the current approach.
> 
> This is indeed the motivation - let every arch do whatever it sees fit.
> lazy_mmu_state_t is basically an opaque type as far as generic code is
> concerned, which also means that this API change is the first and last
> one we need (famous last words, I know). 
> 
> I mentioned in the cover letter that the pkeys-based page table
> protection series [1] would have an immediate use for lazy_mmu_state_t.
> In that proposal, any helper writing to pgtables needs to modify the
> pkey register and then restore it. To reduce the overhead, lazy_mmu is
> used to set the pkey register only once in enter(), and then restore it
> in leave() [2]. This currently relies on storing the original pkey
> register value in thread_struct, which is suboptimal and most
> importantly doesn't work if lazy_mmu sections nest. With this series, we
> could instead store the pkey register value in lazy_mmu_state_t
> (enlarging it to 64 bits or more).
> 
> I also considered going further and making lazy_mmu_state_t a pointer as
> Alexander suggested - more complex to manage, but also a lot more flexible.
> 
> >>> Would that integrate well with LAZY_MMU_DEFAULT etc?
> >>
> >> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
> >> want to use it - at least that is how I read the description above.
> >>
> >> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
> >> that do not follow this pattern, and it looks as a problem to me.
> 
> This discussion also made me realise that this is problematic, as the
> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
> convenience, not for generic code (where lazy_mmu_state_t should ideally
> be an opaque type as mentioned above). It almost feels like the kasan
> case deserves a different API, because this is not how enter() and
> leave() are meant to be used. This would mean quite a bit of churn
> though, so maybe just introduce another arch-defined value to pass to
> leave() for such a situation - for instance,
> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?

What about to adjust the semantics of apply_to_page_range() instead?

It currently assumes any caller is fine with apply_to_pte_range() to
enter the lazy mode. By contrast, kasan_(de)populate_vmalloc_pte() are
not fine at all and must leave the lazy mode. That literally suggests
the original assumption is incorrect.

We could change int apply_to_pte_range(..., bool create, ...) to e.g.
apply_to_pte_range(..., unsigned int flags, ...) and introduce a flag
that simply skips entering the lazy mmu mode.

Thanks!

