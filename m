Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A8E1C24EF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:50:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnVh4jFPzDqyq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:50:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gsx6nWF8; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqt6qL7zDr6v
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:10 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id a21so1121437pls.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRG3snmF5tseeCaythTgToFsHUjdZrmW3z8maxEAfWE=;
 b=gsx6nWF8P/cl81VOSjQV8IgOZQDxpCA7yr7W2BXJK3Cdzx80l9YTZ1BpDzTT3dSeAa
 TTPeKxw5gXcMaMCNBXRP1xXdx80TDYyP57WYD0giNvoCFWht7s5yHKOo0dXVktKGDTBj
 4odFqTpl0PWL/RKO3ha/KLVaSjuA1KtffR3HTDmWgTxNtqI1iFUHhB5/1tCdNwDfDNwO
 E/POlqNWE600IOOVb4CzQjK+U92fqEBmEJjj87stw6M5Bmf2w6e14IJyQUnNO0gwZ6Xo
 LzgOlBDH7pTVj1YlKpCqRyDh3v8i/l3oQLFwYpLoRLwmCrE1Ee4mh+9+LaAiat1KWJ4p
 O6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRG3snmF5tseeCaythTgToFsHUjdZrmW3z8maxEAfWE=;
 b=jSfDl+bhjs76ic2g8Ri1hfiw2BZUFV/OhpgyI6c3keBwYE1GrQGVAE6qmXfndp/9V8
 XjnR44sfbU3PZ+Un/AoWxchKjgKHP4HPyKkGaofHdXlbyaO27st+HLxJjrwsBLbHx9pZ
 bKlvzyMa8SQbqaTxqjxFNcKcc/Zq1jIi4ZhfYBTtNqYDOZmrYyhJg5HjznxpxfWN5aGr
 JcnTYX1Wfkc1HzdGxgE6NUhu8VX3jM1fAG7gLZZIo3i3Z3T4f1/aQ2+0Rc3H0Khypygi
 2DLKlkjmps/MhKlxJYuZgNpUhp31DCvmTqHnGQPq09YL2M6THMkeVQUy8OPL1l9stOoc
 Sv1A==
X-Gm-Message-State: AGi0PuZxMolW2vGtVWCIixhDBLEb28taKiSVopZjzLVow8w29XuJc+D2
 NIiJc3lgQEY/q+g294EghANg3ey0
X-Google-Smtp-Source: APiQypIkmnViE9JbEUr0GdcemXKQ8aOET2SjOq1ZE/dFlM8CHun6YTOztzEBJQcpfFXWPaGQwcCXiQ==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id
 ci12mr5271724pjb.104.1588418408012; 
 Sat, 02 May 2020 04:20:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 06/10] powerpc/powernv: opal use new opal call entry point
 if it exists
Date: Sat,  2 May 2020 21:19:10 +1000
Message-Id: <20200502111914.166578-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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

OPAL may advertise new endian-specific entry point which has different
calling conventions including using the caller's stack, but otherwise
provides the standard OPAL call API without any changes required to
the OS.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/opal.c                   |  5 +++
 arch/powerpc/platforms/powernv/opal-call.c | 36 ++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal.c      | 30 +++++++++++-------
 3 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/boot/opal.c b/arch/powerpc/boot/opal.c
index b69818ce592b..8b006a0282ac 100644
--- a/arch/powerpc/boot/opal.c
+++ b/arch/powerpc/boot/opal.c
@@ -13,6 +13,7 @@
 struct opal {
 	u64 base;
 	u64 entry;
+	u64 v4_le_entry;
 } opal;
 
 static u32 opal_con_id;
@@ -75,6 +76,10 @@ static void opal_init(void)
 	if (getprop(opal_node, "opal-entry-address", &opal.entry, sizeof(u64)) < 0)
 		return;
 	opal.entry = be64_to_cpu(opal.entry);
+
+	if (getprop(opal_node, "opal-v4-le-entry-address", &opal.v4_le_entry, sizeof(u64)) < 0)
+		return;
+	opal.v4_le_entry = be64_to_cpu(opal.v4_le_entry);
 }
 
 int opal_console_init(void *devp, struct serial_console_data *scdp)
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 506b1798081a..32857254d268 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -92,6 +92,18 @@ static s64 __opal_call_trace(s64 a0, s64 a1, s64 a2, s64 a3,
 #define DO_TRACE false
 #endif /* CONFIG_TRACEPOINTS */
 
+struct opal {
+	u64 base;
+	u64 entry;
+	u64 size;
+	u64 v4_le_entry;
+};
+extern struct opal opal;
+
+typedef int64_t (*opal_v4_le_entry_fn)(uint64_t r3, uint64_t r4, uint64_t r5,
+                               uint64_t r6, uint64_t r7, uint64_t r8,
+                               uint64_t r9, uint64_t r10);
+
 static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 	     int64_t a4, int64_t a5, int64_t a6, int64_t a7, int64_t opcode)
 {
@@ -99,6 +111,30 @@ static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 	unsigned long msr = mfmsr();
 	bool mmu = (msr & (MSR_IR|MSR_DR));
 	int64_t ret;
+	opal_v4_le_entry_fn fn;
+
+	if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
+		fn = (opal_v4_le_entry_fn)(opal.v4_le_entry);
+
+	if (fn) {
+		if (!mmu) {
+			BUG_ON(msr & MSR_EE);
+			ret = fn(opcode, a0, a1, a2, a3, a4, a5, a6);
+			return ret;
+		}
+
+		local_irq_save(flags);
+		hard_irq_disable(); /* XXX r13 */
+		msr &= ~MSR_EE;
+		mtmsr(msr & ~(MSR_IR|MSR_DR));
+
+		ret = fn(opcode, a0, a1, a2, a3, a4, a5, a6);
+
+		mtmsr(msr);
+		local_irq_restore(flags);
+
+		return ret;
+	}
 
 	msr &= ~MSR_EE;
 
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index a0e9808237b2..d00772d40680 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -46,13 +46,14 @@ static DEFINE_SPINLOCK(msg_list_lock);
 static LIST_HEAD(msg_list);
 
 /* /sys/firmware/opal */
-struct kobject *opal_kobj;
+struct kobject *opal_kobj __read_mostly;
 
 struct opal {
 	u64 base;
 	u64 entry;
 	u64 size;
-} opal;
+	u64 v4_le_entry;
+} opal __read_mostly;
 
 struct mcheck_recoverable_range {
 	u64 start_addr;
@@ -150,14 +151,15 @@ unsigned long arch_symbol_lookup_name(const char *name)
 int __init early_init_dt_scan_opal(unsigned long node,
 				   const char *uname, int depth, void *data)
 {
-	const void *basep, *entryp, *sizep;
-	int basesz, entrysz, runtimesz;
+	const void *basep, *entryp, *v4_le_entryp, *sizep;
+	int basesz, entrysz, v4_le_entrysz, runtimesz;
 
 	if (depth != 1 || strcmp(uname, "ibm,opal") != 0)
 		return 0;
 
 	basep  = of_get_flat_dt_prop(node, "opal-base-address", &basesz);
 	entryp = of_get_flat_dt_prop(node, "opal-entry-address", &entrysz);
+	v4_le_entryp = of_get_flat_dt_prop(node, "opal-v4-le-entry-address", &v4_le_entrysz);
 	sizep = of_get_flat_dt_prop(node, "opal-runtime-size", &runtimesz);
 
 	if (!basep || !entryp || !sizep)
@@ -166,19 +168,25 @@ int __init early_init_dt_scan_opal(unsigned long node,
 	opal.base = of_read_number(basep, basesz/4);
 	opal.entry = of_read_number(entryp, entrysz/4);
 	opal.size = of_read_number(sizep, runtimesz/4);
+	opal.v4_le_entry = of_read_number(v4_le_entryp, v4_le_entrysz/4);
+
+	if (of_flat_dt_is_compatible(node, "ibm,opal-v3")) {
+		powerpc_firmware_features |= FW_FEATURE_OPAL;
+		pr_debug("OPAL detected !\n");
+	} else {
+		panic("OPAL v3 compatible firmware not detected, can not continue.\n");
+	}
 
 	pr_debug("OPAL Base  = 0x%llx (basep=%p basesz=%d)\n",
 		 opal.base, basep, basesz);
-	pr_debug("OPAL Entry = 0x%llx (entryp=%p basesz=%d)\n",
+	pr_debug("OPAL Entry = 0x%llx (entryp=%p entrysz=%d)\n",
 		 opal.entry, entryp, entrysz);
-	pr_debug("OPAL Entry = 0x%llx (sizep=%p runtimesz=%d)\n",
+	pr_debug("OPAL Size = 0x%llx (sizep=%p runtimesz=%d)\n",
 		 opal.size, sizep, runtimesz);
+	if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) && v4_le_entryp) {
 
-	if (of_flat_dt_is_compatible(node, "ibm,opal-v3")) {
-		powerpc_firmware_features |= FW_FEATURE_OPAL;
-		pr_debug("OPAL detected !\n");
-	} else {
-		panic("OPAL != V3 detected, no longer supported.\n");
+		pr_debug("OPAL v4 Entry = 0x%llx (v4_le_entryp=%p v4_le_entrysz=%d)\n",
+			 opal.v4_le_entry, v4_le_entryp, v4_le_entrysz);
 	}
 
 	return 1;
-- 
2.23.0

