Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C8686D04
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 18:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6TTl3Tc7z3cgr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 04:30:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aJBs2ADA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aJBs2ADA;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6TSp4ClWz3c9M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 04:30:01 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id g68so13007888pgc.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Feb 2023 09:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfqqW8xswcE4pCjxXD8PyH0teUj7MSVef6Ler61pLDU=;
        b=aJBs2ADAoMx6JaXIn+YDuFOty94//q3+Y2zjaQ7nJj7RhfZBucnHFDFtakhHvaDolr
         O+90olsE/GiHEBbhjULTa2lb7VdmFxqayLHVEXacqIBhBpBw6J4pk6/5L45Kk3AvmFW/
         L3N4eA/EnqfrqO0+xbn39oR0nv1X6Hk9kO/L6bhexilp0nWDE8oDYmpUHFi32HD5BwEf
         Lz6ftiDPylrJxzQUYC+lDCBoHdLUvEHQEurvy6xnEZKvgRnDx9a9DpRXhbKfZOwMJClT
         AqLmpWFtZ91PIoGUj13NL3S/bp/n7gwjVBkF9r0JNJCK/7c1hf0wUfRmrKOhJ9AlVf5g
         xAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfqqW8xswcE4pCjxXD8PyH0teUj7MSVef6Ler61pLDU=;
        b=ZYHiN1Pcds//kZNw8ezRQiuKs3Qrkww7jJKxIvUBuKfVVI8tgjxzwIHGayX67Pq7x0
         RX8Dx/YWq9YEf98wf1uPIODrKL6Nx0gv8yAQzexd5Vlf3sAzMGlthgFt7Y6RmV7aN0AG
         M6Feiu0Y450eR+i/885wHK/I1X4KbsUEiQWXrAd3jALe+Crz8ZTpQWASue3STXEsDGeG
         TuCmPtwdJjfiYiFe1N6Cy84kJFks0I+uluDP1IZa/slh/r4RBQZnBUi12bNwXoYfm4q9
         tiB00/i+JUeg85gePlpNL3IaIQzpx70A0BIJwDroJZWwxJXfrTvofGb9Qa8rnxTW5Xhp
         fyZg==
X-Gm-Message-State: AO0yUKWkuaoMgbJEJ95y3skwl0AoVM1K39w1zAX7K+XTlWE5Y33RyrPZ
	Mujg73sH4pCeTre+fumoAJWyTsnXCKo/enhx+AWYKA==
X-Google-Smtp-Source: AK7set9vkRiv0cc/fw6dQATGiIp+75R5GPoTDDv/YcUNxz4gdVqcNUtaoRhHK1Y52n0Qy7Puo6f0stvJAbouaLDshcU=
X-Received: by 2002:a05:6a00:721:b0:593:bcc4:11ec with SMTP id
 1-20020a056a00072100b00593bcc411ecmr742504pfm.6.1675272597296; Wed, 01 Feb
 2023 09:29:57 -0800 (PST)
MIME-Version: 1.0
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
 <20230201113155.18113-1-naresh.kamboju@linaro.org> <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
In-Reply-To: <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 1 Feb 2023 09:29:45 -0800
Message-ID: <CAKwvOdnc_ggT_2FQQwq71PiDE_D1xxXXnB5iSWvvoa3pu7kMdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "anders.roxell@linaro.org" <anders.roxell@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, qiongsiwu@gmail.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, nemanja.i.ibm@gmail.com, Linux Kernel Functional Testing <lkft@linaro.org>, "pali@kernel.org" <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 1, 2023 at 3:41 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 01/02/2023 =C3=A0 12:31, Naresh Kamboju a =C3=A9crit :
> > Following build regression started from next-20230131.
> >
> > Regressions found on powerpc:
> >
> >    build/clang-nightly-tqm8xx_defconfig
> >    build/clang-nightly-ppc64e_defconfig
> >
> >
> > make --silent --keep-going --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake=
/builds/1/build ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux-gnu- HOSTC=
C=3Dclang CC=3Dclang LLVM=3D1 LLVM_IAS=3D0 tqm8xx_defconfig
> > make --silent --keep-going --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake=
/builds/1/build ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux-gnu- HOSTC=
C=3Dclang CC=3Dclang LLVM=3D1 LLVM_IAS=3D0
> >
> > error: unknown target CPU '860'
> > note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 60=
3e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5=
, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5=
x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9,=
 pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, =
ppc64le, future
> > make[2]: *** [/builds/linux/scripts/Makefile.build:114: scripts/mod/dev=
icetable-offsets.s] Error 1
> > error: unknown target CPU '860'
> > note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 60=
3e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5=
, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5=
x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9,=
 pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, =
ppc64le, future
> > make[2]: *** [/builds/linux/scripts/Makefile.build:252: scripts/mod/emp=
ty.o] Error 1
>
>
> On GCC, the possible values are:
>
> ppc-linux-gcc: note : valid arguments to =E2=80=98-mcpu=3D=E2=80=99 are: =
401 403 405 405fp
> 440 440fp 464 464fp 476 476fp 505 601 602 603 603e 604 604e 620 630 740
> 7400 7450 750 801 821 823 8540 8548 860 970 G3 G4 G5 a2 cell e300c2
> e300c3 e500mc e500mc64 e5500 e6500 ec603e native power3 power4 power5
> power5+ power6 power6x power7 power8 powerpc powerpc64 powerpc64le rs64
> titan
>
> How do you tell CLANG that you are building for powerpc 8xx ?

+ Nemanjai, Qiongsi,


>
> >
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-2023020=
1/testrun/14479384/suite/build/test/clang-nightly-tqm8xx_defconfig/history/
> >
> > The bisection pointed to this commit,
> >    45f7091aac35 ("powerpc/64: Set default CPU in Kconfig")
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org



--=20
Thanks,
~Nick Desaulniers
