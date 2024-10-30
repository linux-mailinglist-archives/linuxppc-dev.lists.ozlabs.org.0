Return-Path: <linuxppc-dev+bounces-2726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D729B642C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 14:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xdp492FzYz2yZ6;
	Thu, 31 Oct 2024 00:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730295225;
	cv=none; b=D3Y96siY23TMhmR9qX0NI4+2/LMNLXURqg99MlBbE2HuKbsws1KSCpo6U/GmpJA09nHckVDCd4shibEWYxN9PIFjEz2MCThXVWEwGbuWboQI73k3oNgbx+ytl+VBAmuIywP6z9TxwD4EvixlvJ5r6kwcS0tQJdWAQ/OZ2PiNE2v3ET7AemGEC8826si1ELApbbJCGfLpf7wv+OjvTkqBDypmnbewl+a4lpKdu0CjX5NgNgeUH9pbwLo9ct1d2u7EGpU61TxWnW/l1tR+dkC9b0GrXTGswfak2qbjgc5AKW9zG8MJmvKe4zRZEA/9R9wO/9dfXH8hs03l8pOw87glJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730295225; c=relaxed/relaxed;
	bh=rIN9NEJdpGA1ijQ9VvtPh7aO1g5PzQxogRMddlUsnUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyJsAYSL6nJKHibR8CFhFOSih5XvoQQ4c7qP2Vf3WLwCXRZRgPNFM/ud/7DI2LGBbBNLiFNdjr+oN/cIaBXIqdF2vJYMqgpQrFFj+LLpVwDXfDtSQsD3rK2vIYjdnq9O93NN33YJ69HHZNAp8XDMiPa1JLtIDqUnOC0YF2upo1I8yfaRKeG0a4OFw43Cf8w7aWiX8BBeIbl2osKwJOKnVa62cy2AlUoNWCmfg511B/7Sqw0F+Q8BpUyr+ijDLFNdQ1TMnJIWSgEqv43+PloTh5U3X2RMMvtY/vhqvT9wbnR8qHnLinRtumdihorn4W+fxqmBi3puqdPyjCUQY0vSeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XMksxIRK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XMksxIRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xdp476f0lz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 00:33:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d5dh030110;
	Wed, 30 Oct 2024 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=rIN9NEJdpGA1ijQ9VvtPh7aO1g5PzQ
	xogRMddlUsnUg=; b=XMksxIRKpVClldO1sswFvm3W7qEYoC1DZC4u9Xot5yssHh
	0xwhxxn1xYCq/jHdUbH/ZcWFVKsVbr7fT8V75KJKD08DJLd9BDTcz/8CKi/9+1Fv
	y2z3oYKeG5tF09/9WDw4rLlHGXeAfNIosAtWFe1Y+MAr9IpOTognso/Kqqwkw5Q1
	KMU/jMwHcWVwqo2IWPpslVGUyzieYEbJy+jSEFI9LoYsAeZSXJPJkRLGjLWC2zCa
	XIFL4tuxxC0607O8yX9qj0aL4HYsIYGBbpN+A30epyVz7wq/XEbYJS610/wg/rJP
	a8tHp94xwLI77Zg2zhrr/FDRUbzlSYq2aHhYjnFA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h8yq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:33:31 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49UDXUxF014422;
	Wed, 30 Oct 2024 13:33:30 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h8yq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:33:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49UDLV3u024535;
	Wed, 30 Oct 2024 13:33:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42hcyjfxm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:33:29 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49UDXSH257868608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 13:33:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E5752004B;
	Wed, 30 Oct 2024 13:33:28 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A382004D;
	Wed, 30 Oct 2024 13:33:26 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.21.224])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 30 Oct 2024 13:33:26 +0000 (GMT)
Date: Wed, 30 Oct 2024 19:03:13 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] arch/powerpc/kvm: Fix doorbells for nested KVM
 guests on PowerNV
Message-ID: <rbx6n7cqmslnj4re44hb6hdqcuhfbqvmxo5ebsrk2dqia3hj2w@jljlwne2nzvf>
References: <20240627180342.110238-1-gautam@linux.ibm.com>
 <20240627180342.110238-3-gautam@linux.ibm.com>
 <D2GQSGNWNGX4.2R8TH3M64POGJ@gmail.com>
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
In-Reply-To: <D2GQSGNWNGX4.2R8TH3M64POGJ@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OsRhtwN3hjjbeoIWhQDmj4n-gf4gJK2B
X-Proofpoint-ORIG-GUID: q9JbYBXF1S6NMphUjl4TMaGARfrZW6cO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300103
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jul 04, 2024 at 10:10:05PM +1000, Nicholas Piggin wrote:
> On Fri Jun 28, 2024 at 4:03 AM AEST, Gautam Menghani wrote:
> > commit 6398326b9ba1("KVM: PPC: Book3S HV P9: Stop using vc->dpdes")
> > introduced an optimization to use only vcpu->doorbell_request for SMT
> > emulation for Power9 and above guests, but the code for nested guests 
> > still relies on the old way of handling doorbells, due to which an L2
> > guest cannot be booted with XICS with SMT>1. The command to repro
> > this issue is:
> >
> > qemu-system-ppc64 \
> > 	-drive file=rhel.qcow2,format=qcow2 \
> > 	-m 20G \
> > 	-smp 8,cores=1,threads=8 \
> > 	-cpu  host \
> > 	-nographic \
> > 	-machine pseries,ic-mode=xics -accel kvm
> >
> > Fix the plumbing to utilize vcpu->doorbell_request instead of vcore->dpdes 
> > on P9 and above.
> >
> > Fixes: 6398326b9ba1 ("KVM: PPC: Book3S HV P9: Stop using vc->dpdes")
> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv.c        |  9 ++++++++-
> >  arch/powerpc/kvm/book3s_hv_nested.c | 20 ++++++++++++++++----
> >  2 files changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index cea28ac05923..0586fa636707 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -4178,6 +4178,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
> >  	}
> >  	hvregs.hdec_expiry = time_limit;
> >  
> > +	// clear doorbell bit as hvregs already has the info
> > +	vcpu->arch.doorbell_request = 0;
> > +
> >  	/*
> >  	 * When setting DEC, we must always deal with irq_work_raise
> >  	 * via NMI vs setting DEC. The problem occurs right as we
> > @@ -4694,6 +4697,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
> >  	struct kvm_nested_guest *nested = vcpu->arch.nested;
> >  	unsigned long flags;
> >  	u64 tb;
> > +	bool doorbell_pending;
> >  
> >  	trace_kvmppc_run_vcpu_enter(vcpu);
> >  
> > @@ -4752,6 +4756,9 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
> >  	 */
> >  	smp_mb();
> >  
> > +	doorbell_pending = !cpu_has_feature(CPU_FTR_ARCH_300) &&
> > +				vcpu->arch.doorbell_request;
> 
> Hmm... is the feature test flipped here?

Sorry for responding late, I got involved in some other things. 
Yes I think I got that part wrong, I guess it should've been

doorbell_pending = !cpu_has_feature(CPU_FTR_HVMODE) &&
                        vcpu->arch.doorbell_request;

The objective of introducing this is to avoid returning to L1 midway
when L0 is about to run L2. The issue is that if L1 does H_ENTER_NESTED
and there is a doorbell for L2, this condition in kvmhv_run_single_vcpu
will cause L0 to abort and go back to L1:

	} else if (vcpu->arch.pending_exceptions ||
		   vcpu->arch.doorbell_request ||
		   xive_interrupt_pending(vcpu)) {
		vcpu->arch.ret = RESUME_HOST;
		goto out;
	}

Earlier, vc->dpdes was used to pass around doorbell state, that's why
this condition did not cause problems, until 
6398326b9ba1 ("KVM: PPC: Book3S HV P9: Stop using vc->dpdes")

> 
> > +
> >  	if (!nested) {
> >  		kvmppc_core_prepare_to_enter(vcpu);
> >  		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
> > @@ -4769,7 +4776,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
> >  				lpcr |= LPCR_MER;
> >  		}
> >  	} else if (vcpu->arch.pending_exceptions ||
> > -		   vcpu->arch.doorbell_request ||
> > +		   doorbell_pending ||
> >  		   xive_interrupt_pending(vcpu)) {
> >  		vcpu->arch.ret = RESUME_HOST;
> >  		goto out;
> > diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> > index 05f5220960c6..b34eefa6b268 100644
> > --- a/arch/powerpc/kvm/book3s_hv_nested.c
> > +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> > @@ -32,7 +32,10 @@ void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
> >  	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> >  
> >  	hr->pcr = vc->pcr | PCR_MASK;
> > -	hr->dpdes = vc->dpdes;
> > +	if (cpu_has_feature(CPU_FTR_ARCH_300))
> > +		hr->dpdes = vcpu->arch.doorbell_request;
> > +	else
> > +		hr->dpdes = vc->dpdes;
> >  	hr->hfscr = vcpu->arch.hfscr;
> >  	hr->tb_offset = vc->tb_offset;
> >  	hr->dawr0 = vcpu->arch.dawr0;
> 
> Great find.
> 
> Nested is all POWER9 and later only, so I think you can just
> change to using doorbell_request always.

Noted.

> 
> And probably don't have to do anything for book3s_hv.c unless
> I'm mistaken about the feature test.
>

As pointed out above, the intention was to avoid the "else if" part in
kvmhv_run_single_vcpu(). Please do  point out if I missed something here.

Thanks,
Gautam

