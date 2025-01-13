Return-Path: <linuxppc-dev+bounces-5172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88DCA0BE27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 17:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWz5C25rWz3cgW;
	Tue, 14 Jan 2025 03:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736787583;
	cv=none; b=CnUykQsRA3l8JHo9m8llTKF4aZWfcxnGgHbQpZnnTpnQhUnC0aR2KAe1SD6yBEc3e0+AKj4nE+PIogQrqFC5UzTAATyYfb+GW9FihyMo2jYW/2tb4U+Z3KJGbzsg0z/RwVFgFmDPrbu1AxtCmhvysoWftqyM7BQN3PCr7R5j49GNIyGNzE7acq/0p958sTa+dL/mlJ3GC0Zzcwbq2G50/UD9HRQuRdZFvIzk1GTS0PGoiMFpgVJhq7oNOmJTd+PVal0naQy/NaNKg/h3PS5fzinknKFppzj9kZTKQ8U+9sQy0H2IpgfmGqM9g7V55mufR6lM69FyRUxqAZlXcwB/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736787583; c=relaxed/relaxed;
	bh=lNi4ttNXrfrXDMynei5+HVfxxr2BRc6T71jVjH9tT8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uk3y8xHPaPkQ9KYiAuxLM7brWhozs6+eCVPgJyirqtNZuOWiGoB/IcM90mt41A5EreKmzYQrbGfz8Lt+IyaKH4rqs+0nVHVRC9y/kSEHWxvVBUcpTbihvBRZseP+njVZ7JZhz+PKiEpy7Hzz9ln+zPlqIHAUyg3LPJJAtjZevsuNVw2XuZ5AqTHvtCKyiQ/SgNzlUAMzEzhFkza32DxrwD8Na2LnWxqJQ9acfhUAztcWnr9D5lRpZ4iJ7lWi9rmnhy2wxcBDLUu2hEnjUT4dFFMPtNGK7GX4O+2rBcxas9MZRlA0CTlqABxqxEkxP78dCTjBwqz0U8me/rAR4rsMDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dH6fQyWr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3eeafzwykdf0n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dH6fQyWr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3eeafzwykdf0n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWz593gZGz3cgV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 03:59:40 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2166f9f52fbso138436675ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 08:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736787576; x=1737392376; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNi4ttNXrfrXDMynei5+HVfxxr2BRc6T71jVjH9tT8o=;
        b=dH6fQyWrK2WvhILT+K0ZUWpscC/7oWtplgbxElWvX2UGGxDH/HQbuN+xPhTea5pexd
         fFjokuP01BazEJTtg9LtpcFf84n5/9BvlO1Dy0VcnYZIXZNziZ877EdjoCZjGzPHKlSh
         JjZAwD65S+eDbWY/v8FD57U/Bu7cy0Pvl3+mZ9YkguJEpnfEhYumJ1d9AjcPupmeZAAJ
         sL82IbMffjTQjli34WgJURKNQOtuQ2BzvXTg9Fz1Si6kHcK1lmbFf2M3FrLoMRZYiPVi
         ACf0kJhTX6s/A6aKUwMrtMzrJTAfCSBeImCjNkaAmZ9Vm48elHRiYX2nrqrSyNFIsXEw
         VhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787576; x=1737392376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNi4ttNXrfrXDMynei5+HVfxxr2BRc6T71jVjH9tT8o=;
        b=D+Q1xSwZ2GIXqcCSS0w+Izk7UYlKXb19QtX5FxDi+8MbM5AvBHftNLW+ZEKgtohP/N
         mlIErQgKoSzwWWFXr8S3Xh1iIw/axSwuX68wj1cFdJNf8VqaLvaXjxwaZ2etUkEqQQ9v
         5D7kbGhLHpqwo03/1RoQf7b6WVim5ySvQj8GaOuiEhzrf4I680/IReqSuIGa+47OYgWb
         4mMhRnk5LMJCBBnULS6qsJcC0gZtO8Z9y2A79WG9lekM7kEU2OceeSAg5mhjfbelCd7j
         S1HnLPbuVFY9J5PBdT6hH39JxGGByLC46aXkfcdGgIOYXTJNrlxVJ7qj/wgDRYTNAp1k
         PTIA==
X-Forwarded-Encrypted: i=1; AJvYcCW2FqgJBq8TYA9Si0O6wFcV8MPrdDQqB9AI6Z0z155eMbd6S2QZCoKaKArjUZ9VNQB3dyvw8ATp4FwEubQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzjdupac/hbjudxHUYekTq0p0qqABr7Xhv88lGkF2Yd9LeU+jNe
	epVEfgw2xuJVDwshXflLF5h705v29mC+RR4K56Ui1XbECq58FBsPDIUWwfQokYC02QVAGVYL9Zc
	szg==
X-Google-Smtp-Source: AGHT+IENu5ZK9kPpRwdS1+EeXpR6nVCXMTR+IXJJExBjfsTrkclg65OJwbQ4mKEvtimncd2M4JDnxOz3MCM=
X-Received: from plks12.prod.google.com ([2002:a17:903:2cc:b0:211:fb3b:763b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74b:b0:215:5ea2:654b
 with SMTP id d9443c01a7336-21a83f3eebemr334554025ad.1.1736787576636; Mon, 13
 Jan 2025 08:59:36 -0800 (PST)
Date: Mon, 13 Jan 2025 08:59:35 -0800
In-Reply-To: <Z4R12HOD1o8ETYzm@intel.com>
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
 <Z4R12HOD1o8ETYzm@intel.com>
Message-ID: <Z4VGdxyswQ6qcKR0@google.com>
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025, Chao Gao wrote:
> On Fri, Jan 10, 2025 at 05:24:48PM -0800, Sean Christopherson wrote:
> >Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> >that KVM_RUN needs to be re-executed prior to save/restore in order to
> >complete the instruction/operation that triggered the userspace exit.
> >
> >KVM's current approach of adding notes in the Documentation is beyond
> >brittle, e.g. there is at least one known case where a KVM developer added
> >a new userspace exit type, and then that same developer forgot to handle
> >completion when adding userspace support.
> 
> This answers one question I had:
> https://lore.kernel.org/kvm/Z1bmUCEdoZ87wIMn@intel.com/
> 
> So, it is the VMM's (i.e., QEMU's) responsibility to re-execute KVM_RUN in this
> case.

Yep.

> Btw, can this flag be used to address the issue [*] with steal time accounting?
> We can set the new flag for each vCPU in the PM notifier and we need to change
> the re-execution to handle steal time accounting (not just IO completion).
> 
> [*]: https://lore.kernel.org/kvm/Z36XJl1OAahVkxhl@google.com/

Uh, hmm.  Partially?  And not without creating new, potentially worse problems.

I like the idea, but (a) there's no guarantee a vCPU would be "in" KVM_RUN at
the time of suspend, and (b) KVM would need to take vcpu->mutex in the PM notifier
in order to avoid clobbering the current completion callback, which is definitely
a net negative (hello, deadlocks).

E.g. if a vCPU task is in userspace processing emulated MMIO at the time of
suspend+resume, KVM's completion callback will be non-zero and must be preserved.
And if a vCPU task is in userspace processing an exit that _doesn't_ require
completion, setting KVM_RUN_NEEDS_COMPLETION would likely be missed by userspace,
e.g. if userspace checks the flag only after regaining control from KVM_RUN.

In general, I think setting KVM_RUN_NEEDS_COMPLETION outside of KVM_RUN would add
too much complexity.

> one nit below,
> 
> >--- a/arch/x86/include/uapi/asm/kvm.h
> >+++ b/arch/x86/include/uapi/asm/kvm.h
> >@@ -104,9 +104,10 @@ struct kvm_ioapic_state {
> > #define KVM_IRQCHIP_IOAPIC       2
> > #define KVM_NR_IRQCHIPS          3
> > 
> >-#define KVM_RUN_X86_SMM		 (1 << 0)
> >-#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
> >-#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
> >+#define KVM_RUN_X86_SMM			(1 << 0)
> >+#define KVM_RUN_X86_BUS_LOCK		(1 << 1)
> >+#define KVM_RUN_X86_GUEST_MODE		(1 << 2)
> >+#define KVM_RUN_X86_NEEDS_COMPLETION	(1 << 2)
> 
> This X86_NEEDS_COMPLETION should be dropped. It is never used.

Gah, thanks!

