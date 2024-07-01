Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152C91E6F2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 19:53:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x4FleGd4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCYYL2pXJz3c8Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 03:53:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x4FleGd4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCYXZ3Xf9z3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 03:52:29 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4256742f67fso24458085e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719856341; x=1720461141; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1/3Mqv5bU7Lm+/6Z/xl/QjEG/rO3YJRZuHHrfT9XMs=;
        b=x4FleGd4eFT0wMYXP4TWOVMghIE10+lVRxC+LTTYCYLKtv7XomOUZNeNRez7DXn8FQ
         wrsSa11bwoaYvpHq1upFl7FRmC/YU37TyowKBHKAaKzLYm+qldb+w+IunNA/8S3Q2KG0
         cYIw2/aCEXdYzqNsKU8u+3K4Gq+ElSa+KHstCL4wYOPbf7CA5Mhu1nlSEnSfqa46HEEo
         tcMDdFdRrwCRTWcvZgN9B5QKTmWbnwPqXluiyNZ+ZhbAsC9HvRfFrIlc5VnSYP7P0JYv
         dzFckggCN+A76GGiCsPvM7CFhwROgtH0yIIdlNhRdlltIGh8w3iRNm07oqmQ9JO+YTYJ
         QNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719856341; x=1720461141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1/3Mqv5bU7Lm+/6Z/xl/QjEG/rO3YJRZuHHrfT9XMs=;
        b=CS8kaecSCyshWpDmWlMg7FvZlQMc3b3jeq3vLuRZa2TXpSa6sSWQsgnHlaxX87I9xr
         mflHmzVgJxc5HqFUM+sUqwMfm949Og1K7lbxrvTWMV/vgD67z7dKv0XV51TewyFSH67L
         jFMjj3EzndrnSytOQul1vL4W2etzdEo7XxHLVvW0dSVhg0zyH26vKT1pn9rJUwEvp/5N
         OnGPMBa7LJY7Q03tQlWQCYA9CcEa6GAPLkZrX7SNssXg8ZsGczIvnFqbW7R3KeYX++UZ
         4Z5UkHYvhabaeYG/lgtdyrNn2d1O0ISDhJLsHWxa0kSvpGt+QvGCnPwK/evd2obzEziD
         ollg==
X-Forwarded-Encrypted: i=1; AJvYcCVJIf0sb8vcG24t1JrGWXhBFYv8JqBYeFnOE4kWOSuq5vGUN1Ttjphd/ntaMV/bRv5k2OYv7kefcwA9VSCqymZV4GBuUgoVsX6SO2BNaw==
X-Gm-Message-State: AOJu0Yz+nQijLWSc2DIcLfcAbJ6l+kKsjrWKO6fe/QKujyjDQsbzkqNK
	+sbu+SF+VPVd7pcpcYOEjTilZgpYkOfwLJlFjLwueWNpJ8sHecRyeBHIIUwYjVv1Rl1SLM1YD2a
	k6CCSsQwqLTRjB0X6NZNp9DHEykYLolxd6gFz
X-Google-Smtp-Source: AGHT+IG7kANdMixnrRX/w/wCL06WRJILCv9aR81l3eU1ucu2os0oVGFSDzYlK6U+a1azCoA3WAsnnYnMeJC+/F+ecm0=
X-Received: by 2002:a5d:49cc:0:b0:366:eade:bfbb with SMTP id
 ffacd0b85a97d-367757200admr5266366f8f.46.1719856341379; Mon, 01 Jul 2024
 10:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com> <171874683295.1901599.10170158200177384059.b4-ty@google.com>
In-Reply-To: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 1 Jul 2024 10:51:53 -0700
Message-ID: <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jun 18, 2024 at 2:41=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> > This series changes KVM to mark a vCPU as preempted/ready if-and-only-i=
f
> > it's scheduled out while running. i.e. Do not mark a vCPU
> > preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> > when userspace is doing KVM_RUN with immediate_exit=3Dtrue.
> >
> > This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> > set st->preempted when going back to user space"), which  stopped
> > marking a vCPU as preempted when returning to userspace. But if userspa=
ce
> > invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> > preempted/ready. This is arguably incorrect behavior since the vCPU was
> > not actually preempted while the guest was running, it was preempted
> > while doing something on behalf of userspace.
> >
> > [...]
>
> Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've=
 been
> away from upstream too long ;-) ).  Thanks!

Thanks for the cleanups. Looks like you replaced "[Tt]his commit"
throughout. Anything else (so I can avoid the same mistakes in the
future)?

>
> [1/3] KVM: Introduce vcpu->wants_to_run
>       https://github.com/kvm-x86/linux/commit/a6816314af57
> [2/3] KVM: Ensure new code that references immediate_exit gets extra scru=
tiny
>       https://github.com/kvm-x86/linux/commit/4b23e0c199b2
> [3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while ru=
nning
>       https://github.com/kvm-x86/linux/commit/118964562969
>
> --
> https://github.com/kvm-x86/linux/tree/next
