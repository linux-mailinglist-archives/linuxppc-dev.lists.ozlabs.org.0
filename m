Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0464C5267
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 01:08:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K56Rt3jdDz3cNk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 11:08:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MmF7aDNZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MmF7aDNZ; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K56R84PQMz30Dv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 11:07:47 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso6242522pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 16:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=c5B6JRpH2tbmLBFBMPjCFNLPBgu4FT5DIbHXGYJdCK8=;
 b=MmF7aDNZ0tCRKCA08hEFDy64f+YnQ2/g6cOWR4EuXliwFwbU0Vu48vP/mdNsKXQeyZ
 EeSvXiWEUGzXToeTYPgpa6MFBK3iab+OaDsdhIKZxv4sdPiflwZZvHioYRhpL5iqKoQu
 PJp8yRfo4e95feVAS+zetRfXI2De+dfnuJ7+Td+RwqYVjrdmIBUtIzApG5HZoJuLjuOi
 OHquYyPAM9s74SnqQcjS+PKNRNsLV31TGtolp6h57rm2yCdYqog0aTTMiGntqVR4lfeI
 ieDUgO/0TSqeVgvAI6Ovh8YoMMkroBoJSaBlcrEqhy3uUmvWWHmx4EzzVDzjcWp0JfbX
 MV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=c5B6JRpH2tbmLBFBMPjCFNLPBgu4FT5DIbHXGYJdCK8=;
 b=jY4MIqK1YcrXBgGqSiWdHyA7jl/K0MU18O19x2DB9Y479r2znriV+XVlQmfMzEUEmf
 JMipQWBoVBTDDMergK+toyBZyfcpgjnXjzd5xu7vvzW2nfZo/6KLGSmAtqopH3BR+99c
 /Pd6ApwdE2cx2+1BJxrbs0bztqN8J+uJQse99Py3i/zvWMGAIsjy/XVHl8yISE2yVPaz
 /6dKb/Y7wa9THjrBfCvkn29gRo77Qo1UlTM//UJrzusgrgTCNoYPawNgaor3nuOBkgO6
 9yvLTrxWUVkn0qpuhzZQKr7OH2V7twrSd9MVSMdHhCmIyj6AanwiH4uRZF9SM4moQxqW
 P8Gg==
X-Gm-Message-State: AOAM531zomL3nFEJBLJV2ssJpepVin7mlVSLd3qlYNEB9/8W2gc26nTA
 mRtWBKHz1meGyVx7EZP/VGE=
X-Google-Smtp-Source: ABdhPJz8UcTnhJMjqVzj//IRynVGj6DHXJzLRxFY20AEWWT0+6hgtNUecNWrIpo0/D5GJEv1WjEHug==
X-Received: by 2002:a17:902:8bcc:b0:14f:2294:232e with SMTP id
 r12-20020a1709028bcc00b0014f2294232emr9754162plo.105.1645834063924; 
 Fri, 25 Feb 2022 16:07:43 -0800 (PST)
Received: from localhost (118-208-203-92.tpgi.com.au. [118.208.203.92])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056a0023c900b004e10365c47dsm4550030pfc.192.2022.02.25.16.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 16:07:43 -0800 (PST)
Date: Sat, 26 Feb 2022 10:07:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
 <1645694174.z03tip9set.astroid@bobo.none>
 <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
 <1645700767.qxyu8a9wl9.astroid@bobo.none>
 <20220224172948.GN614@gate.crashing.org>
 <1645748553.sa2ewgy7dr.astroid@bobo.none>
 <20220225222841.GS614@gate.crashing.org>
In-Reply-To: <20220225222841.GS614@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1645833637.za1t01a9md.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "# 3.4.x" <stable@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of February 26, 2022 8:28 am:
> On Fri, Feb 25, 2022 at 10:23:07AM +1000, Nicholas Piggin wrote:
>> Excerpts from Segher Boessenkool's message of February 25, 2022 3:29 am:
>> > On Thu, Feb 24, 2022 at 09:13:25PM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Arnd Bergmann's message of February 24, 2022 8:20 pm:
>> >> > Again, there should be a minimum number of those .machine directive=
s
>> >> > in inline asm as well, which tends to work out fine as long as the
>> >> > entire kernel is built with the correct -march=3D option for the mi=
nimum
>> >> > supported CPU, and stays away from inline asm that requires a highe=
r
>> >> > CPU level.
>> >>=20
>> >> There's really no advantage to them, and they're ugly and annoying
>> >> and if we applied the concept consistently for all asm they would gro=
w=20
>> >> to a very large number.
>> >=20
>> > The advantage is that you get machine code that *works*.  There are
>> > quite a few mnemonics that translate to different instructions with
>> > different machine options!  We like to get the intended instructions
>> > instead of something that depends on what assembler options the user
>> > has passed behind our backs.
>> >=20
>> >> The idea they'll give you good static checking just doesn't really
>> >> pan out.
>> >=20
>> > That never was a goal of this at all.
>> >=20
>> > -many was very problematical for GCC itself.  We no longer use it.
>>=20
>> You have the wrong context. We're not talking about -many vs .machine
>> here.
>=20
> Okay, so you have no idea what you are talking about?  Wow.

Wrong context. It's not about -many. We're past that everyone agrees=20
it's wrong.

> The reason GCC uses .machine *itself* is because assembler -mmachine
> options *cannot work*, for many reasons.  We hit problems often enough
> that years ago we started moving away from it already.  The biggest
> problems are that on one hand there are mnemonics that encode to
> different instructions depending on target arch or cpu selected (like
> mftb, lxvx, wait, etc.), and on the other hand GCC needs to switch that
> target halfway through compilation (attribute((target(...)))).
>=20
> Often these problems were hidden most of the time by us passing -many.
> But not all of the time, and over time, problems became more frequent
> and nasty.
>=20
> Passing assembler -m options is nasty when you have to mix it with
> .machine statements (and we need the latter no matter what), and it

No it's not nasty, read the gas manual. -m specifies the machine and
so does .machine. It's simple.

> becomes completely unpredictable if the user passes other -m options
> manually.
> Inline assembler is inserted textually in the generated assembler code.
> This is a big part of the strength of inline assembler.  It does mean
> that if you need a different target selected for your assembler code
> then you need to arrange for that in your assembler code.
>=20
> So yes, this very much is about -many, other -m options, and .machine .
> I discourage the kernel (as well as any other project) from using -m
> options, especially -many, but that is your own choice of course.  I
> get sick and tired from you calling a deliberate design decision we
> arrived at after years of work and weighing alternatives a "bug" though.

Alan posted a good summary here

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102485#c10

Thanks,
Nick
