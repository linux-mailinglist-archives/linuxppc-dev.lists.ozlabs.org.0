Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A66A4C75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 21:48:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQXfK2Sbmz3c83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 07:48:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.181; helo=mail-pl1-f181.google.com; envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQXdn5gFZz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 07:48:29 +1100 (AEDT)
Received: by mail-pl1-f181.google.com with SMTP id n6so6752020plf.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 12:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677530906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+m9KvQgsk6KX1umFXOQFHmJN94F4Y5922Swg5OIj4o=;
        b=d1C/37ML11Hfppy0CY+qc5X0hKCG0Gn3xi8ruzwhJMeDnGAtoAmASQ2sftJIx+jTh1
         2nliRajMdK9543h7WptRG1xnBFWz8sEiVGBolZoVqOHE1S5MlS5l4rPwUfOc70bWJ9tq
         2ZpMJfjawUEfUwDJafpW3wcLADcYuNeh+neyGukoiMVsXyB+u5kokLvGT/hFdhDFLEwj
         m32OloclIopzbdbJX/HLXwKBdq7iss7Y8wXuJLiaJUcSMm3XFOFpBTDMxqbGItvSCi46
         h1P9Z+Z8+kWQYg+orQkFbQKv4nLPnGtsiWMnUN/qPweHGCJoE3nzvYKVRhK5FOtxZeQ/
         qG7g==
X-Gm-Message-State: AO0yUKXxIxsB8t3DLnWG8Hh1hd69IPF0HTOkRTBWA+57uMNXZZZNWeG5
	9c/uCYxHXJ9p2wrXU0ugWUZD+SwNgF8wQw==
X-Google-Smtp-Source: AK7set+jQ3mnnTovLzjI94YA+zLdlMJQetjwELoXY+x7IFqY7LLIx0X7ArUA5HxRnU7me2lvc6Vo2g==
X-Received: by 2002:a17:902:8505:b0:19c:a0e6:8026 with SMTP id bj5-20020a170902850500b0019ca0e68026mr117175plb.50.1677530906064;
        Mon, 27 Feb 2023 12:48:26 -0800 (PST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709029a0b00b001898ee9f723sm5034572plp.2.2023.02.27.12.48.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:48:25 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id p6so7292571plf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 12:48:24 -0800 (PST)
X-Received: by 2002:a17:90a:62c1:b0:237:9029:c29b with SMTP id
 k1-20020a17090a62c100b002379029c29bmr277929pjs.0.1677530904518; Mon, 27 Feb
 2023 12:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
In-Reply-To: <Y/o8bQz5CuRhdD8B@windriver.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 27 Feb 2023 14:48:12 -0600
X-Gmail-Original-Message-ID: <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
Message-ID: <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
To: Paul Gortmaker <paul.gortmaker@windriver.com>
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
Cc: Scott Wood <oss@buserror.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 25, 2023 at 10:52=E2=80=AFAM Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> [RE: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms] On 24=
/02/2023 (Fri 21:16) Leo Li wrote:
>
> >
> >
> > > -----Original Message-----
> > > From: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > Sent: Monday, February 20, 2023 5:59 AM
> > > To: linuxppc-dev@lists.ozlabs.org
> > > Cc: Leo Li <leoyang.li@nxp.com>; Claudiu Manoil <claudiu.manoil@nxp.c=
om>;
> > > Paul Gortmaker <paul.gortmaker@windriver.com>; Scott Wood
> > > <oss@buserror.net>; Michael Ellerman <mpe@ellerman.id.au>; Benjamin
> > > Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras
> > > <paulus@samba.org>
> > > Subject: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platform=
s
> > >
> > > [This RFC is proposed for v6.4 and hence is based off linux-next.]
> > >
> > > This series removes support for four e300 (MPC83xx) Freescale process=
or
> > > family evaluation boards that were added to the kernel in the 2006 er=
a.
> >
> > Hi Paul,
> >
> > I talked with our marketing team on this.  Although we do not recommend=
 any new design with these SoCs, they are still being shipped in large amou=
nt to customers now.  Plus it is possible for the bigger amount of existing=
 devices to be updating their software that includes a new kernel.  So we s=
hould definitely keep all the common SoC code that might be needed to suppo=
rt their own design.
>
> Thanks for confirming with your marketing team that they "do not
> recommend any new design with these SoCs" -- it also confirms the
> information I read on the web pages for the platforms.
>
> As those of us immersed in this world all know from the 101 basics of
> Product Life Cycle lessons, it doesn't matter if it is a phone or a
> set-top-box/PVR or whatever else kind of non-PC consumer device --
> kernel uprevs never happen in that product space.

One thing is that the QorIQ platforms are not for the consumer
devices.  They are mostly used in networking or communication
equipment.  I think their product life cycle would be more like the
server or data center scenario.

Regards,
Leo
>
> So with the best interests of the mainline kernel in mind, I think we
> are good to proceed with this for summer 2023.  And of course as I've
> said many times before - the kernel is in git, so really you can't
> delete anything anyway - it remains in history forever.
>
> Thanks,
> Paul.
> --
>
> >
> > >
> > > These boards were all of a very similar form factor, a largish PCI or=
 PCI-X card
> > > that could also be used standalone with an external power brick, and =
all
> > > shared the Modular Development System (MDS) designation.
> > >
> > > These platforms were made in limited quantity and were generally desi=
gned
> > > to get early silicon into the hands of OEMs who would later develop t=
heir
> > > own boards/platforms.  As such, availability was limited to those who=
 would
> > > be working on boards and/or BSP support.
> > >
> > > Many early revision MDS platforms used a mechanical clamping system t=
o
> > > hold the BGA CPU in place to facilitate CPU updates -- something not
> > > normally possible for a soldered down BGA in a COTS system.
> > >
> > > The point of these details is to give context that reflects that thes=
e four
> > > boards were made in limited quantities, were not in a form factor tha=
t is
> > > really "hobbyist" friendly and hence make sense for removal 17 years =
later.
> >
> > We would agree with you that the MDS platforms are only used by a limit=
ed number of customers for evaluation purpose, so it should be fine to be r=
emoved.  So for this series:
> >
> > Acked-by: Li Yang <leoyang.li@nxp.com>
> >
> > >
> > > Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> > > MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel=
.
> > >
> > > There will still exist several e300 Freescale Reference Design System=
 (RDS)
> > > boards[5] and mini-ITX boards[6] with support in the kernel.  While t=
hese
> > > were more of a COTS "ready to deploy" design more suited to hobbyists=
, it
> > > probably makes sense to consider removing these as well, based on age=
.
> >
> > These boards are mass market boards that sold in larger amount and are =
much more likely to still be used.  We would suggest we keep them for now.
> >
> > >
> > > But before we get to that, lets see how this goes -- and then we shou=
ld look
> > > at similar early e500 evaluation platforms [MPC8540-ADS, etc] next, a=
s the
> > > oldest there date back to 2002[7] -- before considering RDB/mITX.
> > >
> > > I intentionally didn't put any links in the commits, since as we all =
know, they
> > > tend not to be stable long term, so keep them here in the merge data.
> > > Credit to NXP for keeping around these old legacy docs this long!
> > >
> > > Paul.
> > >
> > > --
> > >
> > > [1]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .nxp.com%2Fdesign%2Fqoriq-developer-resources%2Fmpc8349e-modular-
> > > development-
> > > system%3AMPC8349EMDS&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> > > 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> > > 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > > MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> > > 0%7C%7C%7C&sdata=3DQ4COgwpjsE4mHXvl9HdGo3otPCYML3z%2FR6IoCEYRE
> > > wg%3D&reserved=3D0
> > > [2]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .nxp.com%2Fdocs%2Fen%2Fuser-
> > > guide%2FMPC8360EMDSUM.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com
> > > %7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c30
> > > 1635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8ey
> > > JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > > 7C3000%7C%7C%7C&sdata=3DJyLT0MfGAHQ8a%2FNgpLdVFtyACkwPR%2FOkB
> > > yN1aW0wySs%3D&reserved=3D0
> > > [3]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> > > mcus%2Fpowerquicc-processors%2Fpowerquicc-iii-mpc85xx%2Fmpc837xe-
> > > modular-development-
> > > system%3AMPC837XEMDS&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> > > 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> > > 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > > MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> > > 0%7C%7C%7C&sdata=3D052dpEEcGmbuhRLnMDCNoOkTeguF%2BPA0oJGNvV1
> > > jSjI%3D&reserved=3D0
> > > [4]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> > > mcus%2Fpowerquicc-processors%2Fpowerquicc-ii-pro-mpc83xx%2Flow-
> > > power-powerquicc-ii-pro-processor-with-ddr2-tdm-pci-security-usb-quic=
c-
> > > engine-with-
> > > utopia%3AMPC8323E&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1
> > > e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> > > 7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> > > wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> > > C%7C%7C&sdata=3DmZQh%2FogNgNUb0wNJV972kYIDvn61gx0TWNd1u1d7PZ
> > > Q%3D&reserved=3D0
> > > [5]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .nxp.com%2Fdocs%2Fen%2Ffact-
> > > sheet%2FMPC8379ERDBFS.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com%7
> > > Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > > 35%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> > > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > > 7C3000%7C%7C%7C&sdata=3DEJmP6Regr7zpvYvHUmX64h3LZSaBT3Mb1h%2BN
> > > KQT%2FUls%3D&reserved=3D0
> > > [6]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .digikey.ca%2Fen%2Fproducts%2Fdetail%2Fnxp-usa-inc%2FMPC8349E-MITX-
> > > GP%2F1204733&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1e44264
> > > 0c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7
> > > C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
> > > 7C&sdata=3Dhw6IQDUaXH6huQFCnCkFIbNfj1xMrq%2FanDMUU%2FXZYQg%3
> > > D&reserved=3D0
> > > [7]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww
> > > .nxp.com%2Fdocs%2Fen%2Freference-
> > > manual%2FMPC8560ADSUG.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com%
> > > 7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301
> > > 635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> > > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > > 7C3000%7C%7C%7C&sdata=3DEd%2BZR07y9Sp8xx5H47SAXzk9ET73creygxk%2B
> > > emmbfuA%3D&reserved=3D0
> > >
> > > Cc: Scott Wood <oss@buserror.net>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: Li Yang <leoyang.li@nxp.com>
> > > Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
> > >
> > > ---
> > >
> > > Paul Gortmaker (4):
> > >   powerpc: drop MPC834x_MDS platform support
> > >   powerpc: drop MPC836x_MDS platform support
> > >   powerpc: drop MPC837x_MDS platform support
> > >   powerpc: drop MPC832x_MDS platform support
> > >
> > >  arch/powerpc/boot/Makefile                    |   1 -
> > >  arch/powerpc/boot/dts/mpc832x_mds.dts         | 436 ---------------
> > >  arch/powerpc/boot/dts/mpc834x_mds.dts         | 403 --------------
> > >  arch/powerpc/boot/dts/mpc836x_mds.dts         | 481 ----------------=
-
> > >  arch/powerpc/boot/dts/mpc8377_mds.dts         | 505 ----------------=
--
> > >  arch/powerpc/boot/dts/mpc8378_mds.dts         | 489 ----------------=
-
> > >  arch/powerpc/boot/dts/mpc8379_mds.dts         | 455 ----------------
> > >  .../configs/83xx/mpc832x_mds_defconfig        |  59 --
> > >  .../configs/83xx/mpc834x_mds_defconfig        |  58 --
> > >  .../configs/83xx/mpc836x_mds_defconfig        |  64 ---
> > >  .../configs/83xx/mpc837x_mds_defconfig        |  58 --
> > >  arch/powerpc/configs/mpc83xx_defconfig        |   4 -
> > >  arch/powerpc/configs/ppc6xx_defconfig         |   4 -
> > >  arch/powerpc/platforms/83xx/Kconfig           |  32 --
> > >  arch/powerpc/platforms/83xx/Makefile          |   4 -
> > >  arch/powerpc/platforms/83xx/mpc832x_mds.c     | 110 ----
> > >  arch/powerpc/platforms/83xx/mpc834x_mds.c     | 101 ----
> > >  arch/powerpc/platforms/83xx/mpc836x_mds.c     | 210 --------
> > >  arch/powerpc/platforms/83xx/mpc837x_mds.c     | 103 ----
> > >  19 files changed, 3577 deletions(-)
> > >  delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
> > >  delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
> > >  delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
> > >  delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
> > >  delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
> > >  delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
> > >  delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
> > >  delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
> > >  delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
> > >  delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
> > >  delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c
> > >  delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c
> > >  delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c
> > >  delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c
> > >
> > > --
> > > 2.17.1
> >
