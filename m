Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98759399499
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 22:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwLPs6bqgz3092
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 06:35:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RlndGsIB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RlndGsIB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwLPK4ncRz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 06:35:01 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152KXtwV003966; Wed, 2 Jun 2021 16:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WR4LexuXoTCZFyWiZjqC0zplJ1d+4BlNbURpiGO6aqs=;
 b=RlndGsIBvJlCN8kgc33q9zMJqHUuR+wag5L/7ALiAynCuR7apsehaTMQvOs40noP26BQ
 RakvlWKbBMGGMlUMuf8pfWvX2La3N36yi0liu8xoOAAU0FujMQh3f7KmED9zkOWJNFz7
 ZAuZw5ka4o/HnL2QEWu0VmcQDF9z1a8DEUawrrAEtKJ+T3e2fPzmNLvvUbHvvTjUHx76
 3Xv/E6jOqjC+l64K7RlNzUlY5J7x2zfpOcRwv81AX1dxWYMw4Dd9FwrOQQELnUTdSxdu
 yfDCGxN9ifbed9kPYlYIjScc8s30Uc8LUhwV0ndL6vB6ibMtGuqrLW4nBXAq8Kz2zlag KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xfkctfjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 16:34:58 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152KYvmA009756;
 Wed, 2 Jun 2021 16:34:57 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xfkctfjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 16:34:57 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152KT6nW030367;
 Wed, 2 Jun 2021 20:34:56 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 38ud89tdd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 20:34:56 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152KYu6B24904144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 20:34:56 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CA7CAC065;
 Wed,  2 Jun 2021 20:34:56 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57BE6AC064;
 Wed,  2 Jun 2021 20:34:55 +0000 (GMT)
Received: from localhost (unknown [9.211.44.140])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Jun 2021 20:34:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9
 and POWER10 processors
In-Reply-To: <20210602040441.3984352-1-npiggin@gmail.com>
References: <20210602040441.3984352-1-npiggin@gmail.com>
Date: Wed, 02 Jun 2021 17:34:52 -0300
Message-ID: <875yywvwcz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HJj4FdsWh6kbQ0-tHnr7-SlX0FnoNEQ0
X-Proofpoint-ORIG-GUID: aM5Qy0dbzY7ALDs7Yu-xJZlzUSKiwrMn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_10:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106020129
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>
> The POWER9 vCPU TLB management code assumes all threads in a core share
> a TLB, and that TLBIEL execued by one thread will invalidate TLBs for
> all threads. This is not the case for SMT8 capable POWER9 and POWER10
> (big core) processors, where the TLB is split between groups of threads.
> This results in TLB multi-hits, random data corruption, etc.
>
> Fix this by introducing cpu_first_tlb_thread_sibling etc., to determine
> which siblings share TLBs, and use that in the guest TLB flushing code.
>
> [npiggin@gmail.com: add changelog and comment]
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/cputhreads.h | 30 +++++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv.c          | 13 ++++++------
>  arch/powerpc/kvm/book3s_hv_builtin.c  |  2 +-
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c   |  2 +-
>  4 files changed, 39 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputhreads.h b/arch/powerpc/include/asm/cputhreads.h
> index 98c8bd155bf9..b167186aaee4 100644
> --- a/arch/powerpc/include/asm/cputhreads.h
> +++ b/arch/powerpc/include/asm/cputhreads.h
> @@ -98,6 +98,36 @@ static inline int cpu_last_thread_sibling(int cpu)
>  	return cpu | (threads_per_core - 1);
>  }
>
> +/*
> + * tlb_thread_siblings are siblings which share a TLB. This is not
> + * architected, is not something a hypervisor could emulate and a future
> + * CPU may change behaviour even in compat mode, so this should only be
> + * used on PowerNV, and only with care.
> + */
> +static inline int cpu_first_tlb_thread_sibling(int cpu)
> +{
> +	if (cpu_has_feature(CPU_FTR_ARCH_300) && (threads_per_core == 8))
> +		return cpu & ~0x6;	/* Big Core */
> +	else
> +		return cpu_first_thread_sibling(cpu);
> +}
> +
> +static inline int cpu_last_tlb_thread_sibling(int cpu)
> +{
> +	if (cpu_has_feature(CPU_FTR_ARCH_300) && (threads_per_core == 8))
> +		return cpu | 0x6;	/* Big Core */
> +	else
> +		return cpu_last_thread_sibling(cpu);
> +}
> +
> +static inline int cpu_tlb_thread_sibling_step(void)
> +{
> +	if (cpu_has_feature(CPU_FTR_ARCH_300) && (threads_per_core == 8))
> +		return 2;		/* Big Core */
> +	else
> +		return 1;
> +}
> +
>  static inline u32 get_tensr(void)
>  {
>  #ifdef	CONFIG_BOOKE
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 28a80d240b76..0a8398a63f80 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2657,7 +2657,7 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
>  	cpumask_t *cpu_in_guest;
>  	int i;
>
> -	cpu = cpu_first_thread_sibling(cpu);
> +	cpu = cpu_first_tlb_thread_sibling(cpu);
>  	if (nested) {
>  		cpumask_set_cpu(cpu, &nested->need_tlb_flush);
>  		cpu_in_guest = &nested->cpu_in_guest;
> @@ -2671,9 +2671,10 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
>  	 * the other side is the first smp_mb() in kvmppc_run_core().
>  	 */
>  	smp_mb();
> -	for (i = 0; i < threads_per_core; ++i)
> -		if (cpumask_test_cpu(cpu + i, cpu_in_guest))
> -			smp_call_function_single(cpu + i, do_nothing, NULL, 1);
> +	for (i = cpu; i <= cpu_last_tlb_thread_sibling(cpu);
> +					i += cpu_tlb_thread_sibling_step())
> +		if (cpumask_test_cpu(i, cpu_in_guest))
> +			smp_call_function_single(i, do_nothing, NULL, 1);
>  }
>
>  static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
> @@ -2704,8 +2705,8 @@ static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
>  	 */
>  	if (prev_cpu != pcpu) {
>  		if (prev_cpu >= 0 &&
> -		    cpu_first_thread_sibling(prev_cpu) !=
> -		    cpu_first_thread_sibling(pcpu))
> +		    cpu_first_tlb_thread_sibling(prev_cpu) !=
> +		    cpu_first_tlb_thread_sibling(pcpu))
>  			radix_flush_cpu(kvm, prev_cpu, vcpu);
>  		if (nested)
>  			nested->prev_cpu[vcpu->arch.nested_vcpu_id] = pcpu;
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 7a0e33a9c980..3edc25c89092 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -800,7 +800,7 @@ void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
>  	 * Thus we make all 4 threads use the same bit.
>  	 */
>  	if (cpu_has_feature(CPU_FTR_ARCH_300))
> -		pcpu = cpu_first_thread_sibling(pcpu);
> +		pcpu = cpu_first_tlb_thread_sibling(pcpu);
>
>  	if (nested)
>  		need_tlb_flush = &nested->need_tlb_flush;
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> index 7af7c70f1468..407dbf21bcbc 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -67,7 +67,7 @@ static int global_invalidates(struct kvm *kvm)
>  		 * so use the bit for the first thread to represent the core.
>  		 */
>  		if (cpu_has_feature(CPU_FTR_ARCH_300))
> -			cpu = cpu_first_thread_sibling(cpu);
> +			cpu = cpu_first_tlb_thread_sibling(cpu);
>  		cpumask_clear_cpu(cpu, &kvm->arch.need_tlb_flush);
>  	}
