Return-Path: <linuxppc-dev+bounces-5187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7500AA0C1AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 20:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX2cG1PgXz3cgV;
	Tue, 14 Jan 2025 06:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736797102;
	cv=none; b=AQdDICwn5auHK++1KI5zsTAHaWSuKwGfmJvNb+tJMJx00bAnWGPhqhsEqsHS8fjAddG6oYl5XQLngSj7eaNA7WS+uGHQTIVU9Lpw9ImufwhfD3NJHUbwXJK3uEpy/xs5jegTCWZx/PS+gB5Fo4SdYjsPJKIn3ptse7Ffz1OJmJXfY7A/3jp+eP2xrjYyJb2Y4hf4CS0SKAsXre/HbaCMe8yivYa8ni+FvDvPD5Q5T8jDReyh6hqyDdXHJ00pOFYLrcXkRtXWRytxolgURCPWQjpUat8tiLxDTGZgDYEIxR5LPwIHjs0os+J2KTmr9HYPBBjoK+xxXtncnIlezp+heg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736797102; c=relaxed/relaxed;
	bh=/rjWWyywyHLKDMYuI2ahh5YT8tgxFksz90V6c+HpW8o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a77ZRLQOpqD2ECKqSPDD6rvd61AciPF3N6HXsydsJUOSzcfusPIsOCzdEDsPUAlk2n0E6cgcBpA07+x/PXk+87+fQRAtFNxtX9ksSlXH/YWLjnwrysnH1sZLz7ByY9okOhFIP4byuaIReV8/XJ93i2GiHO5mClUzt0oMHZFdYrw7wo8Pu4HYeOBCS/aXeBPVsfacyoWopeFL6m/nmdfTC9S/N2KC4ZDLxrC96JMhPK2e7jP9Cs+UBYhqX+1DtfUQ+rAQYwy+I5CQFlgqsoa7pT9GmIc3IdKqXXPW1pKM2C+0h7cq4DlWmQxFl9GlkOgKaLz2TvHDncIIkGY2qzsZSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mYmJ9Ai9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mYmJ9Ai9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX2cD6k6kz3cfT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 06:38:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 212D4A41340;
	Mon, 13 Jan 2025 19:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA9AC4CEE1;
	Mon, 13 Jan 2025 19:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736797092;
	bh=yDf65y7+IH8PA/+JZhqUXTr3IxuryhUAx9rLn3yyULs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mYmJ9Ai9JhKhbnL/24T8j29IHGHpFxP7mY+XRsEHVBJu++4+QAEE05xDeaQ0loZUH
	 uI9f//3bbpxPTDmCqxr8uK1bsOeR84DIBfnfN314ou1gekXcm4sWwtM8IoL1N9owcO
	 uYNOxhB4CMZQndJw7LPUNF3sjdk3UrS69dt9otVHmnzFz66RM27r5QwFGcDyVkSFe5
	 qfh4TD/mPUmFZ3N1TK4/VhH3sEE84uIZjQv4/qGrhfUtTD6xplhEQJi2rG2n4E+wu6
	 4bmcAAje2IIvRAwPdYo90ZHDMB1+pS1ASzL73O2f2C+D4HdK0TjfHizjClScKO7qfz
	 257t6nkLTBD/w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXQGH-00Bltd-Ms;
	Mon, 13 Jan 2025 19:38:09 +0000
Date: Mon, 13 Jan 2025 19:38:08 +0000
Message-ID: <87bjwaqzbz.wl-maz@kernel.org>
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
In-Reply-To: <Z4ViZb7rruRiN-Oe@google.com>
References: <20250111012450.1262638-1-seanjc@google.com>
	<20250111012450.1262638-4-seanjc@google.com>
	<87ikqlr4vo.wl-maz@kernel.org>
	<Z4U03KRYy2DVEgJR@google.com>
	<86ikqiwq7y.wl-maz@kernel.org>
	<Z4ViZb7rruRiN-Oe@google.com>
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

On Mon, 13 Jan 2025 18:58:45 +0000,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On Mon, Jan 13, 2025, Marc Zyngier wrote:
> > On Mon, 13 Jan 2025 15:44:28 +0000,
> > Sean Christopherson <seanjc@google.com> wrote:
> > > 
> > > On Sat, Jan 11, 2025, Marc Zyngier wrote:
> > > > On Sat, 11 Jan 2025 01:24:48 +0000,
> > > > Sean Christopherson <seanjc@google.com> wrote:
> > > > > 
> > > > > Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> > > > > that KVM_RUN needs to be re-executed prior to save/restore in order to
> > > > > complete the instruction/operation that triggered the userspace exit.
> > > > > 
> > > > > KVM's current approach of adding notes in the Documentation is beyond
> > > > > brittle, e.g. there is at least one known case where a KVM developer added
> > > > > a new userspace exit type, and then that same developer forgot to handle
> > > > > completion when adding userspace support.
> > > > 
> > > > Is this going to fix anything? If they couldn't be bothered to read
> > > > the documentation, let alone update it, how is that going to be
> > > > improved by extra rules and regulations?
> > > > 
> > > > I don't see how someone ignoring the documented behaviour of a given
> > > > exit reason is, all of a sudden, have an epiphany and take a *new*
> > > > flag into account.
> > > 
> > > The idea is to reduce the probability of introducing bugs, in KVM or userspace,
> > > every time KVM attaches a completion callback.  Yes, userspace would need to be
> > > updated to handle KVM_RUN_NEEDS_COMPLETION, but once that flag is merged, neither
> > > KVM's documentation nor userspace would never need to be updated again.  And if
> > > all architectures took an approach of handling completion via function callback,
> > > I'm pretty sure we'd never need to manually update KVM itself either.
> > 
> > You are assuming that we need this completion, and I dispute this
> > assertion.
> 
> Ah, gotcha.
> 
> > > > > +The pending state of the operation for such exits is not preserved in state
> > > > > +which is visible to userspace, thus userspace should ensure that the operation
> > > > > +is completed before performing state save/restore, e.g. for live migration.
> > > > > +Userspace can re-enter the guest with an unmasked signal pending or with the
> > > > > +immediate_exit field set to complete pending operations without allowing any
> > > > > +further instructions to be executed.
> > > > > +
> > > > > +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> > > > > +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> > > > > +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> > > > > +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
> > > > 
> > > > So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
> > > > must be present for all of these exits, right? And from what I can
> > > > tell, this capability is unconditionally advertised.
> > > > 
> > > > Yet, you don't amend arm64 to publish that flag. Not that I think this
> > > > causes any issue (even if you save the state at that point without
> > > > reentering the guest, it will be still be consistent), but that
> > > > directly contradicts the documentation (isn't that ironic? ;-).
> > > 
> > > It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():
> > > 
> > > 	if (run->exit_reason == KVM_EXIT_MMIO) {
> > > 		ret = kvm_handle_mmio_return(vcpu);
> > > 		if (ret <= 0)
> > > 			return ret;
> > > 	}
> > 
> > That's satisfying a load from the guest forwarded to userspace.
> 
> And MMIO stores, no?  I.e. PC needs to be incremented on stores as well.

Yes, *after* the store as completed. If you replay the instruction,
the same store comes out.

>
> > If the VMM did a save of the guest at this stage, restored and resumed it,
> > *nothing* bad would happen, as PC still points to the instruction that got
> > forwarded. You'll see the same load again.
> 
> But replaying an MMIO store could cause all kinds of problems, and even MMIO
> loads could theoretically be problematic, e.g. if there are side effects in the
> device that trigger on access to a device register.

But that's the VMM's problem. If it has modified its own state and
doesn't return to the guest to complete the instruction, that's just
as bad as a load, which *do* have side effects as well.

Overall, the guest state exposed by KVM is always correct, and
replaying the instruction is not going to change that. It is if the
VMM is broken that things turn ugly *for the VMM itself*, and I claim
that no amount of flag being added is going to help that.

	M.

-- 
Without deviation from the norm, progress is not possible.

