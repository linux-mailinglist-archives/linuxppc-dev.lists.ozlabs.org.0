Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F15F0615
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 09:54:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf2Z85vS8z3cd5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 17:54:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KPvMDbth;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KPvMDbth;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf2YX2Cfnz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 17:54:07 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-324ec5a9e97so36846437b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+DPmC9HGrxyWVOvuIfYhJcdnRJHGFY3DQuvHfCTpW3E=;
        b=KPvMDbthihCGrWQvuWrM9AtuWIM/OklMJMhddG7ibfStcBEDi47Y+025W4ZyKgLgwC
         v0vh6m61ddwRptMFk43Ssjz7U51PJ4tetWpMjJWyWSJDYndad1eo9v8NTLz2glMjoyLi
         W/cS72g9xtNkPydsYF8770TB7OQDHFb4WuF5DWXkJ3UWOq3H9j25L7essqzfEoqALX4i
         CP/6NqUOjpBbArhNIXFDzmqLvkf4dr5Lv8u8146f/evQfcBVJjFcsxjA+Dqs5xomcGlz
         3IBThGWwo44PKm6zvAgTbXQ9g6CsNXfVeRdy0oF9OgoBbg7j95SrumBee0Cj5oJrJTTx
         K10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+DPmC9HGrxyWVOvuIfYhJcdnRJHGFY3DQuvHfCTpW3E=;
        b=bZ1fU2keY40fysz0kOoWg7V38hoDOd09xQdjLCdYim3RVVTBt/zhHFWu/5s6RQG1uJ
         IDsFezqrlmV2iXkX4u4Rdce2Wbj56Dg48pRBYXl/zNDUO0XfrZte2j46UKJE+QLO30Uq
         Kso8T6AaDeGQG+JVJoNI9c6JB+ZXeHZrs1RHlpn4OyDZeTwSQVBB1RGL8kSGKLii/w79
         l29FrTnV8tRAk/D3DhXirXgyq7k2eMTkIq4IJScZMFRXTYpHEoTh5nnBMcRCDgGOigBM
         z1Ig0/FDUFJgtA5BZkhi/+utyoynID7xim05hZodJz6BeLk80Bm+VIbp2mCLNADxblMP
         2DDg==
X-Gm-Message-State: ACrzQf3joH+/iK0fcgkXfmSE1zwRelp44tdzNRdeOQ1G+XeZOyQaxxOF
	JDuX8pooh2m9k2fooei8kCGkhZYXr5cZ7JmsJ4c=
X-Google-Smtp-Source: AMsMyM6nWP/YKahyME6/s++e0muG7M4L0C2OH6h/KC0/kolceUAS4xpt9MbVbehMHTUqK4Kc67LXlPOC4b2V1vYLrYA=
X-Received: by 2002:a0d:f905:0:b0:345:3b1b:a00d with SMTP id
 j5-20020a0df905000000b003453b1ba00dmr7318289ywf.510.1664524443665; Fri, 30
 Sep 2022 00:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220929101502.32527-1-lukas.bulwahn@gmail.com> <87pmfdpatr.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmfdpatr.fsf@mpe.ellerman.id.au>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 30 Sep 2022 09:53:52 +0200
Message-ID: <CAKXUXMxe5EagwsQVyt_WLf2mMXZbUqzaEaiUjBj9ZwRRZywx0g@mail.gmail.com>
Subject: Re: [PATCH] powerpc: update config files
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 30, 2022 at 9:42 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> > Clean up config files by:
> >   - removing configs that were deleted in the past
> >   - removing configs not in tree and without recently pending patches
> >   - adding new configs that are replacements for old configs in the file
> >
> > For some detailed information, see Link.
> >
> > Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
>
> Ideally I'd like a list in the change log of each symbol and why they're
> being removed/changed. It's pretty easy to accidentally drop something
> otherwise.
>
> I think this is the list in this case:
>
> Renamed:
>   - CONFIG_PPC_PTDUMP -> CONFIG_GENERIC_PTDUMP
>     e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
>
> Removed:
>   - CONFIG_BLK_DEV_CRYPTOLOOP
>     47e9624616c8 ("block: remove support for cryptoloop and the xor transfer")
>
>   - CONFIG_CRYPTO_RMD128
>     b21b9a5e0aef ("crypto: rmd128 - remove RIPE-MD 128 hash algorithm")
>
>   - CONFIG_CRYPTO_RMD256
>     c15d4167f0b0 ("crypto: rmd256 - remove RIPE-MD 256 hash algorithm")
>
>   - CONFIG_CRYPTO_RMD320
>     93f64202926f ("crypto: rmd320 - remove RIPE-MD 320 hash algorithm")
>
>   - CONFIG_CRYPTO_SALSA20
>     663f63ee6d9c ("crypto: salsa20 - remove Salsa20 stream cipher algorithm")
>
>   - CONFIG_CRYPTO_TGR192
>     87cd723f8978 ("crypto: tgr192 - remove Tiger 128/160/192 hash algorithms")
>
>   - CONFIG_HARDENED_USERCOPY_PAGESPAN
>     1109a5d90701 ("usercopy: Remove HARDENED_USERCOPY_PAGESPAN")
>
>   - CONFIG_RAPIDIO_TSI568, CONFIG_RAPIDIO_TSI57X
>     612d4904191f ("rapidio: remove not used code about RIO_VID_TUNDRA")
>
>   - CONFIG_RAW_DRIVER
>     603e4922f1c8 ("remove the raw driver")
>
>   - CONFIG_ROCKETPORT
>     3b00b6af7a5b ("tty: rocket, remove the driver")
>
>   - CONFIG_ENABLE_MUST_CHECK
>     196793946264 ("Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK")
>
>
> I'll fold that into the change log.
>

Sure. Go ahead. I have provided all information I collected in the
linked email (and this information drove my scripts to take actions)
and I am happy to provide it in any form a maintainer may think is
good for them. But I assume you did this with a simple script
yourself.

After going through the changes of Kconfig from the last decade, it
seems feasible that the information on Kconfig changes is actually
maintained somewhere and that would allow updating of arbitrary kernel
configs to newer kernel versions. It is not completely out of reach at
least.

And to really improve the situation, I would like to reduce all these
defconfigs in the repository to minimal kernel fragments that really
focus on what these config for specific machines intend to tell. E.g.,
these configs below (powerpc-configs) are about ensuring specific
hardware support, not about setting "CONFIG_CRYPTO_XYZ" one way or the
other. That is actually just "noise". I do not know how to do this
right yet, but with a bit of experimentation and investigation, I
might come with a first idea and then we will see.

Lukas

> cheers
>
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  arch/powerpc/configs/83xx/mpc837x_rdb_defconfig | 1 -
> >  arch/powerpc/configs/85xx/ge_imp3a_defconfig    | 1 -
> >  arch/powerpc/configs/85xx/ppa8548_defconfig     | 2 --
> >  arch/powerpc/configs/cell_defconfig             | 1 -
> >  arch/powerpc/configs/g5_defconfig               | 1 -
> >  arch/powerpc/configs/mpc512x_defconfig          | 1 -
> >  arch/powerpc/configs/mpc885_ads_defconfig       | 2 +-
> >  arch/powerpc/configs/pasemi_defconfig           | 1 -
> >  arch/powerpc/configs/pmac32_defconfig           | 1 -
> >  arch/powerpc/configs/powernv_defconfig          | 3 ---
> >  arch/powerpc/configs/ppc64_defconfig            | 3 ---
> >  arch/powerpc/configs/ppc64e_defconfig           | 3 ---
> >  arch/powerpc/configs/ppc6xx_defconfig           | 7 -------
> >  arch/powerpc/configs/ps3_defconfig              | 1 -
> >  arch/powerpc/configs/pseries_defconfig          | 3 ---
> >  arch/powerpc/configs/skiroot_defconfig          | 2 --
> >  arch/powerpc/configs/storcenter_defconfig       | 1 -
> >  17 files changed, 1 insertion(+), 33 deletions(-)
> >
> > diff --git a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
> > index cbcae2a927e9..4e3373381ab6 100644
> > --- a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
> > +++ b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
> > @@ -77,6 +77,5 @@ CONFIG_NFS_FS=y
> >  CONFIG_NFS_V4=y
> >  CONFIG_ROOT_NFS=y
> >  CONFIG_CRC_T10DIF=y
> > -# CONFIG_ENABLE_MUST_CHECK is not set
> >  CONFIG_CRYPTO_ECB=m
> >  CONFIG_CRYPTO_PCBC=m
> > diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> > index e7672c186325..ea719898b581 100644
> > --- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> > +++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
> > @@ -74,7 +74,6 @@ CONFIG_MTD_PHYSMAP_OF=y
> >  CONFIG_MTD_RAW_NAND=y
> >  CONFIG_MTD_NAND_FSL_ELBC=y
> >  CONFIG_BLK_DEV_LOOP=m
> > -CONFIG_BLK_DEV_CRYPTOLOOP=m
> >  CONFIG_BLK_DEV_NBD=m
> >  CONFIG_BLK_DEV_RAM=y
> >  CONFIG_BLK_DEV_RAM_SIZE=131072
> > diff --git a/arch/powerpc/configs/85xx/ppa8548_defconfig b/arch/powerpc/configs/85xx/ppa8548_defconfig
> > index 190978a5b7d5..4bd5f993d26a 100644
> > --- a/arch/powerpc/configs/85xx/ppa8548_defconfig
> > +++ b/arch/powerpc/configs/85xx/ppa8548_defconfig
> > @@ -7,9 +7,7 @@ CONFIG_RAPIDIO=y
> >  CONFIG_FSL_RIO=y
> >  CONFIG_RAPIDIO_DMA_ENGINE=y
> >  CONFIG_RAPIDIO_ENUM_BASIC=y
> > -CONFIG_RAPIDIO_TSI57X=y
> >  CONFIG_RAPIDIO_CPS_XX=y
> > -CONFIG_RAPIDIO_TSI568=y
> >  CONFIG_RAPIDIO_CPS_GEN2=y
> >  CONFIG_ADVANCED_OPTIONS=y
> >  CONFIG_LOWMEM_SIZE_BOOL=y
> > diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
> > index 7fd9e596ea33..06391cc2af3a 100644
> > --- a/arch/powerpc/configs/cell_defconfig
> > +++ b/arch/powerpc/configs/cell_defconfig
> > @@ -195,7 +195,6 @@ CONFIG_NLS_ISO8859_9=m
> >  CONFIG_NLS_ISO8859_13=m
> >  CONFIG_NLS_ISO8859_14=m
> >  CONFIG_NLS_ISO8859_15=m
> > -# CONFIG_ENABLE_MUST_CHECK is not set
> >  CONFIG_MAGIC_SYSRQ=y
> >  CONFIG_DEBUG_KERNEL=y
> >  CONFIG_DEBUG_MUTEXES=y
> > diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
> > index 9d6212a8b195..71d9d112c0b6 100644
> > --- a/arch/powerpc/configs/g5_defconfig
> > +++ b/arch/powerpc/configs/g5_defconfig
> > @@ -119,7 +119,6 @@ CONFIG_INPUT_EVDEV=y
> >  # CONFIG_SERIO_I8042 is not set
> >  # CONFIG_SERIO_SERPORT is not set
> >  # CONFIG_HW_RANDOM is not set
> > -CONFIG_RAW_DRIVER=y
> >  CONFIG_I2C_CHARDEV=y
> >  CONFIG_AGP=m
> >  CONFIG_AGP_UNINORTH=m
> > diff --git a/arch/powerpc/configs/mpc512x_defconfig b/arch/powerpc/configs/mpc512x_defconfig
> > index e75d3f3060c9..10fe061c5e6d 100644
> > --- a/arch/powerpc/configs/mpc512x_defconfig
> > +++ b/arch/powerpc/configs/mpc512x_defconfig
> > @@ -114,5 +114,4 @@ CONFIG_NFS_FS=y
> >  CONFIG_ROOT_NFS=y
> >  CONFIG_NLS_CODEPAGE_437=y
> >  CONFIG_NLS_ISO8859_1=y
> > -# CONFIG_ENABLE_MUST_CHECK is not set
> >  # CONFIG_CRYPTO_HW is not set
> > diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> > index 700115d85d6f..56b876e418e9 100644
> > --- a/arch/powerpc/configs/mpc885_ads_defconfig
> > +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> > @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
> >  CONFIG_DETECT_HUNG_TASK=y
> >  CONFIG_BDI_SWITCH=y
> >  CONFIG_PPC_EARLY_DEBUG=y
> > -CONFIG_PPC_PTDUMP=y
> > +CONFIG_GENERIC_PTDUMP=y
> > diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
> > index e00a703581c3..96aa5355911f 100644
> > --- a/arch/powerpc/configs/pasemi_defconfig
> > +++ b/arch/powerpc/configs/pasemi_defconfig
> > @@ -92,7 +92,6 @@ CONFIG_LEGACY_PTY_COUNT=4
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> >  CONFIG_HW_RANDOM=y
> > -CONFIG_RAW_DRIVER=y
> >  CONFIG_I2C_CHARDEV=y
> >  CONFIG_I2C_PASEMI=y
> >  CONFIG_SENSORS_LM85=y
> > diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
> > index 13885ec563d1..019163c2571e 100644
> > --- a/arch/powerpc/configs/pmac32_defconfig
> > +++ b/arch/powerpc/configs/pmac32_defconfig
> > @@ -284,7 +284,6 @@ CONFIG_BOOTX_TEXT=y
> >  CONFIG_CRYPTO_PCBC=m
> >  CONFIG_CRYPTO_MD4=m
> >  CONFIG_CRYPTO_SHA512=m
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> > diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> > index 4acca5263404..e1213973d858 100644
> > --- a/arch/powerpc/configs/powernv_defconfig
> > +++ b/arch/powerpc/configs/powernv_defconfig
> > @@ -251,7 +251,6 @@ CONFIG_RTC_CLASS=y
> >  CONFIG_RTC_DRV_GENERIC=y
> >  # CONFIG_VIRTIO_MENU is not set
> >  CONFIG_LIBNVDIMM=y
> > -# CONFIG_ND_BLK is not set
> >  CONFIG_EXT2_FS=y
> >  CONFIG_EXT2_FS_XATTR=y
> >  CONFIG_EXT2_FS_POSIX_ACL=y
> > @@ -324,13 +323,11 @@ CONFIG_CRYPTO_MD5_PPC=m
> >  CONFIG_CRYPTO_MICHAEL_MIC=m
> >  CONFIG_CRYPTO_SHA1_PPC=m
> >  CONFIG_CRYPTO_SHA256=y
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> >  CONFIG_CRYPTO_CAST6=m
> >  CONFIG_CRYPTO_KHAZAD=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_SERPENT=m
> >  CONFIG_CRYPTO_TEA=m
> >  CONFIG_CRYPTO_TWOFISH=m
> > diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
> > index 6be0c43397b4..d6949a6c5b2b 100644
> > --- a/arch/powerpc/configs/ppc64_defconfig
> > +++ b/arch/powerpc/configs/ppc64_defconfig
> > @@ -215,7 +215,6 @@ CONFIG_HVC_RTAS=y
> >  CONFIG_HVCS=m
> >  CONFIG_VIRTIO_CONSOLE=m
> >  CONFIG_IBM_BSR=m
> > -CONFIG_RAW_DRIVER=y
> >  CONFIG_I2C_CHARDEV=y
> >  CONFIG_I2C_AMD8111=y
> >  CONFIG_I2C_PASEMI=y
> > @@ -344,13 +343,11 @@ CONFIG_CRYPTO_MD5_PPC=m
> >  CONFIG_CRYPTO_MICHAEL_MIC=m
> >  CONFIG_CRYPTO_SHA1_PPC=m
> >  CONFIG_CRYPTO_SHA256=y
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> >  CONFIG_CRYPTO_CAST6=m
> >  CONFIG_CRYPTO_KHAZAD=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_SERPENT=m
> >  CONFIG_CRYPTO_TEA=m
> >  CONFIG_CRYPTO_TWOFISH=m
> > diff --git a/arch/powerpc/configs/ppc64e_defconfig b/arch/powerpc/configs/ppc64e_defconfig
> > index 5cf49a515f8e..f97a2d31bbf7 100644
> > --- a/arch/powerpc/configs/ppc64e_defconfig
> > +++ b/arch/powerpc/configs/ppc64e_defconfig
> > @@ -118,7 +118,6 @@ CONFIG_INPUT_MISC=y
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> >  # CONFIG_HW_RANDOM is not set
> > -CONFIG_RAW_DRIVER=y
> >  CONFIG_I2C_CHARDEV=y
> >  CONFIG_I2C_AMD8111=y
> >  CONFIG_FB=y
> > @@ -234,13 +233,11 @@ CONFIG_CRYPTO_PCBC=m
> >  CONFIG_CRYPTO_HMAC=y
> >  CONFIG_CRYPTO_MICHAEL_MIC=m
> >  CONFIG_CRYPTO_SHA512=m
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> >  CONFIG_CRYPTO_CAST6=m
> >  CONFIG_CRYPTO_KHAZAD=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_SERPENT=m
> >  CONFIG_CRYPTO_TEA=m
> >  CONFIG_CRYPTO_TWOFISH=m
> > diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> > index a24f484bfbd2..d23deb94b36e 100644
> > --- a/arch/powerpc/configs/ppc6xx_defconfig
> > +++ b/arch/powerpc/configs/ppc6xx_defconfig
> > @@ -321,7 +321,6 @@ CONFIG_PNP=y
> >  CONFIG_ISAPNP=y
> >  CONFIG_MAC_FLOPPY=m
> >  CONFIG_BLK_DEV_LOOP=m
> > -CONFIG_BLK_DEV_CRYPTOLOOP=m
> >  CONFIG_BLK_DEV_NBD=m
> >  CONFIG_BLK_DEV_RAM=y
> >  CONFIG_BLK_DEV_RAM_SIZE=16384
> > @@ -590,7 +589,6 @@ CONFIG_GAMEPORT_EMU10K1=m
> >  CONFIG_GAMEPORT_FM801=m
> >  # CONFIG_LEGACY_PTYS is not set
> >  CONFIG_SERIAL_NONSTANDARD=y
> > -CONFIG_ROCKETPORT=m
> >  CONFIG_SYNCLINK_GT=m
> >  CONFIG_NOZOMI=m
> >  CONFIG_N_HDLC=m
> > @@ -1107,13 +1105,9 @@ CONFIG_CRYPTO_XTS=m
> >  CONFIG_CRYPTO_HMAC=y
> >  CONFIG_CRYPTO_XCBC=m
> >  CONFIG_CRYPTO_MICHAEL_MIC=m
> > -CONFIG_CRYPTO_RMD128=m
> >  CONFIG_CRYPTO_RMD160=m
> > -CONFIG_CRYPTO_RMD256=m
> > -CONFIG_CRYPTO_RMD320=m
> >  CONFIG_CRYPTO_SHA1=y
> >  CONFIG_CRYPTO_SHA512=m
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> > @@ -1121,7 +1115,6 @@ CONFIG_CRYPTO_CAMELLIA=m
> >  CONFIG_CRYPTO_CAST6=m
> >  CONFIG_CRYPTO_FCRYPT=m
> >  CONFIG_CRYPTO_KHAZAD=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_SEED=m
> >  CONFIG_CRYPTO_SERPENT=m
> >  CONFIG_CRYPTO_TEA=m
> > diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
> > index 2d9ac233da68..0a1b42c4f26a 100644
> > --- a/arch/powerpc/configs/ps3_defconfig
> > +++ b/arch/powerpc/configs/ps3_defconfig
> > @@ -165,6 +165,5 @@ CONFIG_RCU_CPU_STALL_TIMEOUT=60
> >  # CONFIG_FTRACE is not set
> >  CONFIG_CRYPTO_PCBC=m
> >  CONFIG_CRYPTO_MICHAEL_MIC=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_LZO=m
> >  CONFIG_PRINTK_TIME=y
> > diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
> > index 44c0e6e5f546..7497e17ea657 100644
> > --- a/arch/powerpc/configs/pseries_defconfig
> > +++ b/arch/powerpc/configs/pseries_defconfig
> > @@ -189,7 +189,6 @@ CONFIG_HVC_RTAS=y
> >  CONFIG_HVCS=m
> >  CONFIG_VIRTIO_CONSOLE=m
> >  CONFIG_IBM_BSR=m
> > -CONFIG_RAW_DRIVER=y
> >  CONFIG_I2C_CHARDEV=y
> >  CONFIG_FB=y
> >  CONFIG_FIRMWARE_EDID=y
> > @@ -304,13 +303,11 @@ CONFIG_CRYPTO_MD5_PPC=m
> >  CONFIG_CRYPTO_MICHAEL_MIC=m
> >  CONFIG_CRYPTO_SHA1_PPC=m
> >  CONFIG_CRYPTO_SHA256=y
> > -CONFIG_CRYPTO_TGR192=m
> >  CONFIG_CRYPTO_WP512=m
> >  CONFIG_CRYPTO_ANUBIS=m
> >  CONFIG_CRYPTO_BLOWFISH=m
> >  CONFIG_CRYPTO_CAST6=m
> >  CONFIG_CRYPTO_KHAZAD=m
> > -CONFIG_CRYPTO_SALSA20=m
> >  CONFIG_CRYPTO_SERPENT=m
> >  CONFIG_CRYPTO_TEA=m
> >  CONFIG_CRYPTO_TWOFISH=m
> > diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> > index f491875700e8..e0964210f259 100644
> > --- a/arch/powerpc/configs/skiroot_defconfig
> > +++ b/arch/powerpc/configs/skiroot_defconfig
> > @@ -133,7 +133,6 @@ CONFIG_ACENIC_OMIT_TIGON_I=y
> >  # CONFIG_NET_VENDOR_AQUANTIA is not set
> >  # CONFIG_NET_VENDOR_ARC is not set
> >  # CONFIG_NET_VENDOR_ATHEROS is not set
> > -# CONFIG_NET_VENDOR_AURORA is not set
> >  CONFIG_TIGON3=m
> >  CONFIG_BNX2X=m
> >  # CONFIG_NET_VENDOR_BROCADE is not set
> > @@ -274,7 +273,6 @@ CONFIG_NLS_UTF8=y
> >  CONFIG_ENCRYPTED_KEYS=y
> >  CONFIG_SECURITY=y
> >  CONFIG_HARDENED_USERCOPY=y
> > -CONFIG_HARDENED_USERCOPY_PAGESPAN=y
> >  CONFIG_FORTIFY_SOURCE=y
> >  CONFIG_SECURITY_LOCKDOWN_LSM=y
> >  CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
> > diff --git a/arch/powerpc/configs/storcenter_defconfig b/arch/powerpc/configs/storcenter_defconfig
> > index 47dcfaddc1ac..7a978d396991 100644
> > --- a/arch/powerpc/configs/storcenter_defconfig
> > +++ b/arch/powerpc/configs/storcenter_defconfig
> > @@ -76,4 +76,3 @@ CONFIG_NLS_CODEPAGE_437=y
> >  CONFIG_NLS_ISO8859_1=y
> >  CONFIG_NLS_UTF8=y
> >  CONFIG_CRC_T10DIF=y
> > -# CONFIG_ENABLE_MUST_CHECK is not set
> > --
> > 2.17.1
