Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68B6EEDF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pJX6pHdz3fZx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:05:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ljvzkog6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ljvzkog6;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8z42hJz3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:15 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b733fd00bso5357084b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488753; x=1685080753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF2USIIBgsH0+cckxZfNEtqITyGwjtzqR/Gieyn3Mts=;
        b=ljvzkog6HfFMRVlEhuHE0pxbq0JyqL6sOVgBwE1UvMjH/sTukdi1WgiSb69+kNTt56
         gEkwYkx1QuglOuTwmCXG1a9CkJINP8wzBTC7kZW60xTSqxzj3YQQpb2dsB/0MVmRouWa
         j5M+bpQ2rYTqLk14YsFZ67kcqrrLT/0DvQWekH0yRQcHBSBawuEQFSE07nHYayRdPamS
         5eepRiRI1RQQtrOvBbDyuZXBUm25/yW9lmyUFHSdkH8X7dVwU/RKnAFiyofCioNFPFKB
         H1dib/VEF14yqaXAnUZXMGskJI5DZMSw2A6oi2d/iDCveSRxTEHCQBndMiStxG8txoaP
         09cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488753; x=1685080753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF2USIIBgsH0+cckxZfNEtqITyGwjtzqR/Gieyn3Mts=;
        b=Wb+2KldPlUHqwjWKRoRtgC+K26bJdbgoa6XtN99/YmGJQX5Oil/Fn7f/eDOj0F7JnF
         C305y8vV5mTBNMug+hiGGcNi2nIRFhB1JZZEVy9d5uqw7cUGCwfQiO+5imupw+469yG9
         l+cbXZW/OQnWiP9BPgXAFV8mG5gTMIdX3/aXEzQybnrK4okDCJZ3BJzc8g9nO0XktLv+
         UBWXzR7Wy8+lK1UGQxArRQXhlREBB49IegCxateKX0JR72XqL2LdZtmBJE/jlxzZI80W
         ga8FUPIpp+cj3s/FE9JmPDt/IEK8IJ83pz9Om2J5eMc7y7Ap+KqIsvxWGZYYOoNTmyLV
         bgAw==
X-Gm-Message-State: AAQBX9c8Vk3s/QpcQuFsQnR8fJLkZePVUJMNwg22PwC0UlbGJO8w+ZgS
	sGWDcEG2QN95mACkOH5mFf2DSk7Ozbd10w==
X-Google-Smtp-Source: AKy350Z1o64d2L7cy5DV2UrQ+OTHqmsnuFex1KIl4tJGvI78az0umzkn+a3p/pTXDXataa1mHlxqyQ==
X-Received: by 2002:a05:6a00:13aa:b0:637:f447:9916 with SMTP id t42-20020a056a0013aa00b00637f4479916mr28343888pfg.16.1682488752595;
        Tue, 25 Apr 2023 22:59:12 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/9] powerpc/boot: clean up Makefile flags
Date: Wed, 26 Apr 2023 15:58:44 +1000
Message-Id: <20230426055848.402993-8-npiggin@gmail.com>
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

