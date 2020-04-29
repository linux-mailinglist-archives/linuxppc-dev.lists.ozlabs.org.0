Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592B1BDB71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 14:10:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49By4y6kwFzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 22:10:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iHbKHuxo; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iHbKHuxo; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49By2L03FfzDqyG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:07:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588162071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxP7ZETmlLlv+gVE9NINK/C0wFmGs+lE/O5yF+80YvM=;
 b=iHbKHuxoCbm+ZNxPVszGXIeeUvDxbypIbRrzdPJF9n52Jny0/DpcGjtCHCqUzop+Iryg1+
 IOUgmQaakhB7Y4cIG3mD0rv0stT+PAZ6osY44p//0wb41BGqTQRJDpx/0CrUSD5eeM5vmk
 Xy+QJH9Oji0goDOKlbGxTLUaSgty8DQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588162071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxP7ZETmlLlv+gVE9NINK/C0wFmGs+lE/O5yF+80YvM=;
 b=iHbKHuxoCbm+ZNxPVszGXIeeUvDxbypIbRrzdPJF9n52Jny0/DpcGjtCHCqUzop+Iryg1+
 IOUgmQaakhB7Y4cIG3mD0rv0stT+PAZ6osY44p//0wb41BGqTQRJDpx/0CrUSD5eeM5vmk
 Xy+QJH9Oji0goDOKlbGxTLUaSgty8DQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-3I4f9FtBNVWgMPvblEmzcg-1; Wed, 29 Apr 2020 08:07:47 -0400
X-MC-Unique: 3I4f9FtBNVWgMPvblEmzcg-1
Received: by mail-wm1-f70.google.com with SMTP id s12so1104904wmj.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JzCKZLUuLFWol2g0XAdehiMxQ7h8LZkkHyQw/IoI2Lk=;
 b=gpLV65sUXTQjChKQPBNhPznmyy+dQlEWTvI6Up22MXFZuINDd2dE1+Pu6gNKJWOQZK
 SGYfkhY1isXLBso210Osz7MfN3vny0SXSbU3W4M2MOgmQqdlB0XWSliJiqtDYrEZ+7vH
 ekzjTZONwKv4NP5/4kjSVK7fGzt+8aY1hdu67zWzp4PlJVkE1W6Z/OeLtZsSf/sabpIt
 Afh9iNzZMLMowTHG8z0ZxT3aPJL9TQcxoVNwmXlgHzhNC1fp8OZAy+fOyZuxz5gsaz6v
 PeBrwSC32QlwCa2Dwy6rhXTqSuwiqeLKvmJtpHvtPlDsjBCdkJtiSNr7qRcseC1RVnfy
 iIOw==
X-Gm-Message-State: AGi0PuY/KjiMoViHWNid1CIzzez52pxh//VwOQq/lTdIJnWURUDqyfPc
 0raqTa/17mf3GU+/WGNynU1Kh/HsPz8636mE3Vz8u8QQWXIRkvmUcpvfguT3Fge87BOmyoat3sS
 3P5eHr+3lgICQQ9SeexAp+cE+8g==
X-Received: by 2002:adf:e450:: with SMTP id t16mr41848712wrm.301.1588162065980; 
 Wed, 29 Apr 2020 05:07:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJyZQDVaRyZH74jjCr4+q3m+V20LIx3RdVwzBd6yW7ZBQVZ06ZZzo/9/5pVPOKWDXkzdNd3zg==
X-Received: by 2002:adf:e450:: with SMTP id t16mr41848659wrm.301.1588162065538; 
 Wed, 29 Apr 2020 05:07:45 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id a9sm7125563wmm.38.2020.04.29.05.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:07:27 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v4 2/7] KVM: arm64: clean up redundant 'kvm_run' parameters
In-Reply-To: <20200427043514.16144-3-tianjia.zhang@linux.alibaba.com>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-3-tianjia.zhang@linux.alibaba.com>
Date: Wed, 29 Apr 2020 14:07:10 +0200
Message-ID: <87o8rah4wh.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: christoffer.dall@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 david@redhat.com, heiko.carstens@de.ibm.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, hpa@zytor.com, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, frankja@linux.ibm.com, chenhuacai@gmail.com,
 joro@8bytes.org, x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, tianjia.zhang@linux.alibaba.com, cohuck@redhat.com,
 linux-mips@vger.kernel.org, sean.j.christopherson@intel.com,
 james.morse@arm.com, maz@kernel.org, pbonzini@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:

> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. For historical reasons, many kvm-related function parameters
> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
> patch does a unified cleanup of these remaining redundant parameters.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/kvm_coproc.h | 12 +++++-----
>  arch/arm64/include/asm/kvm_host.h   | 11 ++++-----
>  arch/arm64/include/asm/kvm_mmu.h    |  2 +-
>  arch/arm64/kvm/handle_exit.c        | 36 ++++++++++++++---------------
>  arch/arm64/kvm/sys_regs.c           | 13 +++++------
>  virt/kvm/arm/arm.c                  |  6 ++---
>  virt/kvm/arm/mmio.c                 | 11 +++++----
>  virt/kvm/arm/mmu.c                  |  5 ++--
>  8 files changed, 46 insertions(+), 50 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_coproc.h b/arch/arm64/include/asm=
/kvm_coproc.h
> index 0185ee8b8b5e..454373704b8a 100644
> --- a/arch/arm64/include/asm/kvm_coproc.h
> +++ b/arch/arm64/include/asm/kvm_coproc.h
> @@ -27,12 +27,12 @@ struct kvm_sys_reg_target_table {
>  void kvm_register_target_sys_reg_table(unsigned int target,
>  =09=09=09=09       struct kvm_sys_reg_target_table *table);
> =20
> -int kvm_handle_cp14_load_store(struct kvm_vcpu *vcpu, struct kvm_run *ru=
n);
> -int kvm_handle_cp14_32(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -int kvm_handle_cp14_64(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -int kvm_handle_cp15_32(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -int kvm_handle_cp15_64(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -int kvm_handle_sys_reg(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +int kvm_handle_cp14_load_store(struct kvm_vcpu *vcpu);
> +int kvm_handle_cp14_32(struct kvm_vcpu *vcpu);
> +int kvm_handle_cp14_64(struct kvm_vcpu *vcpu);
> +int kvm_handle_cp15_32(struct kvm_vcpu *vcpu);
> +int kvm_handle_cp15_64(struct kvm_vcpu *vcpu);
> +int kvm_handle_sys_reg(struct kvm_vcpu *vcpu);
> =20
>  #define kvm_coproc_table_init kvm_sys_reg_table_init
>  void kvm_sys_reg_table_init(void);
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/k=
vm_host.h
> index 32c8a675e5a4..3fab32e4948c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -481,18 +481,15 @@ u64 __kvm_call_hyp(void *hypfn, ...);
>  void force_vm_exit(const cpumask_t *mask);
>  void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot);
> =20
> -int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -=09=09int exception_index);
> -void handle_exit_early(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -=09=09       int exception_index);
> +int handle_exit(struct kvm_vcpu *vcpu, int exception_index);
> +void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index);
> =20
>  /* MMIO helpers */
>  void kvm_mmio_write_buf(void *buf, unsigned int len, unsigned long data)=
;
>  unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
> =20
> -int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -int io_mem_abort(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -=09=09 phys_addr_t fault_ipa);
> +int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
> +int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
> =20
>  int kvm_perf_init(void);
>  int kvm_perf_teardown(void);
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kv=
m_mmu.h
> index 30b0e8d6b895..2ec7b9bb25d3 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -159,7 +159,7 @@ void kvm_free_stage2_pgd(struct kvm *kvm);
>  int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  =09=09=09  phys_addr_t pa, unsigned long size, bool writable);
> =20
> -int kvm_handle_guest_abort(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
> =20
>  void kvm_mmu_free_memory_caches(struct kvm_vcpu *vcpu);
> =20
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index aacfc55de44c..ec3a66642ea5 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -25,7 +25,7 @@
>  #define CREATE_TRACE_POINTS
>  #include "trace.h"
> =20
> -typedef int (*exit_handle_fn)(struct kvm_vcpu *, struct kvm_run *);
> +typedef int (*exit_handle_fn)(struct kvm_vcpu *);
> =20
>  static void kvm_handle_guest_serror(struct kvm_vcpu *vcpu, u32 esr)
>  {
> @@ -33,7 +33,7 @@ static void kvm_handle_guest_serror(struct kvm_vcpu *vc=
pu, u32 esr)
>  =09=09kvm_inject_vabt(vcpu);
>  }
> =20
> -static int handle_hvc(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +static int handle_hvc(struct kvm_vcpu *vcpu)
>  {
>  =09int ret;
> =20
> @@ -50,7 +50,7 @@ static int handle_hvc(struct kvm_vcpu *vcpu, struct kvm=
_run *run)
>  =09return ret;
>  }
> =20
> -static int handle_smc(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +static int handle_smc(struct kvm_vcpu *vcpu)
>  {
>  =09/*
>  =09 * "If an SMC instruction executed at Non-secure EL1 is
> @@ -69,7 +69,7 @@ static int handle_smc(struct kvm_vcpu *vcpu, struct kvm=
_run *run)
>   * Guest access to FP/ASIMD registers are routed to this handler only
>   * when the system doesn't support FP/ASIMD.
>   */
> -static int handle_no_fpsimd(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +static int handle_no_fpsimd(struct kvm_vcpu *vcpu)
>  {
>  =09kvm_inject_undefined(vcpu);
>  =09return 1;
> @@ -87,7 +87,7 @@ static int handle_no_fpsimd(struct kvm_vcpu *vcpu, stru=
ct kvm_run *run)
>   * world-switches and schedule other host processes until there is an
>   * incoming IRQ or FIQ to the VM.
>   */
> -static int kvm_handle_wfx(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
>  {
>  =09if (kvm_vcpu_get_hsr(vcpu) & ESR_ELx_WFx_ISS_WFE) {
>  =09=09trace_kvm_wfx_arm64(*vcpu_pc(vcpu), true);
> @@ -109,16 +109,16 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu, st=
ruct kvm_run *run)
>   * kvm_handle_guest_debug - handle a debug exception instruction
>   *
>   * @vcpu:=09the vcpu pointer
> - * @run:=09access to the kvm_run structure for results
>   *
>   * We route all debug exceptions through the same handler. If both the
>   * guest and host are using the same debug facilities it will be up to
>   * userspace to re-inject the correct exception for guest delivery.
>   *
> - * @return: 0 (while setting run->exit_reason), -1 for error
> + * @return: 0 (while setting vcpu->run->exit_reason), -1 for error
>   */
> -static int kvm_handle_guest_debug(struct kvm_vcpu *vcpu, struct kvm_run =
*run)
> +static int kvm_handle_guest_debug(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09u32 hsr =3D kvm_vcpu_get_hsr(vcpu);
>  =09int ret =3D 0;
> =20
> @@ -144,7 +144,7 @@ static int kvm_handle_guest_debug(struct kvm_vcpu *vc=
pu, struct kvm_run *run)
>  =09return ret;
>  }
> =20
> -static int kvm_handle_unknown_ec(struct kvm_vcpu *vcpu, struct kvm_run *=
run)
> +static int kvm_handle_unknown_ec(struct kvm_vcpu *vcpu)
>  {
>  =09u32 hsr =3D kvm_vcpu_get_hsr(vcpu);
> =20
> @@ -155,7 +155,7 @@ static int kvm_handle_unknown_ec(struct kvm_vcpu *vcp=
u, struct kvm_run *run)
>  =09return 1;
>  }
> =20
> -static int handle_sve(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +static int handle_sve(struct kvm_vcpu *vcpu)
>  {
>  =09/* Until SVE is supported for guests: */
>  =09kvm_inject_undefined(vcpu);
> @@ -193,7 +193,7 @@ void kvm_arm_vcpu_ptrauth_trap(struct kvm_vcpu *vcpu)
>   * Guest usage of a ptrauth instruction (which the guest EL1 did not tur=
n into
>   * a NOP).
>   */
> -static int kvm_handle_ptrauth(struct kvm_vcpu *vcpu, struct kvm_run *run=
)
> +static int kvm_handle_ptrauth(struct kvm_vcpu *vcpu)
>  {
>  =09kvm_arm_vcpu_ptrauth_trap(vcpu);
>  =09return 1;
> @@ -238,7 +238,7 @@ static exit_handle_fn kvm_get_exit_handler(struct kvm=
_vcpu *vcpu)
>   * KVM_EXIT_DEBUG, otherwise userspace needs to complete its
>   * emulation first.
>   */
> -static int handle_trap_exceptions(struct kvm_vcpu *vcpu, struct kvm_run =
*run)
> +static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
>  {
>  =09int handled;
> =20
> @@ -253,7 +253,7 @@ static int handle_trap_exceptions(struct kvm_vcpu *vc=
pu, struct kvm_run *run)
>  =09=09exit_handle_fn exit_handler;
> =20
>  =09=09exit_handler =3D kvm_get_exit_handler(vcpu);
> -=09=09handled =3D exit_handler(vcpu, run);
> +=09=09handled =3D exit_handler(vcpu);
>  =09}
> =20
>  =09return handled;
> @@ -263,9 +263,10 @@ static int handle_trap_exceptions(struct kvm_vcpu *v=
cpu, struct kvm_run *run)
>   * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) =
on
>   * proper exit to userspace.
>   */
> -int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -=09=09       int exception_index)
> +int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
> +
>  =09if (ARM_SERROR_PENDING(exception_index)) {
>  =09=09u8 hsr_ec =3D ESR_ELx_EC(kvm_vcpu_get_hsr(vcpu));
> =20
> @@ -291,7 +292,7 @@ int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run=
 *run,
>  =09case ARM_EXCEPTION_EL1_SERROR:
>  =09=09return 1;
>  =09case ARM_EXCEPTION_TRAP:
> -=09=09return handle_trap_exceptions(vcpu, run);
> +=09=09return handle_trap_exceptions(vcpu);
>  =09case ARM_EXCEPTION_HYP_GONE:
>  =09=09/*
>  =09=09 * EL2 has been reset to the hyp-stub. This happens when a guest
> @@ -315,8 +316,7 @@ int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run=
 *run,
>  }
> =20
>  /* For exit types that need handling before we can be preempted */
> -void handle_exit_early(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -=09=09       int exception_index)
> +void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
>  {
>  =09if (ARM_SERROR_PENDING(exception_index)) {
>  =09=09if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 51db934702b6..e5a0d0d676c8 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2116,7 +2116,7 @@ static const struct sys_reg_desc *find_reg(const st=
ruct sys_reg_params *params,
>  =09return bsearch((void *)pval, table, num, sizeof(table[0]), match_sys_=
reg);
>  }
> =20
> -int kvm_handle_cp14_load_store(struct kvm_vcpu *vcpu, struct kvm_run *ru=
n)
> +int kvm_handle_cp14_load_store(struct kvm_vcpu *vcpu)
>  {
>  =09kvm_inject_undefined(vcpu);
>  =09return 1;
> @@ -2295,7 +2295,7 @@ static int kvm_handle_cp_32(struct kvm_vcpu *vcpu,
>  =09return 1;
>  }
> =20
> -int kvm_handle_cp15_64(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_cp15_64(struct kvm_vcpu *vcpu)
>  {
>  =09const struct sys_reg_desc *target_specific;
>  =09size_t num;
> @@ -2306,7 +2306,7 @@ int kvm_handle_cp15_64(struct kvm_vcpu *vcpu, struc=
t kvm_run *run)
>  =09=09=09=09target_specific, num);
>  }
> =20
> -int kvm_handle_cp15_32(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_cp15_32(struct kvm_vcpu *vcpu)
>  {
>  =09const struct sys_reg_desc *target_specific;
>  =09size_t num;
> @@ -2317,14 +2317,14 @@ int kvm_handle_cp15_32(struct kvm_vcpu *vcpu, str=
uct kvm_run *run)
>  =09=09=09=09target_specific, num);
>  }
> =20
> -int kvm_handle_cp14_64(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_cp14_64(struct kvm_vcpu *vcpu)
>  {
>  =09return kvm_handle_cp_64(vcpu,
>  =09=09=09=09cp14_64_regs, ARRAY_SIZE(cp14_64_regs),
>  =09=09=09=09NULL, 0);
>  }
> =20
> -int kvm_handle_cp14_32(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_cp14_32(struct kvm_vcpu *vcpu)
>  {
>  =09return kvm_handle_cp_32(vcpu,
>  =09=09=09=09cp14_regs, ARRAY_SIZE(cp14_regs),
> @@ -2382,9 +2382,8 @@ static void reset_sys_reg_descs(struct kvm_vcpu *vc=
pu,
>  /**
>   * kvm_handle_sys_reg -- handles a mrs/msr trap on a guest sys_reg acces=
s
>   * @vcpu: The VCPU pointer
> - * @run:  The kvm_run struct
>   */
> -int kvm_handle_sys_reg(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_sys_reg(struct kvm_vcpu *vcpu)
>  {
>  =09struct sys_reg_params params;
>  =09unsigned long esr =3D kvm_vcpu_get_hsr(vcpu);
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index f5390ac2165b..dbeb20804a75 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -659,7 +659,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09=09return ret;
> =20
>  =09if (run->exit_reason =3D=3D KVM_EXIT_MMIO) {
> -=09=09ret =3D kvm_handle_mmio_return(vcpu, run);
> +=09=09ret =3D kvm_handle_mmio_return(vcpu);
>  =09=09if (ret)
>  =09=09=09return ret;
>  =09}
> @@ -811,11 +811,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09=09trace_kvm_exit(ret, kvm_vcpu_trap_get_class(vcpu), *vcpu_pc(vcpu))=
;
> =20
>  =09=09/* Exit types that need handling before we can be preempted */
> -=09=09handle_exit_early(vcpu, run, ret);
> +=09=09handle_exit_early(vcpu, ret);
> =20
>  =09=09preempt_enable();
> =20
> -=09=09ret =3D handle_exit(vcpu, run, ret);
> +=09=09ret =3D handle_exit(vcpu, ret);
>  =09}
> =20
>  =09/* Tell userspace about in-kernel device output levels */
> diff --git a/virt/kvm/arm/mmio.c b/virt/kvm/arm/mmio.c
> index aedfcff99ac5..41ef5c5dbc62 100644
> --- a/virt/kvm/arm/mmio.c
> +++ b/virt/kvm/arm/mmio.c
> @@ -77,9 +77,8 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsign=
ed int len)
>   *=09=09=09     or in-kernel IO emulation
>   *
>   * @vcpu: The VCPU pointer
> - * @run:  The VCPU run struct containing the mmio data
>   */
> -int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
>  {
>  =09unsigned long data;
>  =09unsigned int len;
> @@ -92,6 +91,8 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, struc=
t kvm_run *run)
>  =09vcpu->mmio_needed =3D 0;
> =20
>  =09if (!kvm_vcpu_dabt_iswrite(vcpu)) {
> +=09=09struct kvm_run *run =3D vcpu->run;
> +
>  =09=09len =3D kvm_vcpu_dabt_get_as(vcpu);
>  =09=09data =3D kvm_mmio_read_buf(run->mmio.data, len);
> =20
> @@ -119,9 +120,9 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu, str=
uct kvm_run *run)
>  =09return 0;
>  }
> =20
> -int io_mem_abort(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -=09=09 phys_addr_t fault_ipa)
> +int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09unsigned long data;
>  =09unsigned long rt;
>  =09int ret;
> @@ -188,7 +189,7 @@ int io_mem_abort(struct kvm_vcpu *vcpu, struct kvm_ru=
n *run,
>  =09=09if (!is_write)
>  =09=09=09memcpy(run->mmio.data, data_buf, len);
>  =09=09vcpu->stat.mmio_exit_kernel++;
> -=09=09kvm_handle_mmio_return(vcpu, run);
> +=09=09kvm_handle_mmio_return(vcpu);
>  =09=09return 1;
>  =09}
> =20
> diff --git a/virt/kvm/arm/mmu.c b/virt/kvm/arm/mmu.c
> index e3b9ee268823..c5dc58226b5b 100644
> --- a/virt/kvm/arm/mmu.c
> +++ b/virt/kvm/arm/mmu.c
> @@ -1892,7 +1892,6 @@ static void handle_access_fault(struct kvm_vcpu *vc=
pu, phys_addr_t fault_ipa)
>  /**
>   * kvm_handle_guest_abort - handles all 2nd stage aborts
>   * @vcpu:=09the VCPU pointer
> - * @run:=09the kvm_run structure
>   *
>   * Any abort that gets to the host is almost guaranteed to be caused by =
a
>   * missing second stage translation table entry, which can mean that eit=
her the
> @@ -1901,7 +1900,7 @@ static void handle_access_fault(struct kvm_vcpu *vc=
pu, phys_addr_t fault_ipa)
>   * space. The distinction is based on the IPA causing the fault and whet=
her this
>   * memory region has been registered as standard RAM by user space.
>   */
> -int kvm_handle_guest_abort(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  {
>  =09unsigned long fault_status;
>  =09phys_addr_t fault_ipa;
> @@ -1980,7 +1979,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu, s=
truct kvm_run *run)
>  =09=09 * of the page size.
>  =09=09 */
>  =09=09fault_ipa |=3D kvm_vcpu_get_hfar(vcpu) & ((1 << 12) - 1);
> -=09=09ret =3D io_mem_abort(vcpu, run, fault_ipa);
> +=09=09ret =3D io_mem_abort(vcpu, fault_ipa);
>  =09=09goto out_unlock;
>  =09}

Haven't tried to compile this but the change itself looks obviously
correct, so

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

--=20
Vitaly

