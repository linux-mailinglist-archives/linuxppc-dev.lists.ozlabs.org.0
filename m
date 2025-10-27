Return-Path: <linuxppc-dev+bounces-13308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57250C0C411
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw5r26TCtz2yyx;
	Mon, 27 Oct 2025 19:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761552834;
	cv=none; b=Edz/DM65t39QrwLy69WyGSMdEQHWs6An971Ihh4LOb1B3CApAX7TI6Ppdmb9MzczzkFWODYuP2k4J7tp5Kb0beGTlVP6CtKvJ1GjwHHmae8tzD7ROe8bs7w/C66cGsLerZ/1dgR/GM3oFKnUMQi/9zmxEWnfHY+ZTugUag+mDHUa30vwsUJUzXO42laFZbhK7ouukMK0+RfVrHZr03rioQ+46unTmg/0acy+ABE2a3ryVD4sfb5R5hBhBF+6taODTtJjrJgO09HyvXDLjC3F8+PBnguFm7AWwCeOcHX5iisR1BQ6MiD1xPyDRQNsOsL5BHD/EeOAb76nDDpgG7NyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761552834; c=relaxed/relaxed;
	bh=4Jl1IRJ1KOa3eGEJUzKJJ2c9eSrVA6i/w3yC2J76xMQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TvBPj021SxUPH11TwCaOxBO7m0mNp1VLXe6ISwS3ayxAgOy1EzPcmQ0h9VcZ6tMLqWEA7eIWgRF1F8WBloYcDll5GE6Q10fnKXbGkC7tKpo4OQx2+7atnhuVBHH6fsiPVczOHWDS4jDaZejIZyIaPgRx9FeeESrFyhWh5huukOihoR9nlY/JakeBGfwebU6QJXhko1YSPFeOphqryYUpRjXe+fo863GRfQM9CMGjt6nreXUOWpNFL7ya/ht3j98g+WOscxK6YoUUhHXEF0RYgmYOtgfpzlTHu1bfuCaYx+TTE+64TLv1y+wPsDEmWpLVs6VCHthXLLowQDOhfrqYFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m3xD6u+E; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m3xD6u+E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw5r121fvz2yjr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:13:51 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7833765433cso5446038b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761552829; x=1762157629; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Jl1IRJ1KOa3eGEJUzKJJ2c9eSrVA6i/w3yC2J76xMQ=;
        b=m3xD6u+EDyRHejaPr/gxbdCXsnMQ6kPPWo4zTd9nXLdl7MvyXaq6vx6FHzqn5v3wJJ
         1KrSrRbF/dgFLXABPThajIORtekBpN8JU9BTArf84CI6vdyXBUYQV9ZT+RPQNTmPfZvO
         qJNMcZ/E94Y68pjsez6ISr2GGp/Owk35XyMYFhR14rC4GS8NqMR+t4j2fmVQ0kKJzqqI
         Wt01EeFoKWJm/7xPvqtsgwUAfhSCW8SOewW+cWm17YnvKfiasK7dklYKEjUJeR5FrEDI
         MocjWxNAdMG+79+l0FVIM7lPaABG57jBkjWSGTvYKLG2zJLJqQXqgbrxZImq8IIthSw0
         KsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761552829; x=1762157629;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Jl1IRJ1KOa3eGEJUzKJJ2c9eSrVA6i/w3yC2J76xMQ=;
        b=EPhXSf3b3dzjPqq1s2N0y4u5BMKPEavpQpmHIRWFxlZHHtPS2qP8LBcP6rHScWOXrm
         5sw9h9Ag+Y/a7AeGWvQ227qF44KlnVPNUDX9OW9hcScJF9+YYyeoZXEiUVtW5q+1LDrK
         3znhP3Eg5dWmotqoRSsUO4dt6i9Gn0gZYZEC/t/8O8QLCwd9fatUpgWV6KmyupDi6Mq5
         5H+WYIA6Lgrzxj5KwiRoefl907dLZFWAkymuSHTLtndL76rgg6pBDM7U7FU5ScAjvCi0
         4qMSYYjhUwv52WQAR1p7AsfB5nO1dR/OxtPheZfLDA1JhiEW6f+nMIcbK7hDw28UShea
         +6PQ==
X-Gm-Message-State: AOJu0Yxm4TaBSwMIXmnaaDisNapXfJOohoq5zlgyRF0nTG6cF4OQQzAJ
	U+R50fQ7QgEWEsGBZISBxbTkWP7IveefWFeo7prP00RZCkq21UnPgxI22Q960UYebDLRCRHc8nj
	5Qp1dFGwxULiXsFyWB4E4R8TJYbp+kiKxyvadoSzemzru31pUueDV/d4Dnw==
X-Gm-Gg: ASbGncu3p5MPj0bbrOvUjItk3q0xKHFNh9nHvQC7hHWvX/wz/1Vy9t/ihf/XGnzJgfa
	XwYFcD6p0LoKsOc6RdEjls7z55vJzeyLRwIGguS2gh+kzusnA95aBwrKDTWOmvltvx0HsJJcffR
	4kba+IKScUwJVRNRY/leTSSOe97tN/Kopo9Gqxrlt0Om5KkANy5GDzNGHGzsONC/C5mBH73oYRn
	5IhcNE/4gnBmo/5xKriPDkgAw8+FTLXpVlxoYK5HSFHHPBABhP4MyZ3hMJgCEq5U6pSTRwkTtgB
	fIg4aQ755HFhn1v32+AqY3jeWImrzrJKIVPj0W2cJh4lfOqql2c=
X-Google-Smtp-Source: AGHT+IFpw7Ye8EqgDBoHYXjDVFp96NB4mXnlEykGMm7hHSg9c3xvd1K3cyLgJ0zvPp6p1UEM+WFKSKXcc2UnU9fKjmQ=
X-Received: by 2002:a17:903:11cd:b0:290:8fed:b2a7 with SMTP id
 d9443c01a7336-290cba51064mr438409095ad.57.1761552829221; Mon, 27 Oct 2025
 01:13:49 -0700 (PDT)
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
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Oct 2025 13:43:37 +0530
X-Gm-Features: AWmQ_bnuLZFl-Zo9wFQPh5mv4wjIOE1UOzS2nHbBPw0kmkUt1Ft4MkHbj-JLz7k
Message-ID: <CA+G9fYs8fn5URQx2+s2oNxdUgZkSrdLC0P1tNBW_n-6BaBkK2Q@mail.gmail.com>
Subject: next-20251027: backlight.c:59:39: error: implicit declaration of
 function 'of_find_node_by_name'; did you mean 'bus_find_device_by_name'?
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following powerpc ppc6xx_defconfig build regressions noticed on the
Linux next-20251027 tag with gcc-14 and gcc-8.

* powerpc, build
  - gcc-14-ppc6xx_defconfig
  - gcc-8-ppc6xx_defconfig

First seen on next-20251027
Good: next-20251024
Bad: next-20251027

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20251027: backlight.c:59:39: error: implicit
declaration of function 'of_find_node_by_name'; did you mean
'bus_find_device_by_name'?
Build regression: next-20251027: include/linux/math.h:167:43: error:
first argument to '__builtin_choose_expr' not a constant
Build regression: next-20251027: via-pmu-backlight.c:22:20: error:
'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
Build regression: next-20251027: minmax.h:71:17: error: first argument
to '__builtin_choose_expr' not a constant
Build regression: next-20251027: compiler.h:168:17: error:
'__UNIQUE_ID_x__286' undeclared (first use in this function); did you
mean '__UNIQUE_ID_y__287'?

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
arch/powerpc/platforms/powermac/backlight.c: In function
'pmac_has_backlight_type':
arch/powerpc/platforms/powermac/backlight.c:59:39: error: implicit
declaration of function 'of_find_node_by_name'; did you mean
'bus_find_device_by_name'? [-Wimplicit-function-declaration]
   59 |         struct device_node* bk_node =
of_find_node_by_name(NULL, "backlight");
      |                                       ^~~~~~~~~~~~~~~~~~~~
      |                                       bus_find_device_by_name
arch/powerpc/platforms/powermac/backlight.c:59:39: error:
initialization of 'struct device_node *' from 'int' makes pointer from
integer without a cast [-Wint-conversion]
arch/powerpc/platforms/powermac/backlight.c:60:17: error: implicit
declaration of function 'of_property_match_string'
[-Wimplicit-function-declaration]
   60 |         int i = of_property_match_string(bk_node,
"backlight-control", type);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/platforms/powermac/backlight.c:62:9: error: implicit
declaration of function 'of_node_put'
[-Wimplicit-function-declaration]
   62 |         of_node_put(bk_node);
      |         ^~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:22:20: error:
'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
   22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
      |                    ^~~~~~~~~~~~~~~~~~~
In file included from <command-line>:
drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_curve_lookup':
include/linux/compiler.h:168:17: error: '__UNIQUE_ID_x__286'
undeclared (first use in this function); did you mean
'__UNIQUE_ID_y__287'?
  168 |         __PASTE(__UNIQUE_ID_,                                   \
      |                 ^~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
   45 |                 max = max((int)bl_curve[i], max);
      |                       ^~~
include/linux/minmax.h:71:17: error: first argument to
'__builtin_choose_expr' not a constant
   71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL,
1L)))(ux) >= 0)
      |                 ^~~~~~~~~~~~~~~~~~~~~
include/linux/compiler_types.h:577:23: note: in definition of macro
'__compiletime_assert'
  577 |                 if (!(condition))
         \
      |                       ^~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
   45 |                 max = max((int)bl_curve[i], max);
      |                       ^~~
include/linux/minmax.h:71:17: error: first argument to
'__builtin_choose_expr' not a constant
   71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL,
1L)))(ux) >= 0)
      |                 ^~~~~~~~~~~~~~~~~~~~~
include/linux/compiler_types.h:577:23: note: in definition of macro
'__compiletime_assert'
  577 |                 if (!(condition))
         \
      |                       ^~~~~~~~~
include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
  112 | #define max(x, y)       __careful_cmp(max, x, y)
      |                         ^~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c:45:23: note: in expansion of macro 'max'
   45 |                 max = max((int)bl_curve[i], max);
      |                       ^~~
In file included from include/linux/kernel.h:27,
                 from arch/powerpc/include/asm/page.h:11,
                 from arch/powerpc/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:60,
                 from arch/powerpc/include/asm/ptrace.h:342,
                 from drivers/macintosh/via-pmu-backlight.c:11:
include/linux/math.h:162:17: error: first argument to
'__builtin_choose_expr' not a constant
  162 |                 __builtin_choose_expr(
         \
      |                 ^~~~~~~~~~~~~~~~~~~~~

drivers/macintosh/via-pmu-backlight.c: In function
'pmu_backlight_get_level_brightness':
drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX'
undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
   63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
      |                                      ^~~~~~~~~~~~~~~~
      |                                      BACKLIGHT_RAW
drivers/macintosh/via-pmu-backlight.c:58:51: warning: parameter
'level' set but not used [-Wunused-but-set-parameter]
   58 | static int pmu_backlight_get_level_brightness(int level)
      |                                               ~~~~^~~~~
drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit
declaration of function 'of_machine_is_compatible'
[-Wimplicit-function-declaration]
  144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu-backlight.c: At top level:
drivers/macintosh/via-pmu-backlight.c:22:11: warning: 'bl_curve'
defined but not used [-Wunused-variable]
   22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
      |           ^~~~~~~~
make[5]: *** [scripts/Makefile.build:287:
drivers/macintosh/via-pmu-backlight.o] Error 1
make[5]: Target 'drivers/macintosh/' not remade because of errors.


## Source
* Kernel version: 6.18.0-rc2-next-20251027
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20251027
* Git commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
* Architectures: powerpc
* Toolchains: gcc-14
* Kconfigs: defconfig

## Build
* Test log: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/build.log
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251027/build/gcc-14-ppc6xx_defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrlb77LGOQQSoC8FHCiIEAZK/config

--
Linaro LKFT

