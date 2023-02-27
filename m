Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9096A4CFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 22:17:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQYGq4Q5Lz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 08:17:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.182; helo=mail-pg1-f182.google.com; envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQYGG0QbNz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 08:16:36 +1100 (AEDT)
Received: by mail-pg1-f182.google.com with SMTP id s18so4421580pgq.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 13:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677532593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5i/2+l6C7vo63hVcym9D0eHIni7kftv+BzjwhF/bLw=;
        b=5+KkFZlEi8IAkgYJD0m2ChBwckSvGrzmFQy1tJnt2VR806tsbXcB6sLZpDv4xxnFIe
         MYDpLSsthVjeg5yz44dLA8tY2o1wqMqJ+vjkXuvyZsdwQBnWsISKLiRZdZWEX4tdHowM
         DtYySZoYY08YX1VvuL2G1OCP1XzFof/+h3Rd2Ol9p32ewY1eyjcFXFrpzUDIOk59gBBm
         AmifCSzXhOCc3nMXa1xQgFYlgn7XFAN2+VGgMiKpL9l4JaGYsQWaBKS6e3rpJZTYqWzA
         LR0voFlDVR6H78TUUkwyTqUxqqKscjZRrZAI8y4WVZE1alb35z0NGX5VWrdkMGjEaNN3
         4yKQ==
X-Gm-Message-State: AO0yUKVesgd+AsjcWAJ2t2WoNBJf9rO+SUsXbnWTbFxiyL22A4kfw0jy
	OfUBJISI1mlc6AR4IWrF3aogc7hxbF4ZrQ==
X-Google-Smtp-Source: AK7set/4wfSGgRAyuAQzpKvMGnxsScDt7r3/ni4APf1tF5won62OvE94jF/UeYAOOqjfqvSvOttbmA==
X-Received: by 2002:a62:4eca:0:b0:5d6:4ef8:8c72 with SMTP id c193-20020a624eca000000b005d64ef88c72mr337464pfb.14.1677532593324;
        Mon, 27 Feb 2023 13:16:33 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id m3-20020aa78a03000000b005e06234e70esm4646177pfa.59.2023.02.27.13.16.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 13:16:32 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so11509335pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 13:16:32 -0800 (PST)
X-Received: by 2002:a17:90b:300c:b0:234:c035:7749 with SMTP id
 hg12-20020a17090b300c00b00234c0357749mr301896pjb.0.1677532592022; Mon, 27 Feb
 2023 13:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
In-Reply-To: <20230221194637.28436-1-paul.gortmaker@windriver.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 27 Feb 2023 15:16:19 -0600
X-Gmail-Original-Message-ID: <CADRPPNTyGPZOLwb5e20_FxwkpJ4ayt7VrgAEDgg7XqYSha3vMg@mail.gmail.com>
Message-ID: <CADRPPNTyGPZOLwb5e20_FxwkpJ4ayt7VrgAEDgg7XqYSha3vMg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 21, 2023 at 1:52=E2=80=AFPM Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> [This RFC is proposed for v6.4 and hence is based off linux-next.]
>
> In a similar theme to the e300/MPC83xx evaluation platform removal[1],
> this targets removal of some 13 --> 21 year old e500/MPC85xx evaluation
> boards that were produced in limited numbers and primarily made available
> to hardware/software developers to shape their own boards and BSPs.

These e500 platforms are similar to the e300 platforms that they are
still being shipped, the targeting market probably caused it to have a
longer life cycle.

>
> We start with the MPC8540-ADS[2] and MPC8560-ADS[3] -- based on the revis=
ion
> history in the user's guide[4], these near-identical platforms date back =
to
> at least 2002.  These boards are probably a part of the very small few th=
at
> still exist from the ppc ---> powerpc transition.  Typical of evaluation
> boards, and as the picture[3] shows, these boards had a large footprint i=
n
> order to break out connectors to evaluate as many features as possible.
>
> While it is up to each board OEM to provide input on the EOL of support
> for their own product, I will note that for comparison that I retired our
> SBC8560 support over a decade ago, in v3.6 (2012, in commit b048b4e17cbb)
> and nobody complained.
>
> Next, position yourself about 2007, and the MPC8548CDS (and variants)
> appeared as a vehicle to showcase the then new e500-v2 processor family,
> in a PCI-X card form factor with an additional backplane and the CPU on
> yet another daughter-card.  Not very "hobbyist" friendly.  As the saying
> goes, a picture[5] is worth 1000 words.
>
> Again, for comparison, and perhaps well overdue, I'd requested removal of
> our SBC8548 support in Jan 2021 (c12adb067844, v5.15).
>
> Still roughly in the 2007 era, the MPC8568-MDS[6] just might have been th=
e
> 2nd last in the MDS line that was similar to the MPC83xx-MDS in general
> form factor.  However, as can be seen in the User Guide picture, the
> PCI/PCI-X card edge has been deleted.

The difference here from the e300 platforms is that MPC8540ADS,
MPC8560ADS, MPC8548CDS, MPC8568-MDS are the only reference platforms
supplied by us for these SoCs.  We don't have a separation of
evaluation platforms vs product-like platforms like we did later.
That probably means even if they don't look like "hobbyist" friendly
they are more likely to be still in use.

>
> A semi-recent change in the Kconfig descriptions, in commit d20c96deb3e2
> ("powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options") mad=
e
> it clear some of the MPC8568-MDS support was shared/reused by the lower
> end of the next gen DDR3 enabled processor family -- QorIQ -- in the
> P1021/P1012 MDS[7] platforms.  This MDS variant re-added a PCI-e card edg=
e
> but retained the MDS form factor and overall goal of enabling hardware
> designs for OEM board manufacturers.
>
> Given that, we also include the P1021/P1012 MDS in this series, so that w=
e
> can then remove the MPC85xx_MDS Kconfig option and anything relying on it=
.
>
> Finally, we remove some orphaned MPC85xx kernel config fragments.
>
> Future considerations:
> ----------------------
> Similar to the e300/MPC83xx series, what is NOT touched here is any of th=
e
> e500/MPC85xx RDS or DS platforms.
>
> DS platforms -- In the next MPC85xx platform evolution, the M or C was
> dropped from MDS/CDS designation -- as the evaluation systems dropped the
> "card+backplane" architecture and more closely resembled a typical full
> sized PC-ATX motherboard of the era, with soldered CPU mounted high; RAM
> sockets nearby, and ATX compliant PCI slots below that.
>
> However the feature rich, evaluation goal was retained in this new
> Development System (DS) line.  Contrast that with the RDS systems which
> were a smaller form factor and with only core/critical features exposed t=
o
> connectors, and a ready to deploy to market as-is for the overall goal.
>
> With that in mind, in the future we may want to consider looking at the
> removal of the e500-v2 DS (MP8572DS[8], MPC8544DS[9], ...) platforms.
> However there is now once again overlap with the newer P1/P2 procfam DS
> systems from the same commit, and this time not under the MDS umbrella.
>
> Paul.
> --
>
> [1] https://lore.kernel.org/all/20230220115913.25811-1-paul.gortmaker@win=
driver.com/
> [2] https://www.nxp.com/products/no-longer-manufactured/application-devel=
opment-system-for-mpc8540:MPC8540ADS
> [3] https://www.nxp.com/products/no-longer-manufactured/application-devel=
opment-system-for-mpc8560:MPC8560ADS
> [4] https://www.nxp.com/docs/en/reference-manual/MPC8560ADSUG.pdf
> [5] https://www.flickr.com/photos/daiharuki/905150424/in/photostream/
> [6] https://www.nxp.com/docs/en/user-guide/MPC8568EMDSPBUGAD.pdf
> [7] https://www.nxp.com/design/qoriq-developer-resources/qoriq-p1021-p101=
2-modular-development-system:P1021MDS
> [8] https://www.nxp.com/products/no-longer-manufactured/integrated-commun=
ications-processor-development-system:MPC8572DS
> [9] https://www.nxp.com/docs/en/fact-sheet/MPC8544DSFS.pdf
>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
> Cc: Pali Roh=C3=A1r <pali@kernel.org>
>
> ---
>
> Paul Gortmaker (4):
>   powerpc: drop MPC8540_ADS and MPC8560_ADS platform support
>   powerpc: drop MPC85xx_CDS platform support
>   powerpc: drop MPC8568_MDS / P1021_MDS platform support
>   powerpc: remove orphaned MPC85xx kernel config fragments.
>
>  arch/powerpc/boot/Makefile                    |   5 -
>  arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 355 ----------------
>  arch/powerpc/boot/dts/fsl/mpc8541cds.dts      | 375 -----------------
>  arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi     | 302 -------------
>  arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  82 ----
>  arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  82 ----
>  arch/powerpc/boot/dts/fsl/mpc8555cds.dts      | 375 -----------------
>  arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 388 -----------------
>  arch/powerpc/boot/dts/fsl/mpc8568mds.dts      | 310 --------------
>  arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi | 270 ------------
>  arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi  |  68 ---
>  arch/powerpc/boot/dts/fsl/p1021mds.dts        | 319 --------------
>  arch/powerpc/configs/85xx-32bit.config        |   5 -
>  arch/powerpc/configs/85xx-hw.config           | 139 ------
>  arch/powerpc/configs/85xx-smp.config          |   2 -
>  .../configs/85xx/mpc8540_ads_defconfig        |  47 ---
>  .../configs/85xx/mpc8560_ads_defconfig        |  50 ---
>  .../configs/85xx/mpc85xx_cds_defconfig        |  52 ---
>  arch/powerpc/configs/mpc85xx_base.config      |   3 -
>  arch/powerpc/platforms/85xx/Makefile          |   3 -
>  arch/powerpc/platforms/85xx/mpc85xx_ads.c     | 171 --------
>  arch/powerpc/platforms/85xx/mpc85xx_cds.c     | 397 -----------------
>  arch/powerpc/platforms/85xx/mpc85xx_mds.c     | 398 ------------------
>  23 files changed, 4198 deletions(-)
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8540ads.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8541cds.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8555cds.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8560ads.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/fsl/mpc8568si-pre.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/fsl/p1021mds.dts
>  delete mode 100644 arch/powerpc/configs/85xx-32bit.config
>  delete mode 100644 arch/powerpc/configs/85xx-hw.config
>  delete mode 100644 arch/powerpc/configs/85xx-smp.config
>  delete mode 100644 arch/powerpc/configs/85xx/mpc8540_ads_defconfig
>  delete mode 100644 arch/powerpc/configs/85xx/mpc8560_ads_defconfig
>  delete mode 100644 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
>  delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_ads.c
>  delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_cds.c
>  delete mode 100644 arch/powerpc/platforms/85xx/mpc85xx_mds.c
>
> --
> 2.17.1
>
