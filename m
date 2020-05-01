Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACE1C0D6C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:34:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Czt11s3gzDrBl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mxsmUeaN; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CyvJ5Ch5zDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:50:20 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id w3so3238057plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+L5dwaPus2uRNv6xYiywb7dehN9wQ3Aui1eYGe5c1kQ=;
 b=mxsmUeaN4RqYrbEetHLs8PzpP0Lb0RJTjOTTMnOn0Ct5BBDobImW3+FLhZW/wygdvV
 TyTOLK0bisxb8MKp2iwxYfXGiLQQAmJWe9H++V813Sr4+6UqzDLqW1/7HhsHCFue2qaq
 bvLio9sLv469prmI3ejNiEK214L+BHi8f2ste23IAc91InFLmySzcBBxhRW0qR6rYSdB
 X0GQx3I+4Mh+B6kDE/LN/cb/0JJ49/xRI/AFvAhuujt8NRLYLt35TrTHmL0WaTg0vC+/
 IDfAnXWg6+zECUsF4h+erW+0rMvN4r5B8tPgg68mTxKOly0Hua3kac3FNUGPpGxmm/ux
 zK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+L5dwaPus2uRNv6xYiywb7dehN9wQ3Aui1eYGe5c1kQ=;
 b=e1ThPz88p4ZBgQg9N1evlUhpyOM0QKCa61r3oVtuQqDbpuNZxJ8KZCMGQziIec2KLG
 Fua4VGUJsrw2XIc4blxzfSfLCoKneivtcim6m9TgHAKaDnzxllovEK7lTz4oRePjZ7SD
 Vk7mrTFaOJMPetxYZbO7vnTtSHlakyYsXJzrv1x94m2hnYzxpJ+GxBJJRPiq2gH9tW1Q
 zRhQnmGO2Q9oHlox/g8yN9qxjSlKlEzXkSSVh+/bZUZs66A8pRhY71wc/G+z60/QOcCP
 1n6jKiH40cXmnG5cS3iX3Jmc80UvZVgdqL0LhIWdqvevzMjNT63/wjQnust1HPjb5NPW
 uB0Q==
X-Gm-Message-State: AGi0PuZX07HuJc0j0ykildoA55ZmzMIQfJOMXJ9de88HLLDniNKTQbic
 WdQO8PBku2XDeUTys4yZwjQvfDaq4xLqXw==
X-Google-Smtp-Source: APiQypJzunlSQTglqCwYyolvxcbEj1nui7VkVILdyEpdTqDmkORTvcMgxNybcrsSlkISn/vO10Bn4g==
X-Received: by 2002:a17:90a:bd91:: with SMTP id
 z17mr1391818pjr.189.1588305017399; 
 Thu, 30 Apr 2020 20:50:17 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:50:16 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 25/28] powerpc: Test prefixed instructions in feature fixups
Date: Fri,  1 May 2020 13:42:17 +1000
Message-Id: <20200501034220.8982-26-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
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

