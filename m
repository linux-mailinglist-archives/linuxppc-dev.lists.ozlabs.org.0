Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A760847C01
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 23:06:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=n4nFKEL6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRVHF2ClTz3cll
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 09:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=n4nFKEL6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRVGP1qmLz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 09:06:03 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a370315191dso142798666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Feb 2024 14:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706911555; x=1707516355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88hcq8XgkrpsBeyZheiHmTOtZGbbdlYCkf6URsqgIp4=;
        b=n4nFKEL6GaF6hiAaFfjdxYJ2KaljDpARc99yaboz7R6Ywwm+NCED6uwLFFUecO9PzH
         exLpqdRQoOZ8hB4kkWTmGflDxHqnKfTipWEG1cjfmFbUPMAzfICRMH5hOQtRfQaI/Xpn
         FrYFXzGFh/tIFb4m0kmCsmXjxt/BnX4MxXaZlQEAaDjo69M3a9sTkmeoociZpTj52wcW
         FHRVEiWaBYSWlTVz+SXZg50QM48uQXiNcbPERiDmYnvK08i35LmT4soRzZbjshQvBZmO
         iZ6cGkz8izvTECVoCkQLgjLw8gcZogBTjhfTULX+IeK5Mq7szFWI8bRmPgOi14CAgGj+
         9X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911555; x=1707516355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88hcq8XgkrpsBeyZheiHmTOtZGbbdlYCkf6URsqgIp4=;
        b=sWP4DiHK/CkDM1pH/CyAjdZcdxLiAfnYyDIv4kQ/5AWjR/UA8wDoZCxO9n/vN9JRRM
         THAsN1Udb7EBVUuVui2imIOh1Ou7HZu7PW3F9EZIEhDChoZbW6S9kLDwGtguDqIHw7sl
         OsaXZYBsqTgFLF1Wm1C3rEPJUry1Fj2O3f9arS6y67MASiZ9/pa/UnCGH9AUZZ54PBKj
         sf5IhODlVFl5WCr7Am+fX+Qxfg3Lcr2slvumqkzEEpBo+MdenohSBklL9paggjY6pHXY
         V3Y8ZJOsSxbvrENEQdE9Pz+ht6/eRa31TaHF0RnUmNbjzSGWx730pxNdWdaUJI5Pdy5Q
         bJsw==
X-Gm-Message-State: AOJu0Yyg/xy2EI7EnX3P4JWiGgwF4A/sDlwLoMEjo8bLRnX+4hCFN1Ot
	qTOrczfUMb4H50S3CQXsj+YgFVJFsh4BN+RyTCsnz3olqvJphZaykJQz/YJJ+WHlbF9GgtMgHVi
	xv+/Z3OByrTImzgqdV9zp2QvB8V98SW8W+vPvxw==
X-Google-Smtp-Source: AGHT+IEdra/txPxsHeiEZSIqeLcoax0q8b5/TdMlKdrQpsLC9Bhy0DO41JjMt0QszL6IyZw4hoGkwwrYDp1u0lZqAvA=
X-Received: by 2002:a17:906:2455:b0:a2e:94a0:93b4 with SMTP id
 a21-20020a170906245500b00a2e94a093b4mr4841883ejb.61.1706911555736; Fri, 02
 Feb 2024 14:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com> <Zbuy1E7mz9Oui1Dl@andrea> <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
In-Reply-To: <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 2 Feb 2024 23:05:44 +0100
Message-ID: <CAHVXubjzpTru3Tn+nmv=GwG0YWxnkeYYT1KOJW5a27H2EDAZ0Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings with Svvptc
To: Andrea Parri <parri.andrea@gmail.com>
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 2, 2024 at 4:42=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc.=
com> wrote:
>
> Hi Andrea,
>
> On Thu, Feb 1, 2024 at 4:03=E2=80=AFPM Andrea Parri <parri.andrea@gmail.c=
om> wrote:
> >
> > On Wed, Jan 31, 2024 at 04:59:29PM +0100, Alexandre Ghiti wrote:
> > > The preventive sfence.vma were emitted because new mappings must be m=
ade
> > > visible to the page table walker but Svvptc guarantees that xRET act =
as
> > > a fence, so no need to sfence.vma for the uarchs that implement this
> > > extension.
> >
> > AFAIU, your first submission shows that you don't need that xRET proper=
ty.
> > Similarly for other archs.  What was rationale behind this Svvptc chang=
e?
>
> Actually, the ARC has just changed its mind and removed this new

The wording was incorrect here, the ARC did not state anything, the
author of Svvptc proposed an amended version of the spec that removes
this behaviour and that's under discussion.

> behaviour from the Svvptc extension, so we will take some gratuitous
> page faults (but that should be outliners), which makes riscv similar
> to x86 and arm64.
>
> >
> >
> > > This allows to drastically reduce the number of sfence.vma emitted:
> > >
> > > * Ubuntu boot to login:
> > > Before: ~630k sfence.vma
> > > After:  ~200k sfence.vma
> > >
> > > * ltp - mmapstress01
> > > Before: ~45k
> > > After:  ~6.3k
> > >
> > > * lmbench - lat_pagefault
> > > Before: ~665k
> > > After:   832 (!)
> > >
> > > * lmbench - lat_mmap
> > > Before: ~546k
> > > After:   718 (!)
> >
> > This Svvptc seems to move/add the "burden" of the synchronization to xR=
ET:
> > Perhaps integrate the above counts w/ the perf gains in the cover lette=
r?
>
> Yes, I'll copy that to the cover letter.
>
> Thanks for your interest!
>
> Alex
>
> >
> >   Andrea
