Return-Path: <linuxppc-dev+bounces-13309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14604C0C561
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:38:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6NJ45Ynz2yrl;
	Mon, 27 Oct 2025 19:38:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554304;
	cv=none; b=butDTJakzvdeEwYZ6d++QNiPyiFAVEdP49MnAjICC+ouPMeZKzVawnxkxQEC34xw7dtdhmJc7fBGFx3mxw6+Xo9QJJFpPwe5RcMVJUdmfMgbAd9P9m8xWTX6O3SuxTsL8aviwRpCqufUDP2BGBpaBQLyrXyf+mdGcIIzt7AiLa1s7j4xPdR/CQV/TUsFQLOADHExmxoygfHO8BIOIswcAMmccl+OJH1tcvdQAyPaf6TcumNaW72gnu/ploTP5tOcGbXdTZ7hGhbKVAVWgKE0nsNloydYrzqlU4RMlitblHCBN0xnb78RdrrHBadKXxYuN2WdEpppQqnuH4d5QY2ArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554304; c=relaxed/relaxed;
	bh=MJP782NZwgmJ4qdpWQoW1rM/71H2DwiyXVLt9WngTyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Re4uaSQm5T0RPqDaGOnOL/orbNQcTyKs6J8IDJ1eBuzFwG/H1XEhDbP3y1EfIWOS2S/Gz6MHPZR35Yq3du96sjF2J80aqP6wagxlFfnADVcP+dOWgfIZHB+SwtFe2OGmOks4eFqWxAJ2P9JYNYkFJIZc+AZkkePLCXLKaFTe2TtPl+euoosLiHfHXL/xgbtLlx0yai8oGpc2kRSi240z69nqpyrtXpmUPeNf2sgi6F0oBf0fAVUWwHKwe70c72cTHR9HlscIHzjFxAxTqfQQJAJPSMSELvMYxNRKUVDjfe/aIgdRLUwGPEGuFpSCUUHLYPLdg6Oc/b8D33ZGsiXFqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AXOP9xn7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AXOP9xn7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6NG4ffYz2yjs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:38:21 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-290d4d421f6so39379915ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761554299; x=1762159099; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJP782NZwgmJ4qdpWQoW1rM/71H2DwiyXVLt9WngTyU=;
        b=AXOP9xn7yQe11PE8Y63ZtcP/2MiYbl+k26g89OdBtVmCYs3fw+3kSO8E/tv/GU5Zxt
         dY2dHPpQzfw2A97J0VwjMoFYn/ogs6vwGRNwXdiGGjcV/prkXp3jTlMmzc5EbVux4cWj
         6iISvGz/ojO8gvmc4gNsesNKUflMcvd+hE+jroiYkUGsSCNSxxZdgfRI9OgyW7oMsJ3w
         K9EsZKMJCJxJb+sWWqkXpZtJqc/2sH2dN3tPWCsr01C8zdfp6yf46DHPDtajI1i14Lzq
         vSuNBGIVymo8Opam6Hr6VhfT+J5huOq3bK9AV5jcGNez7Mrd1TwPKArWX/xhKEBC1tAE
         7WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554299; x=1762159099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJP782NZwgmJ4qdpWQoW1rM/71H2DwiyXVLt9WngTyU=;
        b=CF0ruGW8+/f6j91nfADz7q2KIb+KlVgWP+Pw56WmJ2yxsVgtf2aCrxoJydsNcO8OEi
         R+Cxy2Nkiwz015DGDhtJxdrq8UJKxhzC2ZJmF/4imjUpkco96lYrID3gv69Ntua3NM5O
         pVoHdb5YXejjQ0VBPT99eaJaBjF0chA4753ww1o4IOkydMP+9tXK7OHAffvDbC466tw9
         rbZeQVXFKgvt/CO8lJ2zAuqZ6JCfhEPzhcWvwOeS/O68IGRHIu/ZZbFqnqkAGFmimSZS
         TDmljNIV8EyXkM2U9RWCZAutfinvc0SMcYYwGqRuH8UQEiqGdw0NHcvQt4TumKK2rJYo
         JNxw==
X-Forwarded-Encrypted: i=1; AJvYcCXDgqQ1goVAutkVf1XyVZtuXvAnwBuEKgTOS0z+gQROgqyrp4Fs0FCgw0LadX7P6M0QeorPlG+uS91sUZk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMCYuwV3dxjOf/Uy2hjtvqfIQpAfwPloCcvl4xk0Nu+t5mK/ln
	SJDtLMX1cb0qPdrwtUtvNiPk1jgnBhR0djFn5LggsDGorzTGvvN+93qPzzn8z0Kha7UrtiR8rpO
	tC83Gnt6y9W5LOh4QNlwGv6Xqyx1rgsQoYIgPdI6Rbg==
X-Gm-Gg: ASbGncsrmlGV2DAp9jNvXY+uOpyKfzotdbbBaji+kUn9EJEur3+Vcf1RFcK0pgdgTiY
	cRy9JuDqXFNLPcsGoZsvZymd30y8P6G5U/IyWxjYSNFwE0ORuS/Lw7/UmRiJpJLVY7wpb/bU9Is
	1yLVn6ozk0xVIz6BuYM9t/jdBWgu992YjH+lge3SQ+UCE6/yt9DWw+b93z4rYVepAIrwBxQ+riU
	Ykm2Ia+tVCh1X3xcSvbzNtVIkD0FirlqpTymzg1tewr/erxI3r/h+mQw2rFoOQSABgFG+z1Dk3A
	6JzsCAkYasxaPfGS+yMPZdya+uxByaQRgOLskb7um8RRub3WLUA=
X-Google-Smtp-Source: AGHT+IGlLaPRRc5ZN4TC96KOjDMG+YTLw6dssn/YPnBI0ecUO89EvzeEmDpxojyG/sc71/YMzaeujT8odPg9c/PnZjw=
X-Received: by 2002:a17:902:e543:b0:267:99bf:6724 with SMTP id
 d9443c01a7336-290caf830f9mr529461675ad.31.1761554298728; Mon, 27 Oct 2025
 01:38:18 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CA+G9fYs8fn5URQx2+s2oNxdUgZkSrdLC0P1tNBW_n-6BaBkK2Q@mail.gmail.com>
In-Reply-To: <CA+G9fYs8fn5URQx2+s2oNxdUgZkSrdLC0P1tNBW_n-6BaBkK2Q@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Oct 2025 14:08:05 +0530
X-Gm-Features: AWmQ_bm5CgS-nclzvBmLtRcEbtaR0irloEuFZYR8DYix4Gy4NzP49gtmxQFKcU8
Message-ID: <CA+G9fYumAD1_G4UG2LDAPD3fRxN+WQnrm8tPx6pL8qF6wSOUrw@mail.gmail.com>
Subject: Re: next-20251027: backlight.c:59:39: error: implicit declaration of
 function 'of_find_node_by_name'; did you mean 'bus_find_device_by_name'?
To: Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, danielt@kernel.org, 
	Lee Jones <lee@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 27 Oct 2025 at 13:43, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following powerpc ppc6xx_defconfig build regressions noticed on the
> Linux next-20251027 tag with gcc-14 and gcc-8.
>
> * powerpc, build
>   - gcc-14-ppc6xx_defconfig
>   - gcc-8-ppc6xx_defconfig
>
> First seen on next-20251027
> Good: next-20251024
> Bad: next-20251027
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20251027: backlight.c:59:39: error: implicit
> declaration of function 'of_find_node_by_name'; did you mean
> 'bus_find_device_by_name'?
> Build regression: next-20251027: include/linux/math.h:167:43: error:
> first argument to '__builtin_choose_expr' not a constant
> Build regression: next-20251027: via-pmu-backlight.c:22:20: error:
> 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
> Build regression: next-20251027: minmax.h:71:17: error: first argument
> to '__builtin_choose_expr' not a constant
> Build regression: next-20251027: compiler.h:168:17: error:
> '__UNIQUE_ID_x__286' undeclared (first use in this function); did you
> mean '__UNIQUE_ID_y__287'?

Anders bisected this down to,
# first bad commit:
   [243ce64b2b371cdf2cbc39c9422cb3047cab6de7]
   backlight: Do not include <linux/fb.h> in header file

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build error
> arch/powerpc/platforms/powermac/backlight.c: In function
> 'pmac_has_backlight_type':
> arch/powerpc/platforms/powermac/backlight.c:59:39: error: implicit
> declaration of function 'of_find_node_by_name'; did you mean
> 'bus_find_device_by_name'? [-Wimplicit-function-declaration]
>    59 |         struct device_node* bk_node =
> of_find_node_by_name(NULL, "backlight");
>       |                                       ^~~~~~~~~~~~~~~~~~~~
>       |                                       bus_find_device_by_name
> arch/powerpc/platforms/powermac/backlight.c:59:39: error:
> initialization of 'struct device_node *' from 'int' makes pointer from
> integer without a cast [-Wint-conversion]
> arch/powerpc/platforms/powermac/backlight.c:60:17: error: implicit
> declaration of function 'of_property_match_string'
> [-Wimplicit-function-declaration]
>    60 |         int i = of_property_match_string(bk_node,
> "backlight-control", type);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/platforms/powermac/backlight.c:62:9: error: implicit
> declaration of function 'of_node_put'
> [-Wimplicit-function-declaration]
>    62 |         of_node_put(bk_node);
>       |         ^~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:22:20: error:
> 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
>    22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
>       |                    ^~~~~~~~~~~~~~~~~~~
> In file included from <command-line>:
> drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_curve_lookup':
> include/linux/compiler.h:168:17: error: '__UNIQUE_ID_x__286'
> undeclared (first use in this function); did you mean
> '__UNIQUE_ID_y__287'?
>   168 |         __PASTE(__UNIQUE_ID_,                                   \
>       |                 ^~~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
>    45 |                 max = max((int)bl_curve[i], max);
>       |                       ^~~
> include/linux/minmax.h:71:17: error: first argument to
> '__builtin_choose_expr' not a constant
>    71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL,
> 1L)))(ux) >= 0)
>       |                 ^~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler_types.h:577:23: note: in definition of macro
> '__compiletime_assert'
>   577 |                 if (!(condition))
>          \
>       |                       ^~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
>    45 |                 max = max((int)bl_curve[i], max);
>       |                       ^~~
> include/linux/minmax.h:71:17: error: first argument to
> '__builtin_choose_expr' not a constant
>    71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL,
> 1L)))(ux) >= 0)
>       |                 ^~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler_types.h:577:23: note: in definition of macro
> '__compiletime_assert'
>   577 |                 if (!(condition))
>          \
>       |                       ^~~~~~~~~
> include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
>   112 | #define max(x, y)       __careful_cmp(max, x, y)
>       |                         ^~~~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
>    45 |                 max = max((int)bl_curve[i], max);
>       |                       ^~~
> In file included from include/linux/kernel.h:27,
>                  from arch/powerpc/include/asm/page.h:11,
>                  from arch/powerpc/include/asm/thread_info.h:13,
>                  from include/linux/thread_info.h:60,
>                  from arch/powerpc/include/asm/ptrace.h:342,
>                  from drivers/macintosh/via-pmu-backlight.c:11:
> include/linux/math.h:162:17: error: first argument to
> '__builtin_choose_expr' not a constant
>   162 |                 __builtin_choose_expr(
>          \
>       |                 ^~~~~~~~~~~~~~~~~~~~~
>
> drivers/macintosh/via-pmu-backlight.c: In function
> 'pmu_backlight_get_level_brightness':
> drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX'
> undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
>    63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
>       |                                      ^~~~~~~~~~~~~~~~
>       |                                      BACKLIGHT_RAW
> drivers/macintosh/via-pmu-backlight.c:58:51: warning: parameter
> 'level' set but not used [-Wunused-but-set-parameter]
>    58 | static int pmu_backlight_get_level_brightness(int level)
>       |                                               ~~~~^~~~~
> drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
> drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit
> declaration of function 'of_machine_is_compatible'
> [-Wimplicit-function-declaration]
>   144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/macintosh/via-pmu-backlight.c: At top level:
> drivers/macintosh/via-pmu-backlight.c:22:11: warning: 'bl_curve'
> defined but not used [-Wunused-variable]
>    22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
>       |           ^~~~~~~~
> make[5]: *** [scripts/Makefile.build:287:
> drivers/macintosh/via-pmu-backlight.o] Error 1
> make[5]: Target 'drivers/macintosh/' not remade because of errors.
>
>
> ## Source
> * Kernel version: 6.18.0-rc2-next-20251027
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20251027
> * Git commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> * Architectures: powerpc
> * Toolchains: gcc-14
> * Kconfigs: defconfig
>
> ## Build
> * Test log: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/build.log
> * Test details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20251027/build/gcc-14-ppc6xx_defconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/config
>
> --
> Linaro LKFT

- Naresh

