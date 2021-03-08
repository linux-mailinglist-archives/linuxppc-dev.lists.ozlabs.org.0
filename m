Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8A331199
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 16:04:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvM853Hfdz3cPs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 02:04:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MVEHytM3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MVEHytM3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvM7f4XhCz3cG4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 02:04:29 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128F3Q3q067639; Mon, 8 Mar 2021 10:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=3JQl7+OiQwXd/kxZ3DnL9khjx5cDmaNGOhzng0U0/oE=;
 b=MVEHytM3SERnn5VbNX6mW0IwTs3RHi2yyrNDgNRo89WML/3CL3t5TmVxLdau7CkHYeA8
 LFGzaDDheec9aZlXefnGFdrm6mNLDh+7EPcbXPDSmdSGWK6i3eqiqHi2XhRxoKwOLfeb
 sz7+PL2VLbIA0GRYb/8fqWHM5xyIKWl6zFYKzmEitTgQQvzn+f8l6DGP3T5PeZv3vFyb
 yfd7h4IsRGL/pcSJVSXG3w/QbNasOpxR/30lZl6EtTVHt5vC0YYw+Akb0cFYw7ybMurC
 BG1SrDsIuomJghQFmfb8Xz2u48OHy4vxJt34lcoyHV/cBzttenslXNfHaOoIloVWuCku Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375nqbh977-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:04:23 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128F3njm069585;
 Mon, 8 Mar 2021 10:04:23 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375nqbh952-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:04:22 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128F2Z6d016583;
 Mon, 8 Mar 2021 15:04:20 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3741c97b67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 15:04:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128F4Jdx34800056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 15:04:19 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20F9FBE059;
 Mon,  8 Mar 2021 15:04:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73ADEBE065;
 Mon,  8 Mar 2021 15:04:18 +0000 (GMT)
Received: from localhost (unknown [9.163.6.5])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Mar 2021 15:04:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Do not expose HFSCR sanitisation
 to nested hypervisor
In-Reply-To: <1615191200.1pjltfhe7o.astroid@bobo.none>
References: <20210305231055.2913892-1-farosas@linux.ibm.com>
 <1615191200.1pjltfhe7o.astroid@bobo.none>
Date: Mon, 08 Mar 2021 12:04:16 -0300
Message-ID: <87eegpn0un.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_08:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080083
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Fabiano Rosas's message of March 6, 2021 9:10 am:
>> As one of the arguments of the H_ENTER_NESTED hypercall, the nested
>> hypervisor (L1) prepares a structure containing the values of various
>> hypervisor-privileged registers with which it wants the nested guest
>> (L2) to run. Since the nested HV runs in supervisor mode it needs the
>> host to write to these registers.
>> 
>> To stop a nested HV manipulating this mechanism and using a nested
>> guest as a proxy to access a facility that has been made unavailable
>> to it, we have a routine that sanitises the values of the HV registers
>> before copying them into the nested guest's vcpu struct.
>> 
>> However, when coming out of the guest the values are copied as they
>> were back into L1 memory, which means that any sanitisation we did
>> during guest entry will be exposed to L1 after H_ENTER_NESTED returns.
>> 
>> This is not a problem by itself, but in the case of the Hypervisor
>> Facility Status and Control Register (HFSCR), we use the intersection
>> between L2 hfscr bits and L1 hfscr bits. That means that L1 could use
>> this to indirectly read the (hv-privileged) value from its vcpu
>> struct.
>> 
>> This patch fixes this by making sure that L1 only gets back the bits
>> that are necessary for regular functioning.
>
> The general idea of restricting exposure of HV privileged bits, but
> for the case of HFSCR a guest can probe the HFCR anyway by testing which 
> facilities are available (and presumably an HV may need some way to know
> what features are available for it to advertise to its own guests), so
> is this necessary? Perhaps a comment would be sufficient.
>

Well, I'd be happy to force them through the arduous path then =); and
there are features that are emulated by the HV which L1 would not be
able to probe.

I think we should implement a mechanism that stops all leaks now, rather
than having to ponder about this every time we touch an hv_reg in that
structure. I'm not too worried about HFSCR specifically.

Let me think about this some more and see if I can make it more generic,
I realise that sticking the saved_hfscr on the side is not the most
elegant approach.

> Thanks,
> Nick
>
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_nested.c | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
>> index 0cd0e7aad588..860004f46e08 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -98,12 +98,20 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
>>  }
>>  
>>  static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
>> -				 struct hv_guest_state *hr)
>> +				 struct hv_guest_state *hr, u64 saved_hfscr)
>>  {
>>  	struct kvmppc_vcore *vc = vcpu->arch.vcore;
>>  
>> +	/*
>> +	 * During sanitise_hv_regs() we used HFSCR bits from L1 state
>> +	 * to restrict what the L2 state is allowed to be. Since L1 is
>> +	 * not allowed to read this SPR, do not include these
>> +	 * modifications in the return state.
>> +	 */
>> +	hr->hfscr = ((~HFSCR_INTR_CAUSE & saved_hfscr) |
>> +		     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
>> +
>>  	hr->dpdes = vc->dpdes;
>> -	hr->hfscr = vcpu->arch.hfscr;
>>  	hr->purr = vcpu->arch.purr;
>>  	hr->spurr = vcpu->arch.spurr;
>>  	hr->ic = vcpu->arch.ic;
>> @@ -132,12 +140,14 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
>>  	}
>>  }
>>  
>> -static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>> +static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr,
>> +			     u64 *saved_hfscr)
>>  {
>>  	/*
>>  	 * Don't let L1 enable features for L2 which we've disabled for L1,
>>  	 * but preserve the interrupt cause field.
>>  	 */
>> +	*saved_hfscr = hr->hfscr;
>>  	hr->hfscr &= (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
>>  
>>  	/* Don't let data address watchpoint match in hypervisor state */
>> @@ -272,6 +282,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>>  	u64 hdec_exp;
>>  	s64 delta_purr, delta_spurr, delta_ic, delta_vtb;
>>  	u64 mask;
>> +	u64 hfscr;
>>  	unsigned long lpcr;
>>  
>>  	if (vcpu->kvm->arch.l1_ptcr == 0)
>> @@ -324,7 +335,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>>  	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>>  		LPCR_LPES | LPCR_MER;
>>  	lpcr = (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
>> -	sanitise_hv_regs(vcpu, &l2_hv);
>> +
>> +	sanitise_hv_regs(vcpu, &l2_hv, &hfscr);
>>  	restore_hv_regs(vcpu, &l2_hv);
>>  
>>  	vcpu->arch.ret = RESUME_GUEST;
>> @@ -345,7 +357,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>>  	delta_spurr = vcpu->arch.spurr - l2_hv.spurr;
>>  	delta_ic = vcpu->arch.ic - l2_hv.ic;
>>  	delta_vtb = vc->vtb - l2_hv.vtb;
>> -	save_hv_return_state(vcpu, vcpu->arch.trap, &l2_hv);
>> +	save_hv_return_state(vcpu, vcpu->arch.trap, &l2_hv, hfscr);
>>  
>>  	/* restore L1 state */
>>  	vcpu->arch.nested = NULL;
>> -- 
>> 2.29.2
>> 
>> 
