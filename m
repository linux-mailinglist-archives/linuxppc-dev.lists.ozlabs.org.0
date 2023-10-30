Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085F7DBFC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 19:22:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rGSzgTOw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK1pG07G1z3cT0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 05:22:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rGSzgTOw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK1nN6pPzz2xLN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 05:21:44 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso32007575e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698690100; x=1699294900; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/9ggluaJ++InohprDPxvdU7Uw478trPLaD3bhLrtl4=;
        b=rGSzgTOwrwAjfFxViIOogkLK1x6Tryp7tha2xvlpWPjRnEHBrcaV7PxBCXA16G8D5g
         CxP6vkAZb1owV3/LE6YDi68Qo7cLuYgJulW90DdOoKqJN91G5mMWt5T0VQ46GYYpNBnI
         qZZciijPaZNwBu6SEmanaO8eMO+z2XqH+oh1pui13yxqIkuVPAWTKF2m031eD54h5x4I
         xebO+YE+3kzuHxJpIccDY7zKx0P5nejIU08YWOZ0jxP+o8bwTIOqpsZN5rL5T9eFVhh6
         yE3x19BPPGFVNGN9ir+vWP9ysYz9d3KMtYszXdLWq4Z5o4dCgX31WlzpaTsszh+yKgwj
         pIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698690100; x=1699294900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/9ggluaJ++InohprDPxvdU7Uw478trPLaD3bhLrtl4=;
        b=gMZ5ja4OSZOZE/PRL2Mlg2T722KArhWlXG0Tl1ZkymGHWoEGoKTHrrnPdH6lQY6zQI
         wCDXZF0vx87E9h0FT17+dzuODesNjCKK7XQhYc81hJOEosgq7tsS0ARPROzGMCOHSspj
         rFvLsep3OeJOo8cECt5TPE8QYugATcKPe0yqgi+NbG5SSlZN/bwqFlDA7rel6D5kPhJA
         BDmM93QObuaoTyUNmls48sS1GyqtXxJKQzKxRZkt7TZIR3ggQ5LroX6aqLi4a8JG5/v/
         vzS9AShYwM72QoArYmlpdFYT7JRBzeGvVnIyZLoE9cm6wStNYDuuBbvw1Tz62CD+3TMK
         pm9w==
X-Gm-Message-State: AOJu0YzRxuU++JjTvqLVEh4QwEosbFgLbHSUY3MY5dBjS68/aP3Lo3TO
	/hVR8uUKj3T5q5csdJM+v26oSFSgH4ZGnymevPWmAA==
X-Google-Smtp-Source: AGHT+IEmwHEAyRl4O1ADBUXlJ8Ir1QajxdHcmQhP1+JwZ6AL7EQf1l2WpAn/vfiQDkHuuhxFizw+5mWU1UT2yp1CF+k=
X-Received: by 2002:a05:600c:524a:b0:408:4160:1528 with SMTP id
 fc10-20020a05600c524a00b0040841601528mr8760818wmb.30.1698690100370; Mon, 30
 Oct 2023 11:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com> <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
In-Reply-To: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 30 Oct 2023 11:21:12 -0700
Message-ID: <CALzav=djOS8T7AmUa3A7QmP1f0xAm2W-KRDmOov_H8ps77A2qA@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quen
 tin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023 at 10:01=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> On Mon, Oct 30, 2023 at 5:53=E2=80=AFPM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > > From: Chao Peng <chao.p.peng@linux.intel.com>
> > >
> > > Currently in mmu_notifier invalidate path, hva range is recorded and
> > > then checked against by mmu_notifier_retry_hva() in the page fault
> > > handling path. However, for the to be introduced private memory, a pa=
ge
> >                           ^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Is there a missing word here?
>
> No but there could be missing hyphens ("for the to-be-introduced
> private memory"); possibly a "soon" could help parsing and that is
> what you were talking about?

Ah that explains it :)

>
> > >       if (likely(kvm->mmu_invalidate_in_progress =3D=3D 1)) {
> > > +             kvm->mmu_invalidate_range_start =3D INVALID_GPA;
> > > +             kvm->mmu_invalidate_range_end =3D INVALID_GPA;
> >
> > I don't think this is incorrect, but I was a little suprised to see thi=
s
> > here rather than in end() when mmu_invalidate_in_progress decrements to
> > 0.
>
> I think that would be incorrect on the very first start?

Good point. KVM could initialize start/end before registering
notifiers, but that's extra code.
