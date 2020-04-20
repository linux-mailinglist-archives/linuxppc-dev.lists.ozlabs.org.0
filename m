Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 825861B030A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:33:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495JMx0TQfzDqM9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=de.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@de.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=de.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495Hpp5G6vzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:08:17 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K728UR054027
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:08:16 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmu6m5pa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 03:08:16 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <borntraeger@de.ibm.com>;
 Mon, 20 Apr 2020 08:08:07 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:07:58 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K782cq51052714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:08:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4975F42049;
 Mon, 20 Apr 2020 07:08:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51A954203F;
 Mon, 20 Apr 2020 07:08:00 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.158.104])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 07:08:00 +0000 (GMT)
Subject: Re: [PATCH 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, pbonzini@redhat.com,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
References: <20200419075106.16248-1-tianjia.zhang@linux.alibaba.com>
 <20200419075106.16248-2-tianjia.zhang@linux.alibaba.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Mon, 20 Apr 2020 09:07:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419075106.16248-2-tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20042007-0028-0000-0000-000003FB7A62
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-0029-0000-0000-000024C1391B
Message-Id: <7a783487-2f9b-08a6-0ff6-f57bb90495a1@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=848
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200058
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19.04.20 09:51, Tianjia Zhang wrote:
> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. Earlier than historical reasons, many kvm-related function
> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
> This patch does a unified cleanup of these remaining redundant parameters.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/s390/kvm/kvm-s390.c | 127 +++++++++++++++++++++------------------
>  1 file changed, 67 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 443af3ead739..cf420d013ba3 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4173,24 +4173,25 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>  	return rc;
>  }
>  
> -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *run = vcpu->run;

Please use kvm_run as variable name. This makes all of the changes below go away.


>  	struct runtime_instr_cb *riccb;
>  	struct gs_cb *gscb;
>  
> -	riccb = (struct runtime_instr_cb *) &kvm_run->s.regs.riccb;
> -	gscb = (struct gs_cb *) &kvm_run->s.regs.gscb;
> -	vcpu->arch.sie_block->gpsw.mask = kvm_run->psw_mask;
> -	vcpu->arch.sie_block->gpsw.addr = kvm_run->psw_addr;
> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
> -		vcpu->arch.sie_block->todpr = kvm_run->s.regs.todpr;
> -		vcpu->arch.sie_block->pp = kvm_run->s.regs.pp;
> -		vcpu->arch.sie_block->gbea = kvm_run->s.regs.gbea;
> -	}
> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_PFAULT) {
> -		vcpu->arch.pfault_token = kvm_run->s.regs.pft;
> -		vcpu->arch.pfault_select = kvm_run->s.regs.pfs;
> -		vcpu->arch.pfault_compare = kvm_run->s.regs.pfc;
> +	riccb = (struct runtime_instr_cb *) &run->s.regs.riccb;
> +	gscb = (struct gs_cb *) &run->s.regs.gscb;
> +	vcpu->arch.sie_block->gpsw.mask = run->psw_mask;
> +	vcpu->arch.sie_block->gpsw.addr = run->psw_addr;
> +	if (run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
> +		vcpu->arch.sie_block->todpr = run->s.regs.todpr;
> +		vcpu->arch.sie_block->pp = run->s.regs.pp;
> +		vcpu->arch.sie_block->gbea = run->s.regs.gbea;
> +	}
> +	if (run->kvm_dirty_regs & KVM_SYNC_PFAULT) {
> +		vcpu->arch.pfault_token = run->s.regs.pft;
> +		vcpu->arch.pfault_select = run->s.regs.pfs;
> +		vcpu->arch.pfault_compare = run->s.regs.pfc;
>  		if (vcpu->arch.pfault_token == KVM_S390_PFAULT_TOKEN_INVALID)
>  			kvm_clear_async_pf_completion_queue(vcpu);
>  	}
> @@ -4198,7 +4199,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  	 * If userspace sets the riccb (e.g. after migration) to a valid state,
>  	 * we should enable RI here instead of doing the lazy enablement.
>  	 */
> -	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_RICCB) &&
> +	if ((run->kvm_dirty_regs & KVM_SYNC_RICCB) &&
>  	    test_kvm_facility(vcpu->kvm, 64) &&
>  	    riccb->v &&
>  	    !(vcpu->arch.sie_block->ecb3 & ECB3_RI)) {
> @@ -4209,7 +4210,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  	 * If userspace sets the gscb (e.g. after migration) to non-zero,
>  	 * we should enable GS here instead of doing the lazy enablement.
>  	 */
> -	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_GSCB) &&
> +	if ((run->kvm_dirty_regs & KVM_SYNC_GSCB) &&
>  	    test_kvm_facility(vcpu->kvm, 133) &&
>  	    gscb->gssm &&
>  	    !vcpu->arch.gs_enabled) {
> @@ -4218,10 +4219,10 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  		vcpu->arch.sie_block->ecd |= ECD_HOSTREGMGMT;
>  		vcpu->arch.gs_enabled = 1;
>  	}
> -	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_BPBC) &&
> +	if ((run->kvm_dirty_regs & KVM_SYNC_BPBC) &&
>  	    test_kvm_facility(vcpu->kvm, 82)) {
>  		vcpu->arch.sie_block->fpf &= ~FPF_BPBC;
> -		vcpu->arch.sie_block->fpf |= kvm_run->s.regs.bpbc ? FPF_BPBC : 0;
> +		vcpu->arch.sie_block->fpf |= run->s.regs.bpbc ? FPF_BPBC : 0;
>  	}
>  	if (MACHINE_HAS_GS) {
>  		preempt_disable();
> @@ -4232,45 +4233,47 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  		}
>  		if (vcpu->arch.gs_enabled) {
>  			current->thread.gs_cb = (struct gs_cb *)
> -						&vcpu->run->s.regs.gscb;
> +						&run->s.regs.gscb;
>  			restore_gs_cb(current->thread.gs_cb);
>  		}
>  		preempt_enable();
>  	}
> -	/* SIE will load etoken directly from SDNX and therefore kvm_run */
> +	/* SIE will load etoken directly from SDNX and therefore run */
>  }
>  
> -static void sync_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void sync_regs(struct kvm_vcpu *vcpu)
>  {
> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_PREFIX)
> -		kvm_s390_set_prefix(vcpu, kvm_run->s.regs.prefix);
> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_CRS) {
> -		memcpy(&vcpu->arch.sie_block->gcr, &kvm_run->s.regs.crs, 128);
> +	struct kvm_run *run = vcpu->run;
> +
> +	if (run->kvm_dirty_regs & KVM_SYNC_PREFIX)
> +		kvm_s390_set_prefix(vcpu, run->s.regs.prefix);
> +	if (run->kvm_dirty_regs & KVM_SYNC_CRS) {
> +		memcpy(&vcpu->arch.sie_block->gcr, &run->s.regs.crs, 128);
>  		/* some control register changes require a tlb flush */
>  		kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
>  	}
> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
> -		kvm_s390_set_cpu_timer(vcpu, kvm_run->s.regs.cputm);
> -		vcpu->arch.sie_block->ckc = kvm_run->s.regs.ckc;
> +	if (run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
> +		kvm_s390_set_cpu_timer(vcpu, run->s.regs.cputm);
> +		vcpu->arch.sie_block->ckc = run->s.regs.ckc;
>  	}
>  	save_access_regs(vcpu->arch.host_acrs);
> -	restore_access_regs(vcpu->run->s.regs.acrs);
> +	restore_access_regs(run->s.regs.acrs);
>  	/* save host (userspace) fprs/vrs */
>  	save_fpu_regs();
>  	vcpu->arch.host_fpregs.fpc = current->thread.fpu.fpc;
>  	vcpu->arch.host_fpregs.regs = current->thread.fpu.regs;
>  	if (MACHINE_HAS_VX)
> -		current->thread.fpu.regs = vcpu->run->s.regs.vrs;
> +		current->thread.fpu.regs = run->s.regs.vrs;
>  	else
> -		current->thread.fpu.regs = vcpu->run->s.regs.fprs;
> -	current->thread.fpu.fpc = vcpu->run->s.regs.fpc;
> +		current->thread.fpu.regs = run->s.regs.fprs;
> +	current->thread.fpu.fpc = run->s.regs.fpc;
>  	if (test_fp_ctl(current->thread.fpu.fpc))
>  		/* User space provided an invalid FPC, let's clear it */
>  		current->thread.fpu.fpc = 0;
>  
>  	/* Sync fmt2 only data */
>  	if (likely(!kvm_s390_pv_cpu_is_protected(vcpu))) {
> -		sync_regs_fmt2(vcpu, kvm_run);
> +		sync_regs_fmt2(vcpu);
>  	} else {
>  		/*
>  		 * In several places we have to modify our internal view to
> @@ -4282,19 +4285,21 @@ static void sync_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  		 * do only accept the condition code from userspace.
>  		 */
>  		vcpu->arch.sie_block->gpsw.mask &= ~PSW_MASK_CC;
> -		vcpu->arch.sie_block->gpsw.mask |= kvm_run->psw_mask &
> +		vcpu->arch.sie_block->gpsw.mask |= run->psw_mask &
>  						   PSW_MASK_CC;
>  	}
>  
> -	kvm_run->kvm_dirty_regs = 0;
> +	run->kvm_dirty_regs = 0;
>  }
>  
> -static void store_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void store_regs_fmt2(struct kvm_vcpu *vcpu)
>  {
> -	kvm_run->s.regs.todpr = vcpu->arch.sie_block->todpr;
> -	kvm_run->s.regs.pp = vcpu->arch.sie_block->pp;
> -	kvm_run->s.regs.gbea = vcpu->arch.sie_block->gbea;
> -	kvm_run->s.regs.bpbc = (vcpu->arch.sie_block->fpf & FPF_BPBC) == FPF_BPBC;
> +	struct kvm_run *run = vcpu->run;
> +
> +	run->s.regs.todpr = vcpu->arch.sie_block->todpr;
> +	run->s.regs.pp = vcpu->arch.sie_block->pp;
> +	run->s.regs.gbea = vcpu->arch.sie_block->gbea;
> +	run->s.regs.bpbc = (vcpu->arch.sie_block->fpf & FPF_BPBC) == FPF_BPBC;
>  	if (MACHINE_HAS_GS) {
>  		__ctl_set_bit(2, 4);
>  		if (vcpu->arch.gs_enabled)
> @@ -4310,39 +4315,41 @@ static void store_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  	/* SIE will save etoken directly into SDNX and therefore kvm_run */
>  }
>  
> -static void store_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void store_regs(struct kvm_vcpu *vcpu)
>  {
> -	kvm_run->psw_mask = vcpu->arch.sie_block->gpsw.mask;
> -	kvm_run->psw_addr = vcpu->arch.sie_block->gpsw.addr;
> -	kvm_run->s.regs.prefix = kvm_s390_get_prefix(vcpu);
> -	memcpy(&kvm_run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
> -	kvm_run->s.regs.cputm = kvm_s390_get_cpu_timer(vcpu);
> -	kvm_run->s.regs.ckc = vcpu->arch.sie_block->ckc;
> -	kvm_run->s.regs.pft = vcpu->arch.pfault_token;
> -	kvm_run->s.regs.pfs = vcpu->arch.pfault_select;
> -	kvm_run->s.regs.pfc = vcpu->arch.pfault_compare;
> -	save_access_regs(vcpu->run->s.regs.acrs);
> +	struct kvm_run *run = vcpu->run;
> +
> +	run->psw_mask = vcpu->arch.sie_block->gpsw.mask;
> +	run->psw_addr = vcpu->arch.sie_block->gpsw.addr;
> +	run->s.regs.prefix = kvm_s390_get_prefix(vcpu);
> +	memcpy(&run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
> +	run->s.regs.cputm = kvm_s390_get_cpu_timer(vcpu);
> +	run->s.regs.ckc = vcpu->arch.sie_block->ckc;
> +	run->s.regs.pft = vcpu->arch.pfault_token;
> +	run->s.regs.pfs = vcpu->arch.pfault_select;
> +	run->s.regs.pfc = vcpu->arch.pfault_compare;
> +	save_access_regs(run->s.regs.acrs);
>  	restore_access_regs(vcpu->arch.host_acrs);
>  	/* Save guest register state */
>  	save_fpu_regs();
> -	vcpu->run->s.regs.fpc = current->thread.fpu.fpc;
> +	run->s.regs.fpc = current->thread.fpu.fpc;
>  	/* Restore will be done lazily at return */
>  	current->thread.fpu.fpc = vcpu->arch.host_fpregs.fpc;
>  	current->thread.fpu.regs = vcpu->arch.host_fpregs.regs;
>  	if (likely(!kvm_s390_pv_cpu_is_protected(vcpu)))
> -		store_regs_fmt2(vcpu, kvm_run);
> +		store_regs_fmt2(vcpu);
>  }
>  
>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> -	struct kvm_run *kvm_run = vcpu->run;
> +	struct kvm_run *run = vcpu->run;
>  	int rc;
>  
> -	if (kvm_run->immediate_exit)
> +	if (run->immediate_exit)
>  		return -EINTR;
>  
> -	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
> -	    kvm_run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
> +	if (run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
> +	    run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
>  		return -EINVAL;
>  
>  	vcpu_load(vcpu);
> @@ -4368,14 +4375,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  		goto out;
>  	}
>  
> -	sync_regs(vcpu, kvm_run);
> +	sync_regs(vcpu);
>  	enable_cpu_timer_accounting(vcpu);
>  
>  	might_fault();
>  	rc = __vcpu_run(vcpu);
>  
>  	if (signal_pending(current) && !rc) {
> -		kvm_run->exit_reason = KVM_EXIT_INTR;
> +		run->exit_reason = KVM_EXIT_INTR;
>  		rc = -EINTR;
>  	}
>  
> @@ -4390,7 +4397,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	}
>  
>  	disable_cpu_timer_accounting(vcpu);
> -	store_regs(vcpu, kvm_run);
> +	store_regs(vcpu);
>  
>  	kvm_sigset_deactivate(vcpu);
>  
> 

