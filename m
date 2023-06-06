Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8D723831
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:52:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb1Nv6TZCz3f7n
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ViYgYCU9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ViYgYCU9;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb1K535ltz3f7b
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:48:41 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-652d76be8c2so4998262b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686034118; x=1688626118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gNrbuh/VnmzvJEwoXJDBOMuvQOpY3Z/9t0AlP2eqsk=;
        b=ViYgYCU9wXtUg9hz1DLB3EXpRq5qYhOLLE+5l8hTFn0FA1ZggtnyZXw48mdre3TlFv
         qmfNhqQw1WqJNC8IVeoBp7qFjKkUWhnYBBsBwtzrIuR1yyhfyijN+KDyTVy8epDu4J1N
         0mEkmPjBIjgwPSETp+cDTZ55ftUQuwW1zH0fLnmq1r6vst/srgQJzCQO62sWGiehcwP1
         op5W12LSOgX+CebQphQ1HcDujqyFtsq9Pm8YWUQkHUMJTv4SQBjPXjJUIamoLc19+/2Y
         +nCBHjSJLck9mpDhZvGxvmWFutTvB4bsz+lHwVA5Uqsbvkd0WVZUf+acCObYzZIv747F
         lvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686034118; x=1688626118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gNrbuh/VnmzvJEwoXJDBOMuvQOpY3Z/9t0AlP2eqsk=;
        b=MJFqT8MPUal09Jm5xvfV1CRGEyD0+ztWokVpTSYvwTRjCuTwdRUEqeASRa+vZ7arm7
         eZ/mdAr+FzERo8o63gRiiMFBXm0K1WaniG8tTPiAEFkkiLIA7humMnsEsYvAKdTP1dZt
         xlWbImayiuipoZTpKdoa26T9MgPuGtnF257vKMWUsm3gv3SD9YnVC2kUaK6AxrbkttWy
         XBxCsXx6kEKjPZWCAux7glxjg0t79X6VVZAc6J1mZVognPUOIEIr6jnScMmra8f3ntnn
         me56VfevFhQ6c1Di07B69MuLALzVgIgOqX98xeQBTVzcsUpN/33NW5lGDU5BSNU3i4F5
         67Fw==
X-Gm-Message-State: AC+VfDyYGweIXRgl6GxyfmvS1JkfE/7Rk80zruyTZcdloVT3MUnOVQlR
	S+5+sNwHXMs2F+Xt24wwr2TNbd0wBh0=
X-Google-Smtp-Source: ACHHUZ5RmukVWZY7r55lldJr+fC+SwKHJ101o/B7UU/+9vQDzwkUKLINmZ656LqwAEpZOqYlKCv/8A==
X-Received: by 2002:a05:6a20:244c:b0:114:f141:733b with SMTP id t12-20020a056a20244c00b00114f141733bmr2127131pzc.15.1686034117921;
        Mon, 05 Jun 2023 23:48:37 -0700 (PDT)
Received: from wheely.local0.net ([1.146.61.5])
        by smtp.gmail.com with ESMTPSA id z7-20020a655a47000000b0050fa6546a45sm2188645pgs.6.2023.06.05.23.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:48:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/build: Remove -pipe from compilation flags
Date: Tue,  6 Jun 2023 16:48:30 +1000
Message-Id: <20230606064830.184083-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
This applies after the boot flags series, but easy enough to rebase if
necessary.

Thanks,
Nick

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
index 6f9ef031bfc7..bf8976563e02 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -71,7 +71,7 @@ endif
 BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
 BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
-BOOTCFLAGS	:= -pipe $(BOOTTARGETFLAGS) \
+BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -O2 \
 		   -msoft-float -mno-altivec -mno-vsx \
@@ -81,7 +81,7 @@ BOOTCFLAGS	:= -pipe $(BOOTTARGETFLAGS) \
 		   $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		   -fomit-frame-pointer -fno-builtin -fPIC
 
-BOOTAFLAGS	:= -pipe $(BOOTTARGETFLAGS) -D__ASSEMBLY__
+BOOTAFLAGS	:= $(BOOTTARGETFLAGS) -D__ASSEMBLY__
 
 BOOTARFLAGS	:= -crD
 
-- 
2.40.1

