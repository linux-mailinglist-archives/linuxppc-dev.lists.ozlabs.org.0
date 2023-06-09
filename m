Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5A728F3C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 07:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qcq1444Ypz3fK4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:11:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iwHEeHVe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iwHEeHVe;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qcq0C2Kt5z3dwh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 15:10:16 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-650bacd6250so1149937b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 22:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686287410; x=1688879410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q61uwCs+opPfNGIfJe10WUoOtgcAd2jIfdBZ8rro1Lk=;
        b=iwHEeHVe178g8aSxfwjWKZnFgRDtOezgxBxZFwtQf8x9CRRfrgU9l4xx4bnghLTrZ/
         +LUgQIuYfXV6wWsMvDbpOcD57LZo36yo7UClHHGccclFVaCknmjf1X/W4jEfaaZhELvC
         wrw61UZdBI2FZm1sF4waXxddzqQE1/dBUUVtwputmDlJVO8mil+PhdQ66na4Gg6ekPy+
         ptP/EynLC8UvOnEuocU+ZHkWsxhFdpxQm5zhEVPHDJQlax/N4JXwynvUp3Ah53YxRVag
         7YEp1ewplCsjZzsSKJKziTJiE8DRpPllxPFMTrLM3ramXu0rlmzFbItFx1XKhOG3Knk1
         5HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686287410; x=1688879410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q61uwCs+opPfNGIfJe10WUoOtgcAd2jIfdBZ8rro1Lk=;
        b=CESLuJXB3jHQrsJA/GTXJ+r9S77ZUbrYiahuVZXQy9mOSXdk2n6E+FXvIY80eivEwC
         cc0zGsTrIGKWbmpbOO/wZavmaRreKoirBcY1h9yJYW5GjBvtHyE9QsO443Bn/VgTGyx7
         p2475LAopXpsSIrv47YmfEbAlQ0xkByH6dK2pzEujHn6dttbMac35vG4CysqEpbrLd3b
         q/gprNjvIsFTA2zSg1Zy+AjHEOdXpDQLQZGn6ykjjJdPbcuBZsEWR6b9j5g9BiTA7Pmb
         iUnsZ1O+kigZ0oeC4uC03UvXRkZIyKHcF6bG0jWEGC58oJ6jri1dlNSDPGrL1gy1ZVGe
         /MZA==
X-Gm-Message-State: AC+VfDwfROeivyV2WpB3WuPnsJD5QWJYOFGkfVn8VcfhlTtKzpOe03JX
	ryIwEnZXYsx2EjwBP7GKgICg7RKw8RU=
X-Google-Smtp-Source: ACHHUZ4tmg21mwfY7gwaQkxH5GkhueCUbrmAg4kEpWBXpqwlCQ97qjTUTawIZlndE2qLgBfVjt2Iew==
X-Received: by 2002:a05:6a20:3d12:b0:103:b0f9:7110 with SMTP id y18-20020a056a203d1200b00103b0f97110mr184956pzi.11.1686287410335;
        Thu, 08 Jun 2023 22:10:10 -0700 (PDT)
Received: from wheely.local0.net (61-68-214-98.tpgi.com.au. [61.68.214.98])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902c38900b001aface7bdd8sm2276828plg.31.2023.06.08.22.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 22:10:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/build: vdso linker warning for orphan sections
Date: Fri,  9 Jun 2023 15:10:02 +1000
Message-Id: <20230609051002.3342-1-npiggin@gmail.com>
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

Add --orphan-handlin for vdsos, and adjust vdso linker scripts to deal
with orphan sections.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vdso/Makefile     | 2 ++
 arch/powerpc/kernel/vdso/vdso32.lds.S | 4 +++-
 arch/powerpc/kernel/vdso/vdso64.lds.S | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 4c3f34485f08..23ee96106537 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -56,6 +56,8 @@ KCSAN_SANITIZE := n
 ccflags-y := -fno-common -fno-builtin
 ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
 ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
+ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
+
 # Filter flags that clang will warn are unused for linking
 ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
 
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index bc0be274a9ac..426e1ccc6971 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -83,9 +83,11 @@ SECTIONS
 
 	/DISCARD/	: {
 		*(.note.GNU-stack)
+		*(*.EMB.apuinfo)
+		*(.branch_lt)
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
-		*(.got1)
+		*(.got1 .glink .iplt .rela*)
 	}
 }
 
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index 744ae5363e6c..bda6c8cdd459 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -32,7 +32,7 @@ SECTIONS
 	. = ALIGN(16);
 	.text		: {
 		*(.text .stub .text.* .gnu.linkonce.t.* __ftr_alt_*)
-		*(.sfpr .glink)
+		*(.sfpr)
 	}						:text
 	PROVIDE(__etext = .);
 	PROVIDE(_etext = .);
@@ -81,10 +81,12 @@ SECTIONS
 
 	/DISCARD/	: {
 		*(.note.GNU-stack)
+		*(*.EMB.apuinfo)
 		*(.branch_lt)
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
 		*(.opd)
+		*(.glink .iplt .plt .rela*)
 	}
 }
 
-- 
2.40.1

