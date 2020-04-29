Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838B1BDD60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:20:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BzfR6xjQzDq9p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 23:20:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NwDNO4KD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NwDNO4KD; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByZr30wpzDr7Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:32:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588163552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEG9cr0YudfcKrUhr4UQLp9dWCrNrrfGbJkQs2Sd+qo=;
 b=NwDNO4KD/7dfcIDt7RfKXE6Ao+7gdoO/rTHQF97PT7FZY93uz14Hem7WrVNcTFOS6o2g8G
 Qe+nvu5+KisfISpVGRWsRMOnxPEA0LNYQbxhaY8FpW7v9l8XELhc4R7C5MuLLSVdi1vX4g
 2y5/0r8r33JQ/07Ti72b6FvYT90jD+M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588163552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEG9cr0YudfcKrUhr4UQLp9dWCrNrrfGbJkQs2Sd+qo=;
 b=NwDNO4KD/7dfcIDt7RfKXE6Ao+7gdoO/rTHQF97PT7FZY93uz14Hem7WrVNcTFOS6o2g8G
 Qe+nvu5+KisfISpVGRWsRMOnxPEA0LNYQbxhaY8FpW7v9l8XELhc4R7C5MuLLSVdi1vX4g
 2y5/0r8r33JQ/07Ti72b6FvYT90jD+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-OzlNylR_MP-9uk-KC18vAg-1; Wed, 29 Apr 2020 08:32:29 -0400
X-MC-Unique: OzlNylR_MP-9uk-KC18vAg-1
Received: by mail-wm1-f72.google.com with SMTP id f81so889118wmf.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2r44D5C6Mc91eO4tbsaCQfW6hS0QHZKzFSGTjcJtnkM=;
 b=Jc+9UNp9fxfzziCNfD1OAntNpNxfbUAotHMytuhVh9Uvt4PY10GV2PtqHix7fp6k3g
 05bf/WdO8G96H6/TrAW0dUAImWKwxVEJZXXap3ScQub+v8XjtR/ry9MkyjAXaai/IiTI
 zywnm7KnZ9A3FIJ2hb0h+/33omwJ3GR+XU8U4bnizUpdcUHlW0wuyp80GSkqYsL773gm
 ZQ5wNH9stwdwUpjHuc07FhPKWYbp+ObuTDo3OYhw7o4t/ImSqFEBb1XnVjiShgYWeTal
 9Qk3DQ6Unr465XjIBsh4xh4Yn9R0Zz22uRALu9qOW7FIFR2CmIpvAw2WA22MmRwSefUr
 U65A==
X-Gm-Message-State: AGi0PubNEgEPKHYmTTk7gSpKZ72rbOyRcKJZn3lcFVN0YQX8giphhKaB
 Xu0JGodEJed961vGFTdn9ldi7awgE4u/R1OtHvBtnGLlCrzUdxrj417xqPz38xPyPMT6DMuwkXo
 PrQj4IF4imB3M/9Mb6injWy64TA==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr3255568wmh.59.1588163546629;
 Wed, 29 Apr 2020 05:32:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypIUt2QcUs/ue7eG0c5ey1ZGkYiccmwB7jrvhBdXnEL1WfhOltSQe8aqmvAk+4ZIw/YUMdu6NQ==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr3255375wmh.59.1588163544561;
 Wed, 29 Apr 2020 05:32:24 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id z16sm31272368wrl.0.2020.04.29.05.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:32:23 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v4 4/7] KVM: PPC: clean up redundant 'kvm_run' parameters
In-Reply-To: <20200427043514.16144-5-tianjia.zhang@linux.alibaba.com>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-5-tianjia.zhang@linux.alibaba.com>
Date: Wed, 29 Apr 2020 14:32:21 +0200
Message-ID: <87h7x2h3qi.fsf@vitty.brq.redhat.com>
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
>  arch/powerpc/include/asm/kvm_book3s.h    | 16 +++---
>  arch/powerpc/include/asm/kvm_ppc.h       | 27 +++++----
>  arch/powerpc/kvm/book3s.c                |  4 +-
>  arch/powerpc/kvm/book3s.h                |  2 +-
>  arch/powerpc/kvm/book3s_64_mmu_hv.c      | 12 ++--
>  arch/powerpc/kvm/book3s_64_mmu_radix.c   |  4 +-
>  arch/powerpc/kvm/book3s_emulate.c        | 10 ++--
>  arch/powerpc/kvm/book3s_hv.c             | 60 ++++++++++----------
>  arch/powerpc/kvm/book3s_hv_nested.c      | 11 ++--
>  arch/powerpc/kvm/book3s_paired_singles.c | 72 ++++++++++++------------
>  arch/powerpc/kvm/book3s_pr.c             | 30 +++++-----
>  arch/powerpc/kvm/booke.c                 | 36 ++++++------
>  arch/powerpc/kvm/booke.h                 |  8 +--
>  arch/powerpc/kvm/booke_emulate.c         |  2 +-
>  arch/powerpc/kvm/e500_emulate.c          | 15 +++--
>  arch/powerpc/kvm/emulate.c               | 10 ++--
>  arch/powerpc/kvm/emulate_loadstore.c     | 32 +++++------
>  arch/powerpc/kvm/powerpc.c               | 72 ++++++++++++------------
>  arch/powerpc/kvm/trace_hv.h              |  6 +-
>  19 files changed, 212 insertions(+), 217 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index 506e4df2d730..66dbb1f85d59 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -155,12 +155,11 @@ extern void kvmppc_mmu_unmap_page(struct kvm_vcpu *=
vcpu, struct kvmppc_pte *pte)
>  extern int kvmppc_mmu_map_segment(struct kvm_vcpu *vcpu, ulong eaddr);
>  extern void kvmppc_mmu_flush_segment(struct kvm_vcpu *vcpu, ulong eaddr,=
 ulong seg_size);
>  extern void kvmppc_mmu_flush_segments(struct kvm_vcpu *vcpu);
> -extern int kvmppc_book3s_hv_page_fault(struct kvm_run *run,
> -=09=09=09struct kvm_vcpu *vcpu, unsigned long addr,
> -=09=09=09unsigned long status);
> +extern int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
> +=09=09=09unsigned long addr, unsigned long status);
>  extern long kvmppc_hv_find_lock_hpte(struct kvm *kvm, gva_t eaddr,
>  =09=09=09unsigned long slb_v, unsigned long valid);
> -extern int kvmppc_hv_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *=
vcpu,
> +extern int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
>  =09=09=09unsigned long gpa, gva_t ea, int is_store);
> =20
>  extern void kvmppc_mmu_hpte_cache_map(struct kvm_vcpu *vcpu, struct hpte=
_cache *pte);
> @@ -174,8 +173,7 @@ extern void kvmppc_mmu_hpte_sysexit(void);
>  extern int kvmppc_mmu_hv_init(void);
>  extern int kvmppc_book3s_hcall_implemented(struct kvm *kvm, unsigned lon=
g hc);
> =20
> -extern int kvmppc_book3s_radix_page_fault(struct kvm_run *run,
> -=09=09=09struct kvm_vcpu *vcpu,
> +extern int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
>  =09=09=09unsigned long ea, unsigned long dsisr);
>  extern unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
>  =09=09=09=09=09gva_t eaddr, void *to, void *from,
> @@ -234,7 +232,7 @@ extern void kvmppc_trigger_fac_interrupt(struct kvm_v=
cpu *vcpu, ulong fac);
>  extern void kvmppc_set_bat(struct kvm_vcpu *vcpu, struct kvmppc_bat *bat=
,
>  =09=09=09   bool upper, u32 val);
>  extern void kvmppc_giveup_ext(struct kvm_vcpu *vcpu, ulong msr);
> -extern int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_=
vcpu *vcpu);
> +extern int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu);
>  extern kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa,
>  =09=09=09bool writing, bool *writable);
>  extern void kvmppc_add_revmap_chain(struct kvm *kvm, struct revmap_entry=
 *rev,
> @@ -300,12 +298,12 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw=
0, u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>  long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
> -int kvmhv_run_single_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu=
,
> +int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
>  =09=09=09  u64 time_limit, unsigned long lpcr);
>  void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr=
);
>  void kvmhv_restore_hv_return_state(struct kvm_vcpu *vcpu,
>  =09=09=09=09   struct hv_guest_state *hr);
> -long int kvmhv_nested_page_fault(struct kvm_run *run, struct kvm_vcpu *v=
cpu);
> +long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu);
> =20
>  void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac);
> =20
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index 94f5a32acaf1..ccf66b3a4c1d 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -58,28 +58,28 @@ enum xlate_readwrite {
>  =09XLATE_WRITE=09=09/* check for write permissions */
>  };
> =20
> -extern int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcp=
u);
> -extern int __kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *v=
cpu);
> +extern int kvmppc_vcpu_run(struct kvm_vcpu *vcpu);
> +extern int __kvmppc_vcpu_run(struct kvm_run *run, struct kvm_vcpu *vcpu)=
;
>  extern void kvmppc_handler_highmem(void);
> =20
>  extern void kvmppc_dump_vcpu(struct kvm_vcpu *vcpu);
> -extern int kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu=
,
> +extern int kvmppc_handle_load(struct kvm_vcpu *vcpu,
>                                unsigned int rt, unsigned int bytes,
>  =09=09=09      int is_default_endian);
> -extern int kvmppc_handle_loads(struct kvm_run *run, struct kvm_vcpu *vcp=
u,
> +extern int kvmppc_handle_loads(struct kvm_vcpu *vcpu,
>                                 unsigned int rt, unsigned int bytes,
>  =09=09=09       int is_default_endian);
> -extern int kvmppc_handle_vsx_load(struct kvm_run *run, struct kvm_vcpu *=
vcpu,
> +extern int kvmppc_handle_vsx_load(struct kvm_vcpu *vcpu,
>  =09=09=09=09unsigned int rt, unsigned int bytes,
>  =09=09=09int is_default_endian, int mmio_sign_extend);
> -extern int kvmppc_handle_vmx_load(struct kvm_run *run, struct kvm_vcpu *=
vcpu,
> +extern int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
>  =09=09unsigned int rt, unsigned int bytes, int is_default_endian);
> -extern int kvmppc_handle_vmx_store(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +extern int kvmppc_handle_vmx_store(struct kvm_vcpu *vcpu,
>  =09=09unsigned int rs, unsigned int bytes, int is_default_endian);
> -extern int kvmppc_handle_store(struct kvm_run *run, struct kvm_vcpu *vcp=
u,
> +extern int kvmppc_handle_store(struct kvm_vcpu *vcpu,
>  =09=09=09       u64 val, unsigned int bytes,
>  =09=09=09       int is_default_endian);
> -extern int kvmppc_handle_vsx_store(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +extern int kvmppc_handle_vsx_store(struct kvm_vcpu *vcpu,
>  =09=09=09=09int rs, unsigned int bytes,
>  =09=09=09=09int is_default_endian);
> =20
> @@ -90,10 +90,9 @@ extern int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *ead=
dr, int size, void *ptr,
>  =09=09     bool data);
>  extern int kvmppc_st(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void=
 *ptr,
>  =09=09     bool data);
> -extern int kvmppc_emulate_instruction(struct kvm_run *run,
> -                                      struct kvm_vcpu *vcpu);
> +extern int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu);
>  extern int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu);
> -extern int kvmppc_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcp=
u);
> +extern int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu);
>  extern void kvmppc_emulate_dec(struct kvm_vcpu *vcpu);
>  extern u32 kvmppc_get_dec(struct kvm_vcpu *vcpu, u64 tb);
>  extern void kvmppc_decrementer_func(struct kvm_vcpu *vcpu);
> @@ -267,7 +266,7 @@ struct kvmppc_ops {
>  =09void (*vcpu_put)(struct kvm_vcpu *vcpu);
>  =09void (*inject_interrupt)(struct kvm_vcpu *vcpu, int vec, u64 srr1_fla=
gs);
>  =09void (*set_msr)(struct kvm_vcpu *vcpu, u64 msr);
> -=09int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
> +=09int (*vcpu_run)(struct kvm_vcpu *vcpu);
>  =09int (*vcpu_create)(struct kvm_vcpu *vcpu);
>  =09void (*vcpu_free)(struct kvm_vcpu *vcpu);
>  =09int (*check_requests)(struct kvm_vcpu *vcpu);
> @@ -291,7 +290,7 @@ struct kvmppc_ops {
>  =09int (*init_vm)(struct kvm *kvm);
>  =09void (*destroy_vm)(struct kvm *kvm);
>  =09int (*get_smmu_info)(struct kvm *kvm, struct kvm_ppc_smmu_info *info)=
;
> -=09int (*emulate_op)(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +=09int (*emulate_op)(struct kvm_vcpu *vcpu,
>  =09=09=09  unsigned int inst, int *advance);
>  =09int (*emulate_mtspr)(struct kvm_vcpu *vcpu, int sprn, ulong spr_val);
>  =09int (*emulate_mfspr)(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val)=
;
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 5690a1f9b976..345d22de213b 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -758,9 +758,9 @@ void kvmppc_set_msr(struct kvm_vcpu *vcpu, u64 msr)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_set_msr);
> =20
> -int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
> +int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
>  {
> -=09return vcpu->kvm->arch.kvm_ops->vcpu_run(kvm_run, vcpu);
> +=09return vcpu->kvm->arch.kvm_ops->vcpu_run(vcpu);
>  }
> =20
>  int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
> diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
> index eae259ee49af..9b6323ec8e60 100644
> --- a/arch/powerpc/kvm/book3s.h
> +++ b/arch/powerpc/kvm/book3s.h
> @@ -18,7 +18,7 @@ extern void kvm_set_spte_hva_hv(struct kvm *kvm, unsign=
ed long hva, pte_t pte);
> =20
>  extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
>  extern void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu);
> -extern int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcp=
u *vcpu,
> +extern int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
>  =09=09=09=09     unsigned int inst, int *advance);
>  extern int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu,
>  =09=09=09=09=09int sprn, ulong spr_val);
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3=
s_64_mmu_hv.c
> index 2b35f9bcf892..36a07656ebbb 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -413,7 +413,7 @@ static int instruction_is_store(unsigned int instr)
>  =09return (instr & mask) !=3D 0;
>  }
> =20
> -int kvmppc_hv_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_hv_emulate_mmio(struct kvm_vcpu *vcpu,
>  =09=09=09   unsigned long gpa, gva_t ea, int is_store)
>  {
>  =09u32 last_inst;
> @@ -473,10 +473,10 @@ int kvmppc_hv_emulate_mmio(struct kvm_run *run, str=
uct kvm_vcpu *vcpu,
> =20
>  =09vcpu->arch.paddr_accessed =3D gpa;
>  =09vcpu->arch.vaddr_accessed =3D ea;
> -=09return kvmppc_emulate_mmio(run, vcpu);
> +=09return kvmppc_emulate_mmio(vcpu);
>  }
> =20
> -int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vc=
pu,
> +int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
>  =09=09=09=09unsigned long ea, unsigned long dsisr)
>  {
>  =09struct kvm *kvm =3D vcpu->kvm;
> @@ -499,7 +499,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09pte_t pte, *ptep;
> =20
>  =09if (kvm_is_radix(kvm))
> -=09=09return kvmppc_book3s_radix_page_fault(run, vcpu, ea, dsisr);
> +=09=09return kvmppc_book3s_radix_page_fault(vcpu, ea, dsisr);
> =20
>  =09/*
>  =09 * Real-mode code has already searched the HPT and found the
> @@ -519,7 +519,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09=09=09gpa_base =3D r & HPTE_R_RPN & ~(psize - 1);
>  =09=09=09gfn_base =3D gpa_base >> PAGE_SHIFT;
>  =09=09=09gpa =3D gpa_base | (ea & (psize - 1));
> -=09=09=09return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea,
> +=09=09=09return kvmppc_hv_emulate_mmio(vcpu, gpa, ea,
>  =09=09=09=09=09=09dsisr & DSISR_ISSTORE);
>  =09=09}
>  =09}
> @@ -555,7 +555,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
> =20
>  =09/* No memslot means it's an emulated MMIO region */
>  =09if (!memslot || (memslot->flags & KVM_MEMSLOT_INVALID))
> -=09=09return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea,
> +=09=09return kvmppc_hv_emulate_mmio(vcpu, gpa, ea,
>  =09=09=09=09=09      dsisr & DSISR_ISSTORE);
> =20
>  =09/*
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index aa12cd4078b3..16c947bd5e87 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -887,7 +887,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *v=
cpu,
>  =09return ret;
>  }
> =20
> -int kvmppc_book3s_radix_page_fault(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
>  =09=09=09=09   unsigned long ea, unsigned long dsisr)
>  {
>  =09struct kvm *kvm =3D vcpu->kvm;
> @@ -933,7 +933,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09=09=09kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
>  =09=09=09return RESUME_GUEST;
>  =09=09}
> -=09=09return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea, writing);
> +=09=09return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
>  =09}
> =20
>  =09if (memslot->flags & KVM_MEM_READONLY) {
> diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_=
emulate.c
> index dad71d276b91..0effd48c8f4d 100644
> --- a/arch/powerpc/kvm/book3s_emulate.c
> +++ b/arch/powerpc/kvm/book3s_emulate.c
> @@ -235,7 +235,7 @@ void kvmppc_emulate_tabort(struct kvm_vcpu *vcpu, int=
 ra_val)
> =20
>  #endif
> =20
> -int kvmppc_core_emulate_op_pr(struct kvm_run *run, struct kvm_vcpu *vcpu=
,
> +int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
>  =09=09=09      unsigned int inst, int *advance)
>  {
>  =09int emulated =3D EMULATE_DONE;
> @@ -371,13 +371,13 @@ int kvmppc_core_emulate_op_pr(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09=09=09if (kvmppc_h_pr(vcpu, cmd) =3D=3D EMULATE_DONE)
>  =09=09=09=09break;
> =20
> -=09=09=09run->papr_hcall.nr =3D cmd;
> +=09=09=09vcpu->run->papr_hcall.nr =3D cmd;
>  =09=09=09for (i =3D 0; i < 9; ++i) {
>  =09=09=09=09ulong gpr =3D kvmppc_get_gpr(vcpu, 4 + i);
> -=09=09=09=09run->papr_hcall.args[i] =3D gpr;
> +=09=09=09=09vcpu->run->papr_hcall.args[i] =3D gpr;
>  =09=09=09}
> =20
> -=09=09=09run->exit_reason =3D KVM_EXIT_PAPR_HCALL;
> +=09=09=09vcpu->run->exit_reason =3D KVM_EXIT_PAPR_HCALL;
>  =09=09=09vcpu->arch.hcall_needed =3D 1;
>  =09=09=09emulated =3D EMULATE_EXIT_USER;
>  =09=09=09break;
> @@ -629,7 +629,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_run *run, st=
ruct kvm_vcpu *vcpu,
>  =09}
> =20
>  =09if (emulated =3D=3D EMULATE_FAIL)
> -=09=09emulated =3D kvmppc_emulate_paired_single(run, vcpu);
> +=09=09emulated =3D kvmppc_emulate_paired_single(vcpu);
> =20
>  =09return emulated;
>  }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 413ea2dcb10c..296bc6fb4eb1 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1156,8 +1156,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
>  =09return kvmppc_hcall_impl_hv_realmode(cmd);
>  }
> =20
> -static int kvmppc_emulate_debug_inst(struct kvm_run *run,
> -=09=09=09=09=09struct kvm_vcpu *vcpu)
> +static int kvmppc_emulate_debug_inst(struct kvm_vcpu *vcpu)
>  {
>  =09u32 last_inst;
> =20
> @@ -1171,8 +1170,8 @@ static int kvmppc_emulate_debug_inst(struct kvm_run=
 *run,
>  =09}
> =20
>  =09if (last_inst =3D=3D KVMPPC_INST_SW_BREAKPOINT) {
> -=09=09run->exit_reason =3D KVM_EXIT_DEBUG;
> -=09=09run->debug.arch.address =3D kvmppc_get_pc(vcpu);
> +=09=09vcpu->run->exit_reason =3D KVM_EXIT_DEBUG;
> +=09=09vcpu->run->debug.arch.address =3D kvmppc_get_pc(vcpu);
>  =09=09return RESUME_HOST;
>  =09} else {
>  =09=09kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
> @@ -1273,9 +1272,10 @@ static int kvmppc_emulate_doorbell_instr(struct kv=
m_vcpu *vcpu)
>  =09return RESUME_GUEST;
>  }
> =20
> -static int kvmppc_handle_exit_hv(struct kvm_run *run, struct kvm_vcpu *v=
cpu,
> +static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  =09=09=09=09 struct task_struct *tsk)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int r =3D RESUME_HOST;
> =20
>  =09vcpu->stat.sum_exits++;
> @@ -1410,7 +1410,7 @@ static int kvmppc_handle_exit_hv(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09=09=09=09swab32(vcpu->arch.emul_inst) :
>  =09=09=09=09vcpu->arch.emul_inst;
>  =09=09if (vcpu->guest_debug & KVM_GUESTDBG_USE_SW_BP) {
> -=09=09=09r =3D kvmppc_emulate_debug_inst(run, vcpu);
> +=09=09=09r =3D kvmppc_emulate_debug_inst(vcpu);
>  =09=09} else {
>  =09=09=09kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
>  =09=09=09r =3D RESUME_GUEST;
> @@ -1462,7 +1462,7 @@ static int kvmppc_handle_exit_hv(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09return r;
>  }
> =20
> -static int kvmppc_handle_nested_exit(struct kvm_run *run, struct kvm_vcp=
u *vcpu)
> +static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
>  {
>  =09int r;
>  =09int srcu_idx;
> @@ -1520,7 +1520,7 @@ static int kvmppc_handle_nested_exit(struct kvm_run=
 *run, struct kvm_vcpu *vcpu)
>  =09 */
>  =09case BOOK3S_INTERRUPT_H_DATA_STORAGE:
>  =09=09srcu_idx =3D srcu_read_lock(&vcpu->kvm->srcu);
> -=09=09r =3D kvmhv_nested_page_fault(run, vcpu);
> +=09=09r =3D kvmhv_nested_page_fault(vcpu);
>  =09=09srcu_read_unlock(&vcpu->kvm->srcu, srcu_idx);
>  =09=09break;
>  =09case BOOK3S_INTERRUPT_H_INST_STORAGE:
> @@ -1530,7 +1530,7 @@ static int kvmppc_handle_nested_exit(struct kvm_run=
 *run, struct kvm_vcpu *vcpu)
>  =09=09if (vcpu->arch.shregs.msr & HSRR1_HISI_WRITE)
>  =09=09=09vcpu->arch.fault_dsisr |=3D DSISR_ISSTORE;
>  =09=09srcu_idx =3D srcu_read_lock(&vcpu->kvm->srcu);
> -=09=09r =3D kvmhv_nested_page_fault(run, vcpu);
> +=09=09r =3D kvmhv_nested_page_fault(vcpu);
>  =09=09srcu_read_unlock(&vcpu->kvm->srcu, srcu_idx);
>  =09=09break;
> =20
> @@ -2934,7 +2934,7 @@ static void post_guest_process(struct kvmppc_vcore =
*vc, bool is_master)
> =20
>  =09=09ret =3D RESUME_GUEST;
>  =09=09if (vcpu->arch.trap)
> -=09=09=09ret =3D kvmppc_handle_exit_hv(vcpu->run, vcpu,
> +=09=09=09ret =3D kvmppc_handle_exit_hv(vcpu,
>  =09=09=09=09=09=09    vcpu->arch.run_task);
> =20
>  =09=09vcpu->arch.ret =3D ret;
> @@ -3900,15 +3900,16 @@ static int kvmhv_setup_mmu(struct kvm_vcpu *vcpu)
>  =09return r;
>  }
> =20
> -static int kvmppc_run_vcpu(struct kvm_run *kvm_run, struct kvm_vcpu *vcp=
u)
> +static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int n_ceded, i, r;
>  =09struct kvmppc_vcore *vc;
>  =09struct kvm_vcpu *v;
> =20
>  =09trace_kvmppc_run_vcpu_enter(vcpu);
> =20
> -=09kvm_run->exit_reason =3D 0;
> +=09run->exit_reason =3D 0;
>  =09vcpu->arch.ret =3D RESUME_GUEST;
>  =09vcpu->arch.trap =3D 0;
>  =09kvmppc_update_vpas(vcpu);
> @@ -3952,8 +3953,8 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run,=
 struct kvm_vcpu *vcpu)
>  =09=09=09r =3D kvmhv_setup_mmu(vcpu);
>  =09=09=09spin_lock(&vc->lock);
>  =09=09=09if (r) {
> -=09=09=09=09kvm_run->exit_reason =3D KVM_EXIT_FAIL_ENTRY;
> -=09=09=09=09kvm_run->fail_entry.
> +=09=09=09=09run->exit_reason =3D KVM_EXIT_FAIL_ENTRY;
> +=09=09=09=09run->fail_entry.
>  =09=09=09=09=09hardware_entry_failure_reason =3D 0;
>  =09=09=09=09vcpu->arch.ret =3D r;
>  =09=09=09=09break;
> @@ -4013,7 +4014,7 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run,=
 struct kvm_vcpu *vcpu)
>  =09if (vcpu->arch.state =3D=3D KVMPPC_VCPU_RUNNABLE) {
>  =09=09kvmppc_remove_runnable(vc, vcpu);
>  =09=09vcpu->stat.signal_exits++;
> -=09=09kvm_run->exit_reason =3D KVM_EXIT_INTR;
> +=09=09run->exit_reason =3D KVM_EXIT_INTR;
>  =09=09vcpu->arch.ret =3D -EINTR;
>  =09}
> =20
> @@ -4024,15 +4025,15 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_ru=
n, struct kvm_vcpu *vcpu)
>  =09=09wake_up(&v->arch.cpu_run);
>  =09}
> =20
> -=09trace_kvmppc_run_vcpu_exit(vcpu, kvm_run);
> +=09trace_kvmppc_run_vcpu_exit(vcpu);
>  =09spin_unlock(&vc->lock);
>  =09return vcpu->arch.ret;
>  }
> =20
> -int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
> -=09=09=09  struct kvm_vcpu *vcpu, u64 time_limit,
> +int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  =09=09=09  unsigned long lpcr)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int trap, r, pcpu;
>  =09int srcu_idx, lpid;
>  =09struct kvmppc_vcore *vc;
> @@ -4041,7 +4042,7 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
> =20
>  =09trace_kvmppc_run_vcpu_enter(vcpu);
> =20
> -=09kvm_run->exit_reason =3D 0;
> +=09run->exit_reason =3D 0;
>  =09vcpu->arch.ret =3D RESUME_GUEST;
>  =09vcpu->arch.trap =3D 0;
> =20
> @@ -4165,9 +4166,9 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
>  =09r =3D RESUME_GUEST;
>  =09if (trap) {
>  =09=09if (!nested)
> -=09=09=09r =3D kvmppc_handle_exit_hv(kvm_run, vcpu, current);
> +=09=09=09r =3D kvmppc_handle_exit_hv(vcpu, current);
>  =09=09else
> -=09=09=09r =3D kvmppc_handle_nested_exit(kvm_run, vcpu);
> +=09=09=09r =3D kvmppc_handle_nested_exit(vcpu);
>  =09}
>  =09vcpu->arch.ret =3D r;
> =20
> @@ -4177,7 +4178,7 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
>  =09=09while (vcpu->arch.ceded && !kvmppc_vcpu_woken(vcpu)) {
>  =09=09=09if (signal_pending(current)) {
>  =09=09=09=09vcpu->stat.signal_exits++;
> -=09=09=09=09kvm_run->exit_reason =3D KVM_EXIT_INTR;
> +=09=09=09=09run->exit_reason =3D KVM_EXIT_INTR;
>  =09=09=09=09vcpu->arch.ret =3D -EINTR;
>  =09=09=09=09break;
>  =09=09=09}
> @@ -4193,13 +4194,13 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run=
,
> =20
>   done:
>  =09kvmppc_remove_runnable(vc, vcpu);
> -=09trace_kvmppc_run_vcpu_exit(vcpu, kvm_run);
> +=09trace_kvmppc_run_vcpu_exit(vcpu);
> =20
>  =09return vcpu->arch.ret;
> =20
>   sigpend:
>  =09vcpu->stat.signal_exits++;
> -=09kvm_run->exit_reason =3D KVM_EXIT_INTR;
> +=09run->exit_reason =3D KVM_EXIT_INTR;
>  =09vcpu->arch.ret =3D -EINTR;
>   out:
>  =09local_irq_enable();
> @@ -4207,8 +4208,9 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
>  =09goto done;
>  }
> =20
> -static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu=
)
> +static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int r;
>  =09int srcu_idx;
>  =09unsigned long ebb_regs[3] =3D {};=09/* shut up GCC */
> @@ -4292,10 +4294,10 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run=
, struct kvm_vcpu *vcpu)
>  =09=09 */
>  =09=09if (kvm->arch.threads_indep && kvm_is_radix(kvm) &&
>  =09=09    !no_mixing_hpt_and_radix)
> -=09=09=09r =3D kvmhv_run_single_vcpu(run, vcpu, ~(u64)0,
> +=09=09=09r =3D kvmhv_run_single_vcpu(vcpu, ~(u64)0,
>  =09=09=09=09=09=09  vcpu->arch.vcore->lpcr);
>  =09=09else
> -=09=09=09r =3D kvmppc_run_vcpu(run, vcpu);
> +=09=09=09r =3D kvmppc_run_vcpu(vcpu);
> =20
>  =09=09if (run->exit_reason =3D=3D KVM_EXIT_PAPR_HCALL &&
>  =09=09    !(vcpu->arch.shregs.msr & MSR_PR)) {
> @@ -4305,7 +4307,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, =
struct kvm_vcpu *vcpu)
>  =09=09=09kvmppc_core_prepare_to_enter(vcpu);
>  =09=09} else if (r =3D=3D RESUME_PAGE_FAULT) {
>  =09=09=09srcu_idx =3D srcu_read_lock(&kvm->srcu);
> -=09=09=09r =3D kvmppc_book3s_hv_page_fault(run, vcpu,
> +=09=09=09r =3D kvmppc_book3s_hv_page_fault(vcpu,
>  =09=09=09=09vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
>  =09=09=09srcu_read_unlock(&kvm->srcu, srcu_idx);
>  =09=09} else if (r =3D=3D RESUME_PASSTHROUGH) {
> @@ -4979,7 +4981,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *k=
vm)
>  }
> =20
>  /* We don't need to emulate any privileged instructions or dcbz */
> -static int kvmppc_core_emulate_op_hv(struct kvm_run *run, struct kvm_vcp=
u *vcpu,
> +static int kvmppc_core_emulate_op_hv(struct kvm_vcpu *vcpu,
>  =09=09=09=09     unsigned int inst, int *advance)
>  {
>  =09return EMULATE_FAIL;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 5a3987f3ebf3..fe4c535882e6 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -290,7 +290,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  =09=09=09r =3D RESUME_HOST;
>  =09=09=09break;
>  =09=09}
> -=09=09r =3D kvmhv_run_single_vcpu(vcpu->run, vcpu, hdec_exp, lpcr);
> +=09=09r =3D kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
>  =09} while (is_kvmppc_resume_guest(r));
> =20
>  =09/* save L2 state for return */
> @@ -1256,8 +1256,7 @@ static inline int kvmppc_radix_shift_to_level(int s=
hift)
>  }
> =20
>  /* called with gp->tlb_lock held */
> -static long int __kvmhv_nested_page_fault(struct kvm_run *run,
> -=09=09=09=09=09  struct kvm_vcpu *vcpu,
> +static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
>  =09=09=09=09=09  struct kvm_nested_guest *gp)
>  {
>  =09struct kvm *kvm =3D vcpu->kvm;
> @@ -1340,7 +1339,7 @@ static long int __kvmhv_nested_page_fault(struct kv=
m_run *run,
>  =09=09}
> =20
>  =09=09/* passthrough of emulated MMIO case */
> -=09=09return kvmppc_hv_emulate_mmio(run, vcpu, gpa, ea, writing);
> +=09=09return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
>  =09}
>  =09if (memslot->flags & KVM_MEM_READONLY) {
>  =09=09if (writing) {
> @@ -1427,13 +1426,13 @@ static long int __kvmhv_nested_page_fault(struct =
kvm_run *run,
>  =09return RESUME_GUEST;
>  }
> =20
> -long int kvmhv_nested_page_fault(struct kvm_run *run, struct kvm_vcpu *v=
cpu)
> +long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu)
>  {
>  =09struct kvm_nested_guest *gp =3D vcpu->arch.nested;
>  =09long int ret;
> =20
>  =09mutex_lock(&gp->tlb_lock);
> -=09ret =3D __kvmhv_nested_page_fault(run, vcpu, gp);
> +=09ret =3D __kvmhv_nested_page_fault(vcpu, gp);
>  =09mutex_unlock(&gp->tlb_lock);
>  =09return ret;
>  }
> diff --git a/arch/powerpc/kvm/book3s_paired_singles.c b/arch/powerpc/kvm/=
book3s_paired_singles.c
> index bf0282775e37..a11436720a8c 100644
> --- a/arch/powerpc/kvm/book3s_paired_singles.c
> +++ b/arch/powerpc/kvm/book3s_paired_singles.c
> @@ -169,7 +169,7 @@ static void kvmppc_inject_pf(struct kvm_vcpu *vcpu, u=
long eaddr, bool is_store)
>  =09kvmppc_book3s_queue_irqprio(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE);
>  }
> =20
> -static int kvmppc_emulate_fpr_load(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +static int kvmppc_emulate_fpr_load(struct kvm_vcpu *vcpu,
>  =09=09=09=09   int rs, ulong addr, int ls_type)
>  {
>  =09int emulated =3D EMULATE_FAIL;
> @@ -188,7 +188,7 @@ static int kvmppc_emulate_fpr_load(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09=09kvmppc_inject_pf(vcpu, addr, false);
>  =09=09goto done_load;
>  =09} else if (r =3D=3D EMULATE_DO_MMIO) {
> -=09=09emulated =3D kvmppc_handle_load(run, vcpu, KVM_MMIO_REG_FPR | rs,
> +=09=09emulated =3D kvmppc_handle_load(vcpu, KVM_MMIO_REG_FPR | rs,
>  =09=09=09=09=09      len, 1);
>  =09=09goto done_load;
>  =09}
> @@ -213,7 +213,7 @@ static int kvmppc_emulate_fpr_load(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09return emulated;
>  }
> =20
> -static int kvmppc_emulate_fpr_store(struct kvm_run *run, struct kvm_vcpu=
 *vcpu,
> +static int kvmppc_emulate_fpr_store(struct kvm_vcpu *vcpu,
>  =09=09=09=09    int rs, ulong addr, int ls_type)
>  {
>  =09int emulated =3D EMULATE_FAIL;
> @@ -248,7 +248,7 @@ static int kvmppc_emulate_fpr_store(struct kvm_run *r=
un, struct kvm_vcpu *vcpu,
>  =09if (r < 0) {
>  =09=09kvmppc_inject_pf(vcpu, addr, true);
>  =09} else if (r =3D=3D EMULATE_DO_MMIO) {
> -=09=09emulated =3D kvmppc_handle_store(run, vcpu, val, len, 1);
> +=09=09emulated =3D kvmppc_handle_store(vcpu, val, len, 1);
>  =09} else {
>  =09=09emulated =3D EMULATE_DONE;
>  =09}
> @@ -259,7 +259,7 @@ static int kvmppc_emulate_fpr_store(struct kvm_run *r=
un, struct kvm_vcpu *vcpu,
>  =09return emulated;
>  }
> =20
> -static int kvmppc_emulate_psq_load(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +static int kvmppc_emulate_psq_load(struct kvm_vcpu *vcpu,
>  =09=09=09=09   int rs, ulong addr, bool w, int i)
>  {
>  =09int emulated =3D EMULATE_FAIL;
> @@ -279,12 +279,12 @@ static int kvmppc_emulate_psq_load(struct kvm_run *=
run, struct kvm_vcpu *vcpu,
>  =09=09kvmppc_inject_pf(vcpu, addr, false);
>  =09=09goto done_load;
>  =09} else if ((r =3D=3D EMULATE_DO_MMIO) && w) {
> -=09=09emulated =3D kvmppc_handle_load(run, vcpu, KVM_MMIO_REG_FPR | rs,
> +=09=09emulated =3D kvmppc_handle_load(vcpu, KVM_MMIO_REG_FPR | rs,
>  =09=09=09=09=09      4, 1);
>  =09=09vcpu->arch.qpr[rs] =3D tmp[1];
>  =09=09goto done_load;
>  =09} else if (r =3D=3D EMULATE_DO_MMIO) {
> -=09=09emulated =3D kvmppc_handle_load(run, vcpu, KVM_MMIO_REG_FQPR | rs,
> +=09=09emulated =3D kvmppc_handle_load(vcpu, KVM_MMIO_REG_FQPR | rs,
>  =09=09=09=09=09      8, 1);
>  =09=09goto done_load;
>  =09}
> @@ -302,7 +302,7 @@ static int kvmppc_emulate_psq_load(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09return emulated;
>  }
> =20
> -static int kvmppc_emulate_psq_store(struct kvm_run *run, struct kvm_vcpu=
 *vcpu,
> +static int kvmppc_emulate_psq_store(struct kvm_vcpu *vcpu,
>  =09=09=09=09    int rs, ulong addr, bool w, int i)
>  {
>  =09int emulated =3D EMULATE_FAIL;
> @@ -318,10 +318,10 @@ static int kvmppc_emulate_psq_store(struct kvm_run =
*run, struct kvm_vcpu *vcpu,
>  =09if (r < 0) {
>  =09=09kvmppc_inject_pf(vcpu, addr, true);
>  =09} else if ((r =3D=3D EMULATE_DO_MMIO) && w) {
> -=09=09emulated =3D kvmppc_handle_store(run, vcpu, tmp[0], 4, 1);
> +=09=09emulated =3D kvmppc_handle_store(vcpu, tmp[0], 4, 1);
>  =09} else if (r =3D=3D EMULATE_DO_MMIO) {
>  =09=09u64 val =3D ((u64)tmp[0] << 32) | tmp[1];
> -=09=09emulated =3D kvmppc_handle_store(run, vcpu, val, 8, 1);
> +=09=09emulated =3D kvmppc_handle_store(vcpu, val, 8, 1);
>  =09} else {
>  =09=09emulated =3D EMULATE_DONE;
>  =09}
> @@ -618,7 +618,7 @@ static int kvmppc_ps_one_in(struct kvm_vcpu *vcpu, bo=
ol rc,
>  =09return EMULATE_DONE;
>  }
> =20
> -int kvmppc_emulate_paired_single(struct kvm_run *run, struct kvm_vcpu *v=
cpu)
> +int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu)
>  {
>  =09u32 inst;
>  =09enum emulation_result emulated =3D EMULATE_DONE;
> @@ -680,7 +680,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09int i =3D inst_get_field(inst, 17, 19);
> =20
>  =09=09addr +=3D get_d_signext(inst);
> -=09=09emulated =3D kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w, i)=
;
> +=09=09emulated =3D kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
>  =09=09break;
>  =09}
>  =09case OP_PSQ_LU:
> @@ -690,7 +690,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09int i =3D inst_get_field(inst, 17, 19);
> =20
>  =09=09addr +=3D get_d_signext(inst);
> -=09=09emulated =3D kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w, i)=
;
> +=09=09emulated =3D kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
> =20
>  =09=09if (emulated =3D=3D EMULATE_DONE)
>  =09=09=09kvmppc_set_gpr(vcpu, ax_ra, addr);
> @@ -703,7 +703,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09int i =3D inst_get_field(inst, 17, 19);
> =20
>  =09=09addr +=3D get_d_signext(inst);
> -=09=09emulated =3D kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w, i=
);
> +=09=09emulated =3D kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
>  =09=09break;
>  =09}
>  =09case OP_PSQ_STU:
> @@ -713,7 +713,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09int i =3D inst_get_field(inst, 17, 19);
> =20
>  =09=09addr +=3D get_d_signext(inst);
> -=09=09emulated =3D kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w, i=
);
> +=09=09emulated =3D kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
> =20
>  =09=09if (emulated =3D=3D EMULATE_DONE)
>  =09=09=09kvmppc_set_gpr(vcpu, ax_ra, addr);
> @@ -733,7 +733,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09=09int i =3D inst_get_field(inst, 22, 24);
> =20
>  =09=09=09addr +=3D kvmppc_get_gpr(vcpu, ax_rb);
> -=09=09=09emulated =3D kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w,=
 i);
> +=09=09=09emulated =3D kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
>  =09=09=09break;
>  =09=09}
>  =09=09case OP_4X_PS_CMPO0:
> @@ -747,7 +747,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09=09int i =3D inst_get_field(inst, 22, 24);
> =20
>  =09=09=09addr +=3D kvmppc_get_gpr(vcpu, ax_rb);
> -=09=09=09emulated =3D kvmppc_emulate_psq_load(run, vcpu, ax_rd, addr, w,=
 i);
> +=09=09=09emulated =3D kvmppc_emulate_psq_load(vcpu, ax_rd, addr, w, i);
> =20
>  =09=09=09if (emulated =3D=3D EMULATE_DONE)
>  =09=09=09=09kvmppc_set_gpr(vcpu, ax_ra, addr);
> @@ -824,7 +824,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09=09int i =3D inst_get_field(inst, 22, 24);
> =20
>  =09=09=09addr +=3D kvmppc_get_gpr(vcpu, ax_rb);
> -=09=09=09emulated =3D kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w=
, i);
> +=09=09=09emulated =3D kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
>  =09=09=09break;
>  =09=09}
>  =09=09case OP_4XW_PSQ_STUX:
> @@ -834,7 +834,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09=09=09int i =3D inst_get_field(inst, 22, 24);
> =20
>  =09=09=09addr +=3D kvmppc_get_gpr(vcpu, ax_rb);
> -=09=09=09emulated =3D kvmppc_emulate_psq_store(run, vcpu, ax_rd, addr, w=
, i);
> +=09=09=09emulated =3D kvmppc_emulate_psq_store(vcpu, ax_rd, addr, w, i);
> =20
>  =09=09=09if (emulated =3D=3D EMULATE_DONE)
>  =09=09=09=09kvmppc_set_gpr(vcpu, ax_ra, addr);
> @@ -922,7 +922,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09   FPU_LS_SINGLE);
>  =09=09break;
>  =09}
> @@ -930,7 +930,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09   FPU_LS_SINGLE);
> =20
>  =09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -941,7 +941,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09   FPU_LS_DOUBLE);
>  =09=09break;
>  =09}
> @@ -949,7 +949,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09   FPU_LS_DOUBLE);
> =20
>  =09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -960,7 +960,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09    FPU_LS_SINGLE);
>  =09=09break;
>  =09}
> @@ -968,7 +968,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09    FPU_LS_SINGLE);
> =20
>  =09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -979,7 +979,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09    FPU_LS_DOUBLE);
>  =09=09break;
>  =09}
> @@ -987,7 +987,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *run,=
 struct kvm_vcpu *vcpu)
>  =09{
>  =09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) + full_d;
> =20
> -=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd, addr,
> +=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd, addr,
>  =09=09=09=09=09=09    FPU_LS_DOUBLE);
> =20
>  =09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -1001,7 +1001,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0;
> =20
>  =09=09=09addr +=3D kvmppc_get_gpr(vcpu, ax_rb);
> -=09=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd,
>  =09=09=09=09=09=09=09   addr, FPU_LS_SINGLE);
>  =09=09=09break;
>  =09=09}
> @@ -1010,7 +1010,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd,
>  =09=09=09=09=09=09=09   addr, FPU_LS_SINGLE);
> =20
>  =09=09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -1022,7 +1022,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd,
>  =09=09=09=09=09=09=09   addr, FPU_LS_DOUBLE);
>  =09=09=09break;
>  =09=09}
> @@ -1031,7 +1031,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_load(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_load(vcpu, ax_rd,
>  =09=09=09=09=09=09=09   addr, FPU_LS_DOUBLE);
> =20
>  =09=09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -1043,7 +1043,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd,
>  =09=09=09=09=09=09=09    addr, FPU_LS_SINGLE);
>  =09=09=09break;
>  =09=09}
> @@ -1052,7 +1052,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd,
>  =09=09=09=09=09=09=09    addr, FPU_LS_SINGLE);
> =20
>  =09=09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -1064,7 +1064,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd,
>  =09=09=09=09=09=09=09    addr, FPU_LS_DOUBLE);
>  =09=09=09break;
>  =09=09}
> @@ -1073,7 +1073,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D kvmppc_get_gpr(vcpu, ax_ra) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd,
>  =09=09=09=09=09=09=09    addr, FPU_LS_DOUBLE);
> =20
>  =09=09=09if (emulated =3D=3D EMULATE_DONE)
> @@ -1085,7 +1085,7 @@ int kvmppc_emulate_paired_single(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu)
>  =09=09=09ulong addr =3D (ax_ra ? kvmppc_get_gpr(vcpu, ax_ra) : 0) +
>  =09=09=09=09     kvmppc_get_gpr(vcpu, ax_rb);
> =20
> -=09=09=09emulated =3D kvmppc_emulate_fpr_store(run, vcpu, ax_rd,
> +=09=09=09emulated =3D kvmppc_emulate_fpr_store(vcpu, ax_rd,
>  =09=09=09=09=09=09=09    addr,
>  =09=09=09=09=09=09=09    FPU_LS_SINGLE_LOW);
>  =09=09=09break;
> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
> index a0f6813f4560..ef54f917bdaf 100644
> --- a/arch/powerpc/kvm/book3s_pr.c
> +++ b/arch/powerpc/kvm/book3s_pr.c
> @@ -700,7 +700,7 @@ static bool kvmppc_visible_gpa(struct kvm_vcpu *vcpu,=
 gpa_t gpa)
>  =09return kvm_is_visible_gfn(vcpu->kvm, gpa >> PAGE_SHIFT);
>  }
> =20
> -int kvmppc_handle_pagefault(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +static int kvmppc_handle_pagefault(struct kvm_vcpu *vcpu,
>  =09=09=09    ulong eaddr, int vec)
>  {
>  =09bool data =3D (vec =3D=3D BOOK3S_INTERRUPT_DATA_STORAGE);
> @@ -795,7 +795,7 @@ int kvmppc_handle_pagefault(struct kvm_run *run, stru=
ct kvm_vcpu *vcpu,
>  =09=09/* The guest's PTE is not mapped yet. Map on the host */
>  =09=09if (kvmppc_mmu_map_page(vcpu, &pte, iswrite) =3D=3D -EIO) {
>  =09=09=09/* Exit KVM if mapping failed */
> -=09=09=09run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
> +=09=09=09vcpu->run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
>  =09=09=09return RESUME_HOST;
>  =09=09}
>  =09=09if (data)
> @@ -808,7 +808,7 @@ int kvmppc_handle_pagefault(struct kvm_run *run, stru=
ct kvm_vcpu *vcpu,
>  =09=09vcpu->stat.mmio_exits++;
>  =09=09vcpu->arch.paddr_accessed =3D pte.raddr;
>  =09=09vcpu->arch.vaddr_accessed =3D pte.eaddr;
> -=09=09r =3D kvmppc_emulate_mmio(run, vcpu);
> +=09=09r =3D kvmppc_emulate_mmio(vcpu);
>  =09=09if ( r =3D=3D RESUME_HOST_NV )
>  =09=09=09r =3D RESUME_HOST;
>  =09}
> @@ -992,7 +992,7 @@ static void kvmppc_emulate_fac(struct kvm_vcpu *vcpu,=
 ulong fac)
>  =09enum emulation_result er =3D EMULATE_FAIL;
> =20
>  =09if (!(kvmppc_get_msr(vcpu) & MSR_PR))
> -=09=09er =3D kvmppc_emulate_instruction(vcpu->run, vcpu);
> +=09=09er =3D kvmppc_emulate_instruction(vcpu);
> =20
>  =09if ((er !=3D EMULATE_DONE) && (er !=3D EMULATE_AGAIN)) {
>  =09=09/* Couldn't emulate, trigger interrupt in guest */
> @@ -1089,8 +1089,7 @@ static void kvmppc_clear_debug(struct kvm_vcpu *vcp=
u)
>  =09}
>  }
> =20
> -static int kvmppc_exit_pr_progint(struct kvm_run *run, struct kvm_vcpu *=
vcpu,
> -=09=09=09=09  unsigned int exit_nr)
> +static int kvmppc_exit_pr_progint(struct kvm_vcpu *vcpu, unsigned int ex=
it_nr)
>  {
>  =09enum emulation_result er;
>  =09ulong flags;
> @@ -1124,7 +1123,7 @@ static int kvmppc_exit_pr_progint(struct kvm_run *r=
un, struct kvm_vcpu *vcpu,
>  =09}
> =20
>  =09vcpu->stat.emulated_inst_exits++;
> -=09er =3D kvmppc_emulate_instruction(run, vcpu);
> +=09er =3D kvmppc_emulate_instruction(vcpu);
>  =09switch (er) {
>  =09case EMULATE_DONE:
>  =09=09r =3D RESUME_GUEST_NV;
> @@ -1139,7 +1138,7 @@ static int kvmppc_exit_pr_progint(struct kvm_run *r=
un, struct kvm_vcpu *vcpu,
>  =09=09r =3D RESUME_GUEST;
>  =09=09break;
>  =09case EMULATE_DO_MMIO:
> -=09=09run->exit_reason =3D KVM_EXIT_MMIO;
> +=09=09vcpu->run->exit_reason =3D KVM_EXIT_MMIO;
>  =09=09r =3D RESUME_HOST_NV;
>  =09=09break;
>  =09case EMULATE_EXIT_USER:
> @@ -1198,7 +1197,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, stru=
ct kvm_vcpu *vcpu,
>  =09=09/* only care about PTEG not found errors, but leave NX alone */
>  =09=09if (shadow_srr1 & 0x40000000) {
>  =09=09=09int idx =3D srcu_read_lock(&vcpu->kvm->srcu);
> -=09=09=09r =3D kvmppc_handle_pagefault(run, vcpu, kvmppc_get_pc(vcpu), e=
xit_nr);
> +=09=09=09r =3D kvmppc_handle_pagefault(vcpu, kvmppc_get_pc(vcpu), exit_n=
r);
>  =09=09=09srcu_read_unlock(&vcpu->kvm->srcu, idx);
>  =09=09=09vcpu->stat.sp_instruc++;
>  =09=09} else if (vcpu->arch.mmu.is_dcbz32(vcpu) &&
> @@ -1248,7 +1247,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, stru=
ct kvm_vcpu *vcpu,
>  =09=09 */
>  =09=09if (fault_dsisr & (DSISR_NOHPTE | DSISR_PROTFAULT)) {
>  =09=09=09int idx =3D srcu_read_lock(&vcpu->kvm->srcu);
> -=09=09=09r =3D kvmppc_handle_pagefault(run, vcpu, dar, exit_nr);
> +=09=09=09r =3D kvmppc_handle_pagefault(vcpu, dar, exit_nr);
>  =09=09=09srcu_read_unlock(&vcpu->kvm->srcu, idx);
>  =09=09} else {
>  =09=09=09kvmppc_core_queue_data_storage(vcpu, dar, fault_dsisr);
> @@ -1292,7 +1291,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, stru=
ct kvm_vcpu *vcpu,
>  =09=09break;
>  =09case BOOK3S_INTERRUPT_PROGRAM:
>  =09case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
> -=09=09r =3D kvmppc_exit_pr_progint(run, vcpu, exit_nr);
> +=09=09r =3D kvmppc_exit_pr_progint(vcpu, exit_nr);
>  =09=09break;
>  =09case BOOK3S_INTERRUPT_SYSCALL:
>  =09{
> @@ -1370,7 +1369,7 @@ int kvmppc_handle_exit_pr(struct kvm_run *run, stru=
ct kvm_vcpu *vcpu,
>  =09=09=09emul =3D kvmppc_get_last_inst(vcpu, INST_GENERIC,
>  =09=09=09=09=09=09    &last_inst);
>  =09=09=09if (emul =3D=3D EMULATE_DONE)
> -=09=09=09=09r =3D kvmppc_exit_pr_progint(run, vcpu, exit_nr);
> +=09=09=09=09r =3D kvmppc_exit_pr_progint(vcpu, exit_nr);
>  =09=09=09else
>  =09=09=09=09r =3D RESUME_GUEST;
> =20
> @@ -1825,8 +1824,9 @@ static void kvmppc_core_vcpu_free_pr(struct kvm_vcp=
u *vcpu)
>  =09vfree(vcpu_book3s);
>  }
> =20
> -static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_run, struct kvm_vcpu *=
vcpu)
> +static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int ret;
>  #ifdef CONFIG_ALTIVEC
>  =09unsigned long uninitialized_var(vrsave);
> @@ -1834,7 +1834,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_r=
un, struct kvm_vcpu *vcpu)
> =20
>  =09/* Check if we can run the vcpu at all */
>  =09if (!vcpu->arch.sane) {
> -=09=09kvm_run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
> +=09=09run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
>  =09=09ret =3D -EINVAL;
>  =09=09goto out;
>  =09}
> @@ -1861,7 +1861,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_run *kvm_r=
un, struct kvm_vcpu *vcpu)
> =20
>  =09kvmppc_fix_ee_before_entry();
> =20
> -=09ret =3D __kvmppc_vcpu_run(kvm_run, vcpu);
> +=09ret =3D __kvmppc_vcpu_run(run, vcpu);
> =20
>  =09kvmppc_clear_debug(vcpu);
> =20
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 6c18ea88fd25..26b3f5900b72 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -730,13 +730,14 @@ int kvmppc_core_check_requests(struct kvm_vcpu *vcp=
u)
>  =09return r;
>  }
> =20
> -int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
> +int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int ret, s;
>  =09struct debug_reg debug;
> =20
>  =09if (!vcpu->arch.sane) {
> -=09=09kvm_run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
> +=09=09run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
>  =09=09return -EINVAL;
>  =09}
> =20
> @@ -778,7 +779,7 @@ int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct k=
vm_vcpu *vcpu)
>  =09vcpu->arch.pgdir =3D vcpu->kvm->mm->pgd;
>  =09kvmppc_fix_ee_before_entry();
> =20
> -=09ret =3D __kvmppc_vcpu_run(kvm_run, vcpu);
> +=09ret =3D __kvmppc_vcpu_run(run, vcpu);
> =20
>  =09/* No need for guest_exit. It's done in handle_exit.
>  =09   We also get here with interrupts enabled. */
> @@ -800,11 +801,11 @@ int kvmppc_vcpu_run(struct kvm_run *kvm_run, struct=
 kvm_vcpu *vcpu)
>  =09return ret;
>  }
> =20
> -static int emulation_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
> +static int emulation_exit(struct kvm_vcpu *vcpu)
>  {
>  =09enum emulation_result er;
> =20
> -=09er =3D kvmppc_emulate_instruction(run, vcpu);
> +=09er =3D kvmppc_emulate_instruction(vcpu);
>  =09switch (er) {
>  =09case EMULATE_DONE:
>  =09=09/* don't overwrite subtypes, just account kvm_stats */
> @@ -821,8 +822,8 @@ static int emulation_exit(struct kvm_run *run, struct=
 kvm_vcpu *vcpu)
>  =09=09       __func__, vcpu->arch.regs.nip, vcpu->arch.last_inst);
>  =09=09/* For debugging, encode the failing instruction and
>  =09=09 * report it to userspace. */
> -=09=09run->hw.hardware_exit_reason =3D ~0ULL << 32;
> -=09=09run->hw.hardware_exit_reason |=3D vcpu->arch.last_inst;
> +=09=09vcpu->run->hw.hardware_exit_reason =3D ~0ULL << 32;
> +=09=09vcpu->run->hw.hardware_exit_reason |=3D vcpu->arch.last_inst;
>  =09=09kvmppc_core_queue_program(vcpu, ESR_PIL);
>  =09=09return RESUME_HOST;
> =20
> @@ -834,8 +835,9 @@ static int emulation_exit(struct kvm_run *run, struct=
 kvm_vcpu *vcpu)
>  =09}
>  }
> =20
> -static int kvmppc_handle_debug(struct kvm_run *run, struct kvm_vcpu *vcp=
u)
> +static int kvmppc_handle_debug(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09struct debug_reg *dbg_reg =3D &(vcpu->arch.dbg_reg);
>  =09u32 dbsr =3D vcpu->arch.dbsr;
> =20
> @@ -954,7 +956,7 @@ static void kvmppc_restart_interrupt(struct kvm_vcpu =
*vcpu,
>  =09}
>  }
> =20
> -static int kvmppc_resume_inst_load(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
>  =09=09=09=09  enum emulation_result emulated, u32 last_inst)
>  {
>  =09switch (emulated) {
> @@ -966,8 +968,8 @@ static int kvmppc_resume_inst_load(struct kvm_run *ru=
n, struct kvm_vcpu *vcpu,
>  =09=09       __func__, vcpu->arch.regs.nip);
>  =09=09/* For debugging, encode the failing instruction and
>  =09=09 * report it to userspace. */
> -=09=09run->hw.hardware_exit_reason =3D ~0ULL << 32;
> -=09=09run->hw.hardware_exit_reason |=3D last_inst;
> +=09=09vcpu->run->hw.hardware_exit_reason =3D ~0ULL << 32;
> +=09=09vcpu->run->hw.hardware_exit_reason |=3D last_inst;
>  =09=09kvmppc_core_queue_program(vcpu, ESR_PIL);
>  =09=09return RESUME_HOST;
> =20
> @@ -1024,7 +1026,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct =
kvm_vcpu *vcpu,
>  =09run->ready_for_interrupt_injection =3D 1;
> =20
>  =09if (emulated !=3D EMULATE_DONE) {
> -=09=09r =3D kvmppc_resume_inst_load(run, vcpu, emulated, last_inst);
> +=09=09r =3D kvmppc_resume_inst_load(vcpu, emulated, last_inst);
>  =09=09goto out;
>  =09}
> =20
> @@ -1084,7 +1086,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct =
kvm_vcpu *vcpu,
>  =09=09break;
> =20
>  =09case BOOKE_INTERRUPT_HV_PRIV:
> -=09=09r =3D emulation_exit(run, vcpu);
> +=09=09r =3D emulation_exit(vcpu);
>  =09=09break;
> =20
>  =09case BOOKE_INTERRUPT_PROGRAM:
> @@ -1094,7 +1096,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct =
kvm_vcpu *vcpu,
>  =09=09=09 * We are here because of an SW breakpoint instr,
>  =09=09=09 * so lets return to host to handle.
>  =09=09=09 */
> -=09=09=09r =3D kvmppc_handle_debug(run, vcpu);
> +=09=09=09r =3D kvmppc_handle_debug(vcpu);
>  =09=09=09run->exit_reason =3D KVM_EXIT_DEBUG;
>  =09=09=09kvmppc_account_exit(vcpu, DEBUG_EXITS);
>  =09=09=09break;
> @@ -1115,7 +1117,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct =
kvm_vcpu *vcpu,
>  =09=09=09break;
>  =09=09}
> =20
> -=09=09r =3D emulation_exit(run, vcpu);
> +=09=09r =3D emulation_exit(vcpu);
>  =09=09break;
> =20
>  =09case BOOKE_INTERRUPT_FP_UNAVAIL:
> @@ -1282,7 +1284,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct =
kvm_vcpu *vcpu,
>  =09=09=09 * actually RAM. */
>  =09=09=09vcpu->arch.paddr_accessed =3D gpaddr;
>  =09=09=09vcpu->arch.vaddr_accessed =3D eaddr;
> -=09=09=09r =3D kvmppc_emulate_mmio(run, vcpu);
> +=09=09=09r =3D kvmppc_emulate_mmio(vcpu);
>  =09=09=09kvmppc_account_exit(vcpu, MMIO_EXITS);
>  =09=09}
> =20
> @@ -1333,7 +1335,7 @@ int kvmppc_handle_exit(struct kvm_run *run, struct =
kvm_vcpu *vcpu,
>  =09}
> =20
>  =09case BOOKE_INTERRUPT_DEBUG: {
> -=09=09r =3D kvmppc_handle_debug(run, vcpu);
> +=09=09r =3D kvmppc_handle_debug(vcpu);
>  =09=09if (r =3D=3D RESUME_HOST)
>  =09=09=09run->exit_reason =3D KVM_EXIT_DEBUG;
>  =09=09kvmppc_account_exit(vcpu, DEBUG_EXITS);
> diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
> index 65b4d337d337..be9da96d9f06 100644
> --- a/arch/powerpc/kvm/booke.h
> +++ b/arch/powerpc/kvm/booke.h
> @@ -70,7 +70,7 @@ void kvmppc_set_tcr(struct kvm_vcpu *vcpu, u32 new_tcr)=
;
>  void kvmppc_set_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits);
>  void kvmppc_clr_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits);
> =20
> -int kvmppc_booke_emulate_op(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
>                              unsigned int inst, int *advance);
>  int kvmppc_booke_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, ulong *s=
pr_val);
>  int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong sp=
r_val);
> @@ -94,16 +94,12 @@ enum int_class {
> =20
>  void kvmppc_set_pending_interrupt(struct kvm_vcpu *vcpu, enum int_class =
type);
> =20
> -extern int kvmppc_core_emulate_op_e500(struct kvm_run *run,
> -=09=09=09=09       struct kvm_vcpu *vcpu,
> +extern int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
>  =09=09=09=09       unsigned int inst, int *advance);
>  extern int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int spr=
n,
>  =09=09=09=09=09  ulong spr_val);
>  extern int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int spr=
n,
>  =09=09=09=09=09  ulong *spr_val);
> -extern int kvmppc_core_emulate_op_e500(struct kvm_run *run,
> -=09=09=09=09       struct kvm_vcpu *vcpu,
> -=09=09=09=09       unsigned int inst, int *advance);
>  extern int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int spr=
n,
>  =09=09=09=09=09  ulong spr_val);
>  extern int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int spr=
n,
> diff --git a/arch/powerpc/kvm/booke_emulate.c b/arch/powerpc/kvm/booke_em=
ulate.c
> index 689ff5f90e9e..d8d38aca71bd 100644
> --- a/arch/powerpc/kvm/booke_emulate.c
> +++ b/arch/powerpc/kvm/booke_emulate.c
> @@ -39,7 +39,7 @@ static void kvmppc_emul_rfci(struct kvm_vcpu *vcpu)
>  =09kvmppc_set_msr(vcpu, vcpu->arch.csrr1);
>  }
> =20
> -int kvmppc_booke_emulate_op(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_booke_emulate_op(struct kvm_vcpu *vcpu,
>                              unsigned int inst, int *advance)
>  {
>  =09int emulated =3D EMULATE_DONE;
> diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emul=
ate.c
> index 3d0d3ec5be96..64eb833e9f02 100644
> --- a/arch/powerpc/kvm/e500_emulate.c
> +++ b/arch/powerpc/kvm/e500_emulate.c
> @@ -83,16 +83,16 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *v=
cpu, int rb)
>  }
>  #endif
> =20
> -static int kvmppc_e500_emul_ehpriv(struct kvm_run *run, struct kvm_vcpu =
*vcpu,
> +static int kvmppc_e500_emul_ehpriv(struct kvm_vcpu *vcpu,
>  =09=09=09=09   unsigned int inst, int *advance)
>  {
>  =09int emulated =3D EMULATE_DONE;
> =20
>  =09switch (get_oc(inst)) {
>  =09case EHPRIV_OC_DEBUG:
> -=09=09run->exit_reason =3D KVM_EXIT_DEBUG;
> -=09=09run->debug.arch.address =3D vcpu->arch.regs.nip;
> -=09=09run->debug.arch.status =3D 0;
> +=09=09vcpu->run->exit_reason =3D KVM_EXIT_DEBUG;
> +=09=09vcpu->run->debug.arch.address =3D vcpu->arch.regs.nip;
> +=09=09vcpu->run->debug.arch.status =3D 0;
>  =09=09kvmppc_account_exit(vcpu, DEBUG_EXITS);
>  =09=09emulated =3D EMULATE_EXIT_USER;
>  =09=09*advance =3D 0;
> @@ -125,7 +125,7 @@ static int kvmppc_e500_emul_mftmr(struct kvm_vcpu *vc=
pu, unsigned int inst,
>  =09return EMULATE_FAIL;
>  }
> =20
> -int kvmppc_core_emulate_op_e500(struct kvm_run *run, struct kvm_vcpu *vc=
pu,
> +int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
>  =09=09=09=09unsigned int inst, int *advance)
>  {
>  =09int emulated =3D EMULATE_DONE;
> @@ -182,8 +182,7 @@ int kvmppc_core_emulate_op_e500(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09=09=09break;
> =20
>  =09=09case XOP_EHPRIV:
> -=09=09=09emulated =3D kvmppc_e500_emul_ehpriv(run, vcpu, inst,
> -=09=09=09=09=09=09=09   advance);
> +=09=09=09emulated =3D kvmppc_e500_emul_ehpriv(vcpu, inst, advance);
>  =09=09=09break;
> =20
>  =09=09default:
> @@ -197,7 +196,7 @@ int kvmppc_core_emulate_op_e500(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09}
> =20
>  =09if (emulated =3D=3D EMULATE_FAIL)
> -=09=09emulated =3D kvmppc_booke_emulate_op(run, vcpu, inst, advance);
> +=09=09emulated =3D kvmppc_booke_emulate_op(vcpu, inst, advance);
> =20
>  =09return emulated;
>  }
> diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
> index 6fca38ca791f..ee1147c98cd8 100644
> --- a/arch/powerpc/kvm/emulate.c
> +++ b/arch/powerpc/kvm/emulate.c
> @@ -191,7 +191,7 @@ static int kvmppc_emulate_mfspr(struct kvm_vcpu *vcpu=
, int sprn, int rt)
> =20
>  /* XXX Should probably auto-generate instruction decoding for a particul=
ar core
>   * from opcode tables in the future. */
> -int kvmppc_emulate_instruction(struct kvm_run *run, struct kvm_vcpu *vcp=
u)
> +int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
>  {
>  =09u32 inst;
>  =09int rs, rt, sprn;
> @@ -270,9 +270,9 @@ int kvmppc_emulate_instruction(struct kvm_run *run, s=
truct kvm_vcpu *vcpu)
>  =09=09 * these are illegal instructions.
>  =09=09 */
>  =09=09if (inst =3D=3D KVMPPC_INST_SW_BREAKPOINT) {
> -=09=09=09run->exit_reason =3D KVM_EXIT_DEBUG;
> -=09=09=09run->debug.arch.status =3D 0;
> -=09=09=09run->debug.arch.address =3D kvmppc_get_pc(vcpu);
> +=09=09=09vcpu->run->exit_reason =3D KVM_EXIT_DEBUG;
> +=09=09=09vcpu->run->debug.arch.status =3D 0;
> +=09=09=09vcpu->run->debug.arch.address =3D kvmppc_get_pc(vcpu);
>  =09=09=09emulated =3D EMULATE_EXIT_USER;
>  =09=09=09advance =3D 0;
>  =09=09} else
> @@ -285,7 +285,7 @@ int kvmppc_emulate_instruction(struct kvm_run *run, s=
truct kvm_vcpu *vcpu)
>  =09}
> =20
>  =09if (emulated =3D=3D EMULATE_FAIL) {
> -=09=09emulated =3D vcpu->kvm->arch.kvm_ops->emulate_op(run, vcpu, inst,
> +=09=09emulated =3D vcpu->kvm->arch.kvm_ops->emulate_op(vcpu, inst,
>  =09=09=09=09=09=09=09       &advance);
>  =09=09if (emulated =3D=3D EMULATE_AGAIN) {
>  =09=09=09advance =3D 0;
> diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emul=
ate_loadstore.c
> index 1139bc56e004..e8a47c84d77d 100644
> --- a/arch/powerpc/kvm/emulate_loadstore.c
> +++ b/arch/powerpc/kvm/emulate_loadstore.c
> @@ -71,7 +71,6 @@ static bool kvmppc_check_altivec_disabled(struct kvm_vc=
pu *vcpu)
>   */
>  int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  {
> -=09struct kvm_run *run =3D vcpu->run;
>  =09u32 inst;
>  =09enum emulation_result emulated =3D EMULATE_FAIL;
>  =09int advance =3D 1;
> @@ -104,10 +103,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  =09=09=09int instr_byte_swap =3D op.type & BYTEREV;
> =20
>  =09=09=09if (op.type & SIGNEXT)
> -=09=09=09=09emulated =3D kvmppc_handle_loads(run, vcpu,
> +=09=09=09=09emulated =3D kvmppc_handle_loads(vcpu,
>  =09=09=09=09=09=09op.reg, size, !instr_byte_swap);
>  =09=09=09else
> -=09=09=09=09emulated =3D kvmppc_handle_load(run, vcpu,
> +=09=09=09=09emulated =3D kvmppc_handle_load(vcpu,
>  =09=09=09=09=09=09op.reg, size, !instr_byte_swap);
> =20
>  =09=09=09if ((op.type & UPDATE) && (emulated !=3D EMULATE_FAIL))
> @@ -124,10 +123,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  =09=09=09=09vcpu->arch.mmio_sp64_extend =3D 1;
> =20
>  =09=09=09if (op.type & SIGNEXT)
> -=09=09=09=09emulated =3D kvmppc_handle_loads(run, vcpu,
> +=09=09=09=09emulated =3D kvmppc_handle_loads(vcpu,
>  =09=09=09=09=09     KVM_MMIO_REG_FPR|op.reg, size, 1);
>  =09=09=09else
> -=09=09=09=09emulated =3D kvmppc_handle_load(run, vcpu,
> +=09=09=09=09emulated =3D kvmppc_handle_load(vcpu,
>  =09=09=09=09=09     KVM_MMIO_REG_FPR|op.reg, size, 1);
> =20
>  =09=09=09if ((op.type & UPDATE) && (emulated !=3D EMULATE_FAIL))
> @@ -164,12 +163,12 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
> =20
>  =09=09=09if (size =3D=3D 16) {
>  =09=09=09=09vcpu->arch.mmio_vmx_copy_nums =3D 2;
> -=09=09=09=09emulated =3D kvmppc_handle_vmx_load(run,
> -=09=09=09=09=09=09vcpu, KVM_MMIO_REG_VMX|op.reg,
> +=09=09=09=09emulated =3D kvmppc_handle_vmx_load(vcpu,
> +=09=09=09=09=09=09KVM_MMIO_REG_VMX|op.reg,
>  =09=09=09=09=09=098, 1);
>  =09=09=09} else {
>  =09=09=09=09vcpu->arch.mmio_vmx_copy_nums =3D 1;
> -=09=09=09=09emulated =3D kvmppc_handle_vmx_load(run, vcpu,
> +=09=09=09=09emulated =3D kvmppc_handle_vmx_load(vcpu,
>  =09=09=09=09=09=09KVM_MMIO_REG_VMX|op.reg,
>  =09=09=09=09=09=09size, 1);
>  =09=09=09}
> @@ -217,7 +216,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  =09=09=09=09io_size_each =3D op.element_size;
>  =09=09=09}
> =20
> -=09=09=09emulated =3D kvmppc_handle_vsx_load(run, vcpu,
> +=09=09=09emulated =3D kvmppc_handle_vsx_load(vcpu,
>  =09=09=09=09=09KVM_MMIO_REG_VSX|op.reg, io_size_each,
>  =09=09=09=09=091, op.type & SIGNEXT);
>  =09=09=09break;
> @@ -227,8 +226,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  =09=09=09/* if need byte reverse, op.val has been reversed by
>  =09=09=09 * analyse_instr().
>  =09=09=09 */
> -=09=09=09emulated =3D kvmppc_handle_store(run, vcpu, op.val,
> -=09=09=09=09=09size, 1);
> +=09=09=09emulated =3D kvmppc_handle_store(vcpu, op.val, size, 1);
> =20
>  =09=09=09if ((op.type & UPDATE) && (emulated !=3D EMULATE_FAIL))
>  =09=09=09=09kvmppc_set_gpr(vcpu, op.update_reg, op.ea);
> @@ -250,7 +248,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  =09=09=09if (op.type & FPCONV)
>  =09=09=09=09vcpu->arch.mmio_sp64_extend =3D 1;
> =20
> -=09=09=09emulated =3D kvmppc_handle_store(run, vcpu,
> +=09=09=09emulated =3D kvmppc_handle_store(vcpu,
>  =09=09=09=09=09VCPU_FPR(vcpu, op.reg), size, 1);
> =20
>  =09=09=09if ((op.type & UPDATE) && (emulated !=3D EMULATE_FAIL))
> @@ -290,12 +288,12 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
> =20
>  =09=09=09if (size =3D=3D 16) {
>  =09=09=09=09vcpu->arch.mmio_vmx_copy_nums =3D 2;
> -=09=09=09=09emulated =3D kvmppc_handle_vmx_store(run,
> -=09=09=09=09=09=09vcpu, op.reg, 8, 1);
> +=09=09=09=09emulated =3D kvmppc_handle_vmx_store(vcpu,
> +=09=09=09=09=09=09op.reg, 8, 1);
>  =09=09=09} else {
>  =09=09=09=09vcpu->arch.mmio_vmx_copy_nums =3D 1;
> -=09=09=09=09emulated =3D kvmppc_handle_vmx_store(run,
> -=09=09=09=09=09=09vcpu, op.reg, size, 1);
> +=09=09=09=09emulated =3D kvmppc_handle_vmx_store(vcpu,
> +=09=09=09=09=09=09op.reg, size, 1);
>  =09=09=09}
> =20
>  =09=09=09break;
> @@ -338,7 +336,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  =09=09=09=09io_size_each =3D op.element_size;
>  =09=09=09}
> =20
> -=09=09=09emulated =3D kvmppc_handle_vsx_store(run, vcpu,
> +=09=09=09emulated =3D kvmppc_handle_vsx_store(vcpu,
>  =09=09=09=09=09op.reg, io_size_each, 1);
>  =09=09=09break;
>  =09=09}
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 7e24691e138a..de4c317ad5f1 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -279,7 +279,7 @@ int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_sanity_check);
> =20
> -int kvmppc_emulate_mmio(struct kvm_run *run, struct kvm_vcpu *vcpu)
> +int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>  {
>  =09enum emulation_result er;
>  =09int r;
> @@ -295,7 +295,7 @@ int kvmppc_emulate_mmio(struct kvm_run *run, struct k=
vm_vcpu *vcpu)
>  =09=09r =3D RESUME_GUEST;
>  =09=09break;
>  =09case EMULATE_DO_MMIO:
> -=09=09run->exit_reason =3D KVM_EXIT_MMIO;
> +=09=09vcpu->run->exit_reason =3D KVM_EXIT_MMIO;
>  =09=09/* We must reload nonvolatiles because "update" load/store
>  =09=09 * instructions modify register state. */
>  =09=09/* Future optimization: only reload non-volatiles if they were
> @@ -1106,9 +1106,9 @@ static inline u32 dp_to_sp(u64 fprd)
>  #define dp_to_sp(x)=09(x)
>  #endif /* CONFIG_PPC_FPU */
> =20
> -static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu,
> -                                      struct kvm_run *run)
> +static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09u64 uninitialized_var(gpr);
> =20
>  =09if (run->mmio.len > sizeof(gpr)) {
> @@ -1218,10 +1218,11 @@ static void kvmppc_complete_mmio_load(struct kvm_=
vcpu *vcpu,
>  =09}
>  }
> =20
> -static int __kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vc=
pu,
> +static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
>  =09=09=09=09unsigned int rt, unsigned int bytes,
>  =09=09=09=09int is_default_endian, int sign_extend)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int idx, ret;
>  =09bool host_swabbed;
> =20
> @@ -1255,7 +1256,7 @@ static int __kvmppc_handle_load(struct kvm_run *run=
, struct kvm_vcpu *vcpu,
>  =09srcu_read_unlock(&vcpu->kvm->srcu, idx);
> =20
>  =09if (!ret) {
> -=09=09kvmppc_complete_mmio_load(vcpu, run);
> +=09=09kvmppc_complete_mmio_load(vcpu);
>  =09=09vcpu->mmio_needed =3D 0;
>  =09=09return EMULATE_DONE;
>  =09}
> @@ -1263,24 +1264,24 @@ static int __kvmppc_handle_load(struct kvm_run *r=
un, struct kvm_vcpu *vcpu,
>  =09return EMULATE_DO_MMIO;
>  }
> =20
> -int kvmppc_handle_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_load(struct kvm_vcpu *vcpu,
>  =09=09       unsigned int rt, unsigned int bytes,
>  =09=09       int is_default_endian)
>  {
> -=09return __kvmppc_handle_load(run, vcpu, rt, bytes, is_default_endian, =
0);
> +=09return __kvmppc_handle_load(vcpu, rt, bytes, is_default_endian, 0);
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_handle_load);
> =20
>  /* Same as above, but sign extends */
> -int kvmppc_handle_loads(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_loads(struct kvm_vcpu *vcpu,
>  =09=09=09unsigned int rt, unsigned int bytes,
>  =09=09=09int is_default_endian)
>  {
> -=09return __kvmppc_handle_load(run, vcpu, rt, bytes, is_default_endian, =
1);
> +=09return __kvmppc_handle_load(vcpu, rt, bytes, is_default_endian, 1);
>  }
> =20
>  #ifdef CONFIG_VSX
> -int kvmppc_handle_vsx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_vsx_load(struct kvm_vcpu *vcpu,
>  =09=09=09unsigned int rt, unsigned int bytes,
>  =09=09=09int is_default_endian, int mmio_sign_extend)
>  {
> @@ -1291,13 +1292,13 @@ int kvmppc_handle_vsx_load(struct kvm_run *run, s=
truct kvm_vcpu *vcpu,
>  =09=09return EMULATE_FAIL;
> =20
>  =09while (vcpu->arch.mmio_vsx_copy_nums) {
> -=09=09emulated =3D __kvmppc_handle_load(run, vcpu, rt, bytes,
> +=09=09emulated =3D __kvmppc_handle_load(vcpu, rt, bytes,
>  =09=09=09is_default_endian, mmio_sign_extend);
> =20
>  =09=09if (emulated !=3D EMULATE_DONE)
>  =09=09=09break;
> =20
> -=09=09vcpu->arch.paddr_accessed +=3D run->mmio.len;
> +=09=09vcpu->arch.paddr_accessed +=3D vcpu->run->mmio.len;
> =20
>  =09=09vcpu->arch.mmio_vsx_copy_nums--;
>  =09=09vcpu->arch.mmio_vsx_offset++;
> @@ -1306,9 +1307,10 @@ int kvmppc_handle_vsx_load(struct kvm_run *run, st=
ruct kvm_vcpu *vcpu,
>  }
>  #endif /* CONFIG_VSX */
> =20
> -int kvmppc_handle_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_store(struct kvm_vcpu *vcpu,
>  =09=09=09u64 val, unsigned int bytes, int is_default_endian)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09void *data =3D run->mmio.data;
>  =09int idx, ret;
>  =09bool host_swabbed;
> @@ -1422,7 +1424,7 @@ static inline int kvmppc_get_vsr_data(struct kvm_vc=
pu *vcpu, int rs, u64 *val)
>  =09return result;
>  }
> =20
> -int kvmppc_handle_vsx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_vsx_store(struct kvm_vcpu *vcpu,
>  =09=09=09int rs, unsigned int bytes, int is_default_endian)
>  {
>  =09u64 val;
> @@ -1438,13 +1440,13 @@ int kvmppc_handle_vsx_store(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09=09if (kvmppc_get_vsr_data(vcpu, rs, &val) =3D=3D -1)
>  =09=09=09return EMULATE_FAIL;
> =20
> -=09=09emulated =3D kvmppc_handle_store(run, vcpu,
> +=09=09emulated =3D kvmppc_handle_store(vcpu,
>  =09=09=09 val, bytes, is_default_endian);
> =20
>  =09=09if (emulated !=3D EMULATE_DONE)
>  =09=09=09break;
> =20
> -=09=09vcpu->arch.paddr_accessed +=3D run->mmio.len;
> +=09=09vcpu->arch.paddr_accessed +=3D vcpu->run->mmio.len;
> =20
>  =09=09vcpu->arch.mmio_vsx_copy_nums--;
>  =09=09vcpu->arch.mmio_vsx_offset++;
> @@ -1453,19 +1455,19 @@ int kvmppc_handle_vsx_store(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09return emulated;
>  }
> =20
> -static int kvmppc_emulate_mmio_vsx_loadstore(struct kvm_vcpu *vcpu,
> -=09=09=09struct kvm_run *run)
> +static int kvmppc_emulate_mmio_vsx_loadstore(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09enum emulation_result emulated =3D EMULATE_FAIL;
>  =09int r;
> =20
>  =09vcpu->arch.paddr_accessed +=3D run->mmio.len;
> =20
>  =09if (!vcpu->mmio_is_write) {
> -=09=09emulated =3D kvmppc_handle_vsx_load(run, vcpu, vcpu->arch.io_gpr,
> +=09=09emulated =3D kvmppc_handle_vsx_load(vcpu, vcpu->arch.io_gpr,
>  =09=09=09 run->mmio.len, 1, vcpu->arch.mmio_sign_extend);
>  =09} else {
> -=09=09emulated =3D kvmppc_handle_vsx_store(run, vcpu,
> +=09=09emulated =3D kvmppc_handle_vsx_store(vcpu,
>  =09=09=09 vcpu->arch.io_gpr, run->mmio.len, 1);
>  =09}
> =20
> @@ -1489,7 +1491,7 @@ static int kvmppc_emulate_mmio_vsx_loadstore(struct=
 kvm_vcpu *vcpu,
>  #endif /* CONFIG_VSX */
> =20
>  #ifdef CONFIG_ALTIVEC
> -int kvmppc_handle_vmx_load(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
>  =09=09unsigned int rt, unsigned int bytes, int is_default_endian)
>  {
>  =09enum emulation_result emulated =3D EMULATE_DONE;
> @@ -1498,13 +1500,13 @@ int kvmppc_handle_vmx_load(struct kvm_run *run, s=
truct kvm_vcpu *vcpu,
>  =09=09return EMULATE_FAIL;
> =20
>  =09while (vcpu->arch.mmio_vmx_copy_nums) {
> -=09=09emulated =3D __kvmppc_handle_load(run, vcpu, rt, bytes,
> +=09=09emulated =3D __kvmppc_handle_load(vcpu, rt, bytes,
>  =09=09=09=09is_default_endian, 0);
> =20
>  =09=09if (emulated !=3D EMULATE_DONE)
>  =09=09=09break;
> =20
> -=09=09vcpu->arch.paddr_accessed +=3D run->mmio.len;
> +=09=09vcpu->arch.paddr_accessed +=3D vcpu->run->mmio.len;
>  =09=09vcpu->arch.mmio_vmx_copy_nums--;
>  =09=09vcpu->arch.mmio_vmx_offset++;
>  =09}
> @@ -1584,7 +1586,7 @@ int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int =
index, u64 *val)
>  =09return result;
>  }
> =20
> -int kvmppc_handle_vmx_store(struct kvm_run *run, struct kvm_vcpu *vcpu,
> +int kvmppc_handle_vmx_store(struct kvm_vcpu *vcpu,
>  =09=09unsigned int rs, unsigned int bytes, int is_default_endian)
>  {
>  =09u64 val =3D 0;
> @@ -1619,12 +1621,12 @@ int kvmppc_handle_vmx_store(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09=09=09return EMULATE_FAIL;
>  =09=09}
> =20
> -=09=09emulated =3D kvmppc_handle_store(run, vcpu, val, bytes,
> +=09=09emulated =3D kvmppc_handle_store(vcpu, val, bytes,
>  =09=09=09=09is_default_endian);
>  =09=09if (emulated !=3D EMULATE_DONE)
>  =09=09=09break;
> =20
> -=09=09vcpu->arch.paddr_accessed +=3D run->mmio.len;
> +=09=09vcpu->arch.paddr_accessed +=3D vcpu->run->mmio.len;
>  =09=09vcpu->arch.mmio_vmx_copy_nums--;
>  =09=09vcpu->arch.mmio_vmx_offset++;
>  =09}
> @@ -1632,19 +1634,19 @@ int kvmppc_handle_vmx_store(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  =09return emulated;
>  }
> =20
> -static int kvmppc_emulate_mmio_vmx_loadstore(struct kvm_vcpu *vcpu,
> -=09=09struct kvm_run *run)
> +static int kvmppc_emulate_mmio_vmx_loadstore(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09enum emulation_result emulated =3D EMULATE_FAIL;
>  =09int r;
> =20
>  =09vcpu->arch.paddr_accessed +=3D run->mmio.len;
> =20
>  =09if (!vcpu->mmio_is_write) {
> -=09=09emulated =3D kvmppc_handle_vmx_load(run, vcpu,
> +=09=09emulated =3D kvmppc_handle_vmx_load(vcpu,
>  =09=09=09=09vcpu->arch.io_gpr, run->mmio.len, 1);
>  =09} else {
> -=09=09emulated =3D kvmppc_handle_vmx_store(run, vcpu,
> +=09=09emulated =3D kvmppc_handle_vmx_store(vcpu,
>  =09=09=09=09vcpu->arch.io_gpr, run->mmio.len, 1);
>  =09}
> =20
> @@ -1774,7 +1776,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09if (vcpu->mmio_needed) {
>  =09=09vcpu->mmio_needed =3D 0;
>  =09=09if (!vcpu->mmio_is_write)
> -=09=09=09kvmppc_complete_mmio_load(vcpu, run);
> +=09=09=09kvmppc_complete_mmio_load(vcpu);
>  #ifdef CONFIG_VSX
>  =09=09if (vcpu->arch.mmio_vsx_copy_nums > 0) {
>  =09=09=09vcpu->arch.mmio_vsx_copy_nums--;
> @@ -1782,7 +1784,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09=09}
> =20
>  =09=09if (vcpu->arch.mmio_vsx_copy_nums > 0) {
> -=09=09=09r =3D kvmppc_emulate_mmio_vsx_loadstore(vcpu, run);
> +=09=09=09r =3D kvmppc_emulate_mmio_vsx_loadstore(vcpu);
>  =09=09=09if (r =3D=3D RESUME_HOST) {
>  =09=09=09=09vcpu->mmio_needed =3D 1;
>  =09=09=09=09goto out;
> @@ -1796,7 +1798,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09=09}
> =20
>  =09=09if (vcpu->arch.mmio_vmx_copy_nums > 0) {
> -=09=09=09r =3D kvmppc_emulate_mmio_vmx_loadstore(vcpu, run);
> +=09=09=09r =3D kvmppc_emulate_mmio_vmx_loadstore(vcpu);
>  =09=09=09if (r =3D=3D RESUME_HOST) {
>  =09=09=09=09vcpu->mmio_needed =3D 1;
>  =09=09=09=09goto out;
> @@ -1829,7 +1831,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09if (run->immediate_exit)
>  =09=09r =3D -EINTR;
>  =09else
> -=09=09r =3D kvmppc_vcpu_run(run, vcpu);
> +=09=09r =3D kvmppc_vcpu_run(vcpu);
> =20
>  =09kvm_sigset_deactivate(vcpu);
> =20
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 8a1e3b0047f1..4a61a971c34e 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -472,9 +472,9 @@ TRACE_EVENT(kvmppc_run_vcpu_enter,
>  );
> =20
>  TRACE_EVENT(kvmppc_run_vcpu_exit,
> -=09TP_PROTO(struct kvm_vcpu *vcpu, struct kvm_run *run),
> +=09TP_PROTO(struct kvm_vcpu *vcpu),
> =20
> -=09TP_ARGS(vcpu, run),
> +=09TP_ARGS(vcpu),
> =20
>  =09TP_STRUCT__entry(
>  =09=09__field(int,=09=09vcpu_id)
> @@ -484,7 +484,7 @@ TRACE_EVENT(kvmppc_run_vcpu_exit,
> =20
>  =09TP_fast_assign(
>  =09=09__entry->vcpu_id  =3D vcpu->vcpu_id;
> -=09=09__entry->exit     =3D run->exit_reason;
> +=09=09__entry->exit     =3D vcpu->run->exit_reason;
>  =09=09__entry->ret      =3D vcpu->arch.ret;
>  =09),

'git grep kvm_run arch/powerpc/kvm/' tells me the result is correct so
in case this even compiles, feel free to add

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

--=20
Vitaly

