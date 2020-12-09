Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6542D4446
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 15:28:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrfYD56pPzDqsN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 01:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A4yMV1J8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrfV20PC7zDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 01:25:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9E2Z77119171; Wed, 9 Dec 2020 09:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=bqFwMxKIfvJ8bopMr1/KAEblJfpQ8B3u0rXvp6N6T20=;
 b=A4yMV1J8BVScsnt00pSQd3hRPFOcSEr5TdOTGsHkrl9D4OIwCWDy7/WHHmdV7Ata5q4l
 VXsafgpl+EEX/E6JT2TzBS5UyUREiTxM+RMrEcB2sLJJDEJDfEbnDd2TpMHh725QGmfV
 ZYiW6WFxW/mcXrrky+G+T++1xmu+QSIGImVC8vqP4/wqJFO92eJ5qWAmvCqNI3DkQQZi
 kIx/KquKWHgD/+bFUHjYlp1C6vJvWU7hiaAFHqWJr4oVWQhYUbZrQ1yn0aFgBH6opj6p
 gGTamMtC4Lk+kXEjsbQs0bE3oM6yA0ZjBYQddD+siNQt2aUyjLwfMC7k8qKUpVa0vKL0 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35avmu7bs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 09:25:31 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9E2cBC119399;
 Wed, 9 Dec 2020 09:25:30 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35avmu7br7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 09:25:30 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9EMAJT022362;
 Wed, 9 Dec 2020 14:25:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3581ua02gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 14:25:29 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9EPSNY9700036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 14:25:28 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4925EBE054;
 Wed,  9 Dec 2020 14:25:28 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A097BE05A;
 Wed,  9 Dec 2020 14:25:27 +0000 (GMT)
Received: from localhost (unknown [9.211.134.143])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  9 Dec 2020 14:25:27 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 paulus@samba.org
Subject: Re: [PATCH v2 1/4] KVM: PPC: Allow nested guest creation when L0
 hv_guest_state > L1
In-Reply-To: <20201124105953.39325-2-ravi.bangoria@linux.ibm.com>
References: <20201124105953.39325-1-ravi.bangoria@linux.ibm.com>
 <20201124105953.39325-2-ravi.bangoria@linux.ibm.com>
Date: Wed, 09 Dec 2020 11:25:24 -0300
Message-ID: <87r1nzgip7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_11:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 suspectscore=1 adultscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090097
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 kvm@vger.kernel.org, leobras.c@gmail.com, jniethe5@gmail.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:

> On powerpc, L1 hypervisor takes help of L0 using H_ENTER_NESTED
> hcall to load L2 guest state in cpu. L1 hypervisor prepares the
> L2 state in struct hv_guest_state and passes a pointer to it via
> hcall. Using that pointer, L0 reads/writes that state directly
> from/to L1 memory. Thus L0 must be aware of hv_guest_state layout
> of L1. Currently it uses version field to achieve this. i.e. If
> L0 hv_guest_state.version != L1 hv_guest_state.version, L0 won't
> allow nested kvm guest.
>
> This restriction can be loosen up a bit. L0 can be taught to
> understand older layout of hv_guest_state, if we restrict the
> new member to be added only at the end. i.e. we can allow
> nested guest even when L0 hv_guest_state.version > L1
> hv_guest_state.version. Though, the other way around is not
> possible.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/hvcall.h   | 17 +++++++--
>  arch/powerpc/kvm/book3s_hv_nested.c | 53 ++++++++++++++++++++++++-----
>  2 files changed, 59 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index fbb377055471..a7073fddb657 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -524,9 +524,12 @@ struct h_cpu_char_result {
>  	u64 behaviour;
>  };
>
> -/* Register state for entering a nested guest with H_ENTER_NESTED */
> +/*
> + * Register state for entering a nested guest with H_ENTER_NESTED.
> + * New member must be added at the end.
> + */
>  struct hv_guest_state {
> -	u64 version;		/* version of this structure layout */
> +	u64 version;		/* version of this structure layout, must be first */
>  	u32 lpid;
>  	u32 vcpu_token;
>  	/* These registers are hypervisor privileged (at least for writing) */
> @@ -560,6 +563,16 @@ struct hv_guest_state {
>  /* Latest version of hv_guest_state structure */
>  #define HV_GUEST_STATE_VERSION	1
>
> +static inline int hv_guest_state_size(unsigned int version)
> +{
> +	switch (version) {
> +	case 1:
> +		return offsetofend(struct hv_guest_state, ppr);
> +	default:
> +		return -1;
> +	}
> +}
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_HVCALL_H */
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 33b58549a9aa..2b433c3bacea 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -215,6 +215,45 @@ static void kvmhv_nested_mmio_needed(struct kvm_vcpu *vcpu, u64 regs_ptr)
>  	}
>  }
>
> +static int kvmhv_read_guest_state_and_regs(struct kvm_vcpu *vcpu,
> +					   struct hv_guest_state *l2_hv,
> +					   struct pt_regs *l2_regs,
> +					   u64 hv_ptr, u64 regs_ptr)
> +{
> +	int size;
> +
> +	if (kvm_vcpu_read_guest(vcpu, hv_ptr, &(l2_hv->version),
> +				sizeof(l2_hv->version)))
> +		return -1;
> +
> +	if (kvmppc_need_byteswap(vcpu))
> +		l2_hv->version = swab64(l2_hv->version);
> +
> +	size = hv_guest_state_size(l2_hv->version);
> +	if (size < 0)
> +		return -1;
> +
> +	return kvm_vcpu_read_guest(vcpu, hv_ptr, l2_hv, size) ||
> +		kvm_vcpu_read_guest(vcpu, regs_ptr, l2_regs,
> +				    sizeof(struct pt_regs));
> +}
> +
> +static int kvmhv_write_guest_state_and_regs(struct kvm_vcpu *vcpu,
> +					    struct hv_guest_state *l2_hv,
> +					    struct pt_regs *l2_regs,
> +					    u64 hv_ptr, u64 regs_ptr)
> +{
> +	int size;
> +
> +	size = hv_guest_state_size(l2_hv->version);
> +	if (size < 0)
> +		return -1;
> +
> +	return kvm_vcpu_write_guest(vcpu, hv_ptr, l2_hv, size) ||
> +		kvm_vcpu_write_guest(vcpu, regs_ptr, l2_regs,
> +				     sizeof(struct pt_regs));
> +}
> +
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  {
>  	long int err, r;
> @@ -235,17 +274,15 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  	hv_ptr = kvmppc_get_gpr(vcpu, 4);
>  	regs_ptr = kvmppc_get_gpr(vcpu, 5);
>  	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -	err = kvm_vcpu_read_guest(vcpu, hv_ptr, &l2_hv,
> -				  sizeof(struct hv_guest_state)) ||
> -		kvm_vcpu_read_guest(vcpu, regs_ptr, &l2_regs,
> -				    sizeof(struct pt_regs));
> +	err = kvmhv_read_guest_state_and_regs(vcpu, &l2_hv, &l2_regs,
> +					      hv_ptr, regs_ptr);
>  	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
>  	if (err)
>  		return H_PARAMETER;
>
>  	if (kvmppc_need_byteswap(vcpu))
>  		byteswap_hv_regs(&l2_hv);
> -	if (l2_hv.version != HV_GUEST_STATE_VERSION)
> +	if (l2_hv.version > HV_GUEST_STATE_VERSION)
>  		return H_P2;
>
>  	if (kvmppc_need_byteswap(vcpu))
> @@ -325,10 +362,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  		byteswap_pt_regs(&l2_regs);
>  	}
>  	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -	err = kvm_vcpu_write_guest(vcpu, hv_ptr, &l2_hv,
> -				   sizeof(struct hv_guest_state)) ||
> -		kvm_vcpu_write_guest(vcpu, regs_ptr, &l2_regs,
> -				   sizeof(struct pt_regs));
> +	err = kvmhv_write_guest_state_and_regs(vcpu, &l2_hv, &l2_regs,
> +					       hv_ptr, regs_ptr);
>  	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
>  	if (err)
>  		return H_AUTHORITY;
