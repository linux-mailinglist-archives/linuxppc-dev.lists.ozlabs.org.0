Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E46EEDFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pKd2ps8z3chm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:06:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dZpYYgZe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dZpYYgZe;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p914HsKz3cgT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:17 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b73203e0aso40605435b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488755; x=1685080755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2Bt/1IFIqoALumDKTJ/iLodSHOQClI8w+LLk56vjhU=;
        b=dZpYYgZebJdBd6Qpz7t4EX7ItHs2D4O/lWigNF4maIoUXzbuc3EAjFwOIJeHhhPonj
         602yAXirDB/GzfiNjIgmdHt58ro2amINtayHSZ2mSnSo3hVzYI3gSXF/5PBx/M8qP4o9
         OtALOd3f20AIk9T7o6LzcXWkTHrz7ZPJcMch2LN+FyDg/6hzwX/K/dIZQKTM2KoQFNvQ
         5f44NlgR/gjaqQtBaDDdqijMWK1iPsLwvan7HW3wHrxW3llSswe78MyuYSdRM+eXO9nZ
         LoAa2yjNeQBdRQLxNIWWWt7fCjU+duXBwASJ3e3w0QeuE1T2kP3rVPP4OcuFPmbdfpxL
         KtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488755; x=1685080755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2Bt/1IFIqoALumDKTJ/iLodSHOQClI8w+LLk56vjhU=;
        b=VfaSJ/27OVAs/B8puxZTbfAa+vBz0AUWBCIfk5RhbHsFKiVLpccFSbUGaAd7xbrgG5
         eEgYvKQFJENP6MgdhXD57wqztWqXWEWmhKG6sazFTq+Gwn3G2Jy2o/gy6+kRnqKHj/78
         gLVZgik39ZImWnktnb2+eZbfvso5pQXNwhCbbqXlaryFF+rAERMEBPUSStsdmlPMH5Gi
         qZZGXG56OdW38j3Xf/ycMGkIJ1p5xgGRV6WWOzSe/H021oHCbfnt3Zrg0X5jlp+txwxB
         52AvmgAjnl50IKWzmGQzVUWg+8j1LJKvkiXYhihak/S2mfvoXUzLVHU8wRKlUXKwTR/X
         FL8A==
X-Gm-Message-State: AC+VfDxeMoroV2EKEEVt7TKjVSrZO0AmNt400Inn6jAmr45rBJQrvOD+
	4pcXp9wEHA328UXLwbhKAllU+d3OTmajlA==
X-Google-Smtp-Source: ACHHUZ7lL9BsN4eDKNOk/N0mOFt9rcZW0vsSPU8KhdS4vfd63jDv5J7a5Jh52cI1vtusOqoRO0XPQQ==
X-Received: by 2002:a05:6a21:339a:b0:f0:4a5e:b686 with SMTP id yy26-20020a056a21339a00b000f04a5eb686mr1379166pzb.29.1682488754799;
        Tue, 25 Apr 2023 22:59:14 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/9] powerpc/build: Remove -pipe from compilation flags
Date: Wed, 26 Apr 2023 15:58:45 +1000
Message-Id: <20230426055848.402993-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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

x86 removed -pipe in commit 437e88ab8f9e2 ("x86/build: Remove -pipe from
KBUILD_CFLAGS") and the newer arm64 and riscv seem to have never used it,
so that seems to be the way the world's going.

Compile performance building defconfig on a POWER10 PowerNV system
was in the noise after 10 builds each. No point in adding options unless
they help something, so remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile      | 2 +-
 arch/powerpc/boot/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dca73f673d70..76fc7cc26780 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -166,7 +166,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
-KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
+KBUILD_CFLAGS	+= $(CFLAGS-y)
 CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 0982a7025e66..1c9951153bae 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -70,7 +70,7 @@ endif
 BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
 BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
-BOOTCFLAGS	:= -pipe $(BOOTTARGETFLAGS) \
+BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
 		   $(call cc-option,-mno-prefixed) \
@@ -79,7 +79,7 @@ BOOTCFLAGS	:= -pipe $(BOOTTARGETFLAGS) \
 		   $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		   -fomit-frame-pointer -fno-builtin -fPIC
 
-BOOTAFLAGS	:= -pipe $(BOOTTARGETFLAGS) -D__ASSEMBLY__
+BOOTAFLAGS	:= $(BOOTTARGETFLAGS) -D__ASSEMBLY__
 
 BOOTARFLAGS	:= -crD
 
-- 
2.40.0

