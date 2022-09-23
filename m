Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9775E7273
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYd2v2lbVz3f45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:30:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y+TEL4aT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y+TEL4aT;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYd2H3yQ4z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:30:15 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so4128302pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 20:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UH85ZBY7dXWi+K/8jeIZj3ecvqo7G2fU7FsaxJKlyCU=;
        b=Y+TEL4aTG01do/JPctY1Nieq7vZfNizf/6kqtdvL3MKT8X19pEDp5/e9OaDZGYPS6P
         r0/1W6rntLpnOnJRJmderRmyObB0PisO4X8Qujz2ujLDN266aL9vEvJZZsqII1XIDf6u
         860QkGSiPxmsrr4MlFDthev9MkLG9EzZvFwysqHPyFil2lq9iYlctIEDBWOZ2xyUjvPJ
         fdf2dRsygAFz/OyPqxXBJbSbalkFrSIBdtSlJJ7rk427XZaouYTHtRQZ9oWL5CSQEgJL
         t5t//3rgBnxgkleXlYnX1j3GhjsQFdwGWwuyGH5GDhpyT7hq5rDVKoY6wOS+EneRaxrc
         BWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UH85ZBY7dXWi+K/8jeIZj3ecvqo7G2fU7FsaxJKlyCU=;
        b=IkQy2Wbg/LqLrl2gwPRewLGyc44/+O2ygQ2+xSd0pqN5oygY7XUxmfqBMJpGNjhSV6
         gocrFP/Vgg+FySoSfbUU/P76SAoaNqrJ+RRDGI2cJF6qlxgxH0VQEguqdmfnW2jHFJkd
         pqg3YzpE37fiS4dz+KIm87zeYpfoBOavSLU3an+fBUIGle4JJ+kbtuF6qmA4NW9zOR7X
         heR25L8s/Lf4TpuUVMra+Swy0J3x9IG3056URagMooeMo5RGb4moADAEYprXn+RBmUM7
         U/SYgNep1h3g+L7y91txO+D5OS5DtA1Uf1w4gw8DXtE6Q5fiv7LwmPNriTXhfkbeMnsQ
         m8uw==
X-Gm-Message-State: ACrzQf0z8j3cTDAs0kMvZ5mfD4aYc/2N2jE/H5IeRYdmWjv2+o7J8Hnk
	QzgqntITn0QoT8BcQigTn3tgFht6LqUYxQ==
X-Google-Smtp-Source: AMsMyM7NwiqMDnfadUbGSwTkoHuPkklG9uCR7q2l8ISRnJpCyYf3FzuAtIP/BBUS7WtK5gP8L7wp3A==
X-Received: by 2002:a17:903:120c:b0:170:aa42:dbba with SMTP id l12-20020a170903120c00b00170aa42dbbamr6576768plh.67.1663903812319;
        Thu, 22 Sep 2022 20:30:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id i2-20020a17090332c200b0015e8d4eb26esm4820776plr.184.2022.09.22.20.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:30:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Date: Fri, 23 Sep 2022 13:30:04 +1000
Message-Id: <20220923033004.536127-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds basic POWER10_CPU option, which builds with -mcpu=power10.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
There's quite a lot of asm and linker changes slated for the next merge
window already so I may leave the pcrel patch for next time. I think we
can add the basic POWER10 build option though.

Thanks,
Nick

 arch/powerpc/Makefile                  | 7 ++++++-
 arch/powerpc/platforms/Kconfig.cputype | 8 +++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 8a3d69b02672..ea88af26f8c6 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -192,9 +192,14 @@ ifdef CONFIG_476FPE_ERR46
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
index 4017be72e46f..1f7c903ea664 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
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

