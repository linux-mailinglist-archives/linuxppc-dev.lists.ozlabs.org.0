Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD718E13B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:35:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l0V61Y9hzDsNq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:35:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kzCl2yMfzF07t
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:37:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48kzCh3rmzz9sSh; Sat, 21 Mar 2020 22:37:52 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1d0c32ec3b860a32df593a22bad0d1dbc5546a59
In-Reply-To: <158455341029.178873.15248663726399374882.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/3] KVM: PPC: Fix kernel crash with PR KVM
Message-Id: <48kzCh3rmzz9sSh@ozlabs.org>
Date: Sat, 21 Mar 2020 22:37:52 +1100 (AEDT)
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Sean Christopherson <sean.j.christopherson@intel.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-18 at 17:43:30 UTC, Greg Kurz wrote:
> With PR KVM, shutting down a VM causes the host kernel to crash:
> 
> [  314.219284] BUG: Unable to handle kernel data access on read at 0xc00800000176c638
> [  314.219299] Faulting instruction address: 0xc008000000d4ddb0
> cpu 0x0: Vector: 300 (Data Access) at [c00000036da077a0]
>     pc: c008000000d4ddb0: kvmppc_mmu_pte_flush_all+0x68/0xd0 [kvm_pr]
>     lr: c008000000d4dd94: kvmppc_mmu_pte_flush_all+0x4c/0xd0 [kvm_pr]
>     sp: c00000036da07a30
>    msr: 900000010280b033
>    dar: c00800000176c638
>  dsisr: 40000000
>   current = 0xc00000036d4c0000
>   paca    = 0xc000000001a00000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 1992, comm = qemu-system-ppc
> Linux version 5.6.0-master-gku+ (greg@palmb) (gcc version 7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)) #17 SMP Wed Mar 18 13:49:29 CET 2020
> enter ? for help
> [c00000036da07ab0] c008000000d4fbe0 kvmppc_mmu_destroy_pr+0x28/0x60 [kvm_pr]
> [c00000036da07ae0] c0080000009eab8c kvmppc_mmu_destroy+0x34/0x50 [kvm]
> [c00000036da07b00] c0080000009e50c0 kvm_arch_vcpu_destroy+0x108/0x140 [kvm]
> [c00000036da07b30] c0080000009d1b50 kvm_vcpu_destroy+0x28/0x80 [kvm]
> [c00000036da07b60] c0080000009e4434 kvm_arch_destroy_vm+0xbc/0x190 [kvm]
> [c00000036da07ba0] c0080000009d9c2c kvm_put_kvm+0x1d4/0x3f0 [kvm]
> [c00000036da07c00] c0080000009da760 kvm_vm_release+0x38/0x60 [kvm]
> [c00000036da07c30] c000000000420be0 __fput+0xe0/0x310
> [c00000036da07c90] c0000000001747a0 task_work_run+0x150/0x1c0
> [c00000036da07cf0] c00000000014896c do_exit+0x44c/0xd00
> [c00000036da07dc0] c0000000001492f4 do_group_exit+0x64/0xd0
> [c00000036da07e00] c000000000149384 sys_exit_group+0x24/0x30
> [c00000036da07e20] c00000000000b9d0 system_call+0x5c/0x68
> 
> This is caused by a use-after-free in kvmppc_mmu_pte_flush_all()
> which dereferences vcpu->arch.book3s which was previously freed by
> kvmppc_core_vcpu_free_pr(). This happens because kvmppc_mmu_destroy()
> is called after kvmppc_core_vcpu_free() since commit ff030fdf5573
> ("KVM: PPC: Move kvm_vcpu_init() invocation to common code").
> 
> The kvmppc_mmu_destroy() helper calls one of the following depending
> on the KVM backend:
> 
> - kvmppc_mmu_destroy_hv() which does nothing (Book3s HV)
> 
> - kvmppc_mmu_destroy_pr() which undoes the effects of
>   kvmppc_mmu_init() (Book3s PR 32-bit)
> 
> - kvmppc_mmu_destroy_pr() which undoes the effects of
>   kvmppc_mmu_init() (Book3s PR 64-bit)
> 
> - kvmppc_mmu_destroy_e500() which does nothing (BookE e500/e500mc)
> 
> It turns out that this is only relevant to PR KVM actually. And both
> 32 and 64 backends need vcpu->arch.book3s to be valid when calling
> kvmppc_mmu_destroy_pr(). So instead of calling kvmppc_mmu_destroy()
> from kvm_arch_vcpu_destroy(), call kvmppc_mmu_destroy_pr() at the
> beginning of kvmppc_core_vcpu_free_pr(). This is consistent with
> kvmppc_mmu_init() being the last call in kvmppc_core_vcpu_create_pr().
> 
> For the same reason, if kvmppc_core_vcpu_create_pr() returns an
> error then this means that kvmppc_mmu_init() was either not called
> or failed, in which case kvmppc_mmu_destroy() should not be called.
> Drop the line in the error path of kvm_arch_vcpu_create().
> 
> Fixes: ff030fdf5573 ("KVM: PPC: Move kvm_vcpu_init() invocation to common code")
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/1d0c32ec3b860a32df593a22bad0d1dbc5546a59

cheers
