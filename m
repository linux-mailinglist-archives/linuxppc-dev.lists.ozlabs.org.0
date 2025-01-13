Return-Path: <linuxppc-dev+bounces-5184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519AA0BF68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX0P35NYSz3cYb;
	Tue, 14 Jan 2025 04:58:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736791111;
	cv=none; b=gTKa+PdPI1WqDVWAuHyh4UODtkAZaGoaP87xH8dswFkYUC/byS1SpLS8T0kW5rNnx0Bvs+cgXavOGZ06EGG2Oy+g+6/dRx7mr6m+qtt/PjFhFC2qDyiiXoAfMUOSV5ykZEIOwRyPcVq/o3mzdmH5fv4zmGqRY/8f5u4Zu9YP9EB9tszupyHXJjX45KGLIps52pjn7bhNzG2J5RD4J2fMYFFvX+ISWpHa31QwZfMFObOlfVxJZ6LXwmnG3aFRLd6fXwVtY5Bt/BzPm/zUibPgVsR/IiRTG6SYK23EqlfXUhZAzTCqMUeIubIpQgeh3B+CgI/wQDR3Is97NlP/P/BFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736791111; c=relaxed/relaxed;
	bh=f0HdX6nZDX+G98yLEbZCGcTbMpwIzUuclg8fJaP7sTA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZtyjjXEq/35OCQQVdajL4nCZgQfeblyHDXDwDDZlq5N8aPTkTR6mm0KJjljkys06F7x+bn2wCe41yL2cBI3vj/rGBRerFyXpJ/EALyPkIjjOk4l+c02i+apgkrtxjO097eWBtHAtnz4ihsDYj+5INA31M5HOFmRpO8xIiIDwSmCIrS9KwFOqouHO7Don+nKHS01WX20cMs240wKuvLvgRuwPvNMrlQMP1wfMk8NZcDoeSBq1JlLlYBocbbM/nVwNoIyDd3g1nQ3nGW31w7R2jdDbxIduhVOliLLgsVIv1d6OoNXyczLW0qUwvTgCION97TxV7CFB25nzs66y/9F8iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psvnlW4w; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psvnlW4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX0P24qGVz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:58:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ECC55C56C1;
	Mon, 13 Jan 2025 17:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12333C4CED6;
	Mon, 13 Jan 2025 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736791108;
	bh=C4U6jDO5tq6E1mF/aBnMvfQnGQRHeO89RHzRkvIhJs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=psvnlW4wafKLVUpZBhNf6LkVPQOrFv6SKqJM0kifmMX54rU4xub0H+UAf1xugSgmM
	 moc6VjZ331Ircoli93W25Z8NosRTi9AbmDVjtUbn8IpTreweH93OkwH4lY3aTOPFMJ
	 bz/tgzDFfnETQHbGpaYrQTkJRGOzkV8n2TWGPiwWKxXZGWLddZk1KH72egmd275I+7
	 02c3/sDd0VfdinwVbal7Pbu33AfO2Yp5TcXkNp2RnKCeXQfi5DXuZc0kAoPCf6KO3L
	 rE4n6tNNW/hFUrUtOlc8j3jebW9cEG+0NLmZRFl97Lj/g4up9g8GXP8V+8B8HwW9jW
	 sUzQJW0KDIZCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXOhl-00Bj4p-S9;
	Mon, 13 Jan 2025 17:58:25 +0000
Date: Mon, 13 Jan 2025 17:58:25 +0000
Message-ID: <86ikqiwq7y.wl-maz@kernel.org>
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
In-Reply-To: <Z4U03KRYy2DVEgJR@google.com>
References: <20250111012450.1262638-1-seanjc@google.com>
	<20250111012450.1262638-4-seanjc@google.com>
	<87ikqlr4vo.wl-maz@kernel.org>
	<Z4U03KRYy2DVEgJR@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
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
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 15:44:28 +0000,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On Sat, Jan 11, 2025, Marc Zyngier wrote:
> > On Sat, 11 Jan 2025 01:24:48 +0000,
> > Sean Christopherson <seanjc@google.com> wrote:
> > > 
> > > Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> > > that KVM_RUN needs to be re-executed prior to save/restore in order to
> > > complete the instruction/operation that triggered the userspace exit.
> > > 
> > > KVM's current approach of adding notes in the Documentation is beyond
> > > brittle, e.g. there is at least one known case where a KVM developer added
> > > a new userspace exit type, and then that same developer forgot to handle
> > > completion when adding userspace support.
> > 
> > Is this going to fix anything? If they couldn't be bothered to read
> > the documentation, let alone update it, how is that going to be
> > improved by extra rules and regulations?
> > 
> > I don't see how someone ignoring the documented behaviour of a given
> > exit reason is, all of a sudden, have an epiphany and take a *new*
> > flag into account.
> 
> The idea is to reduce the probability of introducing bugs, in KVM or userspace,
> every time KVM attaches a completion callback.  Yes, userspace would need to be
> updated to handle KVM_RUN_NEEDS_COMPLETION, but once that flag is merged, neither
> KVM's documentation nor userspace would never need to be updated again.  And if
> all architectures took an approach of handling completion via function callback,
> I'm pretty sure we'd never need to manually update KVM itself either.

You are assuming that we need this completion, and I dispute this
assertion.

>
> > > +7.37 KVM_CAP_NEEDS_COMPLETION
> > > +-----------------------------
> > > +
> > > +:Architectures: all
> > > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > > +
> > > +The presence of this capability indicates that KVM_RUN will set
> > > +KVM_RUN_NEEDS_COMPLETION in kvm_run.flags if KVM requires userspace to re-enter
> > > +the kernel KVM_RUN to complete the exit.
> > > +
> > > +For select exits, userspace must re-enter the kernel with KVM_RUN to complete
> > > +the corresponding operation, only after which is guest state guaranteed to be
> > > +consistent.  On such a KVM_RUN, the kernel side will first finish incomplete
> > > +operations and then check for pending signals.
> > > +
> > > +The pending state of the operation for such exits is not preserved in state
> > > +which is visible to userspace, thus userspace should ensure that the operation
> > > +is completed before performing state save/restore, e.g. for live migration.
> > > +Userspace can re-enter the guest with an unmasked signal pending or with the
> > > +immediate_exit field set to complete pending operations without allowing any
> > > +further instructions to be executed.
> > > +
> > > +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> > > +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> > > +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> > > +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
> > 
> > So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
> > must be present for all of these exits, right? And from what I can
> > tell, this capability is unconditionally advertised.
> > 
> > Yet, you don't amend arm64 to publish that flag. Not that I think this
> > causes any issue (even if you save the state at that point without
> > reentering the guest, it will be still be consistent), but that
> > directly contradicts the documentation (isn't that ironic? ;-).
> 
> It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():
> 
> 	if (run->exit_reason == KVM_EXIT_MMIO) {
> 		ret = kvm_handle_mmio_return(vcpu);
> 		if (ret <= 0)
> 			return ret;
> 	}

That's satisfying a load from the guest forwarded to userspace. If the
VMM did a save of the guest at this stage, restored and resumed it,
*nothing* bad would happen, as PC still points to the instruction that
got forwarded. You'll see the same load again.

As for all arm64 synchronous exceptions, they are idempotent, and can
be repeated as often as you want without side effects.

	M.

-- 
Without deviation from the norm, progress is not possible.

