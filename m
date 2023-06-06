Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD65723828
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb1Ms6FZvz3fDZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SmzNQWg2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SmzNQWg2;
	dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb1HW2Hvhz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:47:19 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6af7d6f6f41so4349050a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686034036; x=1688626036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+2QhvTpB7T08q2PIdZMSMFsMOx/jieaAuDrK72vUF0=;
        b=SmzNQWg2vvvNoRex8IE2rUnA+wQON9A+DuU8PFXpGo2CkjKusHHbkInlZrIxF7APYp
         oCdQa+x9irVYnM+KxLNeRSG+5NeowM5OrY/JeshO3RDyizKACdVni6B09LRlX9/vjIIN
         /MN3AoyegvK8AbWrtjNAm9+vi7S8DnH+ekACIYfWFW/OBLIHcNXWO3z43yw7DLKnokcj
         m06uPxB+xosvDMakz8J1+devE5AkBNU0ApdiPoVIbdJKcQc2VAnhzg2qJkxHYGTyzIXN
         HnSPST+4E5vl9vVfdbcglYsFzBb40APHgthvOSKltrp6LazHYXBZMolNPdo5g698L+r7
         WxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686034036; x=1688626036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+2QhvTpB7T08q2PIdZMSMFsMOx/jieaAuDrK72vUF0=;
        b=Wal4SPfD8oO0r93oFWNPIUh7uEdmK6wdGyqj+AzMQq6BazcXFtKVsk8PWH2bq0rnwr
         axTBlaVUmPPw+OngpphOVBk9aBbsGwufxvhci2N6ZDmtuHiLXhMySrLc1+w0nRC/9dfG
         Q12pYArJjZjVW2GCUHnGmQtzRhCBBvyr1Wup9aZRDRThfo0ewAICHYUXLfwf7t0yMlZV
         9P9sd3stXMVKQHPkhZHUZvohHV5GiDgg9AEmHHhV/7Zmd21Dx98xyh/aH4GE5G8Fq2nm
         UuIDCR+zzjgBt/foJOc68szuOXAsOf6AOdM0DXh/da44oYzfwoFcSapuwUd8ccjLrH/i
         Omfw==
X-Gm-Message-State: AC+VfDzSJTvQ1e0UA8HJyC+IMvN0WP+cUf4UCEs1YXALad8RPApLtMqf
	CVveKswWlRcIDhvPIHFntu3jG68xvYc=
X-Google-Smtp-Source: ACHHUZ5Ts7nS6Qq2vRXi1sa3BFxmUVePz5uIFfAgoj5w+loQ8xr92NI6nQ13cETBHDr5v8rxzQyfjw==
X-Received: by 2002:a05:6830:3a8c:b0:6b2:9425:3d06 with SMTP id dj12-20020a0568303a8c00b006b294253d06mr1201501otb.34.1686034036461;
        Mon, 05 Jun 2023 23:47:16 -0700 (PDT)
Received: from wheely.local0.net ([1.146.61.5])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78e0e000000b0063d24fcc2besm6130449pfr.125.2023.06.05.23.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:47:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/boot: Clean up Makefile after cflags and asflags separation
Date: Tue,  6 Jun 2023 16:46:57 +1000
Message-Id: <20230606064657.183969-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606064657.183969-1-npiggin@gmail.com>
References: <20230606064657.183969-1-npiggin@gmail.com>
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
 arch/powerpc/boot/Makefile | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 9cdc0858b256..6f9ef031bfc7 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -32,14 +32,6 @@ else
     BOOTAR := $(AR)
 endif
 
-BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
-BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
-
-BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
-		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
-		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
-		 -pipe -fomit-frame-pointer -fno-builtin -fPIC
-
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTTARGETFLAGS	+= -m64
 BOOTTARGETFLAGS	+= -mabi=elfv2
@@ -76,15 +68,22 @@ else
 BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) -pipe
-
-BOOTARFLAGS	:= -crD
+BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
+BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
-BOOTCFLAGS	+= $(call cc-option,-mno-prefixed) \
+BOOTCFLAGS	:= -pipe $(BOOTTARGETFLAGS) \
+		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
+		   -fno-strict-aliasing -O2 \
+		   -msoft-float -mno-altivec -mno-vsx \
+		   $(call cc-option,-mno-prefixed) \
 		   $(call cc-option,-mno-pcrel) \
-		   $(call cc-option,-mno-mma)
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
2.40.1

