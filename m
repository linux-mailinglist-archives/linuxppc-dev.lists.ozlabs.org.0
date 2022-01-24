Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6313499D47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:50:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjQDh3M8yz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:50:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BUT7Lv6M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BUT7Lv6M; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjQD0322Lz30KZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:49:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OLgckg019238
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Kdd8sCFvwJ+Tlt1QlCnSTAnkNucgmHPuBBqpGqmIPQ0=;
 b=BUT7Lv6MViHo3PhTdz7n2wJ7AXzp6msb2PiPNK65+QHIdmCAA8ySBMG/NsA1Kiyw/xlw
 V8crDFkFq0CyuYlWBk6lfOi6sX2maDg1Z5PJXn7xX/n/+ESoZnoCP681yjDAkiDGJb41
 wI6o9rayhyEr00UrkxzeXWYEix263MPYsjnYlrfuEmH6dWxJsgOZr2ZEKosZdfNSwdgK
 ebI8xJtcnBZvie4nOg640z7NLiKkAewZ98mYaRajSqm7IfwMZ1+WVKsU8EAWi4tVoWlj
 gH4QxZ4hORgU9FsRwVCDhKAWoyUdoOpnKy4J2E66R5GGycqha2Z/4GnBNpyAwnEIJyfZ pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt48rs5hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:49:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OMnlwA024871
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:49:47 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt48rs5hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:49:47 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OMbVf2007963;
 Mon, 24 Jan 2022 22:49:47 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3dr9j9h5q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:49:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMnkIW34210248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:49:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 458F1C6088;
 Mon, 24 Jan 2022 22:49:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9324BC607C;
 Mon, 24 Jan 2022 22:49:45 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:49:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S PR: Disable SCV when running AIL
 is disabled
In-Reply-To: <20220124102417.3741427-2-npiggin@gmail.com>
References: <20220124102417.3741427-1-npiggin@gmail.com>
 <20220124102417.3741427-2-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:49:43 -0300
Message-ID: <877daoeol4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AhS1zGrEVfYoE6v6CJkrEKSc9h3dnu44
X-Proofpoint-ORIG-GUID: 12sJLWxogUGwE5eJS16QWD1esEUK2Lal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240145
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> PR KVM does not support running with AIL enabled, and SCV does is not
> supported with AIL disabled.
>
> Fix this by ensuring the SCV facility is disabled with FSCR while a
> CPU can be running with AIL=0. PowerNV host supports disabling AIL on a
> per-CPU basis, so SCV just needs to be disabled when a vCPU is run.
>
> The pSeries machine can only switch AIL on a system-wide basis, so it
> must disable SCV support at boot if the configuration can potentially
> run a PR KVM guest.
>
> SCV is not emulated for the PR guest at the moment, this just fixes the
> host crashes.
>
> Alternatives considered and rejected:
> - SCV support can not be disabled by PR KVM after boot, because it is
>   advertised to userspace with HWCAP.
> - AIL can not be disabled on a per-CPU basis. At least when running on
>   pseries it is a per-LPAR setting.
> - Support for real-mode SCV vectors will not be added because they are
>   at 0x17000 so making such a large fixed head space causes immediate
>   value limits to be exceeded, requiring a lot rework and more code.
> - Disabling SCV for any PR KVM possible kernel will cause a slowdown
>   when not using PR KVM.
> - A boot time option to disable SCV to use PR KVM is user-hostile.
> - System call instruction emulation for SCV facility unavailable
>   instructions is too complex and old emulation code was subtly broken
>   and removed.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S |  4 ++++
>  arch/powerpc/kernel/setup_64.c       | 15 +++++++++++++++
>  arch/powerpc/kvm/book3s_pr.c         | 20 ++++++++++++++------
>  3 files changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 55caeee37c08..b66dd6f775a4 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -809,6 +809,10 @@ __start_interrupts:
>   * - MSR_EE|MSR_RI is clear (no reentrant exceptions)
>   * - Standard kernel environment is set up (stack, paca, etc)
>   *
> + * KVM:
> + * These interrupts do not elevate HV 0->1, so HV is not involved. PR KVM
> + * ensures that FSCR[SCV] is disabled whenever it has to force AIL off.
> + *
>   * Call convention:
>   *
>   * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index be8577ac9397..ac52c69a3811 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -197,6 +197,21 @@ static void __init configure_exceptions(void)
>
>  	/* Under a PAPR hypervisor, we need hypercalls */
>  	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
> +		/*
> +		 * PR KVM does not support AIL mode interrupts in the host, and
> +		 * SCV system call interrupt vectors are only implemented for
> +		 * AIL mode. Under pseries, AIL mode can only be enabled and
> +		 * disabled system-wide so when PR KVM is loaded, all CPUs in
> +		 * the host are set to AIL=0 mode. SCV can not be disabled
> +		 * dynamically because the feature is advertised to host
> +		 * userspace, so SCV support must not be enabled if PR KVM can
> +		 * possibly be run.
> +		 */
> +		if (IS_ENABLED(CONFIG_KVM_BOOK3S_PR_POSSIBLE) && !radix_enabled()) {
> +			init_task.thread.fscr &= ~FSCR_SCV;
> +			cur_cpu_spec->cpu_user_features2 &= ~PPC_FEATURE2_SCV;
> +		}
> +

"Under pseries, AIL mode can only be enabled and disabled system-wide so
 when PR KVM is loaded, all CPUs in the host are set to AIL=0 mode."

Loaded as in 'modprobe kvm_pr'? And host as in "nested host"
surely. Unless I completely misunderstood the patch (likely).

Is there a way to make this less unexpected to users? Maybe a few words
in the Kconfig entry for PR_POSSIBLE saying "if you enable this and run
a Hash MMU guest, you lose SCV"?

>  		/* Enable AIL if possible */
>  		if (!pseries_enable_reloc_on_exc()) {
>  			init_task.thread.fscr &= ~FSCR_SCV;
> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
> index 34a801c3604a..4d1c84b94b77 100644
> --- a/arch/powerpc/kvm/book3s_pr.c
> +++ b/arch/powerpc/kvm/book3s_pr.c
> @@ -140,9 +140,12 @@ static void kvmppc_core_vcpu_load_pr(struct kvm_vcpu *vcpu, int cpu)
>  #endif
>
>  	/* Disable AIL if supported */
> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
> -	    cpu_has_feature(CPU_FTR_ARCH_207S))
> -		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
> +		if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
> +		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
> +			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) & ~FSCR_SCV);
> +	}
>
>  	vcpu->cpu = smp_processor_id();
>  #ifdef CONFIG_PPC_BOOK3S_32
> @@ -175,9 +178,12 @@ static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu *vcpu)
>  	kvmppc_save_tm_pr(vcpu);
>
>  	/* Enable AIL if supported */
> -	if (cpu_has_feature(CPU_FTR_HVMODE) &&
> -	    cpu_has_feature(CPU_FTR_ARCH_207S))
> -		mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
> +	if (cpu_has_feature(CPU_FTR_HVMODE)) {
> +		if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +			mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) | LPCR_AIL_3);
> +		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
> +			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) | FSCR_SCV);
> +	}
>
>  	vcpu->cpu = -1;
>  }
> @@ -1037,6 +1043,8 @@ static int kvmppc_handle_fac(struct kvm_vcpu *vcpu, ulong fac)
>
>  void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr)
>  {
> +	if (fscr & FSCR_SCV)
> +		fscr &= ~FSCR_SCV; /* SCV must not be enabled */
>  	if ((vcpu->arch.fscr & FSCR_TAR) && !(fscr & FSCR_TAR)) {
>  		/* TAR got dropped, drop it in shadow too */
>  		kvmppc_giveup_fac(vcpu, FSCR_TAR_LG);
