Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B825BCDF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:06:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRL30jZNz3fNl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:06:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dx+Zu+CB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dx+Zu+CB;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRFR3rCXz3c3Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:19 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso6193545pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wJo8rkqgSQRlAg+Nt0/k7PH3Yku9xhyeGO3Cj9UN1Y8=;
        b=dx+Zu+CBcTTdR5uhkyVZyegUuPu0Y1zzG2+4z6uyBH2E1W3MT17tfl44nPfSlSWxq1
         M3Pdy4ofh0sa4DjE4+ot1i7k37WePzc422407T3wG5wCUNJOvw++5HQVDtIzFGfrBjOj
         weQKXlgPmFDmR3T95xpTCewwJCXcI9O5Vx8ZEEo1Hy3p4K9v1pgW5RcBVr8hz9b8bBwn
         Qk7A1avPXAudQIGDCk2hJBMnoB8xOk9EhUHlRlwWkbQkMc6NG+KR+wNAP4Riyq2u00jX
         e/eqOTRM9eVJSYJZsCmQg0uos72/qU5JNNu1gd57qZCtd1GXzGChQarHZ8oJh28EozJA
         7Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wJo8rkqgSQRlAg+Nt0/k7PH3Yku9xhyeGO3Cj9UN1Y8=;
        b=1e00+bXYZWInEA/yc4n1sooFixTnlOJfNUPSInHizADK+0jbAE0qQiplmubdCXgDN8
         8OUjOOg0BtCUsvrj7GwQL+VIgMGCEeYxZ43noqYx75qsTXwJ2qxH2mCg3CzolQ9NHP7/
         ENMVZPHydepu00vbQ/PMgZUObf6ZdFGrk8D+dWE5hQQ32Gp/Bl+lx2j/wOO2YilyV5Zj
         B+t2D6KA5Hmc0U3O3yRyzaQJNgq8cWtptm2MGyz/U0OglnkhdNvqxD71+6BWZvfX2I0r
         l1JzSM7FOwaJ17GsQZwcInAfia/MXKbFTx+aeLEfBDHQr2Ctz5rkA9AqzrSVl9zypf9X
         PVWg==
X-Gm-Message-State: ACrzQf3wY4oP+kBevH/2JpEmD764LNy6v1ohcy5tQloBhViIeqcBPQmn
	MXyODKqsxJdmUJYCjK//oD5Fcr3k5NE=
X-Google-Smtp-Source: AMsMyM7Jkr4xkEuMB77zMg/XO2ig+KCHW5Ebl2Q8Hk4qgDEcOHQNjVEWh07+DTr2Jb9MxRDjE9pA7A==
X-Received: by 2002:a17:90b:1c0d:b0:202:61d0:33c with SMTP id oc13-20020a17090b1c0d00b0020261d0033cmr31765944pjb.90.1663596136243;
        Mon, 19 Sep 2022 07:02:16 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/7] powerpc/64s: POWER10 CPU Kconfig build option
Date: Tue, 20 Sep 2022 00:01:48 +1000
Message-Id: <20220919140149.4018927-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919140149.4018927-1-npiggin@gmail.com>
References: <20220919140149.4018927-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds basic POWER10_CPU option, which builds with -mcpu=power10.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile                  | 7 ++++++-
 arch/powerpc/platforms/Kconfig.cputype | 8 +++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 471ef14f8574..8c233f0894ba 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -193,9 +193,14 @@ ifdef CONFIG_476FPE_ERR46
 		-T $(srctree)/arch/powerpc/platforms/44x/ppc476_modules.lds
 endif
 
-# No AltiVec or VSX instructions when building kernel
+# No prefix or pcrel
+KBUILD_CFLAGS += $(call cc-option,-mno-prefixed)
+KBUILD_CFLAGS += $(call cc-option,-mno-pcrel)
+
+# No AltiVec or VSX or MMA instructions when building kernel
 KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
 KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
+KBUILD_CFLAGS += $(call cc-option,-mno-mma)
 
 # No SPE instruction when building kernel
 # (We use all available options to help semi-broken compilers)
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 4bf9af6a6eb5..9d4d54fea081 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -84,7 +84,7 @@ choice
 	help
 	  There are two families of 64 bit PowerPC chips supported.
 	  The most common ones are the desktop and server CPUs
-	  (POWER5, 970, POWER5+, POWER6, POWER7, POWER8, POWER9 ...)
+	  (POWER5, 970, POWER5+, POWER6, POWER7, POWER8, POWER9, ...)
 
 	  The other are the "embedded" processors compliant with the
 	  "Book 3E" variant of the architecture
@@ -171,6 +171,11 @@ config POWER9_CPU
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
 
+config POWER10_CPU
+	bool "POWER10"
+	depends on PPC_BOOK3S_64
+	select ARCH_HAS_FAST_MULTIPLIER
+
 config E5500_CPU
 	bool "Freescale e5500"
 	depends on PPC64 && E500
@@ -239,6 +244,7 @@ config TARGET_CPU
 	default "power7" if POWER7_CPU
 	default "power8" if POWER8_CPU
 	default "power9" if POWER9_CPU
+	default "power10" if POWER10_CPU
 	default "405" if 405_CPU
 	default "440" if 440_CPU
 	default "464" if 464_CPU
-- 
2.37.2

