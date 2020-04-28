Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E01BB429
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5j50r60zDqwP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ElP5GI/q; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4dY4Q2GzDql6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:01:53 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 145so9910441pfw.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+L5dwaPus2uRNv6xYiywb7dehN9wQ3Aui1eYGe5c1kQ=;
 b=ElP5GI/quVCqUo3G099ujeT1Sviml5oCks2PjAtX+A77HBPcQ7TpLgRLhpjOhlZvyt
 J5XD1k4Oh6wRX4gS/M/zM9+wPjHmYHYEJ0HrJXTWugFuZFBhRuaHiYrbPC2DhL5ntQTz
 LlapUYgUC58Sjb0coCZCf4tNNvx/6uuwg/ZSvMenCs1ExusVY45cfsZFkGUJHDUS+FhI
 WH/pQa6G3JCWPxZHYQRXMMcbmYj9HB6EgqlKAxuomvjNkM9C70VyQWUe+eLH1j++sNlG
 Dk4QlO5aBknF+m9NA45dH1Q4JODpPt2QD7Zj5jwIgvgrFA6ZDYkPwKK/zsEQywLpbdgN
 bKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+L5dwaPus2uRNv6xYiywb7dehN9wQ3Aui1eYGe5c1kQ=;
 b=n6ofxqHo4igU/CW1pZke8PH9dP41jJ2rfP6CF80CMACJ7TTykuW5itdS8KSswIX8h2
 hEbKkIoLjkqCcKLeSqEd1Ntg/g2+W9Dr+9HhO8pk71y8c5zAAGBB5G3xaQ/OOoc/tGr1
 7Z2rUJXAJ3Zt3ME7QZbKg/qneaHsyY1SkBEVz9jgOdGUdQMizQigYV1gJLQlPyef9P8C
 pwI5EDPj09eHHa4KBmVhMYlg7cdG/2TPLN4WgLFIhtUnR9fEDBU9bG37u5XCMHSfWiSu
 Ua8uXjRL0Vcc4+vHWY/FiMlbEH3o0hzM/Y8fYoly6kKD1eRdx19j5zkvfOIQStygG0vn
 a7Gg==
X-Gm-Message-State: AGi0PuYsUy4DgZNQkQFRiC8g91OdIVrri5JmJejALopWS0Ua6q/GGNia
 VR/H5kKCfhGsWEtn9vPD40STYc/to+c=
X-Google-Smtp-Source: APiQypKbO4b0ny4n3Q/M/wkWVOpBs4jgvRdrgdh1HzJ2Kdq+1c7Qh7bAAlrh2TSyOKkBjyuqHNYptA==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr26549619pga.264.1588039311120; 
 Mon, 27 Apr 2020 19:01:51 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:01:50 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 25/28] powerpc: Test prefixed instructions in feature fixups
Date: Tue, 28 Apr 2020 11:58:11 +1000
Message-Id: <20200428015814.15380-26-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Expand the feature-fixups self-tests to includes tests for prefixed
instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: New to series
---
 arch/powerpc/lib/feature-fixups-test.S | 68 +++++++++++++++++++++++
 arch/powerpc/lib/feature-fixups.c      | 74 ++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/powerpc/lib/feature-fixups-test.S b/arch/powerpc/lib/feature-fixups-test.S
index b12168c2447a..6e2da9123a9b 100644
--- a/arch/powerpc/lib/feature-fixups-test.S
+++ b/arch/powerpc/lib/feature-fixups-test.S
@@ -791,3 +791,71 @@ globl(lwsync_fixup_test_expected_SYNC)
 1:	or	1,1,1
 	sync
 
+globl(ftr_fixup_prefix1)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000000
+	or	2,2,2
+globl(end_ftr_fixup_prefix1)
+
+globl(ftr_fixup_prefix1_orig)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000000
+	or	2,2,2
+
+globl(ftr_fixup_prefix1_expected)
+	or	1,1,1
+	nop
+	nop
+	or	2,2,2
+
+globl(ftr_fixup_prefix2)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000000
+	or	2,2,2
+globl(end_ftr_fixup_prefix2)
+
+globl(ftr_fixup_prefix2_orig)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000000
+	or	2,2,2
+
+globl(ftr_fixup_prefix2_alt)
+	.long 0x7000000
+	.long 0x0000001
+
+globl(ftr_fixup_prefix2_expected)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000001
+	or	2,2,2
+
+globl(ftr_fixup_prefix3)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000000
+	or	2,2,2
+	or	3,3,3
+globl(end_ftr_fixup_prefix3)
+
+globl(ftr_fixup_prefix3_orig)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000000
+	or	2,2,2
+	or	3,3,3
+
+globl(ftr_fixup_prefix3_alt)
+	.long 1 << 26
+	.long 0x0000001
+	nop
+
+globl(ftr_fixup_prefix3_expected)
+	or	1,1,1
+	.long 1 << 26
+	.long 0x0000001
+	nop
+	or	3,3,3
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 243011f85287..6fc499b1d63e 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -687,6 +687,75 @@ static void test_lwsync_macros(void)
 	}
 }
 
+#ifdef __powerpc64__
+static void __init test_prefix_patching(void)
+{
+	extern unsigned int ftr_fixup_prefix1[];
+	extern unsigned int end_ftr_fixup_prefix1[];
+	extern unsigned int ftr_fixup_prefix1_orig[];
+	extern unsigned int ftr_fixup_prefix1_expected[];
+	int size = sizeof(unsigned int) * (end_ftr_fixup_prefix1 - ftr_fixup_prefix1);
+
+	fixup.value = fixup.mask = 8;
+	fixup.start_off = calc_offset(&fixup, ftr_fixup_prefix1 + 1);
+	fixup.end_off = calc_offset(&fixup, ftr_fixup_prefix1 + 3);
+	fixup.alt_start_off = fixup.alt_end_off = 0;
+
+	/* Sanity check */
+	check(memcmp(ftr_fixup_prefix1, ftr_fixup_prefix1_orig, size) == 0);
+
+	patch_feature_section(0, &fixup);
+	check(memcmp(ftr_fixup_prefix1, ftr_fixup_prefix1_expected, size) == 0);
+	check(memcmp(ftr_fixup_prefix1, ftr_fixup_prefix1_orig, size) != 0);
+}
+
+static void __init test_prefix_alt_patching(void)
+{
+	extern unsigned int ftr_fixup_prefix2[];
+	extern unsigned int end_ftr_fixup_prefix2[];
+	extern unsigned int ftr_fixup_prefix2_orig[];
+	extern unsigned int ftr_fixup_prefix2_expected[];
+	extern unsigned int ftr_fixup_prefix2_alt[];
+	int size = sizeof(unsigned int) * (end_ftr_fixup_prefix2 - ftr_fixup_prefix2);
+
+	fixup.value = fixup.mask = 8;
+	fixup.start_off = calc_offset(&fixup, ftr_fixup_prefix2 + 1);
+	fixup.end_off = calc_offset(&fixup, ftr_fixup_prefix2 + 3);
+	fixup.alt_start_off = calc_offset(&fixup, ftr_fixup_prefix2_alt);
+	fixup.alt_end_off = calc_offset(&fixup, ftr_fixup_prefix2_alt + 2);
+	/* Sanity check */
+	check(memcmp(ftr_fixup_prefix2, ftr_fixup_prefix2_orig, size) == 0);
+
+	patch_feature_section(0, &fixup);
+	check(memcmp(ftr_fixup_prefix2, ftr_fixup_prefix2_expected, size) == 0);
+	patch_feature_section(0, &fixup);
+	check(memcmp(ftr_fixup_prefix2, ftr_fixup_prefix2_orig, size) != 0);
+}
+
+static void __init test_prefix_word_alt_patching(void)
+{
+	extern unsigned int ftr_fixup_prefix3[];
+	extern unsigned int end_ftr_fixup_prefix3[];
+	extern unsigned int ftr_fixup_prefix3_orig[];
+	extern unsigned int ftr_fixup_prefix3_expected[];
+	extern unsigned int ftr_fixup_prefix3_alt[];
+	int size = sizeof(unsigned int) * (end_ftr_fixup_prefix3 - ftr_fixup_prefix3);
+
+	fixup.value = fixup.mask = 8;
+	fixup.start_off = calc_offset(&fixup, ftr_fixup_prefix3 + 1);
+	fixup.end_off = calc_offset(&fixup, ftr_fixup_prefix3 + 4);
+	fixup.alt_start_off = calc_offset(&fixup, ftr_fixup_prefix3_alt);
+	fixup.alt_end_off = calc_offset(&fixup, ftr_fixup_prefix3_alt + 3);
+	/* Sanity check */
+	check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_orig, size) == 0);
+
+	patch_feature_section(0, &fixup);
+	check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_expected, size) == 0);
+	patch_feature_section(0, &fixup);
+	check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_orig, size) != 0);
+}
+#endif /* __powerpc64__ */
+
 static int __init test_feature_fixups(void)
 {
 	printk(KERN_DEBUG "Running feature fixup self-tests ...\n");
@@ -701,6 +770,11 @@ static int __init test_feature_fixups(void)
 	test_cpu_macros();
 	test_fw_macros();
 	test_lwsync_macros();
+#ifdef __powerpc64__
+	test_prefix_patching();
+	test_prefix_alt_patching();
+	test_prefix_word_alt_patching();
+#endif
 
 	return 0;
 }
-- 
2.17.1

