Return-Path: <linuxppc-dev+bounces-11939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFAEB4A85E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLf344WBSz3cZ0;
	Tue,  9 Sep 2025 19:41:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757410880;
	cv=none; b=P8cHWjZ6LqLccs7l5oEo5uSNKxXZpfa/mrHJpRd8brte72Jjf49D1/ohln6faREcWW/G9ywv9TEb483drs/ISbdp/FX5REu69e/3ahhej0nDHr8cdEUXA314ddw8xdU5j7JP8/WKBSC9BzAkgTHTyM6BUBCVGLGOPFpoLV/FfvXYFKjF8kEwEfE34ZrvbdsFfvmxmqIOWa/SCBLsmyQQxpuOP1l1MsRD7jYzMRdla0j7kbH4GdyWBMMOfx9aNJYZO6bYKcgJTQyHgmXD1HEcBS70aNAi7n1eQOa4Wb/7xAK9aiD/P3UCBX4HtWPHKsSU1TS6ZoyoUdQ+ZuLkUyIGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757410880; c=relaxed/relaxed;
	bh=zWcQIXAgSZE3jCftx8qMBMf1VpUurIYqH9HodqEjE0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOLXyu/d5tKD9nOCgmx567NSGJdQqBERmhfY1bvIXqQhb7Z2t2RzmgyR2cRvwzffMVsFylnDDzS55EOrAqNFihTT5JEIhNtOABoXdN41zD+ZkvcYafQWZkaITFmac8xuLoc6/aKeiW6YBVw+yAJMxb1yzIVUe+zIEMMPnCrlLpF8pNaJg7dyWq9k07wcslM8S9vNdJ2Spo1c8B0nWzhRx0idEwt3s9zs81FltBTK1PtcJx+lWR++DBRveeQrGZT8ovspkyfis2FhcyYhNTMJiwaMs5Rfg8wG1q7o8mJtkzdfOGI1H0um05mNLesjHKUYyZGAD2ESmJtwCQ+DU0ykFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ERAKr2/0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ERAKr2/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLf335XNdz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:41:19 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58983LO1017978;
	Tue, 9 Sep 2025 09:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=zWcQIXAgSZE3jCftx8qMBMf1VpUurI
	YqH9HodqEjE0k=; b=ERAKr2/0b+85Gl0gJGPChBwQF66LW3Oi2PTpVHT0S9O3cT
	Ogh6Obsb22mSDB6RKtFvicQxQH7Em5A8oD0I5nxAwaNb8/uo3nlQzflgWHoDaI73
	HJYbO2EM++BmL63dYswiKyf3DCl4sC43LQKUJvgYSzJoqo9flhIr4HpJX5FgSugx
	nxkpTZzhMCKXzjU82MrRkLPjYDbZe873Vx7Wql1XT2f1I7N0MW1XZjVRPa59K2LD
	VV7jPCPICsB1PgyR4Skp/kJKJN0V5UfeoBSNtFq2eg9a3cWAGVbhYaW2tp1HOhpP
	+lYn2f2O6UcFcD/48WOX69CsC02e71Jd9O9OLeiA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqxs3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:40:44 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5899HIXj021030;
	Tue, 9 Sep 2025 09:40:43 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqxs3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:40:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896bOAX008428;
	Tue, 9 Sep 2025 09:40:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109pjf7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:40:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5899eexO52167112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 09:40:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 604B32004D;
	Tue,  9 Sep 2025 09:40:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D98620043;
	Tue,  9 Sep 2025 09:40:38 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.87.149.210])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  9 Sep 2025 09:40:38 +0000 (GMT)
Date: Tue, 9 Sep 2025 11:40:37 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
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
Message-ID: <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
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
In-Reply-To: <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CdA-H8SVNxdbZ5nTnrwiW_1I0UR-iy8D
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68bff61c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=xmnICLmBNk8AszDsb_MA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uTrJRk-Nt5us74ILiXCJ7SL_HOQZhnLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXy71df+5jjUw/
 ntr+yICfUeQPRObSlyN3Yh1y4xhRnHGHhZFfRZCcvuRAacCykIbiLJkHQ30eUBJKOGl10TSIS42
 +3nIeLTG23/y6JszEVZ1Ed+b1iNk9DDxZsvwkIfCXfzVoNJXgV1cawSe1+N/vBFlEkK7ENOmW+P
 5QFev+/ePpqxVRniHssrBkwoaFfvkZZLW/2f9hVQyEtzMR8VsnBMkGYw6WFkufIgIXN5VkhAYVQ
 X+97jjddjBhYGKbSAHhaXMbOCL2qCKM7v5sv/V5bw5Wl8DJ9XDeAuCQ/41VgYzOkHMOtqD+ztQw
 0x/7e9psYHEV7vlYlvzJw+aRJnWLrm5gVwmA8e51Z46BZm3hlJcuLkZtLVQrCNNUZn7EXpW7Hgp
 /9u+P9X3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
> On 08.09.25 09:39, Kevin Brodsky wrote:
> > arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> > (taking and returning no value). This is proving problematic in
> > situations where leave() needs to restore some context back to its
> > original state (before enter() was called). In particular, this
> > makes it difficult to support the nesting of lazy_mmu sections -
> > leave() does not know whether the matching enter() call occurred
> > while lazy_mmu was already enabled, and whether to disable it or
> > not.
> > 
> > This patch gives all architectures the chance to store local state
> > while inside a lazy_mmu section by making enter() return some value,
> > storing it in a local variable, and having leave() take that value.
> > That value is typed lazy_mmu_state_t - each architecture defining
> > __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> > For now we define it as int everywhere, which is sufficient to
> > support nesting.
...
> > {
> > + lazy_mmu_state_t lazy_mmu_state;
> > ...
> > - arch_enter_lazy_mmu_mode();
> > + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> > ...
> > - arch_leave_lazy_mmu_mode();
> > + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> > ...
> > }
> > 
> > * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
> >    lazy_mmu is already enabled, and it temporarily disables it by
> >    calling leave() and then enter() again. Here we want to ensure
> >    that any operation between the leave() and enter() calls is
> >    completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
> >    leave() to fully disable lazy_mmu. enter() will then re-enable it
> >    - this achieves the expected behaviour, whether nesting occurred
> >    before that function was called or not.
> > 
> > Note: it is difficult to provide a default definition of
> > lazy_mmu_state_t for architectures implementing lazy_mmu, because
> > that definition would need to be available in
> > arch/x86/include/asm/paravirt_types.h and adding a new generic
> >   #include there is very tricky due to the existing header soup.
> 
> Yeah, I was wondering about exactly that.
> 
> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
> different.
> 
> Which raises the question: is using a new type really of any benefit here?
> 
> Can't we just use an "enum lazy_mmu_state" and call it a day?

I could envision something completely different for this type on s390,
e.g. a pointer to a per-cpu structure. So I would really ask to stick
with the current approach.

> -- 
> Cheers
> 
> David / dhildenb

Thanks!

