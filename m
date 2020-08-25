Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F472513BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 10:00:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbLy11sRkzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 18:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qSJlE00Y; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbLsh1DRtzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 17:56:24 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id o5so6257085pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 00:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6UHluqivOmYKBUNbF2BxyWoXHbfZ9SBg+IHbcaz0JI=;
 b=qSJlE00YIvrv1O3Dj8dOPwa2YBxffYAsxZD93Y3h1WhdNUEi0e5A4iOF+BgSUCvf3P
 FjwI4WYsBBas9R6Ptp0guO8U1PEm89rXoFC9l0q6NkKqqGxR52cgDAqenPyEyToKb1cS
 J7DVJmcsty7is/ppNx4T8wR1SajgoTwNF2BI6Kh+vv4awVyuuyvn28jnxPCVcXox6/PF
 jGmmZ2zPVkxQ8nsKG8LjyN7p+lasa92klTUiJqbUPsMcMH1js6QgnuFxqyI1ratR7DQN
 vKGYFdvsmigUjjUh9EhJMdhUx87ts42uso15q10anfmvCvq4OPJoIIPcamyT8xlHpGf/
 u8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6UHluqivOmYKBUNbF2BxyWoXHbfZ9SBg+IHbcaz0JI=;
 b=Cz01aCLP0abBv+zkqeiP7Vt3GYJ/bQxQkjpeSZ/VXpQZII3Vo4fsluUrsHaV2uGZ1b
 KvnnivMr3hhAxmxHw3yJ+Chmd+xZnLmxoJ6GnH3tIYxznB7zeCgdYOoMjkNh0pYhQHju
 nLVeRQwvChxKinLxh7Km6YKJ5rTp60QZmJ4Eajb52Qbf9aJU5ZA5sG9PdifAxYfs07XX
 2e+Wzi51LT7PW6o7XhnmVOGQ7So/Ntx8swrVBSdA3VsZGUtlbX9KAZ4Hkj+IQoSPsZ0J
 uRpe7t9DsETSzPkq0MRg6VylwvcsSLsTtUTaQNZQDBdAL/DhYvGdlXeLXeu+0+6aygZi
 oGYQ==
X-Gm-Message-State: AOAM532PXHZCBKkZrXjrzqSCAirXDi2V4NsZsdcYeKEY03UYoWyAHpAF
 ECjg9SaoO6E5UysTPaGLuET2NOatlVM=
X-Google-Smtp-Source: ABdhPJynnB00q210YJmKPFGcZ3XvZFRPD3RbT+7or3ihM9rgyaSYWqAhCWacDU9/h5qwLAx6LLWLyg==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr5697617pgj.388.1598342180377; 
 Tue, 25 Aug 2020 00:56:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id 8sm1901464pjx.14.2020.08.25.00.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 00:56:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: add new branch prediction security bits for
 link stack
Date: Tue, 25 Aug 2020 17:56:12 +1000
Message-Id: <20200825075612.224656-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hypervisor interface has defined branch prediction security bits for
handling the link stack. Wire them up.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h      | 2 ++
 arch/powerpc/platforms/pseries/setup.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index fbb377055471..e66627fc1972 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -375,11 +375,13 @@
 #define H_CPU_CHAR_THREAD_RECONFIG_CTRL	(1ull << 57) // IBM bit 6
 #define H_CPU_CHAR_COUNT_CACHE_DISABLED	(1ull << 56) // IBM bit 7
 #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST	(1ull << 54) // IBM bit 9
+#define H_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST (1ull << 52) // IBM bit 11
 
 #define H_CPU_BEHAV_FAVOUR_SECURITY	(1ull << 63) // IBM bit 0
 #define H_CPU_BEHAV_L1D_FLUSH_PR	(1ull << 62) // IBM bit 1
 #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ull << 61) // IBM bit 2
 #define H_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58) // IBM bit 5
+#define H_CPU_BEHAV_FLUSH_LINK_STACK	(1ull << 57) // IBM bit 6
 
 /* Flag values used in H_REGISTER_PROC_TBL hcall */
 #define PROC_TABLE_OP_MASK	0x18
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2f4ee0a90284..633c45ec406d 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -519,9 +519,15 @@ static void init_cpu_char_feature_flags(struct h_cpu_char_result *result)
 	if (result->character & H_CPU_CHAR_BCCTR_FLUSH_ASSIST)
 		security_ftr_set(SEC_FTR_BCCTR_FLUSH_ASSIST);
 
+	if (result->character & H_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST)
+		security_ftr_set(SEC_FTR_BCCTR_LINK_FLUSH_ASSIST);
+
 	if (result->behaviour & H_CPU_BEHAV_FLUSH_COUNT_CACHE)
 		security_ftr_set(SEC_FTR_FLUSH_COUNT_CACHE);
 
+	if (result->behaviour & H_CPU_BEHAV_FLUSH_LINK_STACK)
+		security_ftr_set(SEC_FTR_FLUSH_LINK_STACK);
+
 	/*
 	 * The features below are enabled by default, so we instead look to see
 	 * if firmware has *disabled* them, and clear them if so.
-- 
2.23.0

