Return-Path: <linuxppc-dev+bounces-2580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC849B05A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 16:22:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZlP51RCWz2y8P;
	Sat, 26 Oct 2024 01:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729866169;
	cv=none; b=JN7MLROLO6Ha7nHzinvDcmq2gmlX5SQcsh4oe/6v+w01AYTnslsTtus/Tx4FeeiKlQ3h6IA7aLvCBhiXj+6dvFUMMxteIedhYRNocre3czBEQmycefs8WK7y5zkoIXeCBRp8KYL2moa50IphRGHkjRgMz8aUFV1tTNOuSiiuXO/y70i6wrKVdZ8NFaV30n+u9+7nQVJ2hB612vf7O7UV4eXOym7eBGSmVeunb30n5YDJwybBNNEedEINZibK9QIgXJkC3zaT63srHaOr885i0wzuYApYMOVYPJcOrJFA8f/lubexjBvpdOgXP5H7nz7JfqHENshIahyqvr8EVDobuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729866169; c=relaxed/relaxed;
	bh=ZeVnIZsZ+W6LZTALEEW0rV0SpWEyEKWMjQtAarasrAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OazBY9Ihh1l30EN/cD6wgQstLGVLuPf34FRl35fIOVSTl2HDYBb33SOCpRdqUtiIe32rqaAhxF9FkHK6K+59UR7i1vUXfuDdVtfBGi/khTFPr6JJHSp6KWShceu82qaOETYf6yVDvnAbMlAOyFyslkexn32UoOsOu2EbzlGQ3jn4rmyLGSYOOmtFtomgFbmnoVekSV8uKf+1v5LkmOPofE7FCwJkql2caLr6xt6j7sxHOWxAoJwkI24TbyHeiUsY5jXmdba1h0E3f4pxBpvNVTTOlDjq61m4a7oQBU9R0mlGbWcSDQGqJBJ70tziCdelW16iU0208ADEcaCJDkfTZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFmXHLSi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFmXHLSi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZlP32tnsz2y89
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 01:22:46 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P20eTu016724;
	Fri, 25 Oct 2024 14:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ZeVnIZsZ+W6LZTALEEW0rV0SpWEyEK
	WMjQtAarasrAs=; b=VFmXHLSi18rIA3bfaHj6q8I5FMWL1CMHjA7Za2xDW8tmdc
	NImQmyWh2aUPAn6C8Q9ouVGlm9p42bBGsq6jVMzFUe4wxl8QLJIbCMqZbboK4XJE
	NBE/1tidihamMyGO9raVN9kBAQsyGizUaIPdxfeMYPW7NOLpuICEc73/2Br671N+
	Q969V41NIiksVvpZ0YUI8leCc++eeMdz6Yg5jdeugLutJApyw3CrjKW3zWXM+Bq9
	Kl381Uv4kZhm3l25WcQu+Z1ktu0OJP6OFYP8jaWLZbvuxd5OtKQPgqPfZMQkrCY7
	nMw5fGkfL3E/LenIxuOrNwmKyQDgBkps1wZhB8kA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emajxgtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:22:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49PEMUpv029480;
	Fri, 25 Oct 2024 14:22:30 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emajxgtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:22:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAbv44008796;
	Fri, 25 Oct 2024 14:22:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emkax34j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:22:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49PEMSYC32440840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 14:22:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 636EB2004B;
	Fri, 25 Oct 2024 14:22:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 790ED20043;
	Fri, 25 Oct 2024 14:22:26 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.31.149])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Oct 2024 14:22:26 +0000 (GMT)
Date: Fri, 25 Oct 2024 19:52:23 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU
 before running it to avoid spurious interrupts
Message-ID: <x4sx3g3as4xzhby6gyonh73z54y6z7d5s37yferz3ybbyc6skd@fjwoxrgz6rds>
References: <20241024173417.95395-1-gautam@linux.ibm.com>
 <877c9wkf8q.fsf@mail.lhotse>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c9wkf8q.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KOMBPlvXuVQ2ggS1xN5NnXnFwyFOY6Iw
X-Proofpoint-GUID: jdzenZ0xq_9A_mSgMqBUxBZxed7KPAIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 02:56:05PM +1100, Michael Ellerman wrote:
> Hi Gautam,
> 
> A few comments below ...
> 
> Gautam Menghani <gautam@linux.ibm.com> writes:
> > Mask off the LPCR_MER bit before running a vCPU to ensure that it is not
> > set if there are no pending interrupts.
> 
> I would typically leave this until the end of the change log. ie.
> describe the bug and how it happens first, then the fix at the end.
> 
> But it's not a hard rule, so up to you.

Yes agreed, that would make more sense.

> 
> > Running a vCPU with LPCR_MER bit
>             ^
>         "an L2 vCPU"
> 
> In general if you can qualify L0 vs L1 vs L2 everywhere it would help
> folks follow the description.

yes will add it in v3
> 
> > set and no pending interrupts results in L2 vCPU getting an infinite flood
> > of spurious interrupts. The 'if check' in kvmhv_run_single_vcpu() sets
> > the LPCR_MER bit if there are pending interrupts.
> >
> > The spurious flood problem can be observed in 2 cases:
> > 1. Crashing the guest while interrupt heavy workload is running
> >   a. Start a L2 guest and run an interrupt heavy workload (eg: ipistorm)
> >   b. While the workload is running, crash the guest (make sure kdump
> >      is configured)
> >   c. Any one of the vCPUs of the guest will start getting an infinite
> >      flood of spurious interrupts.
> >
> > 2. Running LTP stress tests in multiple guests at the same time
> >    a. Start 4 L2 guests.
> >    b. Start running LTP stress tests on all 4 guests at same time.
> >    c. In some time, any one/more of the vCPUs of any of the guests will
> >       start getting an infinite flood of spurious interrupts.
> >
> > The root cause of both the above issues is the same:
> > 1. A NMI is sent to a running vCPU that has LPCR_MER bit set.
> > 2. In the NMI path, all registers are refreshed, i.e, H_GUEST_GET_STATE
> >    is called for all the registers.
> > 3. When H_GUEST_GET_STATE is called for lpcr, the vcpu->arch.vcore->lpcr
> >    of that vCPU at L1 level gets updated with LPCR_MER set to 1, and this
> >    new value is always used whenever that vCPU runs, regardless of whether
> >    there was a pending interrupt.
> > 4. Since LPCR_MER is set, the vCPU in L2 always jumps to the external
> >    interrupt handler, and this cycle never ends.
> >
> > Fix the spurious flood by making sure a vCPU's LPCR_MER is always masked
> > before running a vCPU.
> 
> I think your original sentence at the top of the change log is actually more
> accurate. ie. it's not that LPCR_MER is always cleared, it's cleared
> *unless there's a pending interrupt*.

Yes agreed
> 
> > Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
> > Cc: stable@vger.kernel.org # v6.8+
> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> > ---
> > V1 -> V2:
> > 1. Mask off the LPCR_MER in vcpu->arch.vcore->lpcr instead of resetting
> > it so that we avoid grabbing vcpu->arch.vcore->lock. (Suggested by
> > Ritesh in an internal review)
> 
> Did v1 take the vcore->lock? I don't remember it.

No v1 did not take a lock, but ideally was supposed to take a lock. I
missed the locking part there.
> 
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index 8f7d7e37bc8c..b8701b5dde50 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -5089,9 +5089,19 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
> >  
> >  	do {
> >  		accumulate_time(vcpu, &vcpu->arch.guest_entry);
> > +		/*
> > +		 * L1's copy of L2's lpcr (vcpu->arch.vcore->lpcr) can get its MER bit
>                                      ^
>                                      LPCR

Ack. 
> > +		 * unexpectedly set - for e.g. during NMI handling when all register
> > +		 * states are synchronized from L0 to L1. L1 needs to inform L0 about
> > +		 * MER=1 only when there are pending external interrupts.
> > +		 * kvmhv_run_single_vcpu() anyway sets MER bit if there are pending
> > +		 * external interrupts. Hence, mask off MER bit when passing vcore->lpcr
> > +		 * here as otherwise it may generate spurious interrupts in L2 KVM
> > +		 * causing an endless loop, which results in L2 guest getting hung.
> > +		 */
> >  		if (cpu_has_feature(CPU_FTR_ARCH_300))
> >  			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
> > -						  vcpu->arch.vcore->lpcr);
> > +						  vcpu->arch.vcore->lpcr & ~LPCR_MER);
>  
> This is much better than v1 which hid the clearing of LPCR_MER in a macro.
> 
> But I still wonder if it would be better to clear it in
> kvmhv_run_single_vcpu() itself.
> 
> The logic to set LPCR_MER is already in there, so why not ensure
> LPCR_MER is cleared as part of that some block?
> 
> I realise there's another caller of kvmhv_run_single_vcpu() from the
> nested code, but that's OK because there's already a nested check in
> kvmhv_run_single_vcpu(), so you can still isolate this change to just
> the non-nested case.
> 

Yes it would be better to mask off LPCR_MER inside
kvmhv_run_single_vcpu(), will make that change and send v3. 

> cheers

Thanks,
Gautam

