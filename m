Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3506EEDF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:04:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pHS5khHz3fbS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:04:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IwsYIVak;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IwsYIVak;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8w3qxlz3cV7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:12 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b620188aeso7970645b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488750; x=1685080750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF2USIIBgsH0+cckxZfNEtqITyGwjtzqR/Gieyn3Mts=;
        b=IwsYIVakKdfgGZMAsbDXLSsHz/o+E1kq7+rCGuNXma+L0oiCX89QPBeOMW5K0p2N/E
         SSTeO1wq00LRnzHM/bQOddrHSkCbbIe7wYVItlkeHg/3Baf5eomgTRlAw6RO5TN6ycoc
         KksJyVpA66gtzP6OaYxRVomKRld1XLGZIMmhslXatD8WGvfkGoAOrrEQB0YIukGk7cxq
         dFLJKT6al53GurKjScus3mMeKRUctOly9kx60g8qmTEYUGEdI476A1lJ4LZhHW7bAJZJ
         s0BaoSLQ14cRSmPk+aF/c2ZLNxjVzDaML7Kd74ke5smd9TDbQc7eo1ZJhJDXkXqRmiIX
         ghJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488750; x=1685080750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF2USIIBgsH0+cckxZfNEtqITyGwjtzqR/Gieyn3Mts=;
        b=LSvm7wDU7poaL/2VFfNcqqezTQxMiDpfU7sLjPY92zz4/U9kdOtChSskMNoYWY56OR
         RMuAEzBjeGREOFnVtEzA0PJeoru1m+FJDJqGhew4W+vS1IQKawn0iJXqYU2mowzCDJq9
         qXH3s9heN6KYViTE0il+XuwskXgEus/pDphKzQuP639d3HVUoyu+LKcbwC16LV9bSfMT
         JzM2BQDt0lDzsWsChMocEwYsNLmiUe6txvCfwCqxbrYAOzugJi390H63FbMJKNB9LTQi
         TfvVBDUkhJHEHoirhV43dbNxARCCD3At4Km4Bac+05P0h8aPxVcIOMCiBHrH7nkg1wIj
         i47Q==
X-Gm-Message-State: AAQBX9e2TYAiXxIoEk//ZX7XR8WpbfYzWFur07y1fblIlX3pnROuHDkL
	ihnwb3A1Qgj/Qxo1dZ3FDPJSprvpYq31dg==
X-Google-Smtp-Source: AKy350b4NtjHL7ejTYgkVOySM3QPlGsMK9xBxM60u7Fsx+szLY+nN8TRZXJNpdJJ6qjWb3mmM9kYhQ==
X-Received: by 2002:a05:6a00:23d2:b0:62a:c1fa:b253 with SMTP id g18-20020a056a0023d200b0062ac1fab253mr26718432pfc.31.1682488750361;
        Tue, 25 Apr 2023 22:59:10 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/9] powerpc/boot: Clean up Makefile after cflags and asflags separation
Date: Wed, 26 Apr 2023 15:58:43 +1000
Message-Id: <20230426055848.402993-7-npiggin@gmail.com>
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

Tidy pass over boot Makefile. Move variables together where possible.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 99f56c94177f..0982a7025e66 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -32,16 +32,6 @@ else
     BOOTAR := $(AR)
 endif
 
-BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
-BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
-
-BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
-		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
-		 $(call cc-option,-mno-prefixed) $(call cc-option,-mno-pcrel) \
-		 $(call cc-option,-mno-mma) \
-		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
-		 -pipe -fomit-frame-pointer -fno-builtin -fPIC
-
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTTARGETFLAGS	:= -m64
 ifdef CONFIG_PPC64_ELF_ABI_V2
@@ -77,11 +67,21 @@ else
 BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) -pipe
+BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
+BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
-BOOTARFLAGS	:= -crD
+BOOTCFLAGS	:= -pipe $(BOOTTARGETFLAGS) \
+		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
+		   -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
+		   $(call cc-option,-mno-prefixed) \
+		   $(call cc-option,-mno-pcrel) \
+		   $(call cc-option,-mno-mma) \
+		   $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
+		   -fomit-frame-pointer -fno-builtin -fPIC
 
-BOOTCFLAGS	+= $(BOOTTARGETFLAGS)
+BOOTAFLAGS	:= -pipe $(BOOTTARGETFLAGS) -D__ASSEMBLY__
+
+BOOTARFLAGS	:= -crD
 
 ifdef CONFIG_CC_IS_CLANG
 BOOTCFLAGS += $(CLANG_FLAGS)
-- 
2.40.0

