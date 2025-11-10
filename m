Return-Path: <linuxppc-dev+bounces-13989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC3C45525
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 09:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4j8b6jwXz2xqZ;
	Mon, 10 Nov 2025 19:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762762383;
	cv=none; b=SkI6R18C73F5rBcmCwoeIRUKxpRoESyGdv5VzHkFWMbtgNsBuywpcL8rlRTtjSNHwQ6erManKyreM/DnqZnvEH63zuy9LODi4Wd2z0mdETkgpd/ObDJQDEmhG7iVDIP/53q4jmIG/R73FNOBHjIknVgFnQ2WIAFupASlE0fRBa1wdtG/v/0C93+zavqmmocvYHcZxA7xrLAyvIuTt+3oAzvaX1/5KNcEv9/4HvyLy0pYG9qBq0cP3jb+nOAwDInmlUi7c5I6We7ywMP2k1Eaebshr2EuTykBTQ4rIKGKvX3ClEWbHRbkRlZxAwafrQr9tcTr2dI8MSdsTxaKl1HloA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762762383; c=relaxed/relaxed;
	bh=WrPV25ztsYqDlknSOqBjqi2t4Xb9rXv0xi6T3uNdmFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMmMU3edrL9YX/KNXOlw/o86KPdVRfrwhHyv1ZVHhwZBP0ktzYpedLj7tNRYMYc8pEDmmcyd2atdZZj8/mDjsV4rBzxvufCDsg7llWxRS3u0uQk380ANS4aDjZ4060VfDmi3EfSZ8o0LNfWM60HG4tx+Ps4xMbl3xwyeq3FW2htuaOb8VZ6lq5IYHkS70FoDsamMg+xjhYuewTtPsB6f4Q3ZwBpcRTTBOGbQzA5Emj/7+AQ4Mj22GgDzzx1NXccsQdiNXYWVikbMDPQ3Y+Y8+5uac119OpjB0R4+xU28UUW/citG58GXqAmmj/2SaAb2ukYYAeV7pv2Tp5jeZd27Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yv6+1trT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yv6+1trT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4j8Z55TKz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 19:13:01 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9Mrb3H023648;
	Mon, 10 Nov 2025 08:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WrPV25
	ztsYqDlknSOqBjqi2t4Xb9rXv0xi6T3uNdmFI=; b=Yv6+1trT97d7+DoSIjC5W6
	OLc4ylQKCKMAex0x0xYUBtCqgGuOUmceIjAitPSSQP4ha308n1vNjyCUQ6cvZ2r4
	ei0eh+6E9Z0WEUSMVNe1jsCNm1I0JTMS3qMI8JK4k2CVJe8jcjFAe6GAYoZoYIPF
	f2cH/cIWwfriYd6HDlkD0TTd91dXSMehLyFJYeYA+XopFefAuy+V38DHQN1UNf/W
	3T+xvOmCCkXhX+7+7DFZbaLjxNtRDGKQpKgGoSwe7T8r3LPSCJLEPD7oCZTkMUFj
	LW2FbGx5/pNgTdyi+piCoZDGmqPtaOa5o+7Wu4AdD2ze9GkYr3qc6pGcoRQ53Zvg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc6y6xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:11:58 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA86mfJ029272;
	Mon, 10 Nov 2025 08:11:58 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc6y6xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:11:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA51uvx014762;
	Mon, 10 Nov 2025 08:11:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aahpjvgyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:11:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA8BsbP47645168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 08:11:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 951A120043;
	Mon, 10 Nov 2025 08:11:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7574A20040;
	Mon, 10 Nov 2025 08:11:52 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.87.129.150])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Nov 2025 08:11:52 +0000 (GMT)
Date: Mon, 10 Nov 2025 09:11:50 +0100
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
Message-ID: <413b2c49-f124-4cda-8fea-a6cc165f6326-agordeev@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
 <645178fd-df4e-42fe-b55e-97d9506499be@arm.com>
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
In-Reply-To: <645178fd-df4e-42fe-b55e-97d9506499be@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAxOCBTYWx0ZWRfX0qxBt6PLz+e1
 5ZkKhsJ1OtkLmCa4F9dckZhmGNoe5OQimO5vrOJyhCGGn+Oo9dBlfBgtY6sJsMOGytiqooOVqqZ
 5VlqH6qDTNOxg7GqSCIIkxN9587HG/yU0g8PN3RC/Kn+8SDIn+tbvRphHit2rtoXvmhJTS9c/na
 zuc/vHReC35SkVZuc771TOtpWXwRcO+j9mxabq08ugqh/MQzZP8E1qqkKzT/vrw3I0gce+auuVH
 8WG34NSJDjSCXhv0z/g1L2qiclooBzH5Y6sWhPQC3GQgXW7SVzsG1L6s2HqrTxBfWDx3OGWlJ4d
 4V2wmLiIQn3wqkNWKtMaFFAnqiHVcDdPhaMGEjvefyMBpcxvcGE7lueGMCRslhcd2O9xOyzBoik
 qwn8HhTZbHMdNrVo7h0rei5NGYuy+g==
X-Authority-Analysis: v=2.4 cv=GcEaXAXL c=1 sm=1 tr=0 ts=69119e4e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=8nJEP1OIZ-IA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8 a=AOQWXcEz_zGDWlu_gTMA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-GUID: fP4xPRY0VPWa2LszakKlWyXVqqNy18Qg
X-Proofpoint-ORIG-GUID: hjtY_m4sJxhd70lXi6KoIa-Y8h7Rk4-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 07, 2025 at 03:22:54PM +0000, Ryan Roberts wrote:

Hi Ryan,

> On 07/11/2025 14:34, David Hildenbrand (Red Hat) wrote:
> >>>   #ifndef pte_batch_hint
> >>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> >>> index 5d2a876035d6..c49b029d3593 100644
> >>> --- a/mm/kasan/shadow.c
> >>> +++ b/mm/kasan/shadow.c
> >>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep,
> >>> unsigned long addr,
> >>>       pte_t pte;
> >>>       int index;
> >>>   -    arch_leave_lazy_mmu_mode();
> >>> +    lazy_mmu_mode_pause();
> >>
> >> I wonder if there really are use cases that *require* pause/resume? I think
> >> these kasan cases could be correctly implemented using a new nest level instead?
> >> Are there cases where the effects really need to be immediate or do the effects
> >> just need to be visible when you get to where the resume is?
> >>
> >> If the latter, that could just be turned into a nested disable (e.g. a flush).
> >> In this case, there is only 1 PTE write so no benefit, but I wonder if other
> >> cases may have more PTE writes that could then still be batched. It would be
> >> nice to simplify the API by removing pause/resume if we can?
> > 
> > It has clear semantics, clearer than some nest-disable IMHO.
> > 
> > Maybe you can elaborate how you would change ("simplify") the API in that
> > regard? What would the API look like?
> 
> By simplify, I just meant can we remove lazy_mmu_mode_pause() and
> lazy_mmu_mode_resume() ?
> 
> 
> We currently have:
> 
> apply_to_page_range
>   lazy_mmu_mode_enable()
>     kasan_populate_vmalloc_pte()
>       lazy_mmu_mode_pause()
>       <code>
>       lazy_mmu_mode_resume()
>   lazy_mmu_mode_disable()
> 
> Where <code> is setting ptes. But if <code> doesn't need the effects to be
> visible until lazy_mmu_mode_resume(), then you could replace the block with:
> 
> apply_to_page_range
>   lazy_mmu_mode_enable()
>     kasan_populate_vmalloc_pte()
>       lazy_mmu_mode_enable()
>       <code>
>       lazy_mmu_mode_disable()
>   lazy_mmu_mode_disable()
> 
> However, looking at this more closely, I'm not really clear on why we need *any*
> special attention to lazy mmu inside of kasan_populate_vmalloc_pte() and
> kasan_depopulate_vmalloc_pte().
> 
> I *think* that the original concern was that we were doing ptep_get(ptep) inside
> of a lazy_mmu block? So we need to flush so that the getter returns the most
> recent value? But given we have never written to that particular ptep while in
> the lazy mmu block, there is surely no hazard in the first place?

There is, please see:
https://lore.kernel.org/linux-mm/cover.1755528662.git.agordeev@linux.ibm.com/

> apply_to_existing_page_range() will only call kasan_depopulate_vmalloc_pte()
> once per pte, right? So given we read the ptep before writing it, there should
> be no hazard? If so we can remove pause/resume.

Unfortunately, we rather not, please see:
https://lore.kernel.org/linux-mm/d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com/

The problem is kasan code invokes apply_to_page_range(), which enters lazy_mmu
mode unconditionally. I would claim that is rather an obstacle for the kasan
code, not a benefit. But it needs to be tackled.

Should apply_to_page_range() had an option not to enter the lazy_mmu mode
(e.g. an extra "bool skip_lazy" parameter) - the pause/resume could have
been avoided.

> Thanks,
> Ryan

Thanks!

