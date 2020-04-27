Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2B1B96C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 07:46:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499YgD3PVlzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 15:46:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=chenhuacai@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tPyEDsKY; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499YGs1W7GzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 15:28:51 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id r2so15528386ilo.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 22:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WaGkkmN4y0RTKMJdi8EzfBOVXmmyYE1h1oyexRBOoJs=;
 b=tPyEDsKYUyeukcQPidA1eBsK2tO/iOQHFUyMGCqupigUFO6XFt/HeabZznvUO2PtIP
 duxbrxm/RKCdsfGptzRSELZbQtoHBeXtXJzRtIyjTsi875Vz6sIbrU1P1YN8jB0DEBEk
 8HXzzuGowdAlTBweokfr/ecURx3Qc+4g8IKSc4Tlhgko7OFScEnyvij3Dhd2/O1mimMj
 d2izVMbpsqH6WoJRLGLFR/pwKOFnXrtsxQCo+LIPg3euZTHB8LAhZ5aKh05e0lMbJbYT
 6woc+0WVk0Ft2y0zUtyXh4/Z5DY8pKpZO95TWgZepk6wuxUmzAy6Dr662CldNqsyyyYq
 8Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WaGkkmN4y0RTKMJdi8EzfBOVXmmyYE1h1oyexRBOoJs=;
 b=rZhcWUtQYXjkXW1ICR0xMcdCyFXoeIovEURe0MGnfgDu2eBuRLWglGH4Q9q49knrek
 Z8dvRgoxK0rT522reCytNAtDHPnhoQHRglfA4eDbLSVvU4z/dQO9uBq9hu2Zo9fCJVv/
 PvePyMOFqP2A9WYZeNoMHaZtQCnBQjjNlb89lCf+eFn7C7nb6+8IRF8xNvwVzqAv4A8M
 b/SrS6ajxKrM7dBYy04RBCKaUHt8PBs+2c+7hDDo5ORXbqNQaUKn6O8l39wo9UjbMFGX
 yLVy+g6Jg+jQxTOBSLEf/loBXtiojkM4l5qM3Gv7G1shNKjRItvzpb8QWnIaPCa7697N
 wqMw==
X-Gm-Message-State: AGi0PuYGOwPmySZTp0ujrgRfxlovvBxo6n9Onfrz03pl8NYqgXlIpRRa
 YH8S6taCwFAPLWSS8omdUA480Pj06fiXJnTBeuw=
X-Google-Smtp-Source: APiQypJJ3gTkYymjZHG1lOAkRRLWHriIgaVysG1xMH8dflioRXle0xcd0ALG5nbb4/ZZdse7BjsYmeI7nNLAHsuc+NY=
X-Received: by 2002:a92:cece:: with SMTP id z14mr18885492ilq.147.1587965329004; 
 Sun, 26 Apr 2020 22:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-8-tianjia.zhang@linux.alibaba.com>
In-Reply-To: <20200427043514.16144-8-tianjia.zhang@linux.alibaba.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Mon, 27 Apr 2020 13:36:16 +0800
Message-ID: <CAAhV-H5vifJfV+HjJS2UpW-56tdsXFA6VYhaf3xi92POxuPTyg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] KVM: MIPS: clean up redundant kvm_run parameters
 in assembly
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 27 Apr 2020 15:43:32 +1000
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, david@redhat.com,
 heiko.carstens@de.ibm.com, Peter Xu <peterx@redhat.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, hpa@zytor.com,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, Marc Zyngier <maz@kernel.org>, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, jmattson@google.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, cohuck@redhat.com,
 christoffer.dall@arm.com, sean.j.christopherson@intel.com,
 LKML <linux-kernel@vger.kernel.org>, james.morse@arm.com,
 Paolo Bonzini <pbonzini@redhat.com>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Mon, Apr 27, 2020 at 12:35 PM Tianjia Zhang
<tianjia.zhang@linux.alibaba.com> wrote:
>
> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. For historical reasons, many kvm-related function parameters
> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
> patch does a unified cleanup of these remaining redundant parameters.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/mips/include/asm/kvm_host.h |  4 ++--
>  arch/mips/kvm/entry.c            | 21 ++++++++-------------
>  arch/mips/kvm/mips.c             |  3 ++-
>  arch/mips/kvm/trap_emul.c        |  2 +-
>  arch/mips/kvm/vz.c               |  2 +-
>  5 files changed, 14 insertions(+), 18 deletions(-)
>
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 971439297cea..db915c55166d 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -310,7 +310,7 @@ struct kvm_mmu_memory_cache {
>  #define KVM_MIPS_GUEST_TLB_SIZE        64
>  struct kvm_vcpu_arch {
>         void *guest_ebase;
> -       int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
> +       int (*vcpu_run)(struct kvm_vcpu *vcpu);
>
>         /* Host registers preserved across guest mode execution */
>         unsigned long host_stack;
> @@ -821,7 +821,7 @@ int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks);
>  /* Debug: dump vcpu state */
>  int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
>
> -extern int kvm_mips_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu);
> +extern int kvm_mips_handle_exit(struct kvm_vcpu *vcpu);
>
>  /* Building of entry/exception code */
>  int kvm_mips_entry_setup(void);
> diff --git a/arch/mips/kvm/entry.c b/arch/mips/kvm/entry.c
> index 16e1c93b484f..1083f35361ea 100644
> --- a/arch/mips/kvm/entry.c
> +++ b/arch/mips/kvm/entry.c
> @@ -204,7 +204,7 @@ static inline void build_set_exc_base(u32 **p, unsigned int reg)
>   * Assemble the start of the vcpu_run function to run a guest VCPU. The function
>   * conforms to the following prototype:
>   *
> - * int vcpu_run(struct kvm_run *run, struct kvm_vcpu *vcpu);
> + * int vcpu_run(struct kvm_vcpu *vcpu);
>   *
>   * The exit from the guest and return to the caller is handled by the code
>   * generated by kvm_mips_build_ret_to_host().
> @@ -217,8 +217,7 @@ void *kvm_mips_build_vcpu_run(void *addr)
>         unsigned int i;
>
>         /*
> -        * A0: run
> -        * A1: vcpu
> +        * A0: vcpu
>          */
>
>         /* k0/k1 not being used in host kernel context */
> @@ -237,10 +236,10 @@ void *kvm_mips_build_vcpu_run(void *addr)
>         kvm_mips_build_save_scratch(&p, V1, K1);
>
>         /* VCPU scratch register has pointer to vcpu */
> -       UASM_i_MTC0(&p, A1, scratch_vcpu[0], scratch_vcpu[1]);
> +       UASM_i_MTC0(&p, A0, scratch_vcpu[0], scratch_vcpu[1]);
>
>         /* Offset into vcpu->arch */
> -       UASM_i_ADDIU(&p, K1, A1, offsetof(struct kvm_vcpu, arch));
> +       UASM_i_ADDIU(&p, K1, A0, offsetof(struct kvm_vcpu, arch));
>
>         /*
>          * Save the host stack to VCPU, used for exception processing
> @@ -628,10 +627,7 @@ void *kvm_mips_build_exit(void *addr)
>         /* Now that context has been saved, we can use other registers */
>
>         /* Restore vcpu */
> -       UASM_i_MFC0(&p, S1, scratch_vcpu[0], scratch_vcpu[1]);
> -
> -       /* Restore run (vcpu->run) */
> -       UASM_i_LW(&p, S0, offsetof(struct kvm_vcpu, run), S1);
> +       UASM_i_MFC0(&p, S0, scratch_vcpu[0], scratch_vcpu[1]);
>
>         /*
>          * Save Host level EPC, BadVaddr and Cause to VCPU, useful to process
> @@ -793,7 +789,6 @@ void *kvm_mips_build_exit(void *addr)
>          * with this in the kernel
>          */
>         uasm_i_move(&p, A0, S0);
> -       uasm_i_move(&p, A1, S1);
>         UASM_i_LA(&p, T9, (unsigned long)kvm_mips_handle_exit);
>         uasm_i_jalr(&p, RA, T9);
>          UASM_i_ADDIU(&p, SP, SP, -CALLFRAME_SIZ);
> @@ -835,7 +830,7 @@ static void *kvm_mips_build_ret_from_exit(void *addr)
>          * guest, reload k1
>          */
>
> -       uasm_i_move(&p, K1, S1);
> +       uasm_i_move(&p, K1, S0);
>         UASM_i_ADDIU(&p, K1, K1, offsetof(struct kvm_vcpu, arch));
>
>         /*
> @@ -869,8 +864,8 @@ static void *kvm_mips_build_ret_to_guest(void *addr)
>  {
>         u32 *p = addr;
>
> -       /* Put the saved pointer to vcpu (s1) back into the scratch register */
> -       UASM_i_MTC0(&p, S1, scratch_vcpu[0], scratch_vcpu[1]);
> +       /* Put the saved pointer to vcpu (s0) back into the scratch register */
> +       UASM_i_MTC0(&p, S0, scratch_vcpu[0], scratch_vcpu[1]);
>
>         /* Load up the Guest EBASE to minimize the window where BEV is set */
>         UASM_i_LW(&p, T0, offsetof(struct kvm_vcpu_arch, guest_ebase), K1);
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 9710477a9827..32850470c037 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1186,8 +1186,9 @@ static void kvm_mips_set_c0_status(void)
>  /*
>   * Return value is in the form (errcode<<2 | RESUME_FLAG_HOST | RESUME_FLAG_NV)
>   */
> -int kvm_mips_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
> +int kvm_mips_handle_exit(struct kvm_vcpu *vcpu)
>  {
> +       struct kvm_run *run = vcpu->run;
>         u32 cause = vcpu->arch.host_cp0_cause;
>         u32 exccode = (cause >> CAUSEB_EXCCODE) & 0x1f;
>         u32 __user *opc = (u32 __user *) vcpu->arch.pc;
> diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
> index d822f3aee3dc..04c864cc356a 100644
> --- a/arch/mips/kvm/trap_emul.c
> +++ b/arch/mips/kvm/trap_emul.c
> @@ -1238,7 +1238,7 @@ static int kvm_trap_emul_vcpu_run(struct kvm_vcpu *vcpu)
>          */
>         kvm_mips_suspend_mm(cpu);
>
> -       r = vcpu->arch.vcpu_run(vcpu->run, vcpu);
> +       r = vcpu->arch.vcpu_run(vcpu);
>
>         /* We may have migrated while handling guest exits */
>         cpu = smp_processor_id();
> diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
> index 94f1d23828e3..c5878fa0636d 100644
> --- a/arch/mips/kvm/vz.c
> +++ b/arch/mips/kvm/vz.c
> @@ -3152,7 +3152,7 @@ static int kvm_vz_vcpu_run(struct kvm_vcpu *vcpu)
>         kvm_vz_vcpu_load_tlb(vcpu, cpu);
>         kvm_vz_vcpu_load_wired(vcpu);
>
> -       r = vcpu->arch.vcpu_run(vcpu->run, vcpu);
> +       r = vcpu->arch.vcpu_run(vcpu);
>
>         kvm_vz_vcpu_save_wired(vcpu);
>
> --
> 2.17.1
>
