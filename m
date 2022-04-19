Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A47507662
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 19:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjVtC5nzCz3bdq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 03:20:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gRdynu32;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gRdynu32; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjVsW2Sh4z2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 03:19:26 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JG7JZS005868; 
 Tue, 19 Apr 2022 17:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=AH55P/8XERYIIXGtN4bIRiE0oSeKK5B+EtS8816VDeE=;
 b=gRdynu32VusSPAr2yCIiUF1ugYo0o/512AfE4JHn6dxt+mMRGnjMComD+kKpBcgHCz52
 gHcTHhYLUpLqNGzDBSgy1YkJTtE0HXPk/qXWf8vzDo9Ci1u9bPGqFZ5u791A6VLF/Jjg
 zEpeTUV9tFftK3A0y4j5SnUYebknwDXlXDQNXHp8IeyY2q2vjoXPJB1MEj+PsYRVC3JQ
 pMIpqRR2663uyigab4KeAixbZgfAq3KjAOu+BUjd6KPh0QgsVMpP3pfVeOMew/2gaKav
 DEeldXBUYFL6sQ7Pc3BoGXJ0l9D2cybt+AFXORhclsRphO48VslpSqR/e4VxlFHJVCSD jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7rfdyq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:18:10 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23JGurbG023217;
 Tue, 19 Apr 2022 17:18:10 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7rfdypn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:18:10 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23JHCwK3005709;
 Tue, 19 Apr 2022 17:18:09 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3ffne9v46y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:18:09 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23JHI8Gt45154566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 17:18:08 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A9E1AE063;
 Tue, 19 Apr 2022 17:18:08 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FDACAE05F;
 Tue, 19 Apr 2022 17:18:07 +0000 (GMT)
Received: from localhost (unknown [9.160.180.3])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 19 Apr 2022 17:18:07 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] KVM: Add helpers to wrap vcpu->srcu_idx and yell if
 it's abused
In-Reply-To: <20220415004343.2203171-4-seanjc@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-4-seanjc@google.com>
Date: Tue, 19 Apr 2022 14:18:05 -0300
Message-ID: <87h76pouuq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GjmFJa-NfCn7e8p28nGfsPkFCCRbWqWF
X-Proofpoint-ORIG-GUID: 2npZ42Je0J-pWE9ma7OmBcpjESIDGcpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=981 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190098
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Add wrappers to acquire/release KVM's SRCU lock when stashing the index
> in vcpu->src_idx, along with rudimentary detection of illegal usage,
> e.g. re-acquiring SRCU and thus overwriting vcpu->src_idx.  Because the
> SRCU index is (currently) either 0 or 1, illegal nesting bugs can go
> unnoticed for quite some time and only cause problems when the nested
> lock happens to get a different index.
>
> Wrap the WARNs in PROVE_RCU=y, and make them ONCE, otherwise KVM will
> likely yell so loudly that it will bring the kernel to its knees.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For the powerpc part:

Tested-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c |  9 +++++----
>  arch/powerpc/kvm/book3s_hv_nested.c    | 16 +++++++--------
>  arch/powerpc/kvm/book3s_rtas.c         |  4 ++--
>  arch/powerpc/kvm/powerpc.c             |  4 ++--
>  arch/riscv/kvm/vcpu.c                  | 16 +++++++--------
>  arch/riscv/kvm/vcpu_exit.c             |  4 ++--
>  arch/s390/kvm/interrupt.c              |  4 ++--
>  arch/s390/kvm/kvm-s390.c               |  8 ++++----
>  arch/s390/kvm/vsie.c                   |  4 ++--
>  arch/x86/kvm/x86.c                     | 28 ++++++++++++--------------
>  include/linux/kvm_host.h               | 24 +++++++++++++++++++++-
>  11 files changed, 71 insertions(+), 50 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> index e4ce2a35483f..42851c32ff3b 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -168,9 +168,10 @@ int kvmppc_mmu_walk_radix_tree(struct kvm_vcpu *vcpu, gva_t eaddr,
>  			return -EINVAL;
>  		/* Read the entry from guest memory */
>  		addr = base + (index * sizeof(rpte));
> -		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
> +
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  		ret = kvm_read_guest(kvm, addr, &rpte, sizeof(rpte));
> -		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		if (ret) {
>  			if (pte_ret_p)
>  				*pte_ret_p = addr;
> @@ -246,9 +247,9 @@ int kvmppc_mmu_radix_translate_table(struct kvm_vcpu *vcpu, gva_t eaddr,
>  
>  	/* Read the table to find the root of the radix tree */
>  	ptbl = (table & PRTB_MASK) + (table_index * sizeof(entry));
> -	vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  	ret = kvm_read_guest(kvm, ptbl, &entry, sizeof(entry));
> -	srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	if (ret)
>  		return ret;
>  
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 9d373f8963ee..c943a051c6e7 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -306,10 +306,10 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  	/* copy parameters in */
>  	hv_ptr = kvmppc_get_gpr(vcpu, 4);
>  	regs_ptr = kvmppc_get_gpr(vcpu, 5);
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  	err = kvmhv_read_guest_state_and_regs(vcpu, &l2_hv, &l2_regs,
>  					      hv_ptr, regs_ptr);
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	if (err)
>  		return H_PARAMETER;
>  
> @@ -410,10 +410,10 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  		byteswap_hv_regs(&l2_hv);
>  		byteswap_pt_regs(&l2_regs);
>  	}
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  	err = kvmhv_write_guest_state_and_regs(vcpu, &l2_hv, &l2_regs,
>  					       hv_ptr, regs_ptr);
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	if (err)
>  		return H_AUTHORITY;
>  
> @@ -600,16 +600,16 @@ long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu)
>  			goto not_found;
>  
>  		/* Write what was loaded into our buffer back to the L1 guest */
> -		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  		rc = kvm_vcpu_write_guest(vcpu, gp_to, buf, n);
> -		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		if (rc)
>  			goto not_found;
>  	} else {
>  		/* Load the data to be stored from the L1 guest into our buf */
> -		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  		rc = kvm_vcpu_read_guest(vcpu, gp_from, buf, n);
> -		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		if (rc)
>  			goto not_found;
>  
> diff --git a/arch/powerpc/kvm/book3s_rtas.c b/arch/powerpc/kvm/book3s_rtas.c
> index 0f847f1e5ddd..6808bda0dbc1 100644
> --- a/arch/powerpc/kvm/book3s_rtas.c
> +++ b/arch/powerpc/kvm/book3s_rtas.c
> @@ -229,9 +229,9 @@ int kvmppc_rtas_hcall(struct kvm_vcpu *vcpu)
>  	 */
>  	args_phys = kvmppc_get_gpr(vcpu, 4) & KVM_PAM;
>  
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  	rc = kvm_read_guest(vcpu->kvm, args_phys, &args, sizeof(args));
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	if (rc)
>  		goto fail;
>  
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9772b176e406..fd88c2412e83 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -425,9 +425,9 @@ int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
>  		return EMULATE_DONE;
>  	}
>  
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  	rc = kvm_read_guest(vcpu->kvm, pte.raddr, ptr, size);
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	if (rc)
>  		return EMULATE_DO_MMIO;
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2f1caf23eed4..256cf04ec01e 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -724,13 +724,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	/* Mark this VCPU ran at least once */
>  	vcpu->arch.ran_atleast_once = true;
>  
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  
>  	/* Process MMIO value returned from user-space */
>  	if (run->exit_reason == KVM_EXIT_MMIO) {
>  		ret = kvm_riscv_vcpu_mmio_return(vcpu, vcpu->run);
>  		if (ret) {
> -			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +			kvm_vcpu_srcu_read_unlock(vcpu);
>  			return ret;
>  		}
>  	}
> @@ -739,13 +739,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	if (run->exit_reason == KVM_EXIT_RISCV_SBI) {
>  		ret = kvm_riscv_vcpu_sbi_return(vcpu, vcpu->run);
>  		if (ret) {
> -			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +			kvm_vcpu_srcu_read_unlock(vcpu);
>  			return ret;
>  		}
>  	}
>  
>  	if (run->immediate_exit) {
> -		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		return -EINTR;
>  	}
>  
> @@ -784,7 +784,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  		 */
>  		vcpu->mode = IN_GUEST_MODE;
>  
> -		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		smp_mb__after_srcu_read_unlock();
>  
>  		/*
> @@ -802,7 +802,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  			vcpu->mode = OUTSIDE_GUEST_MODE;
>  			local_irq_enable();
>  			preempt_enable();
> -			vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +			kvm_vcpu_srcu_read_lock(vcpu);
>  			continue;
>  		}
>  
> @@ -846,7 +846,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  
>  		preempt_enable();
>  
> -		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  
>  		ret = kvm_riscv_vcpu_exit(vcpu, run, &trap);
>  	}
> @@ -855,7 +855,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  
>  	vcpu_put(vcpu);
>  
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  
>  	return ret;
>  }
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 2d56faddb9d1..a72c15d4b42a 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -456,9 +456,9 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
>  {
>  	if (!kvm_arch_vcpu_runnable(vcpu)) {
> -		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		kvm_vcpu_halt(vcpu);
> -		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
>  	}
>  }
> diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
> index 9b30beac904d..af96dc0549a4 100644
> --- a/arch/s390/kvm/interrupt.c
> +++ b/arch/s390/kvm/interrupt.c
> @@ -1334,11 +1334,11 @@ int kvm_s390_handle_wait(struct kvm_vcpu *vcpu)
>  	hrtimer_start(&vcpu->arch.ckc_timer, sltime, HRTIMER_MODE_REL);
>  	VCPU_EVENT(vcpu, 4, "enabled wait: %llu ns", sltime);
>  no_timer:
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	kvm_vcpu_halt(vcpu);
>  	vcpu->valid_wakeup = false;
>  	__unset_cpu_idle(vcpu);
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  
>  	hrtimer_cancel(&vcpu->arch.ckc_timer);
>  	return 0;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 156d1c25a3c1..da3dabda1a12 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4237,14 +4237,14 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>  	 * We try to hold kvm->srcu during most of vcpu_run (except when run-
>  	 * ning the guest), so that memslots (and other stuff) are protected
>  	 */
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  
>  	do {
>  		rc = vcpu_pre_run(vcpu);
>  		if (rc)
>  			break;
>  
> -		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		/*
>  		 * As PF_VCPU will be used in fault handler, between
>  		 * guest_enter and guest_exit should be no uaccess.
> @@ -4281,12 +4281,12 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>  		__enable_cpu_timer_accounting(vcpu);
>  		guest_exit_irqoff();
>  		local_irq_enable();
> -		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  
>  		rc = vcpu_post_run(vcpu, exit_reason);
>  	} while (!signal_pending(current) && !guestdbg_exit_pending(vcpu) && !rc);
>  
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  	return rc;
>  }
>  
> diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
> index acda4b6fc851..dada78b92691 100644
> --- a/arch/s390/kvm/vsie.c
> +++ b/arch/s390/kvm/vsie.c
> @@ -1091,7 +1091,7 @@ static int do_vsie_run(struct kvm_vcpu *vcpu, struct vsie_page *vsie_page)
>  
>  	handle_last_fault(vcpu, vsie_page);
>  
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  
>  	/* save current guest state of bp isolation override */
>  	guest_bp_isolation = test_thread_flag(TIF_ISOLATE_BP_GUEST);
> @@ -1133,7 +1133,7 @@ static int do_vsie_run(struct kvm_vcpu *vcpu, struct vsie_page *vsie_page)
>  	if (!guest_bp_isolation)
>  		clear_thread_flag(TIF_ISOLATE_BP_GUEST);
>  
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  
>  	if (rc == -EINTR) {
>  		VCPU_EVENT(vcpu, 3, "%s", "machine check");
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index f35fe09de59d..bc24b35c4e80 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10157,7 +10157,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  	/* Store vcpu->apicv_active before vcpu->mode.  */
>  	smp_store_release(&vcpu->mode, IN_GUEST_MODE);
>  
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  
>  	/*
>  	 * 1) We should set ->mode before checking ->requests.  Please see
> @@ -10188,7 +10188,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  		smp_wmb();
>  		local_irq_enable();
>  		preempt_enable();
> -		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  		r = 1;
>  		goto cancel_injection;
>  	}
> @@ -10314,7 +10314,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  	local_irq_enable();
>  	preempt_enable();
>  
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  
>  	/*
>  	 * Profile KVM exit RIPs:
> @@ -10344,7 +10344,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  }
>  
>  /* Called within kvm->srcu read side.  */
> -static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
> +static inline int vcpu_block(struct kvm_vcpu *vcpu)
>  {
>  	bool hv_timer;
>  
> @@ -10360,12 +10360,12 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  		if (hv_timer)
>  			kvm_lapic_switch_to_sw_timer(vcpu);
>  
> -		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		if (vcpu->arch.mp_state == KVM_MP_STATE_HALTED)
>  			kvm_vcpu_halt(vcpu);
>  		else
>  			kvm_vcpu_block(vcpu);
> -		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  
>  		if (hv_timer)
>  			kvm_lapic_switch_to_hv_timer(vcpu);
> @@ -10407,7 +10407,6 @@ static inline bool kvm_vcpu_running(struct kvm_vcpu *vcpu)
>  static int vcpu_run(struct kvm_vcpu *vcpu)
>  {
>  	int r;
> -	struct kvm *kvm = vcpu->kvm;
>  
>  	vcpu->arch.l1tf_flush_l1d = true;
>  
> @@ -10415,7 +10414,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>  		if (kvm_vcpu_running(vcpu)) {
>  			r = vcpu_enter_guest(vcpu);
>  		} else {
> -			r = vcpu_block(kvm, vcpu);
> +			r = vcpu_block(vcpu);
>  		}
>  
>  		if (r <= 0)
> @@ -10437,9 +10436,9 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>  		}
>  
>  		if (__xfer_to_guest_mode_work_pending()) {
> -			srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> +			kvm_vcpu_srcu_read_unlock(vcpu);
>  			r = xfer_to_guest_mode_handle_work(vcpu);
> -			vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
> +			kvm_vcpu_srcu_read_lock(vcpu);
>  			if (r)
>  				return r;
>  		}
> @@ -10542,7 +10541,6 @@ static void kvm_put_guest_fpu(struct kvm_vcpu *vcpu)
>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_run *kvm_run = vcpu->run;
> -	struct kvm *kvm = vcpu->kvm;
>  	int r;
>  
>  	vcpu_load(vcpu);
> @@ -10550,7 +10548,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	kvm_run->flags = 0;
>  	kvm_load_guest_fpu(vcpu);
>  
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +	kvm_vcpu_srcu_read_lock(vcpu);
>  	if (unlikely(vcpu->arch.mp_state == KVM_MP_STATE_UNINITIALIZED)) {
>  		if (kvm_run->immediate_exit) {
>  			r = -EINTR;
> @@ -10562,9 +10560,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  		 */
>  		WARN_ON_ONCE(kvm_lapic_hv_timer_in_use(vcpu));
>  
> -		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> +		kvm_vcpu_srcu_read_unlock(vcpu);
>  		kvm_vcpu_block(vcpu);
> -		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
> +		kvm_vcpu_srcu_read_lock(vcpu);
>  
>  		if (kvm_apic_accept_events(vcpu) < 0) {
>  			r = 0;
> @@ -10625,7 +10623,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	if (kvm_run->kvm_valid_regs)
>  		store_regs(vcpu);
>  	post_kvm_run_save(vcpu);
> -	srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> +	kvm_vcpu_srcu_read_unlock(vcpu);
>  
>  	kvm_sigset_deactivate(vcpu);
>  	vcpu_put(vcpu);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 252ee4a61b58..76fc7233bd6a 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -315,7 +315,10 @@ struct kvm_vcpu {
>  	int cpu;
>  	int vcpu_id; /* id given by userspace at creation */
>  	int vcpu_idx; /* index in kvm->vcpus array */
> -	int srcu_idx;
> +	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
> +#ifdef CONFIG_PROVE_RCU
> +	int srcu_depth;
> +#endif
>  	int mode;
>  	u64 requests;
>  	unsigned long guest_debug;
> @@ -841,6 +844,25 @@ static inline void kvm_vm_bugged(struct kvm *kvm)
>  	unlikely(__ret);					\
>  })
>  
> +static inline void kvm_vcpu_srcu_read_lock(struct kvm_vcpu *vcpu)
> +{
> +#ifdef CONFIG_PROVE_RCU
> +	WARN_ONCE(vcpu->srcu_depth++,
> +		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
> +#endif
> +	vcpu->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +}
> +
> +static inline void kvm_vcpu_srcu_read_unlock(struct kvm_vcpu *vcpu)
> +{
> +	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->____srcu_idx);
> +
> +#ifdef CONFIG_PROVE_RCU
> +	WARN_ONCE(--vcpu->srcu_depth,
> +		  "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
> +#endif
> +}
> +
>  static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
>  {
>  	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
