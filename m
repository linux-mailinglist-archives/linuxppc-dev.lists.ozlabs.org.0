Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D55BF2FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 03:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXLkn0dsFz3cdC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 11:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IoGyM3dg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IoGyM3dg;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXLjT0qkgz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 11:41:16 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so668813pjk.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DCgl65fX5UxKswF3P4KWuoh6Sb1axGlQUQ0GTCdYsOU=;
        b=IoGyM3dgRh9PmeI+4bNzf8uni8Q7Z0nhADYgDivkfDOQN0IlcgFPVKX5sEULwdMSUc
         JN8vaosfktDHHqHWxQwOEuuLfAfOhTrhz4qDyneRY2srbqV9vfqX375pyTJX1aFaBvVf
         G0GJ47P9/PDCKXJyetTzqOkBmusqnLlXIhRV9r75dWtMLmA/cqNqfgrlKHydgAVYOnPM
         45u9sPyyjL9DlBtvWKdJAOgjL1qLsYEeRcd2RMghFewviNuYXWMEE0DLXy/fLW76T3cW
         pRjuEB4ncJ5QoAY4IndmdhQvu+qmZwbhK9O+RttUG2hXUvUVlqpSgNd6uQYTzMWvS6/d
         qqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DCgl65fX5UxKswF3P4KWuoh6Sb1axGlQUQ0GTCdYsOU=;
        b=cCvXyyKLfHh8x31ngbjmaaloSbJopxxVU4p8UbLIf9tlNlJSGU7YDqfV0OLJGOHa0h
         Vp0QH2ubE/E00Jsx+13F3m86zbRCn1svyLqH/8u0egwBcDPIoaF23FHbbEeYsBzXuYzK
         EpiY3cwKPAP49RC5I+MyIPeCYVKMtWcshy8DBb7Cinca4t9RN6+lDCdiXRmPGigSXlEv
         GyuVi+N/3OXYaUl/ubR4W2iGReLjjovis6Gp22cYYK6/PkhgeAWLyU79XCwWJrjV9A04
         PDLAsmdjAvnKIe88KoOWFhrvzNmpq7RjMmI6Ooo0BJ+zuDPzrZlIojJLuO6jCYiqaTqm
         XHxA==
X-Gm-Message-State: ACrzQf3NEDat0Ny0WgmKqxAJtNV8OYYPucISWJIw8bhgUiDz942XmHua
	MYw+ubcFrNuyZ1If6/EGENLYpv316eo=
X-Google-Smtp-Source: AMsMyM6rmpsEYVF7ub31azcXF+jCn/YGl7hIclKqZRX2H21yDhcTWYiRNtAPexafb9TCp475/s0psA==
X-Received: by 2002:a17:902:70c6:b0:173:c64:c03b with SMTP id l6-20020a17090270c600b001730c64c03bmr2357200plt.34.1663724474169;
        Tue, 20 Sep 2022 18:41:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id w62-20020a623041000000b0053e156e9475sm575131pfw.182.2022.09.20.18.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 18:41:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: update cpu selection options
Date: Wed, 21 Sep 2022 11:41:03 +1000
Message-Id: <20220921014103.587954-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220921014103.587954-1-npiggin@gmail.com>
References: <20220921014103.587954-1-npiggin@gmail.com>
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

Update the 64s GENERIC_CPU option. POWER4 support has been dropped, so
make that clear in the option name. The POWER5_CPU option is dropped
because it's uncommon, and GENERIC_CPU covers it.

-mtune= before power8 is dropped because the minimum gcc version
supports power8, and tuning is made consistent between big and little
endian.

A 970 option is added for PowerPC 970 / G5 because they still have a
user base, and -mtune=power8 does not generate good code for the 970.

This also updates the ISA versions document to add Power4/Power4+
because I didn't realise Power4+ used 2.01.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
The 970 option builds and boots a QEMU TCG 970 machine.

 Documentation/powerpc/isa-versions.rst | 14 ++++++++++++++
 arch/powerpc/Makefile                  |  5 +++--
 arch/powerpc/platforms/Kconfig.cputype |  8 ++++----
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
index dfcb1097dce4..a242b3821681 100644
--- a/Documentation/powerpc/isa-versions.rst
+++ b/Documentation/powerpc/isa-versions.rst
@@ -4,6 +4,8 @@ CPU to ISA Version Mapping
 
 Mapping of some CPU versions to relevant ISA versions.
 
+Note Power4 and Power4+ are not supported.
+
 ========= ====================================================================
 CPU       Architecture version
 ========= ====================================================================
@@ -24,6 +26,12 @@ PPC970    - PowerPC User Instruction Set Architecture Book I v2.01
           - PowerPC Virtual Environment Architecture Book II v2.01
           - PowerPC Operating Environment Architecture Book III v2.01
           - Plus Altivec/VMX ~= 2.03
+Power4+   - PowerPC User Instruction Set Architecture Book I v2.01
+          - PowerPC Virtual Environment Architecture Book II v2.01
+          - PowerPC Operating Environment Architecture Book III v2.01
+Power4    - PowerPC User Instruction Set Architecture Book I v2.00
+          - PowerPC Virtual Environment Architecture Book II v2.00
+          - PowerPC Operating Environment Architecture Book III v2.00
 ========= ====================================================================
 
 
@@ -44,6 +52,8 @@ Power5++   No
 Power5+    No
 Power5     No
 PPC970     Yes
+Power4+    No
+Power4     No
 ========== ==================
 
 ========== ====
@@ -60,6 +70,8 @@ Power5++   No
 Power5+    No
 Power5     No
 PPC970     No
+Power4+    No
+Power4     No
 ========== ====
 
 ========== ====================================
@@ -76,4 +88,6 @@ Power5++   No
 Power5+    No
 Power5     No
 PPC970     No
+Power4+    No
+Power4     No
 ========== ====================================
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 140a5e6471fe..8a3d69b02672 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -149,11 +149,12 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 ifdef CONFIG_PPC_BOOK3S_64
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power9,-mtune=power8)
 else
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
 CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power4
 endif
+CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power10,	\
+				  $(call cc-option,-mtune=power9,	\
+				  $(call cc-option,-mtune=power8)))
 else ifdef CONFIG_PPC_BOOK3E_64
 CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
 endif
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 5185d942b455..4017be72e46f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -125,7 +125,7 @@ choice
 	  If unsure, select Generic.
 
 config GENERIC_CPU
-	bool "Generic (POWER4 and above)"
+	bool "Generic (POWER5 and PowerPC 970 and above)"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
 
@@ -144,8 +144,8 @@ config CELL_CPU
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
 
-config POWER5_CPU
-	bool "POWER5"
+config PPC_970_CPU
+	bool "PowerPC 970 (including PowerPC G5)"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
 
@@ -234,7 +234,7 @@ config TARGET_CPU
 	string
 	depends on TARGET_CPU_BOOL
 	default "cell" if CELL_CPU
-	default "power5" if POWER5_CPU
+	default "970" if PPC_970_CPU
 	default "power6" if POWER6_CPU
 	default "power7" if POWER7_CPU
 	default "power8" if POWER8_CPU
-- 
2.37.2

