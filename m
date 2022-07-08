Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40456C127
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 22:05:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lfkld1Gc6z3cBy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 06:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.187; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lfkl53tdRz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 06:04:31 +1000 (AEST)
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQgtC-1nyRLA49x8-00Ni7r for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul
 2022 22:04:27 +0200
Received: by mail-yb1-f173.google.com with SMTP id l11so39475822ybu.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 13:04:26 -0700 (PDT)
X-Gm-Message-State: AJIora/SopMw1usE0LD+2YXHURi0iWEuRRmzWcOZ253pNjoW9g2whnpl
	zKqJm6Cd8chxurtlNxTKpHhny4FuJTofdGlcyUI=
X-Google-Smtp-Source: AGRyM1savU/Qw4Umj3pyp2adCxX0XYcdGWhZpyJOvSwo6AcbUz+MBNyDLd6G6BSJJDRVleS8AnJ0WO3o2LAilMgwrYM=
X-Received: by 2002:a5b:b47:0:b0:66e:3617:d262 with SMTP id
 b7-20020a5b0b47000000b0066e3617d262mr5273482ybr.106.1657310665592; Fri, 08
 Jul 2022 13:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au> <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com> <20220708171227.74nbcgsk63y4bdna@pali>
In-Reply-To: <20220708171227.74nbcgsk63y4bdna@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Jul 2022 22:04:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
Message-ID: <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4jh5STvBp7xpx2k/ay7rdYT7dRxmqwNyzzj4fg1/24sPPMOAXQr
 D4nDMSVJ3IYDuUxR9OkgqRLsL9gINkI9PbQw9o1tnQKLm9l8h0+A2lONvQN3lzlwJ7O10bG
 b7dMI8QCYy543lGxEUBqV5zBwdwPMPyhg4RSp9SH7clR7T2SwVcIXtc0ZPW9J6pGe7xIAj+
 4ug1kjalmJHPFCifYqqPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rqm2Ct6g50c=:SFsd+SHOFqKdwLtS2ZpgKU
 5gy6w05MdHE1p9LnMCVdhrZRNZ8Gs3Gq48Q/vi30cCVNh1l7yCTT30DHC8P9ap7drVYbYzoWD
 JF94xn7QRQW3q2lWg2K90OfTVSG+zvS6UAFLm0R5svGCHvfoO8t0cUYCOBQgzb0dMame+fq2F
 lhRBBkCBI11iYB+o/PEfvJeKiN9s5b68cMXffNqxxZk6vzn7Wm6ZyPePFPBj0moNUosPrSYXr
 mloUB3ix3AMQ9GZkbStBb72RnLPDNoBeBXl5fXCBpEMcwf3sg+SevDbpU8yldxlaRMldGz55j
 gKTiQiSyL60D81q6cCh1J9jAyGmh3iE7N6UNVfkZpoh4VZZLM4ktDMSLRPtyIFOBRRwr9H2lK
 mjdT2jj5EJeymJrZP/qqNWWga++vKDKzZ/YpWDlRAR7nJsOUqwxU9GmbmkkBgg7f1GKEWxOum
 0kcjpEeziTthxm0y86Mb6Uhpv4236llljUszveWSgE9Wd7jfDIJ2hp/pqUiQVJ4GImli2frTh
 JN720OVFenyghgEqB6u6qMoEZW4E9S5v1IR6R+grrePxBg80NCFCRc4G98jsGx75s43EaRo6P
 Hj1FC6s6zpczeqj/zd7ginRJERcsmDKZ9cuXDhuTAwhp2IK9oj7kdUec2onftqeiIh6AtJ0Aj
 V0RQuxmISIGpFF1+f9btdUGh26pOx/gsKXBFBWjpyvFTRKwAGMPvQRuSl/xbzBxnWCI8v1CKb
 W6JpcpxMTGGF9KD9u10GEofeQ6EXrYlTR1z4yA==
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 8, 2022 at 7:12 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> On Monday 04 July 2022 14:07:10 Arnd Bergmann wrote:
> > Another problem I see is that a kernel that is built for both E500 and =
E500MC
> > uses -mcpu=3De500mc and may not actually work on the older ones either
> > (even with your patch).
>
> Such configuration is not supported, see arch/powerpc/platforms/Kconfig.c=
putype:
>
> config PPC_E500MC
>         bool "e500mc Support"
>         select PPC_FPU
>         select COMMON_CLK
>         depends on E500
>         help
>           This must be enabled for running on e500mc (and derivatives
>           such as e5500/e6500), and must be disabled for running on
>           e500v1 or e500v2.
>
> Based on this option you can enable either support for e500v1/e500v2 or
> for e500mc. But not both.

This looks like a bad decision in Kconfig though, as there is nothing
enforcing the rule: If you want support for E500MC, you have to select
PPC_85xx, which implies E500 and allows selecting any combination
of E500v1, E500v2 and E500MC based machines, but enabling
any E500MC based one breaks all the others.

If this is a hard dependency, I think it should be enforced by making
E500MC a separate top-level option in the "Processor Type" choice
statement. However, if they can actually coexist, the help text and
the Makefile need to be fixed.

       Arnd
