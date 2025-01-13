Return-Path: <linuxppc-dev+bounces-5163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CEEA0BC53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:44:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWxQW4Symz3cYr;
	Tue, 14 Jan 2025 02:44:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736783075;
	cv=none; b=kpGsgLoLPN87JLWVqX6ZYOdsMMeZePnqJelJ+AVtvUFgSjaCLLhyNb2Q32R1t/MFAzef9R7qXeRxRZvIERKvgQ70BSz6JXZZSyFLrOCcrZG3XmrQYGWoHNFPQqHUWnVFUI7FRaHduVB/8I95qu4tDakK7c0ObUHgDcqk7giljy0MoXualYkiNthLZ/TWYV+1Sx0UdcNnxNwfg/fQwS8cE4TrZPghiPLrdIpf9JSkvWnNFrVQUXhh2yXBRHcsGB88JtG+Y/PCRAPwcAkDkBcq6+9xc0aJShfTwjScdNOgEOiAKF9o3hemMTGDLokfnqeL6NVCKjrYrcpiku4KxnKlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736783075; c=relaxed/relaxed;
	bh=f9GN/9Nt3vZP1g4PXg+O1YxepiT+zT9oJT9rhlVkhGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M5ZQjnvdh5hEp4OdhsM4tDk6r5iiLzj58VrrifEsa0QawtMmcm11Zd0UYSMHyRwbyUHP6iZ/Xq9ynEHgeKUMnp7SiQ04rRIWx4ek4Th5zmXy3Yzk4A9OYlOMd/pbE9uoToJRTqsS8eDiZ76TT3Gi1TFCdfRyQBQeuj28QTevYhW1m2gT8EvLXXgmGY9dWXypoAimGQlRCe8pakQj4zO8t521Uy/dHIIVzuGZRc093Jauy5z2nZxBhDSRTmZOT+QYSEUSnW8ywIsLCW6BImIxtSkci8fZUA1Sw3Cjt+umzsEe9KMYfLlus9YovV5yQ3JB/Xy6jBMXK/jzLszX2C5g7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cP0Tq/Qr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=33jsfzwykdj8rd9mibfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cP0Tq/Qr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=33jsfzwykdj8rd9mibfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWxQV0brDz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:44:33 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2163dc0f689so114251205ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736783070; x=1737387870; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9GN/9Nt3vZP1g4PXg+O1YxepiT+zT9oJT9rhlVkhGw=;
        b=cP0Tq/Qrc5kDu5/XbRPd12z1fXt+jbrtVRFRQKscW9cMiyMQpyj/nlzjMF1gCnnJE7
         fag/b5y9BFnNTSTag934vr3e2KNE9jARFQyaZHMWOWmNQZyEUNJ/qKFOAF9BMBlqZyke
         GzV+bA8aZPsM4SqVu7w8xABHaAc/0T/ByZPMX6DODUHRvnS92Pf526uPrulSPC7vt+0M
         9SogH7Z7Z0kkC97fOyCYvPo4CKMA9XNNksYZ9tCuZpJx88jd0cn7xq3g5r32KWa345l8
         Ful60xHpIbWNmHaAhtOUus877AndzHt4AJrUUPlrq5PxqpfNMOVmADEpzCVODkIrhCE8
         BEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783070; x=1737387870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9GN/9Nt3vZP1g4PXg+O1YxepiT+zT9oJT9rhlVkhGw=;
        b=wsqA3yu42fGAVSHNBdITBRYSdu+tTEn053ZyOrqrQenmAvUsEc0q2o/qfL7DcUjMKo
         8nv0Z8gL1Focxvuv8OddS/IcnNI1sSGYkrowO+NQO3oxxg4vnG7Fw//k3r/yrayI5Yi0
         3g3NSLH0iIQmhzg4C2AE3+yldob0NHwe9prfkpNXqBpjkTRxxUIrln9CvEOCPhedKJzC
         805ObYQeirUb0dYJWdx9pKho58aHIaZttiPmDV2aPl6TVi8JprnZIlduro8sa1kmD35P
         xjfl/F/1YT0UYA38GXH4sel32LLiwfsBsplWmyu1g08IHswc9XEgciuhfMYdTJZeq5cl
         68GA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2OrI/KEWu7T/c0wCNwNVWClLqw3Wg3SzHX5V3mGPNekQx3FoEwlvxw1UiSMdGZcHgnb9SdUISIqqmFo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBf3D9sefgJFsamftZcAjVdY2lcSrnyCJIEmaIacpEwE6dgseF
	E1X2EZZTq2SSqGfv8Xs2s9ocYb8lygiZiffLwGitrlpGnY2NAcfpUgezAQQ0ZrUZXmEE5VSrufn
	urw==
X-Google-Smtp-Source: AGHT+IHIQyazhiyyUpnFFe5650540BmH10WSCzq7nQUkxQTSPWj6gISntiQcqyGsVty8NrTJi6F4Z/IpKIc=
X-Received: from pfbfh41.prod.google.com ([2002:a05:6a00:3929:b0:72a:bc54:8507])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3993:b0:1e1:adb9:d1a6
 with SMTP id adf61e73a8af0-1e88d0f000fmr33694244637.41.1736783070268; Mon, 13
 Jan 2025 07:44:30 -0800 (PST)
Date: Mon, 13 Jan 2025 07:44:28 -0800
In-Reply-To: <87ikqlr4vo.wl-maz@kernel.org>
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
 <87ikqlr4vo.wl-maz@kernel.org>
Message-ID: <Z4U03KRYy2DVEgJR@google.com>
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

On Sat, Jan 11, 2025, Marc Zyngier wrote:
> On Sat, 11 Jan 2025 01:24:48 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> > that KVM_RUN needs to be re-executed prior to save/restore in order to
> > complete the instruction/operation that triggered the userspace exit.
> > 
> > KVM's current approach of adding notes in the Documentation is beyond
> > brittle, e.g. there is at least one known case where a KVM developer added
> > a new userspace exit type, and then that same developer forgot to handle
> > completion when adding userspace support.
> 
> Is this going to fix anything? If they couldn't be bothered to read
> the documentation, let alone update it, how is that going to be
> improved by extra rules and regulations?
> 
> I don't see how someone ignoring the documented behaviour of a given
> exit reason is, all of a sudden, have an epiphany and take a *new*
> flag into account.

The idea is to reduce the probability of introducing bugs, in KVM or userspace,
every time KVM attaches a completion callback.  Yes, userspace would need to be
updated to handle KVM_RUN_NEEDS_COMPLETION, but once that flag is merged, neither
KVM's documentation nor userspace would never need to be updated again.  And if
all architectures took an approach of handling completion via function callback,
I'm pretty sure we'd never need to manually update KVM itself either.

> > +7.37 KVM_CAP_NEEDS_COMPLETION
> > +-----------------------------
> > +
> > +:Architectures: all
> > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > +
> > +The presence of this capability indicates that KVM_RUN will set
> > +KVM_RUN_NEEDS_COMPLETION in kvm_run.flags if KVM requires userspace to re-enter
> > +the kernel KVM_RUN to complete the exit.
> > +
> > +For select exits, userspace must re-enter the kernel with KVM_RUN to complete
> > +the corresponding operation, only after which is guest state guaranteed to be
> > +consistent.  On such a KVM_RUN, the kernel side will first finish incomplete
> > +operations and then check for pending signals.
> > +
> > +The pending state of the operation for such exits is not preserved in state
> > +which is visible to userspace, thus userspace should ensure that the operation
> > +is completed before performing state save/restore, e.g. for live migration.
> > +Userspace can re-enter the guest with an unmasked signal pending or with the
> > +immediate_exit field set to complete pending operations without allowing any
> > +further instructions to be executed.
> > +
> > +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> > +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> > +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> > +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
> 
> So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
> must be present for all of these exits, right? And from what I can
> tell, this capability is unconditionally advertised.
> 
> Yet, you don't amend arm64 to publish that flag. Not that I think this
> causes any issue (even if you save the state at that point without
> reentering the guest, it will be still be consistent), but that
> directly contradicts the documentation (isn't that ironic? ;-).

It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():

	if (run->exit_reason == KVM_EXIT_MMIO) {
		ret = kvm_handle_mmio_return(vcpu);
		if (ret <= 0)
			return ret;
	}

> Or is your intent to *relax* the requirements on arm64 (and anything
> else but x86 and POWER)?

