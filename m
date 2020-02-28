Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B15172FA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:04:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TGBR5KL6zDr75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 15:04:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=hmuZ9Bx5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jza5eG7E; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TG8h1YRwzDqBH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 15:02:43 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6587480F;
 Thu, 27 Feb 2020 23:02:39 -0500 (EST)
Received: from imap35 ([10.202.2.85])
 by compute5.internal (MEProxy); Thu, 27 Feb 2020 23:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=yDNr6
 cIp+q6/+ecebXB5XIPiNj/FLJ3ZWp+FFBnyePQ=; b=hmuZ9Bx5DouFkImGnpHjm
 afcJX/vqOgpiYmp/4/McrkRHqA5EuONL655Qj+b+4j7J9hIBZF6UGjUZHIj60nzm
 0FPYZtRoklOBQUH59CMzJm0vWGOAUG1iprX88rA9hLvlHT61MwDiChTnKUbeeHml
 /pJ3B8cX7jwygwseJyn1Yjc/6GobbY4lbfQ6AGNTG2yFRFpO4rhrQp/ql8sTacKL
 QRF/u0LAewxfBWuHa64sLLhnX7nVJ/0gxARS/QcINiJh7D0lQB1B3g4NKoOyJvwh
 Q0zfz1aqWaCAEjVvybXhnVDZU4EuHd5zJZhP3FuBzMqvQMV4523qMcqEF0b+1oUw
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=yDNr6cIp+q6/+ecebXB5XIPiNj/FLJ3ZWp+FFBnye
 PQ=; b=jza5eG7Er+x/TQZ1O99s6GZ+cQRP5fd9XdaDO3xN7UPh0DR19ZgIiiyS3
 8i1OSuKAk4SerQRk+WUSFDgGFxjnItViPKA7T86pCOTR2uCtx4iOFEnD0gnIhSwA
 XQOzFSM0lfoyol2q1SfiHNBSsJd9llACE6j+3+sjWszXCMZRWUpI2qwi9DxBVEAK
 cJmHgXXa1HGp7Cf1FKUqvEHAPaMpMtn0aBgO/OfoCxgq1J8D+PAF11bCSxe5gwiX
 oAFKer+RFqXTDNjmypair9hJ/AKsyNMNHRd3jGcTafGzF4k6bzf2RsNGoYbu9E/c
 bs12/b8/NQOepHyWbENFGpFWZsoHw==
X-ME-Sender: <xms:3pBYXhR83RYqKPQLI-Ae0f0lek3mSW_dxOUc0VVmcV470Sfx51Imaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleejgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvtddmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftfhushhsvghllhcuvehurhhrvgihfdcuoehruhhstghurhesrh
 hushhsvghllhdrtggtqeenucffohhmrghinhepohiilhgrsghsrdhorhhgpdhophgvnhhp
 ohifvghrrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:3pBYXmobO1AiVzZ7gm-qsms1tEX-tPsiCh0kErdlcrWRmEFUxXb-1g>
 <xmx:3pBYXiXPl34miLHkcfcYUE1eHVPPSjw7h7GluDfAk3LFEWGN7MDfUg>
 <xmx:3pBYXs9aTaoea54uFnl4IEH4-vnJPBxXG8qbIz7Lm1aR3EPM6h3IGg>
 <xmx:35BYXgjFBdgXurWFS-Ho1KR7WwTAAoC2lQEDtj14VGaLWtGAjg3ijg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0ACB414C014D; Thu, 27 Feb 2020 23:02:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <95816cae-565b-40a8-a3bf-4733672c6e91@www.fastmail.com>
In-Reply-To: <b2b97a86-2f29-af14-52c2-a69ef6202b75@linux.ibm.com>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
 <d45c91cf5f83424b8f3989b7ead28c50d8d765a9.1582803998.git.christophe.leroy@c-s.fr>
 <4e528bf2-2b53-ae93-cdcc-0c80953f40f2@c-s.fr>
 <87pndz1xsf.fsf@mpe.ellerman.id.au>
 <b2b97a86-2f29-af14-52c2-a69ef6202b75@linux.ibm.com>
Date: Fri, 28 Feb 2020 15:02:14 +1100
From: "Russell Currey" <ruscur@russell.cc>
To: "Andrew Donnellan" <ajd@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@c-s.fr>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, mikey@neuling.org
Subject: =?UTF-8?Q?Re:_[PATCH_v4_13/13]_powerpc/ptrace:_move_ptrace=5Ftriggered()?=
 =?UTF-8?Q?_into_hw=5Fbreakpoint.c?=
Content-Type: text/plain;charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This was my fault, I should really test changes like these before they g=
o live.  Apologies for the confusion caused

--=20
  Russell Currey
  ruscur@russell.cc

On Fri, Feb 28, 2020, at 2:59 PM, Andrew Donnellan wrote:
> On 28/2/20 9:16 am, Michael Ellerman wrote:
> > Christophe Leroy <christophe.leroy@c-s.fr> writes:
> >> Russel,
> >>
> >> Le 27/02/2020 =C3=A0 12:49, Christophe Leroy a =C3=A9crit=C2=A0:
> >>> ptrace_triggered() is declared in asm/hw_breakpoint.h and
> >>> only needed when CONFIG_HW_BREAKPOINT is set, so move it
> >>> into hw_breakpoint.c
> >>
> >> My series v4 is definitely buggy (I included ptrace_decl.h instead
> >> instead of ptrace-decl.h), how can Snowpatch say build succeeded
> >> (https://patchwork.ozlabs.org/patch/1245807/) ?
> >=20
> > Which links to:
> >    https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15=
895//artifact/linux/report.txt
> >=20
> > The actual build log of which is:
> >    https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15=
895/artifact/linux/build_new.log
> >=20
> > Which contains:
> >    scripts/Makefile.build:267: recipe for target 'arch/powerpc/kerne=
l/ptrace/ptrace-altivec.o' failed
> >    make[3]: *** [arch/powerpc/kernel/ptrace/ptrace-altivec.o] Error =
1
> >    make[3]: *** Waiting for unfinished jobs....
> >    scripts/Makefile.build:505: recipe for target 'arch/powerpc/kerne=
l/ptrace' failed
> >    make[2]: *** [arch/powerpc/kernel/ptrace] Error 2
> >    make[2]: *** Waiting for unfinished jobs....
> >    scripts/Makefile.build:505: recipe for target 'arch/powerpc/kerne=
l' failed
> >    make[1]: *** [arch/powerpc/kernel] Error 2
> >    make[1]: *** Waiting for unfinished jobs....
> >    Makefile:1681: recipe for target 'arch/powerpc' failed
> >    make: *** [arch/powerpc] Error 2
> >    make: *** Waiting for unfinished jobs....
> >=20
> > Same for ppc64le:
> >    https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15=
896/artifact/linux/build_new.log
> >=20
> >=20
> > So it seems like snowpatch always reports the build as succeeded eve=
n
> > when it fails.
>=20
> Turns out there was an issue in a recent change in our build script=20=

> which caused build failures to return the wrong exit code and put the=20=

> wrong text in the reports, because of some confusion with bash=20
> subshells. I've fixed it (I think).
>=20
> --=20
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
>=20
>
