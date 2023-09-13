Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0879DCFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 02:11:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=M0+ISFk+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlgqS56tzz3dmm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 10:11:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=M0+ISFk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlgpZ21NVz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 10:11:01 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-501be2d45e0so10529366e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 17:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694563854; x=1695168654; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDU5pSKkCf+ROG6Vvo9qMmmrl9dENDhQwvux9jW53fk=;
        b=M0+ISFk+vW0XFR+pnnYRGrrN6RKT3BOOFONB8xXri557yJi0vEG9VFs71cXmlS0plF
         Y6vL7vC9LfOLF0b1ui0Vu6CWvGudEcyUxvrUy6lTZdl+94blaJM1WFJOTmwvEUW3wRGc
         xF6QH/FE6rTX9hhMO7THQY//+E/fl8iek/DVKJyUoMW2O4satjJ5T0oCtRxKz7mmewp2
         goxnkoTg/cfwvYeXnCc74BQSyZpk0qubY8CTtoWCq0EnItIVnAgIzPmeAPUyhvExAd4F
         dd5yGUCr6fOzWLVASjCdEZZTKlzm31897YeC7w3IT3OLYW7IPm9lqGYx+dlH1Fq2Runs
         xHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694563854; x=1695168654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDU5pSKkCf+ROG6Vvo9qMmmrl9dENDhQwvux9jW53fk=;
        b=aOZa023QQooNVD4zYlb2zBdNWPguxhn6Tp3iCvhKChvGEg+2YyXkgCPNZpcpt7eEY+
         JoXchEz+BFTnBy5FAnMGCZxDiO+r8GOeXfQPoHxGMr1CLH8TT+14RvHBKGRu7ifxwlqU
         xvNqzhHPGpiySbra0pXQLytHIGVJq1SY3ePFOsWXpVtSjXIi2jzwsx2yepksNKmp5oHX
         ZR1xFO6e/0YwW4mQd+yNM58k11j5s55qrDze4eUi8ecKtCfyPIUk1Jsbr9c0pKDFtoLe
         OLwNAgHvOpS7TCYjF0WA7MlXgObdP2+0c7LOxau0osfy6KRpSDWkQSRHASJ3l2MzGpqJ
         n5Fw==
X-Gm-Message-State: AOJu0YzpSzUNBvMYndNnCB0K1PdlgTFBZRRwB8QJS0szX3jQPYSvKquh
	tWuAyqcfCc1xb9GN4xfv5GUYBcp7vVD648JZejw=
X-Google-Smtp-Source: AGHT+IE0DJ1yIeH5yZxGYgPrqT6xeFSkjh5Zl6R/0fUeOPfMg57L6CIwSvBEee3CSY3IGdEklD5DOU0AfhXdAtHa5js=
X-Received: by 2002:a19:e012:0:b0:502:9dc3:9c68 with SMTP id
 x18-20020a19e012000000b005029dc39c68mr597128lfg.63.1694563853416; Tue, 12 Sep
 2023 17:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230912224654.6556-1-puranjay12@gmail.com> <20230912224654.6556-6-puranjay12@gmail.com>
 <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk> <CANk7y0iFdgHgu+RXYJvP3swaRS+-Lr0CgOAdcQWtjs4VkrOzdQ@mail.gmail.com>
In-Reply-To: <CANk7y0iFdgHgu+RXYJvP3swaRS+-Lr0CgOAdcQWtjs4VkrOzdQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Sep 2023 17:10:42 -0700
Message-ID: <CAADnVQLzbyG3xWVDFyTsDPRSC=fnAskaeyc1erQVLYo_b6Lg_w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with B/H/W
To: Puranjay Mohan <puranjay12@gmail.com>
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
Cc: Alexei Starovoitov <ast@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>, Shubham Bansal <illusionist.neo@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, Daniel Borkmann <daniel@iogearbox.net>, Helge Deller <deller@gmx.de>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Luke Nelson <luke.r.nels@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Hao Luo <haoluo@google.com>, linux-parisc@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Wang YanQing <udknight@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Da
 bbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 12, 2023 at 4:17=E2=80=AFPM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> On Wed, Sep 13, 2023 at 1:04=E2=80=AFAM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Tue, Sep 12, 2023 at 10:46:53PM +0000, Puranjay Mohan wrote:
> > > The JITs should not depend on the verifier for zero extending the upp=
er
> > > 32 bits of the destination register when loading a byte, half-word, o=
r
> > > word.
> > >
> > > A following patch will make the verifier stop patching zext instructi=
ons
> > > after LDX.
> >
> > This was introduced by:
> >
> > 163541e6ba34 ("arm: bpf: eliminate zero extension code-gen")
> >
> > along with an additional function. So three points:
> >
> > 1) the commit should probably explain why it has now become undesirable
> > to access this verifier state, whereas it appears it was explicitly
> > added to permit this optimisation.
>
> I added some details in the cover letter.
>
> For the complete discussion see: [1]
>
> > 2) you state that jits should not depend on this state, but the above
> > commit adds more references than you're removing, so aren't there still
> > references to the verifier remaining after this patch? I count a total
> > of 10, and the patch below removes three.
>
> The JITs should not depend on this state for LDX (loading
> a B/H/W.
> This patch removes the usage only for LDX.
>
> > 3) what about the bpf_jit_needs_zext() function that was added to
> > support the export of this zext state?
>
> That is still applicable, The verifier will still emit zext
> instructions for other
> instructions like BPF_ALU / BPF_ALU64
>
> >
> > Essentially, the logic stated in the commit message doesn't seem to be
> > reflected by the proposed code change.
>
> I will try to provide more information.
> Currently I have asked Alexei if we really need this in [2].
> I still think this optimization is useful and we should keep it.

Right. subreg tracking is indeed functional for narrow loads.
Let's drop this patch set.
