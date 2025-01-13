Return-Path: <linuxppc-dev+bounces-5185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB0A0C0E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 19:59:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX1kp2xMrz3cdm;
	Tue, 14 Jan 2025 05:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736794738;
	cv=none; b=YSUz/AzuIyfm2joF2q+USQoXTUgbmiYXUOx28t67pWSUIK0TnLPKlPloaLXMhiT5zEgljykBaRlna2DYGXbkaZoCY7EaXcjYyHzrSsgheJSyX0jSwSGhToGL2v+Joh4924D5uSIOE/ab6P56yWziFahfoIJ1uW8mueCrC7pPwARfPqfIh93KCCXkYHWkBCr1WFI5cg3Ky0RRrsxWwT7GqLv4T+TfOHgkWq8eu4a+v7qVuC2PAAvAFTJ3QqGU/G2LVzc81eyZC1KRvKHR4rHQJHRI+g/0KKs6xsSICWCiB7Vyeuw0Ck2FoO3kgTTy2IpGiyira0/rXJ9/xNEvcp2VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736794738; c=relaxed/relaxed;
	bh=uwan4230Eb0GWwMOhozfXQlgkrr0Jk3ApSxALReE/p0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DC8pmAFI7+t/xGm49aOWFPRhX9BKaTuQq59CnzGhb4dYrGJ5Bq0UHa3efYXLLEkOo1QyOl8bFGp6kcCn4c/eESrjHynf6DaQMrUqJyihsEu9B87PtCKJqXIN+m6qF2I1UKo1dxjfQvC3PNFolM0YwNnMbrf0RQmPxNGRWRSGXVXLvX9HvXjqixb1SRbtFFYOIEaurFP3hZKDihgH/g6amPq+EIOdqgVlL1JT3MwGaTvcp5vAw2CxrhmZ3YRIAcp5rGp/2lCDqXIspWo9QrA+e6Vi+WlEpHV6s3aHUhC1NLiU/SrHb6T/24fl/84hrM7RCQKYaUawYplpEZKlyeYPGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=j9ypuLHJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3zmkfzwykdimzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=j9ypuLHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3zmkfzwykdimzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX1km3JX3z30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 05:58:54 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so7872543a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736794727; x=1737399527; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwan4230Eb0GWwMOhozfXQlgkrr0Jk3ApSxALReE/p0=;
        b=j9ypuLHJtvMOhZgUG/DdSLfrRkAL4Tu1AglWAX6CjkkloR5m1KaX0zfaAgb+9hHfaN
         06ClNrn15xqGulC1lzF6TsP2Hrz/CYbDcAGazKPR7Bj7dVOkKVwODpeWunxBq7GdHsAr
         fqcPlfsKBoAvE3ttHwauWAc4AbysdQywL6YkrvtGTAJstq1FdMMYN507hQCAcKxRDSVK
         ol+HR0Es//UN2GzrN5KtNuAhbtQRkD49GuhG5kdU3uZYAEDIvCSH90KUJo4p1c3gbLh5
         DMLKV3INI49j8ddZJx66mArGtVfTIJjKJMfYiiw1muPS5n7zQOaJ1DJTEeWYVVJXkPmd
         o9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736794727; x=1737399527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwan4230Eb0GWwMOhozfXQlgkrr0Jk3ApSxALReE/p0=;
        b=qH5oAOQ1U98q8A5YdBgETdZ98dLL0dlivf+zZnV77W9ltYnpUdxV/R7aUbwZXHdbIv
         I6x354a4eTRsDWZhBuEWifpPdM0hUelfjnP2VI3upQHI7ehGksrM6fJlGqcI2el4sfvr
         6BIyFHQvx5I1dQHGiLHPtyp8ABTgNbeyVINmaMl45HYLJ2QmhkvnxBDCTCVApskLodSC
         fFwkwU5rYzlsOqi5KzK6bBMkU4AVSn04E2CGlWALfKZc/n7VWFaWi5jFRYqrlxKObPNK
         KnQUXsl17N2xHXktHiMeJW9D6bm5J4nCB/BTatT2CyoF8lwjd7fjPTH5SOdAJeFV/q3z
         vRig==
X-Forwarded-Encrypted: i=1; AJvYcCWpPAlDEMEJuI+XtvW+Afio84gEvtJcPU1I5xhEtqFwjqyvh5YeboYqlR2rmD5mOsJscuWOYtBLALF2vso=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbizMiOL47ZMjZI2mDGZJBY0dVj+C13Bntxq6F2HqHtykFTUq8
	YdZtI0cCYELKofBdufUEUeX/RCOgqpkugY9aZ0GSKKmA7p19x/es6wBoAebOZx2E4zRuEYsF5t2
	KfA==
X-Google-Smtp-Source: AGHT+IH9c5/wT/tYnT2Ksuswivrz3/1NK3niqf+jjzVEmdiTAN7aTx3Xg3pUiP1uOtfflIlyc1vt7cYUYYg=
X-Received: from pfbfd28.prod.google.com ([2002:a05:6a00:2e9c:b0:727:3b66:ace])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2181:b0:725:ae5f:7f06
 with SMTP id d2e1a72fcca58-72d2201b86emr33470701b3a.23.1736794726627; Mon, 13
 Jan 2025 10:58:46 -0800 (PST)
Date: Mon, 13 Jan 2025 10:58:45 -0800
In-Reply-To: <86ikqiwq7y.wl-maz@kernel.org>
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
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com> <20250111012450.1262638-4-seanjc@google.com>
 <87ikqlr4vo.wl-maz@kernel.org> <Z4U03KRYy2DVEgJR@google.com> <86ikqiwq7y.wl-maz@kernel.org>
Message-ID: <Z4ViZb7rruRiN-Oe@google.com>
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Michael Ellerman <mpe@ellerman.id.au>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025, Marc Zyngier wrote:
> On Mon, 13 Jan 2025 15:44:28 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Sat, Jan 11, 2025, Marc Zyngier wrote:
> > > On Sat, 11 Jan 2025 01:24:48 +0000,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> > > > that KVM_RUN needs to be re-executed prior to save/restore in order to
> > > > complete the instruction/operation that triggered the userspace exit.
> > > > 
> > > > KVM's current approach of adding notes in the Documentation is beyond
> > > > brittle, e.g. there is at least one known case where a KVM developer added
> > > > a new userspace exit type, and then that same developer forgot to handle
> > > > completion when adding userspace support.
> > > 
> > > Is this going to fix anything? If they couldn't be bothered to read
> > > the documentation, let alone update it, how is that going to be
> > > improved by extra rules and regulations?
> > > 
> > > I don't see how someone ignoring the documented behaviour of a given
> > > exit reason is, all of a sudden, have an epiphany and take a *new*
> > > flag into account.
> > 
> > The idea is to reduce the probability of introducing bugs, in KVM or userspace,
> > every time KVM attaches a completion callback.  Yes, userspace would need to be
> > updated to handle KVM_RUN_NEEDS_COMPLETION, but once that flag is merged, neither
> > KVM's documentation nor userspace would never need to be updated again.  And if
> > all architectures took an approach of handling completion via function callback,
> > I'm pretty sure we'd never need to manually update KVM itself either.
> 
> You are assuming that we need this completion, and I dispute this
> assertion.

Ah, gotcha.

> > > > +The pending state of the operation for such exits is not preserved in state
> > > > +which is visible to userspace, thus userspace should ensure that the operation
> > > > +is completed before performing state save/restore, e.g. for live migration.
> > > > +Userspace can re-enter the guest with an unmasked signal pending or with the
> > > > +immediate_exit field set to complete pending operations without allowing any
> > > > +further instructions to be executed.
> > > > +
> > > > +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> > > > +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> > > > +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> > > > +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
> > > 
> > > So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
> > > must be present for all of these exits, right? And from what I can
> > > tell, this capability is unconditionally advertised.
> > > 
> > > Yet, you don't amend arm64 to publish that flag. Not that I think this
> > > causes any issue (even if you save the state at that point without
> > > reentering the guest, it will be still be consistent), but that
> > > directly contradicts the documentation (isn't that ironic? ;-).
> > 
> > It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():
> > 
> > 	if (run->exit_reason == KVM_EXIT_MMIO) {
> > 		ret = kvm_handle_mmio_return(vcpu);
> > 		if (ret <= 0)
> > 			return ret;
> > 	}
> 
> That's satisfying a load from the guest forwarded to userspace.

And MMIO stores, no?  I.e. PC needs to be incremented on stores as well.

> If the VMM did a save of the guest at this stage, restored and resumed it,
> *nothing* bad would happen, as PC still points to the instruction that got
> forwarded. You'll see the same load again.

But replaying an MMIO store could cause all kinds of problems, and even MMIO
loads could theoretically be problematic, e.g. if there are side effects in the
device that trigger on access to a device register.

