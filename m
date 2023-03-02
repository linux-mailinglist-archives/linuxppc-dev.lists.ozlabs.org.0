Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F023D6A7C2E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 08:58:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS3Pf64JWz3cM1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 18:58:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pn+DJn+k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pn+DJn+k;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS3Nl4qswz3c2v
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 18:57:25 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1100957wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 23:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677743839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gGlmdrxpk12L0HtiU5R9bJeUayhxQ74GXgfAq6meuw=;
        b=pn+DJn+k9uImMGeBMXuwnMQE1biMNzy71Plo8H7DOI3fKK/ceps9rgGUxc/bmw8s6L
         4TQMSud9TXFc8/r2OEOEiAKv5SApxcJ1Yd/LQHA0imhiw3qi8hrsJYLIdS7LaNAmBH1O
         AbgLlGVWFn2hf8BkmR90At5+g3zqQ61Ankq9cGuBB9WgQfAsyn4JZulcRbW71gf7ZeYz
         oRP4F6/LxUTL9nxCbjnWUdwQSV0fTcnbx/sIcDMk8fB8xQ9dJ6UAQMnDD3HBbCn+Qr4a
         fIykdIwuX5WmEnYpwkBvfu6oXc7MDCcdwlfNYOa5JGNIdVdo8Hubuxh+Kfco99U7Z89i
         QfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677743839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gGlmdrxpk12L0HtiU5R9bJeUayhxQ74GXgfAq6meuw=;
        b=iiZByP2roH7UmBQ8MZ6LBmWMlOtXeKqTCn8P99Zp0tvQaNAZXHA/Oh2AepFYFPowii
         jpnQZL9feZP0jISWv4Wo1xjY1UgL0FwuEDtfDyjAr8x2tAuSwgU5Q2zjtNLXn13tsV1q
         VdmKUi3+ebJ/WFu24if4PT12SmB8CxzMa4rk93VBdLLEDPsESvZZn2OJLmNEgmqGCZbp
         su4lxSSG5QWCFkkUvJaPKt2uRpLDPmkhtnBmi6MNktHY0vVUd+iz4/m3RnOm6ERgwcCA
         eOo3qUjw4HmjEVfSpLvviuO2rRzSjCa8/tOxAL278Rc40yMWxyQRfUyHErkz0XTr297b
         vEKg==
X-Gm-Message-State: AO0yUKVh5TeXiH0RYbLhuYDEPtK8EzNsWkLWLDFdLXT+ZiQMj8ssDRTy
	BR11LmIUDTQ8cyNS8qcYK/sDdawdPbGwRuHGVHJJ/w==
X-Google-Smtp-Source: AK7set8WtHYe+gEo1Fgs1pSlJqsnM2tCvgsXzdB6/J3n+P8FnRw3jetc5Yrjj9TAlqQSjPmyeFZCYlu44lotg0az/Sk=
X-Received: by 2002:a05:600c:4591:b0:3ea:8ed9:8e4b with SMTP id
 r17-20020a05600c459100b003ea8ed98e4bmr2655128wmo.6.1677743839531; Wed, 01 Mar
 2023 23:57:19 -0800 (PST)
MIME-Version: 1.0
References: <Y+tSBlSsQBQF/Ro2@osiris> <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
In-Reply-To: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 2 Mar 2023 08:57:08 +0100
Message-ID: <CAHVXubgdr_NrLPnZ6NhuDt8uZYZD+R_swpCVGoLDxnD+eOJcuA@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Palmer Dabbelt <palmer@dabbelt.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, x86@kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, Will Deacon <will@kernel.org>, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, corbet@lwn.net, linux-sh@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, loongarch@lists.linux.dev, Paul Walmsley <paul.wal
 msley@sifive.com>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, svens@linux.ibm.com, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 2, 2023 at 4:17=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
>
> On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux.ibm.com wrote:
> > On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
> >> Hi Heiko,
> >>
> >> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wro=
te:
> >> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
> >> > > This all came up in the context of increasing COMMAND_LINE_SIZE in=
 the
> >> > > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE =
is the
> >> > > maximum length of /proc/cmdline and userspace could staticly rely =
on
> >> > > that to be correct.
> >> > >
> >> > > Usually I wouldn't mess around with changing this sort of thing, b=
ut
> >> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LIN=
E_SIZE
> >> > > to 2048").  There are also a handful of examples of COMMAND_LINE_S=
IZE
> >> > > increasing, but they're from before the UAPI split so I'm not quit=
e sure
> >> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE =
from
> >> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to ker=
nel
> >> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE=
"),
> >> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> >> > > asm-generic/setup.h.").
> >> > >
> >> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have b=
een
> >> > > part of the uapi to begin with, and userspace should be able to ha=
ndle
> >> > > /proc/cmdline of whatever length it turns out to be.  I don't see =
any
> >> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Goo=
gle
> >> > > search, but that's not really enough to consider it unused on my e=
nd.
> >> > >
> >> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE r=
eally
> >> > > shouldn't be part of uapi, so this now touches all the ports.  I'v=
e
> >> > > tried to split this all out and leave it bisectable, but I haven't
> >> > > tested it all that aggressively.
> >> >
> >> > Just to confirm this assumption a bit more: that's actually the same
> >> > conclusion that we ended up with when commit 3da0243f906a ("s390: ma=
ke
> >> > command line configurable") went upstream.
>
> Thanks, I guess I'd missed that one.  At some point I think there was
> some discussion of making this a Kconfig for everyone, which seems
> reasonable to me -- our use case for this being extended is syzkaller,
> but we're sort of just picking a value that's big enough for now and
> running with it.
>
> Probably best to get it out of uapi first, though, as that way at least
> it's clear that it's not uABI.
>
> >> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
> >> I assume?
> >
> > Yes, sorry for that. I got distracted while writing and used the wrong
> > branch to look this up.
>
> Alex: Probably worth adding that to the list in the cover letter as it
> looks like you were planning on a v4 anyway (which I guess you now have
> to do, given that I just added the issue to RISC-V).

Yep, I will :)

Thanks,

Alex
