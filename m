Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B606734819
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 22:12:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BI4IVSXI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkkbG2xLGz3bZr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 06:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BI4IVSXI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkkZJ35Q3z305N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 06:11:51 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-3fde9bfb3c8so115251cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687119108; x=1689711108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpfISiVhGBFvYu3AQzytJ9eyp0qWbNPzT0F/TqGcEF0=;
        b=BI4IVSXI0OmI7HSHsHlrapOhxlYQr88irtqXtejFQDdwi0ENBjBoT+XLb8GlVX5ye2
         2RKZIVa3SgmrzIbhLz9gPTVxEaHp2aLuGzJABn2V8qcyj1r5n7W74CILO0agM4yRBdqp
         1RaptWkZvNHDOFx+VjmcCLiDP8C+KTiX8SbGmrEKzvHmrSeItS1P0Xmdw5h0oqtFiDy4
         AOhW0Kb490uZt+xyTNM54SZyWZrBQ/OOSALJEaw5URHLWQ5/4/9LTWbU9KUB5nzr8SkC
         EiNHGrA/DNhBI3N/ps22/XwwMptyPwh1WFUc37QSRtqZWWbsx8o8/qqFNZmnqhSquaII
         BNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687119108; x=1689711108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpfISiVhGBFvYu3AQzytJ9eyp0qWbNPzT0F/TqGcEF0=;
        b=c12UzzxBqPbDtqiduuA0/5S/DgNPZYFtJKJ6he3si659D72raUtsQILkZOKDmD2XAk
         hJCcPzq5wzEls95OPxkFRzPPLHEzOV/kiVvA0mCR/H459s7y3Lo94vjjxCu3QFGlvNrm
         chYxgv83htUg5w65k125h62lj70hO/fFZgGLYprpQCL2iWj91Xky6hc/7Y/f/F7P1nsm
         18lCYRNKW802/b7Df+n+E/q8Dpg5IMiiUT2oq5j2lhGsq1mM2kb2Fdg3CGdNIn9ZlLov
         /HBa3wM6RfSw8UGo6y7g/bADdX3228RxNi2QubVR5s1/+jUvo2gzVjyNOptsPkE2B8Mr
         2RNQ==
X-Gm-Message-State: AC+VfDzphx9jn3gSKtWrR2bZe1tZp8CPb40lRL92Cvy7yC41YLEnMMCG
	7g5NJgUoKh2QTvV+P/nemtb1m6rtjEyKf0yssICcig==
X-Google-Smtp-Source: ACHHUZ7+FzP5AfTCxoLANN0O1kovXzprxLRO2NDRfP+79+jkGgGwKBzMX+UybO5p4uMqphT40cGSU06Ta5mNNZ2MZbY=
X-Received: by 2002:a05:622a:85:b0:3f8:5b2:aeed with SMTP id
 o5-20020a05622a008500b003f805b2aeedmr773688qtw.21.1687119107794; Sun, 18 Jun
 2023 13:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230609005935.42390-1-yuzhao@google.com>
 <873530okh0.wl-maz@kernel.org>
In-Reply-To: <873530okh0.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Sun, 18 Jun 2023 14:11:11 -0600
Message-ID: <CAOUHufaWbWZ-q-PUJnjXD_jDk1s34mcg4vHU8CtAtmeAT-deRA@mail.gmail.com>
Subject: Re: kvm/arm64: Spark benchmark
To: Marc Zyngier <maz@kernel.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 9, 2023 at 7:04=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 09 Jun 2023 01:59:35 +0100,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > TLDR
> > =3D=3D=3D=3D
> > Apache Spark spent 12% less time sorting four billion random integers t=
wenty times (in ~4 hours) after this patchset [1].
>
> Why are the 3 architectures you have considered being evaluated with 3
> different benchmarks?

I was hoping people having special interests in different archs might
try to reproduce the benchmarks that I didn't report (but did cover)
and see what happens.

> I am not suspecting you to have cherry-picked
> the best results

I'm generally very conservative when reporting *synthetic* results.
For example, the same memcached benchmark used on powerpc yielded >50%
improvement on aarch64, because the default Ubuntu Kconfig uses 64KB
base page size for powerpc but 4KB for aarch64. (Before the series,
the reclaim (swap) path takes kvm->mmu_lock for *write* on O(nr of all
pages to consider); after the series, it becomes O(actual nr of pages
to swap), which is <10% given how the benchmark was set up.)

          Ops/sec  Avg. Latency  p50 Latency  p99 Latency  p99.9 Latency
------------------------------------------------------------------------
Before  639511.40       0.09940      0.04700      0.27100       22.52700
After   974184.60       0.06471      0.04700      0.15900        3.75900

> but I'd really like to see a variety of benchmarks
> that exercise this stuff differently.

I'd be happy to try other synthetic workloads that people think that
are relatively representative. Also, I've backported the series and
started an A/B experiment involving ~1 million devices (real-world
workloads). We should have the preliminary results by the time I post
the next version.
