Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA092D55F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 17:52:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=My4FrErE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK2S143VHz3cb2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:52:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=My4FrErE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3gk6ozgykdokdplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK2RK4wndz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 01:51:55 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fb05b9e222so40944595ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720626713; x=1721231513; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2S/Ws8T8aRzTnaLMwEZxjsu7iN6mSUkQ05y/iw/B/rc=;
        b=My4FrErEVFTEyJ4Nrv9EIdW0YgvkiqNjxbStDKN9HYwXwxCkal03rAosCjhjcxmUDh
         TjExSKWlnTJEqhE8IBN2xofkuHCG0jOEN+uPd13EnZnd6ipHOcb3mZXsQwzTox9rZwoo
         fPSrOZS9iGpj4ngmDcobbtfPLos1zS8fcY85GKuZxDP3MS/XckOp4Nssqdj7AA2mHacA
         jOoXX0GmjLT2HM/BJ7gfTOxdzqTuTGLeft2wTTBRDK8Z51iha4nbKk8EPOi7A6kYU4GD
         7ycMWwPAqLrsW5tBTU7HvQ85wFQaL+RbuPyCh4cZUzOVAx09S8+LryOmaH1Gjs4Zm5Zl
         ElFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626713; x=1721231513;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2S/Ws8T8aRzTnaLMwEZxjsu7iN6mSUkQ05y/iw/B/rc=;
        b=kqkcDoGLfMkJzu4okQtVkjF+TXItKji2AS9u9SidOFVmoHXq7uLT7mUN7Vui7JydMW
         2B6hJormwQ7k0nnZigSO6Mr+LSRD3gdNw/u9tIQplpUIjU/fRUUPTaJlZoUQhxYXOUdB
         AX42w7234HDmLPbyXobIutPhIuc4CbxgcfHn4/+2BZmt6NCqkjYpoG6J88nIG04GJjOY
         B08Wc3RhT2TGN291zB161PPAEFMBrUzfCvyYTX3ysqrWRQ4FZgS8DiTx1HXiy/PUfVxP
         LNSwMbELHA8Pqk+d+QcDbJPdTJBlfk54iaGLkpbjggcvSM7XBRn2+wsu/VbSgtpECR84
         N5kA==
X-Forwarded-Encrypted: i=1; AJvYcCVDY/DrcNrFSOlhyyj34cVTuvBITMxNq/N4rLlUD9hpl2sOeRlPGdgGPUg8W8DTXfYfoy7oMft5jAyenZyNw80W9mLad28pjjEdzyjMNA==
X-Gm-Message-State: AOJu0YxjubOMYQJEG9mN0qpFIpmTvreMnNCVB3RyqztG9bcFS3Dk0Dco
	aJE6oCAXOET8qq6SFXVFuhTJLPJNgrIrzLAm7B1Rta6LfioK6hlQ1o9j2mUKpTZY9WFjznI/d5c
	0Pw==
X-Google-Smtp-Source: AGHT+IGFDWyL4oVIv+kd3eR4ozKAgHx5u/arXUHJsTVnFMVwi1+9LesGIr7Enb4S0IMxOwQQwYsx6SyO0KU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dad2:b0:1f7:175a:69ab with SMTP id
 d9443c01a7336-1fbb6ce3e7dmr4023085ad.4.1720626712651; Wed, 10 Jul 2024
 08:51:52 -0700 (PDT)
Date: Wed, 10 Jul 2024 08:51:51 -0700
In-Reply-To: <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com> <171874683295.1901599.10170158200177384059.b4-ty@google.com>
 <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Message-ID: <Zo6uFz187FBYnQiY@google.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01, 2024, David Matlack wrote:
> On Tue, Jun 18, 2024 at 2:41=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> > > This series changes KVM to mark a vCPU as preempted/ready if-and-only=
-if
> > > it's scheduled out while running. i.e. Do not mark a vCPU
> > > preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> > > when userspace is doing KVM_RUN with immediate_exit=3Dtrue.
> > >
> > > This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> > > set st->preempted when going back to user space"), which  stopped
> > > marking a vCPU as preempted when returning to userspace. But if users=
pace
> > > invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be mark=
ed
> > > preempted/ready. This is arguably incorrect behavior since the vCPU w=
as
> > > not actually preempted while the guest was running, it was preempted
> > > while doing something on behalf of userspace.
> > >
> > > [...]
> >
> > Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you'=
ve been
> > away from upstream too long ;-) ).  Thanks!
>=20
> Thanks for the cleanups. Looks like you replaced "[Tt]his commit"
> throughout. Anything else (so I can avoid the same mistakes in the
> future)?

I don't think so?  The "This commit" stuff is the only thing that I remembe=
r, so
any other tweaks can't be that important :-)
