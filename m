Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2EA192608
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:45:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPsV38dfzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ad0vBl4S; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdN071QzDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:03 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id d37so453745pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dne2FYboYRGkTTCFl4cucL/oOgiBdHvSMQ950WlMzl8=;
 b=Ad0vBl4SiGTDl36RCEBrfHr7i2PKFw5ZyrGnWPb6Fdf8nCcgZY8bPP5NHsnlCcOVmZ
 1FyioNk93PpL6/+ccAHJwjw7SgO85/Pv3uExhHva7ZKOQqUBpFY1ZGK7Ylj0UQL/OaZ+
 8b8NTuU3TM+EZz/lfCSDQROjrpRpDYC/RK0l+2euFZqqS4rE/NSqRWYX+HfxqCK2LV+h
 KjRcj5lbGXP13f9bZ71/FaSl1wiT6HeaNZl18Yv1MVjPWwuDiucIEC52Q2tAjSk3Bcan
 kCbJMgqHI+q4k7u60c3lwZ2ET77Mn0OQC8GKWkLFrOyCYtpZCViUO6/vZuwQmpzMEuEy
 z2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dne2FYboYRGkTTCFl4cucL/oOgiBdHvSMQ950WlMzl8=;
 b=CW0w6oISq//XYtm8F+W7R8BlQxtVz12J7kMDD882jgpvDwaF9mlBpOb3JumyPOI7vt
 OsxPeIWjFa0IIS+b8XWEGg5lGp4yKcr6l6LRi+riWKklcilnVlvN18Oq3egufUg34NW8
 /qBUcqrzUAcMkubPRtEM/Qb056BDsvEzRzaDNXb8aWw25yDZ8MLpoq7gDuJ+2zXUic60
 MNlhCMA5zIZhfccanIVHsjt585dleUzv9XhyHUe1oSPCgiW4QdUt1jUZu1oyTUvWi0SY
 LyxbGfJ/fJRUy9yYlVH/sCqIX+Zg9mwQDO+AeXzN//ORdEiP6I8pa+E17Ti92wecRa7S
 ZnYQ==
X-Gm-Message-State: ANhLgQ0hT4WQTdUuL0E1+Uf5sxHcG6IjNCBXkA0Kjf5spuZVGqIOL7qI
 hGcgLArOW9esdoDoMwNKvTndHO3W
X-Google-Smtp-Source: ADFU+vtbFN9MRkQPmKNqU6ul0LE0EowBewB4cvOZdhsGo6BqZBNymF1IflB/A93BbM/Qq0BS3fDhrQ==
X-Received: by 2002:a63:5206:: with SMTP id g6mr2511450pgb.419.1585132500206; 
 Wed, 25 Mar 2020 03:35:00 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:34:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/12] powerpc/pseries/ras: avoid calling rtas_token in NMI
 paths
Date: Wed, 25 Mar 2020 20:34:02 +1000
Message-Id: <20200325103410.157573-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the interest of reducing code and possible failures in the
machine check and system reset paths, grab the "ibm,nmi-interlock"
token at init time.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/platforms/pseries/ras.c   |  2 +-
 arch/powerpc/platforms/pseries/setup.c | 13 ++++++++++---
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index ca33f4ef6cb4..6003c2e533a0 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -128,6 +128,7 @@ extern void machine_check_fwnmi(void);
 
 /* This is true if we are using the firmware NMI handler (typically LPAR) */
 extern int fwnmi_active;
+extern int ibm_nmi_interlock_token;
 
 extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 1d7f973c647b..c74d5e740922 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(rtas_token("ibm,nmi-interlock"), 0, 1, NULL);
+	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 17d17f064a2d..c31acd7ce0c0 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -83,6 +83,7 @@ unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
 EXPORT_SYMBOL(CMO_PageSize);
 
 int fwnmi_active;  /* TRUE if an FWNMI handler is present */
+int ibm_nmi_interlock_token;
 
 static void pSeries_show_cpuinfo(struct seq_file *m)
 {
@@ -113,9 +114,14 @@ static void __init fwnmi_init(void)
 	struct slb_entry *slb_ptr;
 	size_t size;
 #endif
+	int ibm_nmi_register_token;
 
-	int ibm_nmi_register = rtas_token("ibm,nmi-register");
-	if (ibm_nmi_register == RTAS_UNKNOWN_SERVICE)
+	ibm_nmi_register_token = rtas_token("ibm,nmi-register");
+	if (ibm_nmi_register_token == RTAS_UNKNOWN_SERVICE)
+		return;
+
+	ibm_nmi_interlock_token = rtas_token("ibm,nmi-interlock");
+	if (WARN_ON(ibm_nmi_interlock_token == RTAS_UNKNOWN_SERVICE))
 		return;
 
 	/* If the kernel's not linked at zero we point the firmware at low
@@ -123,7 +129,8 @@ static void __init fwnmi_init(void)
 	system_reset_addr  = __pa(system_reset_fwnmi) - PHYSICAL_START;
 	machine_check_addr = __pa(machine_check_fwnmi) - PHYSICAL_START;
 
-	if (0 == rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr,
+	if (0 == rtas_call(ibm_nmi_register_token, 2, 1, NULL,
+				system_reset_addr,
 				machine_check_addr))
 		fwnmi_active = 1;
 
-- 
2.23.0

