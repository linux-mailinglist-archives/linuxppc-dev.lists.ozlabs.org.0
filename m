Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CD87049A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 15:56:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gQmKkynh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpMGS1Jdxz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 01:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gQmKkynh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpMFk67LYz3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 01:55:52 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-47277290797so715378137.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709564149; x=1710168949; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AWTkZgsoLpPKdOGgcn1hzOrRfxw8EPkwi9BIWs11TSI=;
        b=gQmKkynhZn/NDznyqTYZDI3uIayOC3rpCp9G0Z0tYWS2tMsIZvqc1eLLGCvWk1HGmn
         pGutG6nKGKiF/qJbzMObaP2EyWqdpVTpOM3nSOd9Hd/osC2nFjLUbrceGnmloq/d6LbP
         z18uwigbV4wkU8VtFTE0+sLO1CY0I06ZWE6tZJQ5fvpGiX8rzrwCb/GfcY82JRyLEYa+
         jzGLlnLWOhySVycQrJpPPTFAOhabrv4A4Fcqiz6I+sBjBUjy3y557As6dEs9htYf13NG
         6P717x2BAZVhyFwXEo4/oXu2m384qIR34jZtClzs5+N7XLrx2h0+Z6/YJOSRBF7nx1A4
         tK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709564149; x=1710168949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWTkZgsoLpPKdOGgcn1hzOrRfxw8EPkwi9BIWs11TSI=;
        b=lyyODQPBiK2tSBiuN4TJnfYc1LfLcfkQuKvRMexxQd7T1k3uAPGkPX0IZlZWwscM9d
         sQa+7WRAWEPUdcBodO3tK90r/v07ycsN7qFT2uEmokdLPUzKf0PwRPxYLspaRCXrkcmU
         WLKlCqBZP1TsLreBorVy1JPBS1cWZ7e17jlnpZr3asbiEOx202HHU960VEUGY1fI7DsR
         pyETxXEeCEa9x0rVsZRchDfrNL76ZGTInIs99WS35zJM/7+dpaAHEyxDRAnoA+eESbUz
         WFASB2K12s/8YoNiInRpBMOGh9SWNyZxDL6oSqAb58Rq7pBm4QPgANGs8jGrJoTkBSEa
         keJw==
X-Forwarded-Encrypted: i=1; AJvYcCXFZbHP8FtGz42CmsvuwTADVGRdRpy+Bj+cpeo384yjjELZVcDhPfP3UJqiptEWmNkmKGNfkYUmhbTck1LbMisaBG6UArzrC6OrVKCT2A==
X-Gm-Message-State: AOJu0YwF3SXQEXEorP9I+gSezE8CpgCUdY6lzttaTs0L9iTOdO8XOoCu
	LP7mf1Sm/dy/OR0Rq+8UUc2aoXnYIMmKRYz5evl/l3769JbR4cAH2PkP7kxh/d8uNeVFNwn/1ws
	Q86Rm+gklq5NtgTaw5bDnfTAWI0xpA0Bd6kJEuA==
X-Google-Smtp-Source: AGHT+IG934W8fniwCAisOtWNbw/y515juXyLVnR2Fiu+gO0N2Ek8hxZbk2Rv0Vp8Lo6V1b7KKlvuokOu6sTWZN3xv2A=
X-Received: by 2002:a05:6102:2927:b0:472:d517:24cf with SMTP id
 cz39-20020a056102292700b00472d51724cfmr879625vsb.15.1709564149443; Mon, 04
 Mar 2024 06:55:49 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com> <87bk7u5n9h.fsf@intel.com>
In-Reply-To: <87bk7u5n9h.fsf@intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Mar 2024 20:25:38 +0530
Message-ID: <CA+G9fYtQobCEno5oRgqPzhHrjff4zMki=9fWwJ1NPtKeKQ+aUg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jani and Benjamin,

On Mon, 4 Mar 2024 at 15:31, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 04 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > Removal of the backlight include from fb.h uncovered an implicit
> > dependency in powerpc asm/backlight.h. Add the explicit include.
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Closes: https://lore.kernel.org/r/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com
> > Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
> >
> > Not even compile tested!
>
> Naresh, please try this patch!

Thanks for the proposed fix patch.

Steps to reproduce:

# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig ppc6xx_defconfig --kconfig-add CONFIG_PMAC_BACKLIGHT=y
config debugkernel dtbs kernel modules xipkernel

# Applying patch set
Applying: fbdev/chipsfb: Include <linux/backlight.h>

The reported build regression is fixed but build failed with below errors.

My two cents,

I should have copied the full build error log in the morning.

Few more build errors on powerpc builds,
------------------
drivers/macintosh/via-pmu-backlight.c: In function
'__pmu_backlight_update_status':
drivers/macintosh/via-pmu-backlight.c:74:21: error: implicit
declaration of function 'backlight_get_brightness'; did you mean
'pmu_backlight_get_level_brightness'?
[-Werror=implicit-function-declaration]
   74 |         int level = backlight_get_brightness(bd);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~
      |                     pmu_backlight_get_level_brightness
drivers/macintosh/via-pmu-backlight.c: At top level:
drivers/macintosh/via-pmu-backlight.c:108:21: error: variable
'pmu_backlight_data' has initializer but incomplete type
  108 | static const struct backlight_ops pmu_backlight_data = {
      |                     ^~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:109:10: error: 'const struct
backlight_ops' has no member named 'update_status'
  109 |         .update_status  = pmu_backlight_update_status,
      |          ^~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:109:27: warning: excess elements
in struct initializer
  109 |         .update_status  = pmu_backlight_update_status,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:109:27: note: (near
initialization for 'pmu_backlight_data')
drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
drivers/macintosh/via-pmu-backlight.c:136:37: error: storage size of
'props' isn't known
  136 |         struct backlight_properties props;
      |                                     ^~~~~
drivers/macintosh/via-pmu-backlight.c:154:34: error: invalid
application of 'sizeof' to incomplete type 'struct
backlight_properties'
  154 |         memset(&props, 0, sizeof(struct backlight_properties));
      |                                  ^~~~~~
drivers/macintosh/via-pmu-backlight.c:155:22: error:
'BACKLIGHT_PLATFORM' undeclared (first use in this function)
  155 |         props.type = BACKLIGHT_PLATFORM;
      |                      ^~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:155:22: note: each undeclared
identifier is reported only once for each function it appears in
drivers/macintosh/via-pmu-backlight.c:157:14: error: implicit
declaration of function 'backlight_device_register'; did you mean
'root_device_register'? [-Werror=implicit-function-declaration]
  157 |         bd = backlight_device_register(name, NULL, NULL,
&pmu_backlight_data,
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~
      |              root_device_register
drivers/macintosh/via-pmu-backlight.c:166:19: error: invalid use of
undefined type 'struct backlight_device'
  166 |         level = bd->props.max_brightness;
      |                   ^~
drivers/macintosh/via-pmu-backlight.c:176:35: error: invalid use of
undefined type 'struct backlight_device'
  176 |                                 bd->props.max_brightness / 15);
      |                                   ^~
drivers/macintosh/via-pmu-backlight.c:179:11: error: invalid use of
undefined type 'struct backlight_device'
  179 |         bd->props.brightness = level;
      |           ^~
drivers/macintosh/via-pmu-backlight.c:180:11: error: invalid use of
undefined type 'struct backlight_device'
  180 |         bd->props.power = FB_BLANK_UNBLANK;
      |           ^~
drivers/macintosh/via-pmu-backlight.c:181:9: error: implicit
declaration of function 'backlight_update_status'; did you mean
'pmu_backlight_update_status'? [-Werror=implicit-function-declaration]
  181 |         backlight_update_status(bd);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
      |         pmu_backlight_update_status
drivers/macintosh/via-pmu-backlight.c:136:37: warning: unused variable
'props' [-Wunused-variable]
  136 |         struct backlight_properties props;
      |                                     ^~~~~
drivers/macintosh/via-pmu-backlight.c: At top level:
drivers/macintosh/via-pmu-backlight.c:108:35: error: storage size of
'pmu_backlight_data' isn't known
  108 | static const struct backlight_ops pmu_backlight_data = {
      |                                   ^~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:108:35: error: storage size of
'pmu_backlight_data' isn't known
cc1: some warnings being treated as errors
make[5]: *** [scripts/Makefile.build:244:
drivers/macintosh/via-pmu-backlight.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>



> Michael, if this is fine by you, ack to merge via the drm subsystem
> along with the regressing commit?
>
> BR,
> Jani.
>
> > ---
> >  arch/powerpc/include/asm/backlight.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
> > index 1b5eab62ed04..275d5bb9aa04 100644
> > --- a/arch/powerpc/include/asm/backlight.h
> > +++ b/arch/powerpc/include/asm/backlight.h
> > @@ -10,6 +10,7 @@
> >  #define __ASM_POWERPC_BACKLIGHT_H
> >  #ifdef __KERNEL__
> >
> > +#include <linux/backlight.h>
> >  #include <linux/fb.h>
> >  #include <linux/mutex.h>
>
> --
> Jani Nikula, Intel

--
Linaro LKFT
https://lkft.linaro.org
