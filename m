Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 143CC68A111
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 18:59:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7k2574rQz3f7x
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 04:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YccVIaj7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YccVIaj7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7k1B5KW9z3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 04:58:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8067B82B8C;
	Fri,  3 Feb 2023 17:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B326C433D2;
	Fri,  3 Feb 2023 17:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675447129;
	bh=h0FX8njn5v6dhV2AUGOJNYLtMQEKPbwS8wqqRVOBFXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YccVIaj7oaIBJXC0g+3yS+sil13YXsVVAYIp9f2Bd0HIyWQHX8pkeeGpE5yqISmpQ
	 NWyJWS3MfXIHCRUP7hmOBWXl4yGXJ1XQ3tbtpljGE90J7SeLIH0T+A9gnLj8Dvy7ID
	 QeOIrs1upGpfj1NDWWvM+SAJdlsTtMmSNb4rEdnVKy9aPjTEvGKwZFOk5zQfpzJcLP
	 uCZ2RaQ522dlqarGF87ZXl0KEpxyJusSK3SG9DZRRUGCk7Ce/tU6sWdahxYzt+/oAq
	 z983AnRaVXjiOhOF8Zn2cWO+x/IX6Hum3xScZdy8wtSLqtmb/VsG62YKforEDlbKt5
	 k91fom1q1q9ew==
Received: by pali.im (Postfix)
	id 4F160723; Fri,  3 Feb 2023 18:58:46 +0100 (CET)
Date: Fri, 3 Feb 2023 18:58:46 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Message-ID: <20230203175846.oczctwfr2jq7usze@pali>
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
 <20230201113155.18113-1-naresh.kamboju@linaro.org>
 <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
 <CAKwvOdnc_ggT_2FQQwq71PiDE_D1xxXXnB5iSWvvoa3pu7kMdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnc_ggT_2FQQwq71PiDE_D1xxXXnB5iSWvvoa3pu7kMdQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: "anders.roxell@linaro.org" <anders.roxell@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, qiongsiwu@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nemanja.i.ibm@gmail.com, "nathan@kernel.org" <nathan@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Linux Kernel Functional Testing <lkft@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 01 February 2023 09:29:45 Nick Desaulniers wrote:
> On Wed, Feb 1, 2023 at 3:41 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >
> > Le 01/02/2023 à 12:31, Naresh Kamboju a écrit :
> > > Following build regression started from next-20230131.
> > >
> > > Regressions found on powerpc:
> > >
> > >    build/clang-nightly-tqm8xx_defconfig
> > >    build/clang-nightly-ppc64e_defconfig
> > >
> > >
> > > make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 tqm8xx_defconfig
> > > make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0
> > >
> > > error: unknown target CPU '860'
> > > note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
> > > make[2]: *** [/builds/linux/scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
> > > error: unknown target CPU '860'
> > > note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
> > > make[2]: *** [/builds/linux/scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
> >
> >
> > On GCC, the possible values are:
> >
> > ppc-linux-gcc: note : valid arguments to ‘-mcpu=’ are: 401 403 405 405fp
> > 440 440fp 464 464fp 476 476fp 505 601 602 603 603e 604 604e 620 630 740
> > 7400 7450 750 801 821 823 8540 8548 860 970 G3 G4 G5 a2 cell e300c2
> > e300c3 e500mc e500mc64 e5500 e6500 ec603e native power3 power4 power5
> > power5+ power6 power6x power7 power8 powerpc powerpc64 powerpc64le rs64
> > titan
> >
> > How do you tell CLANG that you are building for powerpc 8xx ?

Maybe llvm does not have support for this old CPU core at all? Because
from 'note: valid target CPU values are:' message it looks like that.

> + Nemanjai, Qiongsi,
> 
> 
> >
> > >
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230201/testrun/14479384/suite/build/test/clang-nightly-tqm8xx_defconfig/history/
> > >
> > > The bisection pointed to this commit,
> > >    45f7091aac35 ("powerpc/64: Set default CPU in Kconfig")
> > >
> > > --
> > > Linaro LKFT
> > > https://lkft.linaro.org
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
