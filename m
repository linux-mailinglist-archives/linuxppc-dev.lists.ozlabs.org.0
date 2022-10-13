Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5278E5FE5CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 01:08:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpQDF21JFz3dqh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 10:08:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bONXDX/k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bONXDX/k;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpQCG6j3wz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 10:07:22 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id y191so3307279pfb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyfbo90TheLdRxV8LQZmd0Ccv6k/mt6i8wxA3Zuvjjw=;
        b=bONXDX/kWE6LD4bJPjOeEI7LDyeau720ZCGteJtbX424H+ErIoUIRtsABQJXpHD7rj
         IJwdhnNXZiZYM7N3D7bOTOUCYIrJwn7W/iU8iSYyDFdBE9VHTY1ItJwt5yOTp3OIns0g
         ne70JGUfiYbhqIWZbT5Jct6IRHGnt9Vu8Scb/gUU5rguTeV3bR69hwlvshjqWbi+8HPq
         JiPE5aIRw6FB72RSbXMP2EE28UM2RcocfCpwOJe0KIrRAqqbSqzY2oGWJvtyS/3VCd8u
         yaXWOQN7pkgswA6J18EMKkkaWLIDfM/LmAM4fevcsmyh1ReFUD7p2GXxpM5/15T0LQBZ
         kfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oyfbo90TheLdRxV8LQZmd0Ccv6k/mt6i8wxA3Zuvjjw=;
        b=hBh7uwnj6rrjMfgLhHZ98N0vl8iZtO+KefBd/qPYavkIwZ9aGMtKXhAR9TCSvJwuju
         wOeo69qo7WvpWxAzBnbjX3DW6MnzQkMbQ+DsJhCb5BL2jJiwOChRoZnVB6lN2JQRG0no
         xUFXlCM55er16fqfcMKTNrgvxCqh1BeQpShxI9OwKoeuJ2GgVs41UFm5xZ/KgKVfLFVv
         MZCWjqSGAFyxw7DbQhR4rl6K98TOs2KlNBKuApcgQu8XL6mER2DAK79/I0mtLCEE95qh
         Zf8uH7zbcqQihLA7cRAABEhOmIny1EEPF7dRrEeS062Uq/OSKElYEk3FgLX3mjf5CRNC
         Q2kg==
X-Gm-Message-State: ACrzQf1rCiGyDzUNn005b2xAZC30BaURTAyBT3tcsmQnVCJKp5F9Ko7N
	oF71Zvy8g1JoVLbGQ7W7CmzmpkegDY4=
X-Google-Smtp-Source: AMsMyM6AiMTiNugnVWbdeyWbzNMUPuTSMy6yaP1Uw/0LYUpLzBkstmZ+stfQz1/a8oDr8iUcHW6e2A==
X-Received: by 2002:a05:6a00:24c9:b0:563:b4b8:cee with SMTP id d9-20020a056a0024c900b00563b4b80ceemr1913303pfv.36.1665702437869;
        Thu, 13 Oct 2022 16:07:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902cf1200b001837b19ebb8sm332896plg.244.2022.10.13.16.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 16:07:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s: Add lockdep for HPTE lock
Date: Fri, 14 Oct 2022 09:07:08 +1000
Message-Id: <20221013230710.1987253-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add lockdep annotation for the HPTE bit-spinlock. Modern systems don't
take the tlbie lock, so this shows up some of the same lockdep warnings
that were being reported by the ppc970. And they're not taken in exactly
the same places so this is nice to have in its own right.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 42 +++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 623a7b7ab38b..02d0c210a1ce 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -43,6 +43,29 @@
 
 static DEFINE_RAW_SPINLOCK(native_tlbie_lock);
 
+#ifdef CONFIG_LOCKDEP
+static struct lockdep_map hpte_lock_map =
+        STATIC_LOCKDEP_MAP_INIT("hpte_lock", &hpte_lock_map);
+
+static void acquire_hpte_lock(void)
+{
+	lock_map_acquire(&hpte_lock_map);
+}
+
+static void release_hpte_lock(void)
+{
+	lock_map_release(&hpte_lock_map);
+}
+#else
+static void acquire_hpte_lock(void)
+{
+}
+
+static void release_hpte_lock(void)
+{
+}
+#endif
+
 static inline unsigned long  ___tlbie(unsigned long vpn, int psize,
 						int apsize, int ssize)
 {
@@ -220,6 +243,7 @@ static inline void native_lock_hpte(struct hash_pte *hptep)
 {
 	unsigned long *word = (unsigned long *)&hptep->v;
 
+	acquire_hpte_lock();
 	while (1) {
 		if (!test_and_set_bit_lock(HPTE_LOCK_BIT, word))
 			break;
@@ -234,6 +258,7 @@ static inline void native_unlock_hpte(struct hash_pte *hptep)
 {
 	unsigned long *word = (unsigned long *)&hptep->v;
 
+	release_hpte_lock();
 	clear_bit_unlock(HPTE_LOCK_BIT, word);
 }
 
@@ -279,6 +304,7 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
 		hpte_v = hpte_old_to_new_v(hpte_v);
 	}
 
+	release_hpte_lock();
 	hptep->r = cpu_to_be64(hpte_r);
 	/* Guarantee the second dword is visible before the valid bit */
 	eieio();
@@ -327,6 +353,7 @@ static long native_hpte_remove(unsigned long hpte_group)
 		return -1;
 
 	/* Invalidate the hpte. NOTE: this also unlocks it */
+	release_hpte_lock();
 	hptep->v = 0;
 
 	return i;
@@ -517,10 +544,11 @@ static void native_hpte_invalidate(unsigned long slot, unsigned long vpn,
 		/* recheck with locks held */
 		hpte_v = hpte_get_old_v(hptep);
 
-		if (HPTE_V_COMPARE(hpte_v, want_v) && (hpte_v & HPTE_V_VALID))
+		if (HPTE_V_COMPARE(hpte_v, want_v) && (hpte_v & HPTE_V_VALID)) {
 			/* Invalidate the hpte. NOTE: this also unlocks it */
+			release_hpte_lock();
 			hptep->v = 0;
-		else
+		} else
 			native_unlock_hpte(hptep);
 	}
 	/*
@@ -580,10 +608,8 @@ static void native_hugepage_invalidate(unsigned long vsid,
 			hpte_v = hpte_get_old_v(hptep);
 
 			if (HPTE_V_COMPARE(hpte_v, want_v) && (hpte_v & HPTE_V_VALID)) {
-				/*
-				 * Invalidate the hpte. NOTE: this also unlocks it
-				 */
-
+				/* Invalidate the hpte. NOTE: this also unlocks it */
+				release_hpte_lock();
 				hptep->v = 0;
 			} else
 				native_unlock_hpte(hptep);
@@ -765,8 +791,10 @@ static void native_flush_hash_range(unsigned long number, int local)
 
 			if (!HPTE_V_COMPARE(hpte_v, want_v) || !(hpte_v & HPTE_V_VALID))
 				native_unlock_hpte(hptep);
-			else
+			else {
+				release_hpte_lock();
 				hptep->v = 0;
+			}
 
 		} pte_iterate_hashed_end();
 	}
-- 
2.37.2

