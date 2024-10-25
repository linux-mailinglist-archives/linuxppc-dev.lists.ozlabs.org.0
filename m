Return-Path: <linuxppc-dev+bounces-2581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39F9B05D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 16:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZlZ96M3Sz2y8X;
	Sat, 26 Oct 2024 01:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729866641;
	cv=none; b=iIaEdV9XSxhHCqr5J5bzaOab0PhDBkesSYzE5RUPHySeCs1cxDvvoFjKxfo3/qfC2Gn1ba+/4s8cgHKS3isVVLm8nNM3eOqsHmxb1jE5tH4vhAyD5mTuFxDYHnPOcsfvZAeHt0hVNIahJRPuaqrOS6kp6or078MeOWCwaQj/0FMXvOPwqFpt+GKaDBX8V8jyOImRmRAO6q35LBtag60njZsNadMNzZTM0/IvV7TPQmV12qZU81ZYw7OKLETZCqn5hxV5O8oQmQLr9RWCe6y5GJUoxEalNpUdwU0mrDxnoX8nds3Zuo3jM2d9arZEVuI9ka+6E57jA812APPbAu2WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729866641; c=relaxed/relaxed;
	bh=4aSHpzunucJoG38Awg1OmiC6bUnrZjv8s+7/Ehjm9d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J269izGs8kCAKuUf2dB3bsFIM8WI57JQwZH0KRaW0iI1BwwIbh1ryXd5a5HVwSrc6pPYaLI6VJiGp7boRZy+kd9dtpnhDpUXC/Q13eaoqFE5Tayqw6HAETWC8dYfKkaqXNA8lZQ5CzPVGcrl0eqaO1L+AeVuwICSf7d0AT7GFzyZDuu588eQucFYPPJnSvfiBi2spew3742V0mbyLEl7Rbo1wVxbI45QPDKzgkdHF6fiINaug/JB2faIoHo37aPUF0CxO5az1U6XBHyJE43+6dgLdExWowOh4f60IsAa1glLv9Dlws5VELViiycwk8QjhIFH64F9i2rb9qIftx+klg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SZyqH4AD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SZyqH4AD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZlZ84KKfz2xWT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 01:30:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDiHZn026362;
	Fri, 25 Oct 2024 14:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=4aSHpzunucJoG38Awg1OmiC6bUnrZj
	v8s+7/Ehjm9d8=; b=SZyqH4ADNt0w8ayshcFlgHgONelo/+jptXUf92oUsCZO71
	QAcaz9uOk+N4ksyKrqaMstnTx6HKBVzEteohZ/TyqCEC7VJCyZap6AtHbIVHaoCn
	TC/7VcsC9ZSEgwI3nRFb7UzuSnQWTZvPcPwyJq27r2ZoBslJP90a2nEHqhmRRD/n
	hlUqLsaSHrHMsC/ieKyEs73CKt7hlVK6zCZ72H4JCPOkULqcI4z1lqZMBxVCEzIF
	Bbsy1kHLc87Tl0UJBwg3vpT6q4ppqxKhj9ou/YH6qZgmATe50bZq6K39THJIqb9M
	c0glKC7Q5faVN6ntoQc7p8VsgRKfV5LPrcgHZMIQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emaf6jke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:30:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49PEUNnv001597;
	Fri, 25 Oct 2024 14:30:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emaf6jkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:30:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49PEQCL0001777;
	Fri, 25 Oct 2024 14:30:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emk9p39j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:30:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49PEUL3156557984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 14:30:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B29820040;
	Fri, 25 Oct 2024 14:30:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E83320043;
	Fri, 25 Oct 2024 14:30:19 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.31.149])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Oct 2024 14:30:18 +0000 (GMT)
Date: Fri, 25 Oct 2024 20:00:16 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU
 before running it to avoid spurious interrupts
Message-ID: <4enqw22rinnzklk7b3afty2r54pdlqhm7xry3r56d4levavgc5@znfakd4kw7wy>
References: <20241024173417.95395-1-gautam@linux.ibm.com>
 <871q04oguf.fsf@gmail.com>
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
In-Reply-To: <871q04oguf.fsf@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sh9bilT6NGGhLe9wFw9lFTIvmUIEdRug
X-Proofpoint-ORIG-GUID: Zx4ni3WpydW2FSAYVKzhcQLtXYUhIDM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=963
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 11:37:52AM +0530, Ritesh Harjani (IBM) wrote:
> Gautam Menghani <gautam@linux.ibm.com> writes:
> 
> > Mask off the LPCR_MER bit before running a vCPU to ensure that it is not
> > set if there are no pending interrupts. Running a vCPU with LPCR_MER bit
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
> >
> > Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
> > Cc: stable@vger.kernel.org # v6.8+
> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> > ---
> > V1 -> V2:
> > 1. Mask off the LPCR_MER in vcpu->arch.vcore->lpcr instead of resetting
> > it so that we avoid grabbing vcpu->arch.vcore->lock. (Suggested by
> > Ritesh in an internal review)
> 
> Thanks Gautam for addressing the review comment. But let me improve the
> changelog a little to make it more accurate for others too.
> 
> Removed the macro which was silently clearing LPCR_MER bit from vcore->lpcr
> and instead just mask it off while sending it to kvmhv_run_single_vcpu().
> Added an inline comment describing the reason to avoid anyone tipping
> it over. - (suggested ...)

As suggested by mpe, it would be better to clear LPCR_MER inside
kvmhv_run_single_vcpu() where we check for pending interrupts. But I'll
add the rest of your changelog suggestion in v3.
> 
> 
> Yes, that would also mean that no need of taking any vcore lock since we
> are not modifying any of the vcore state variables which came up in the
> internal review discussion.
> Having said that it will be good to document the usage of vcore->lock
> above the struct kvmppc_vcore definition. Because it isn't obvious of
> when all it should be taken and/or what all it protects?

Yes agreed, I'll send a separate patch documenting this.
> 
> >
> >  arch/powerpc/kvm/book3s_hv.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
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
> > +		 * unexpectedly set - for e.g. during NMI handling when all register
> > +		 * states are synchronized from L0 to L1. L1 needs to inform L0 about
> > +		 * MER=1 only when there are pending external interrupts.
> > +		 * kvmhv_run_single_vcpu() anyway sets MER bit if there are pending
> > +		 * external interrupts. Hence, mask off MER bit when passing vcore->lpcr
> > +		 * here as otherwise it may generate spurious interrupts in L2 KVM
> > +		 * causing an endless loop, which results in L2 guest getting hung.
> > +		 */
> 
> Thanks for describing this inline.
> 
> >  		if (cpu_has_feature(CPU_FTR_ARCH_300))
> >  			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
> > -						  vcpu->arch.vcore->lpcr);
> > +						  vcpu->arch.vcore->lpcr & ~LPCR_MER);
> 
> While still at it - 
> I too like mpe suggestion to clear the LPCR_MER bit at one place
> itself within kvmhv_run_single_vcpu(). 

Yes will send v3.
> 
> >  		else
> >  			r = kvmppc_run_vcpu(vcpu);
> >  
> > -- 
> > 2.47.0
> 
> -ritesh

Thanks,
Gautam

