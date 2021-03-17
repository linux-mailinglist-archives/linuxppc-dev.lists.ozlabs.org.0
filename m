Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E414033F3DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 16:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0tt23pqdz30Pf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 02:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0aFWnSM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M0aFWnSM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0tsY5m7bz3035
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 02:11:29 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HF3NRg032167; Wed, 17 Mar 2021 11:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+qFdfoZE4HH/nkwTIthm2xOy59LKOz3pQdIXAC0i8mA=;
 b=M0aFWnSMhQkLEMwqNbi3NScV/8ZKtJrdu3tkXgdXk7l5p4/1w638CtjWKzVdKnycYrFr
 G3MUPxUI49ymjgrMUy1PaGnobS6ikQi6IBy0w5m82pr6SLKX46WYrmKTIvhliF5Fb4vM
 C1wVUIQ+oiG2HU4zpIa/+sVUyatg0sLFKxJjIhGyLLfibeAzCL4Prp+NuohB4l4b4OE2
 F9se0eJk7aX5iCFSe1LwjCq2mXe1E0k5AZyumKT5dMjuRBt5Ar/UcbXDrSD1nCseIj6w
 0rnlTGt5J9k44Q+kbsmcMLbyomlJDG9Buc5z5Jy5D5W6XI4VZgwWZ3cOx4KapGvkv73L +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37be74bc90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 11:11:25 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12HF42G8035819;
 Wed, 17 Mar 2021 11:11:25 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37be74bc8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 11:11:25 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12HExIJR019072;
 Wed, 17 Mar 2021 15:11:24 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 37a3gcprk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 15:11:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12HFBNa626018200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 15:11:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C3B6AC05B;
 Wed, 17 Mar 2021 15:11:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4DC7AC059;
 Wed, 17 Mar 2021 15:11:21 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.75.186])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Mar 2021 15:11:21 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 34/41] KVM: PPC: Book3S HV: Remove support for
 dependent threads mode on P9
In-Reply-To: <20210305150638.2675513-35-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-35-npiggin@gmail.com>
Date: Wed, 17 Mar 2021 20:41:19 +0530
Message-ID: <87ft0tzug8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_07:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170110
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Radix guest support will be removed from the P7/8 path, so disallow
> dependent threads mode on P9.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/book3s_hv.c        | 27 +++++----------------------
>  2 files changed, 5 insertions(+), 23 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 05fb00d37609..dd017dfa4e65 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -304,7 +304,6 @@ struct kvm_arch {
>  	u8 fwnmi_enabled;
>  	u8 secure_guest;
>  	u8 svm_enabled;
> -	bool threads_indep;
>  	bool nested_enable;
>  	bool dawr1_enabled;
>  	pgd_t *pgtable;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index cb428e2f7140..928ed8180d9d 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -103,13 +103,9 @@ static int target_smt_mode;
>  module_param(target_smt_mode, int, 0644);
>  MODULE_PARM_DESC(target_smt_mode, "Target threads per core (0 = max)");
>  
> -static bool indep_threads_mode = true;
> -module_param(indep_threads_mode, bool, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(indep_threads_mode, "Independent-threads mode (only on POWER9)");
> -
>  static bool one_vm_per_core;
>  module_param(one_vm_per_core, bool, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a core (requires indep_threads_mode=N)");
> +MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a core (requires POWER8 or older)");

Isn't this also a security feature, where there was an ask to make sure
threads/vCPU from other VM won't run on this core? In that context isn't
this applicable also for P9?


>  
>  #ifdef CONFIG_KVM_XICS
>  static const struct kernel_param_ops module_param_ops = {
> @@ -2227,7 +2223,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
>   */
>  static int threads_per_vcore(struct kvm *kvm)
>  {
> -	if (kvm->arch.threads_indep)
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
>  		return 1;
>  	return threads_per_subcore;
>  }
> @@ -4319,7 +4315,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
>  
>  	do {
> -		if (kvm->arch.threads_indep && kvm_is_radix(kvm))
> +		if (kvm_is_radix(kvm))
>  			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
>  						  vcpu->arch.vcore->lpcr);
>  		else
> @@ -4934,21 +4930,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>  	/*
>  	 * Track that we now have a HV mode VM active. This blocks secondary
>  	 * CPU threads from coming online.
> -	 * On POWER9, we only need to do this if the "indep_threads_mode"
> -	 * module parameter has been set to N.
>  	 */
> -	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> -		if (!indep_threads_mode && !cpu_has_feature(CPU_FTR_HVMODE)) {
> -			pr_warn("KVM: Ignoring indep_threads_mode=N in nested hypervisor\n");
> -			kvm->arch.threads_indep = true;
> -		} else if (!indep_threads_mode && cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
> -			pr_warn("KVM: Ignoring indep_threads_mode=N on pre-DD2.2 POWER9\n");
> -			kvm->arch.threads_indep = true;
> -		} else {
> -			kvm->arch.threads_indep = indep_threads_mode;
> -		}
> -	}
> -	if (!kvm->arch.threads_indep)
> +	if (!cpu_has_feature(CPU_FTR_ARCH_300))
>  		kvm_hv_vm_activated();
>  
>  	/*
> @@ -4989,7 +4972,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
>  {
>  	debugfs_remove_recursive(kvm->arch.debugfs_dir);
>  
> -	if (!kvm->arch.threads_indep)
> +	if (!cpu_has_feature(CPU_FTR_ARCH_300))
>  		kvm_hv_vm_deactivated();
>  
>  	kvmppc_free_vcores(kvm);
> -- 
> 2.23.0
