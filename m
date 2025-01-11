Return-Path: <linuxppc-dev+bounces-5077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D718A0A330
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 12:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVbF0311Mz3ccL;
	Sat, 11 Jan 2025 22:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736593300;
	cv=none; b=PJC9Dy+3o5J0k7Ab1lTG/yM21G5UC8fMXYix0OV3gBTAespRPhhtIZWArBLH5L88DYsXLguWxFSHHpT76BDBJRZPUu77Cd4Apit0WYz3LCa8JsXjekw80sEZB/qRHKKnQLqyxBDzWeo7YC6Sp7SHq1gIwJnUfVHyOJyzcbxl3cEq1ogMyJCiuueiK6fLMlJJydwpNtWlMIe4War9QSK4x7ep5j4nme0ft95uQovZA0X6k+sZfqZ76Qm+rgYQkmjGsW46XsqWxYUzVPJyvQEn6PjzAQc0hs/9hIi56+gMt+XPMnFIUfdvsKppaapMQcYdP2zTr5e8PJCgeYFx7Iq3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736593300; c=relaxed/relaxed;
	bh=+2Lyxnn3SuZHHFiWkx4BH6h2lDgHJEAKzd/2NJLj860=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGpyfsJOl4n7YnyqQzpyjVrohteiR6lFfJxdI+Yyg4DXYTV3pTjGxYVeeMnQ+g42PdGXA8CXf7Ghj+vB3lpJciazb2u8+VMS8oTZjXXw4EFf6d9w3fT4tAO2JsQ/51z/1wy899r8L8j8BSnESATYT90cfZ/7QDB3P8zL5rNw6wox4TIjB6d0RqH4CXZki4tdcbRFScIan16vjg0GuaxBNaHfC53jAkI0iMbXGiJQxoTZhYHpSOimxSlYt2z1g8bKbIhPoln3he/j5UjnaxJyaI2qpHZm9pRdwUcWgNAxnqukH2Q0TEznYISEC9WpwVt7JgwjONt/XKdqDMH014Ap9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5/bVuzb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5/bVuzb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVbDy6Qn1z3cc0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 22:01:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 949745C12A6;
	Sat, 11 Jan 2025 11:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B134C4CED2;
	Sat, 11 Jan 2025 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736593296;
	bh=gy67Eo8C1hKneW/xn+UE+Oh9vmay9ok/H+SGcDXNdi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s5/bVuzbBSzTi3/QQcP+Y5MyFvpGcjUyPB4u8ZMRYy0G+Pa+O0yWM7q7/jnwyAI8n
	 lTwe1nz38A6Bibbxyz/hndpTkb3vjQFTiwJAS5t+XIIhRP3WeI5b84YSIiZaz4VuMZ
	 YTpIm+6Iid4koRAJwFjMR6C2FC62G7CMhrmd5KTYuD0wkH6lO78w5jNrlfcH+oKZp9
	 06HYKpx254waJxqGuoxRbXper7rm/FeuXfIR66r/Wv8xArJK/xuWmLtvMc4LGs2gfx
	 eb7JOt1v/wlvhMvB47kcDPS9oZHCYxmp3PJCpwInb8C/xqs+7FwXVi8cojI57iQkI/
	 T2Ri6OEh71jxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tWZFE-00B9ML-Kd;
	Sat, 11 Jan 2025 11:01:33 +0000
Date: Sat, 11 Jan 2025 11:01:31 +0000
Message-ID: <87ikqlr4vo.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit needs completion
In-Reply-To: <20250111012450.1262638-4-seanjc@google.com>
References: <20250111012450.1262638-1-seanjc@google.com>
	<20250111012450.1262638-4-seanjc@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: seanjc@google.com, pbonzini@redhat.com, oliver.upton@linux.dev, mpe@ellerman.id.au, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 11 Jan 2025 01:24:48 +0000,
Sean Christopherson <seanjc@google.com> wrote:
> 
> Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> that KVM_RUN needs to be re-executed prior to save/restore in order to
> complete the instruction/operation that triggered the userspace exit.
> 
> KVM's current approach of adding notes in the Documentation is beyond
> brittle, e.g. there is at least one known case where a KVM developer added
> a new userspace exit type, and then that same developer forgot to handle
> completion when adding userspace support.

Is this going to fix anything? If they couldn't be bothered to read
the documentation, let alone update it, how is that going to be
improved by extra rules and regulations?

I don't see how someone ignoring the documented behaviour of a given
exit reason is, all of a sudden, have an epiphany and take a *new*
flag into account.

> 
> On x86, there are multiple exits that need completion, but they are all
> conveniently funneled through a single callback, i.e. in theory, this is a
> one-time thing for KVM x86 (and other architectures could follow suit with
> additional refactoring).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  Documentation/virt/kvm/api.rst    | 48 ++++++++++++++++++++++---------
>  arch/powerpc/kvm/book3s_emulate.c |  1 +
>  arch/powerpc/kvm/book3s_hv.c      |  1 +
>  arch/powerpc/kvm/book3s_pr.c      |  2 ++
>  arch/powerpc/kvm/booke.c          |  1 +
>  arch/x86/include/uapi/asm/kvm.h   |  7 +++--
>  arch/x86/kvm/x86.c                |  2 ++
>  include/uapi/linux/kvm.h          |  3 ++
>  virt/kvm/kvm_main.c               |  1 +
>  9 files changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index c92c8d4e8779..8e172675d8d6 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6505,7 +6505,7 @@ local APIC is not used.
>  
>  	__u16 flags;
>  
> -More architecture-specific flags detailing state of the VCPU that may
> +Common and architecture-specific flags detailing state of the VCPU that may
>  affect the device's behavior. Current defined flags::
>  
>    /* x86, set if the VCPU is in system management mode */
> @@ -6518,6 +6518,8 @@ affect the device's behavior. Current defined flags::
>    /* arm64, set for KVM_EXIT_DEBUG */
>    #define KVM_DEBUG_ARCH_HSR_HIGH_VALID  (1 << 0)
>  
> +  /* all architectures, set when the exit needs completion (via KVM_RUN) */
> +  #define KVM_RUN_NEEDS_COMPLETION  (1 << 15)
>  ::
>  
>  	/* in (pre_kvm_run), out (post_kvm_run) */
> @@ -6632,19 +6634,10 @@ requires a guest to interact with host userspace.
>  
>  .. note::
>  
> -      For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN,
> -      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR, KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL
> -      the corresponding operations are complete (and guest state is consistent)
> -      only after userspace has re-entered the kernel with KVM_RUN.  The kernel
> -      side will first finish incomplete operations and then check for pending
> -      signals.
> +      For some exits, userspace must re-enter the kernel with KVM_RUN to
> +      complete the exit and ensure guest state is consistent.
>  
> -      The pending state of the operation is not preserved in state which is
> -      visible to userspace, thus userspace should ensure that the operation is
> -      completed before performing a live migration.  Userspace can re-enter the
> -      guest with an unmasked signal pending or with the immediate_exit field set
> -      to complete pending operations without allowing any further instructions
> -      to be executed.
> +      See KVM_CAP_NEEDS_COMPLETION for details.
>  
>  ::
>  
> @@ -8239,7 +8232,7 @@ Note: Userspace is responsible for correctly configuring CPUID 0x15, a.k.a. the
>  core crystal clock frequency, if a non-zero CPUID 0x15 is exposed to the guest.
>  
>  7.36 KVM_CAP_X86_GUEST_MODE
> -------------------------------
> +---------------------------
>  
>  :Architectures: x86
>  :Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> @@ -8252,6 +8245,33 @@ KVM exits with the register state of either the L1 or L2 guest
>  depending on which executed at the time of an exit. Userspace must
>  take care to differentiate between these cases.
>  
> +7.37 KVM_CAP_NEEDS_COMPLETION
> +-----------------------------
> +
> +:Architectures: all
> +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> +
> +The presence of this capability indicates that KVM_RUN will set
> +KVM_RUN_NEEDS_COMPLETION in kvm_run.flags if KVM requires userspace to re-enter
> +the kernel KVM_RUN to complete the exit.
> +
> +For select exits, userspace must re-enter the kernel with KVM_RUN to complete
> +the corresponding operation, only after which is guest state guaranteed to be
> +consistent.  On such a KVM_RUN, the kernel side will first finish incomplete
> +operations and then check for pending signals.
> +
> +The pending state of the operation for such exits is not preserved in state
> +which is visible to userspace, thus userspace should ensure that the operation
> +is completed before performing state save/restore, e.g. for live migration.
> +Userspace can re-enter the guest with an unmasked signal pending or with the
> +immediate_exit field set to complete pending operations without allowing any
> +further instructions to be executed.
> +
> +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.

So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
must be present for all of these exits, right? And from what I can
tell, this capability is unconditionally advertised.

Yet, you don't amend arm64 to publish that flag. Not that I think this
causes any issue (even if you save the state at that point without
reentering the guest, it will be still be consistent), but that
directly contradicts the documentation (isn't that ironic? ;-).

Or is your intent to *relax* the requirements on arm64 (and anything
else but x86 and POWER)?

	M.

-- 
Without deviation from the norm, progress is not possible.

