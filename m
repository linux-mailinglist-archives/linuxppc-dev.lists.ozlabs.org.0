Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CAD265F42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 14:11:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnvjX1kFmzDqgZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 22:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnvgG1Q1nzDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 22:08:57 +1000 (AEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1kGhrE-0003aM-11; Fri, 11 Sep 2020 12:08:48 +0000
Date: Fri, 11 Sep 2020 09:08:43 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Don't return -ENOTSUPP to userspace in ioctls
Message-ID: <20200911120843.GG4002@mussarela>
References: <159982162511.459323.13495475646618845164.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159982162511.459323.13495475646618845164.stgit@bahia.lan>
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
Cc: trivial@kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 12:53:45PM +0200, Greg Kurz wrote:
> ENOTSUPP is a linux only thingy, the value of which is unknown to
> userspace, not to be confused with ENOTSUP which linux maps to
> EOPNOTSUPP, as permitted by POSIX [1]:
> 
> [EOPNOTSUPP]
> Operation not supported on socket. The type of socket (address family
> or protocol) does not support the requested operation. A conforming
> implementation may assign the same values for [EOPNOTSUPP] and [ENOTSUP].
> 
> Return -EOPNOTSUPP instead of -ENOTSUPP for the following ioctls:
> - KVM_GET_FPU for Book3s and BookE
> - KVM_SET_FPU for Book3s and BookE
> - KVM_GET_DIRTY_LOG for BookE
> 
> This doesn't affect QEMU which doesn't call the KVM_GET_FPU and
> KVM_SET_FPU ioctls on POWER anyway since they are not supported,
> and _buggily_ ignores anything but -EPERM for KVM_GET_DIRTY_LOG.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Agreed. ENOTSUPP should never be returned to userspace.

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

> ---
>  arch/powerpc/kvm/book3s.c |    4 ++--
>  arch/powerpc/kvm/booke.c  |    6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 1fce9777af1c..44bf567b6589 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -558,12 +558,12 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>  
>  int kvm_arch_vcpu_ioctl_get_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
>  {
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
>  
>  int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
>  {
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
>  
>  int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 3e1c9f08e302..b1abcb816439 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -1747,12 +1747,12 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
>  
>  int kvm_arch_vcpu_ioctl_get_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
>  {
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
>  
>  int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
>  {
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
>  
>  int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
> @@ -1773,7 +1773,7 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  
>  int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log)
>  {
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
>  
>  void kvmppc_core_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> 
> 
