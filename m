Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCAE728CCF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 03:03:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcjW05pKjz3f5l
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=0QiRzLBE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=0QiRzLBE;
	dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcjT44fTZz3fPG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 11:01:28 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-33ed16b1360so59155ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 18:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686272485; x=1688864485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOlumE3ouLCIH2RP0G1dM53dguqR91oQKVL0viimj70=;
        b=0QiRzLBEfIKm2SVV80x9b/gSHafnBJNKTDt5o9p/8YxMb+AMC9QQBod2E/wzrHuceY
         ouEbiAOyTT2VNZhRW/Ddnr3fLkpDnEjgK4IX7o8er5B//o+OfqB1UfsOITa9lNtjMafb
         POzHfxb+JBYWaM9Q9Ufh+5YDTUlBacFxBJYv75ZsvmP+jho8O69/5BM7c4fJ08LSrba+
         UrPymZ+DU6ROxWa0sxtG8xgOeygPpEsqe4Tl0IyVl7eg3plBMhgdDs7FjlM9qIUxQhSA
         NwnqOQ5SI3/bpHuPo07dXtQdCuXb2Usg3ZiXaCniUcNf+AkBFv+ScKeiNCZmKKK14NoY
         C2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686272485; x=1688864485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOlumE3ouLCIH2RP0G1dM53dguqR91oQKVL0viimj70=;
        b=I333+aAFGlPBX8An3wTh++OzHs2QfzL1cUTTkYFLmtwQYvcRST7wGyG8rksQ2tuCad
         j3+L4TBD3cuvEinY0MWT5v8I/3Wz/u+PIcoYhW0tfdgIVlsxa8ZpevmUsgHypfSn7hFp
         FKf/xH6/jarnMUCBLOMzdMNg0FDMzprrejVXKozZWRSvRBS0hcvlaDJnD3JYf7c1/y9a
         BDwFyTWjYEiIl6bXgGliAbZXDyw4AIzD5fA2qgjTxrfDCfBLXC/MRqNpuZe2Ex2sDYIk
         RQ0S1qSm7UlgzsEjyyA4NeEQ813A563Df0nY995qXmW5zls6qEC3ssQbfvokk+lLC4X2
         dWLw==
X-Gm-Message-State: AC+VfDwhs4Nja8Mxdgl/3oHRmD89DC8OzTzoTLyVykhtvUjMiRa7HOeY
	op8SC4Yp2zpc94ezZPSsujdScSCH9vhXcN6Rn5vhyQ==
X-Google-Smtp-Source: ACHHUZ6K7WtRN1/jwhwUmn81V7wZks+0RBM4oqsXU0y3En74mlS5GsDCmNvtd7xuOihBLkGIFFFI5IogGsWfvJXaSzU=
X-Received: by 2002:a05:6e02:1d90:b0:335:6626:9f38 with SMTP id
 h16-20020a056e021d9000b0033566269f38mr412896ila.0.1686272484663; Thu, 08 Jun
 2023 18:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-2-yuzhao@google.com>
 <ZH7vh1GmsV+UCPwv@google.com>
In-Reply-To: <ZH7vh1GmsV+UCPwv@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 8 Jun 2023 19:00:48 -0600
Message-ID: <CAOUHufa8C-OVwKxNyjQcrGxO9r5GCge+GSbwo8JO2GFOP10TtQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add mmu_notifier_ops->test_clear_young()
To: Tzung-Bi Shih <tzungbi@kernel.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 6, 2023 at 2:34=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Fri, May 26, 2023 at 05:44:26PM -0600, Yu Zhao wrote:
> > +/*
> > + * Architectures that implement kvm_arch_test_clear_young() should ove=
rride
> > + * kvm_arch_has_test_clear_young().
> > + *
> > + * kvm_arch_has_test_clear_young() is allowed to return false positive=
, i.e., it
> > + * can return true if kvm_arch_test_clear_young() is supported but dis=
abled due
> > + * to some runtime constraint. In this case, kvm_arch_test_clear_young=
() should
>
> Is it a typo here?  s/kvm_arch_test_clear_young/kvm_arch_has_test_clear_y=
oung/.

Not a typo.
