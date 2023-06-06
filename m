Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B933F72381B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb1L33qpkz3fCB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:49:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RfI2ZLko;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RfI2ZLko;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb1HP4BqMz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:47:13 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso5856238b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686034031; x=1688626031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWWzXLx8dotAm4CkNVsWIsWxVrxEbMQDMV4PYsF5IU4=;
        b=RfI2ZLkonlgVxwQr30f/GbLGQZ6Oo/A4FEMJR0NtT4Rd80LxUSvE1OkNh5VjrGc+2u
         mmmO0T6HXyRvMQHxRpnvM9l+8KhNUfKj3eHCZ7VtSlBzOlhJ6H1YXB5C/FK9jU7rqPh+
         LisgcEed4sH7ecrcHrekt1B3HeoFSrizx608Ucka9Es4B+n/rViX6Cpa35Q10VE/Kl1h
         Yq7mgiXhAt4bg6SQGA376GZ73xWHOJj1VI0ptvzF45XPc1GkPHnjsY5raa6BLCxQk9Dm
         U4wz7KF/50JutTvhMdo9EDbop1PLI4ufncJHmtXCMjDynHYdou4vgS8ruxoY+BAzziX/
         BcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686034031; x=1688626031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWWzXLx8dotAm4CkNVsWIsWxVrxEbMQDMV4PYsF5IU4=;
        b=ZLO1v3pecG1h01iyoTZ6oTnEkqA1wF7MFmMlHI1OPBgqhAtf0k+tZBXAXu2WL1uNMM
         bmwQZKAJSEUMj+ZT64VoryuNmhmZ1c++uwnAWQLlUmwd2QlqTPuA0S98mKb7cQ33T5pb
         qEA+GSJVQFR/RHxHRv4VjlRM458VjGig+NgLzsyLpfca15IVyiH8XjVqHEpxjKeEzOL+
         xSgyqWI5XL2i/r9tJuamQylcUio7ia+IyRriXpkd7gBEHgStVNaYU1mWglpjWFp/FtJK
         hi/0/zpcuhtMPv7JMIpUwi7kf5IOzD7Lj8a4Doe7Cvx45xSNce/6xeCX2zMdKy94srHn
         sGgw==
X-Gm-Message-State: AC+VfDzim9BLqYnC6ljzW3lz4GncLK33JFpLHg+bXnmCGVZpE2rzmcZD
	Yr2XNAHdrH/E0UXd/fd/H7viBahcFPI=
X-Google-Smtp-Source: ACHHUZ7KJxC5OH+9mTmJAxOK5UwIYxf/gcfsjMRrpi2c8Va+lfetjoBMzM/eR+u8TZBiSVRO0+Re+g==
X-Received: by 2002:a05:6a00:1254:b0:64f:35c8:8584 with SMTP id u20-20020a056a00125400b0064f35c88584mr1433523pfi.18.1686034030997;
        Mon, 05 Jun 2023 23:47:10 -0700 (PDT)
Received: from wheely.local0.net ([1.146.61.5])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78e0e000000b0063d24fcc2besm6130449pfr.125.2023.06.05.23.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:47:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/boot: Separate CPP flags from BOOTCFLAGS
Date: Tue,  6 Jun 2023 16:46:55 +1000
Message-Id: <20230606064657.183969-3-npiggin@gmail.com>
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

Add BOOTCPPFLAGS variable for the CPP options required by C and AS.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index ae80f7f1774e..9445ec442512 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -32,11 +32,13 @@ else
     BOOTAR := $(AR)
 endif
 
+BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
+BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
+
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
 		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
-		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
-		 $(LINUXINCLUDE)
+		 -pipe -fomit-frame-pointer -fno-builtin -fPIC
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTTARGETFLAGS	+= -m64
@@ -68,15 +70,13 @@ $(obj)/treeboot-iss4xx.o: BOOTTARGETFLAGS += -mcpu=405
 $(obj)/treeboot-currituck.o: BOOTTARGETFLAGS += -mcpu=405
 $(obj)/treeboot-akebono.o: BOOTTARGETFLAGS += -mcpu=405
 
-BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
-
 ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTTARGETFLAGS	+= -mbig-endian
 else
 BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS) -nostdinc
+BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS)
 
 BOOTARFLAGS	:= -crD
 
@@ -227,10 +227,10 @@ clean-files := $(zlib-) $(zlibheader-) $(zliblinuxheader-) \
 		empty.c zImage.coff.lds zImage.ps3.lds zImage.lds
 
 quiet_cmd_bootcc = BOOTCC  $@
-      cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCFLAGS) -c -o $@ $<
+      cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCPPFLAGS) $(BOOTCFLAGS) -c -o $@ $<
 
 quiet_cmd_bootas = BOOTAS  $@
-      cmd_bootas = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTAFLAGS) -c -o $@ $<
+      cmd_bootas = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCPPFLAGS) $(BOOTAFLAGS) -c -o $@ $<
 
 quiet_cmd_bootar = BOOTAR  $@
       cmd_bootar = $(BOOTAR) $(BOOTARFLAGS) $@.$$$$ $(real-prereqs); mv $@.$$$$ $@
-- 
2.40.1

