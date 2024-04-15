Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A578A53E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 16:32:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JcshQ0Mn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ8ky720Nz3dkm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 00:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JcshQ0Mn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3pdodzgykdf0n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ8kC0m58z3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 00:31:29 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c6245bc7caso2524956a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713191485; x=1713796285; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c2CdFnxXRBnmzc0kZKqWJbmgAhAN/X9RQGLQm4qlas=;
        b=JcshQ0MnDTGA0MJVFvFNYCwusSDcf+HMYGn1D5bn1MhV8Aoy521HtHX7qZ0veMWoIk
         lePYqcJHXOOMfcwrdG5v1KvDIebQDRpNSCMatACSgfsFOWy1Cb8ICli/GgKCIq3dbHTl
         z4eaplorkywIRl0VOCrNRTm3WmdNOekD6mqjIPQG4pUFGtg+sT54n72SnUm1lZM8kw6t
         C6p6e08++d8GeOSVZGMrnEb9G67r/ELTQLG4FGTPNB13v7O2cCZBPjAMU1i57wWe7dFw
         QExH6a/Gq3lLVMANHkU+I3FhwHJVhsoZyouiN7OM+sNHt09GKtZvXC6h0U7KB2x1EdYM
         vV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713191485; x=1713796285;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3c2CdFnxXRBnmzc0kZKqWJbmgAhAN/X9RQGLQm4qlas=;
        b=dC3ZTB6ki+SDbCmRXo2Pfh6RDPP3uO1X3EIR7jnfN67JHFD4fWXDykGwn10HOgf2Zh
         VQ9njjw/g+NJBF+LzR8cTm7nD9rus3w1ePd7fBLm4z14pNHoGul1LDhxDTgjdxZo7S1F
         VQgj7Gh4VT/2SYlrayWPbuMcBk4Emh0jCfvqC1eyvlMtMXQI8ATUOs4AyEEIXgc+SuiS
         1Kv+pxNAx7Z/Fj0o64wt3+/XRvSqpSmnK/kuC9tOxTdk9TiJPDtlnODGfxH0DpVO4ZyI
         qtEM/tsNvMBFOHSq82R5WJRiUmsQ0Z9ee3SP+2S8vTKnbgcve5oWQhOHwNZO2rfcPsYP
         +mcA==
X-Forwarded-Encrypted: i=1; AJvYcCVyFi2VW+ppx55w55WwOhw0s4bkxDw4S9TZH/FWrnejvNp9AOKiG9DdLXPA976EN2GJWBK2qgl6a6Om9V7kAfSmPJSXgeTLORrDcvxDOA==
X-Gm-Message-State: AOJu0Yz6pKXanTWKnGq3FMag2wjYD1wM+7dechF0kh8aKUvqBD1wNbdx
	5u+oUQweeqhOObgZRDB3k4r4PLVlyrVgBpz/GNKPdvhgUYWfOIhf/pMQnR53nPf1JSuwHDENEIM
	hpA==
X-Google-Smtp-Source: AGHT+IHuch75LMAnc1U2ltEvl5EQtMTtzEb/8rE4LBdYCN+wg04KdOcX1kaXCFsKcUY8MvFdl8nCoh4Cvw4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:ec02:0:b0:5dc:bc92:23c4 with SMTP id
 j2-20020a63ec02000000b005dcbc9223c4mr27975pgh.12.1713191484874; Mon, 15 Apr
 2024 07:31:24 -0700 (PDT)
Date: Mon, 15 Apr 2024 07:31:23 -0700
In-Reply-To: <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com> <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au> <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse> <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Message-ID: <Zh06O35yKIF2vNdE@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> Hi Michael,
>=20
> On Sat, Apr 13, 2024 at 11:38=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > ...
> > >> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@googl=
e.com> wrote:
> > ...
> > >>> diff --git a/kernel/cpu.c b/kernel/cpu.c
> > >>> index 8f6affd051f7..07ad53b7f119 100644
> > >>> --- a/kernel/cpu.c
> > >>> +++ b/kernel/cpu.c
> > >>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
> > >>>  };
> > >>>
> > >>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
> > >>> -   CPU_MITIGATIONS_AUTO;
> > >>> +   IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AU=
TO :
> > >>> +                                                CPU_MITIGATIONS_OF=
F;
> > >>>
> > >>>  static int __init mitigations_parse_cmdline(char *arg)
> > >>>  {
> >
> > I think a minimal workaround/fix would be:
> >
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 2b8fd6bb7da0..290be2f9e909 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -191,6 +191,10 @@ config GENERIC_CPU_AUTOPROBE
> >  config GENERIC_CPU_VULNERABILITIES
> >         bool
> >
> > +config SPECULATION_MITIGATIONS
> > +       def_bool y
> > +       depends on !X86
> > +
> >  config SOC_BUS
> >         bool
> >         select GLOB
>=20
> Thanks, that works for me (on arm64), so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't =
think
of better solution than an on-by-default generic Kconfig, though can't that=
 it
more simply be:

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 2b8fd6bb7da0..5930cb56ee29 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
 config GENERIC_CPU_VULNERABILITIES
        bool
=20
+config SPECULATION_MITIGATIONS
+       def_bool !X86
+
 config SOC_BUS
        bool
        select GLOB
