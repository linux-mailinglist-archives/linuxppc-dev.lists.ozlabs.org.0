Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7391C66F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:29:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3XW6D5mzDrfw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UuQ4K1UF; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2d31x10zDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:48:39 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t11so512433pgg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HeqhcP/7xjLDWAVICbxgERTt8EtDOymfjFPln/yhzn4=;
 b=UuQ4K1UFVS6b6o3bdoyMxYu4QLALffI3/OwGHYDkZMeLZldS8Nezz4SQ98bJaubIpB
 R0VEylOkVn+ifDzw1mlK7W+g/NOrD6pVe3Ktl1KK01KWY8Ju4ykJcz+3AW46xOrnYSK0
 7mXfD7bzVgDxf906AYleSntuSI98Tab7N0MyApzQ/w434DOo94DiVblBxqVahujX0Pt/
 G+/H3Zsuhu3ldrPjP+YQST5kP1BO1ALmxlXNn//TAy+BeKwRH4d0RcTmGWqM4rHoeiRt
 qLT/I61eBqMbo27YmusLH/Jk3xAxw31PDqXHOMuXB7lBMP86v00zIUyd4FCEkGePCxpq
 s+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HeqhcP/7xjLDWAVICbxgERTt8EtDOymfjFPln/yhzn4=;
 b=OCjJChO9Ua78PILVAR9xPjHayE1VIBvjTrTsSX48FKPK7FD6BPt5TzRBmrGskvlBGZ
 ou2c11ZPZjNr47yF7aZDDmngcnajBz5Q+jaJQ3UVQeIoO7ytdwOYOleD/0IHtFpRcRs/
 R+1DNsbhSvrPM03B3n1iXb/0rXuveoSmnrZl3ju7SnB28owx0R/bxAOtXHq0ZqjK/ylL
 lbciqoiWjmRqVHwn78IOVGBntTUTk537fEOuMdgz3y307y7Fciz5iG2EONkBVZSHj/2b
 EaO6uBatpqrZVbUq0qlqmLztHHk3rtmo3qBOzcPgOJ8M/G5OfUkn/NeonK2MfXrUpaJ7
 8xag==
X-Gm-Message-State: AGi0PuYi+2GK6Co0LJGU+MnQ7dUa1Y8b2JRWVuQUgyrcWv/b1vYGEWhZ
 T6qTwoV9pb0HcJCdG63efPJ5RjpsCGTw7A==
X-Google-Smtp-Source: APiQypLo4uiDTX4FnkhcmpjraxHwB3MX22t8UihUISf3eJQGWmF9Tv85O4z1Oim1Xqf0K8foM6jWhA==
X-Received: by 2002:a63:801:: with SMTP id 1mr5282784pgi.278.1588736916671;
 Tue, 05 May 2020 20:48:36 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:48:36 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 25/30] powerpc: Test prefixed instructions in feature fixups
Date: Wed,  6 May 2020 13:40:45 +1000
Message-Id: <20200506034050.24806-26-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
v8: Use OP_PREFIX
---
 arch/powerpc/lib/feature-fixups-test.S | 69 ++++++++++++++++++++++++
 arch/powerpc/lib/feature-fixups.c      | 73 ++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/powerpc/lib/feature-fixups-test.S b/arch/powerpc/lib/feature-fixups-test.S
index b12168c2447a..480172fbd024 100644
--- a/arch/powerpc/lib/feature-fixups-test.S
+++ b/arch/powerpc/lib/feature-fixups-test.S
@@ -7,6 +7,7 @@
 #include <asm/ppc_asm.h>
 #include <asm/synch.h>
 #include <asm/asm-compat.h>
+#include <asm/ppc-opcode.h>
 
 	.text
 
@@ -791,3 +792,71 @@ globl(lwsync_fixup_test_expected_SYNC)
 1:	or	1,1,1
 	sync
 
+globl(ftr_fixup_prefix1)
+	or	1,1,1
+	.long OP_PREFIX << 26
+	.long 0x0000000
+	or	2,2,2
+globl(end_ftr_fixup_prefix1)
+
+globl(ftr_fixup_prefix1_orig)
+	or	1,1,1
+	.long OP_PREFIX << 26
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
+	.long OP_PREFIX << 26
+	.long 0x0000000
+	or	2,2,2
+globl(end_ftr_fixup_prefix2)
+
+globl(ftr_fixup_prefix2_orig)
+	or	1,1,1
+	.long OP_PREFIX << 26
+	.long 0x0000000
+	or	2,2,2
+
+globl(ftr_fixup_prefix2_alt)
+	.long OP_PREFIX << 26
+	.long 0x0000001
+
+globl(ftr_fixup_prefix2_expected)
+	or	1,1,1
+	.long OP_PREFIX << 26
+	.long 0x0000001
+	or	2,2,2
+
+globl(ftr_fixup_prefix3)
+	or	1,1,1
+	.long OP_PREFIX << 26
+	.long 0x0000000
+	or	2,2,2
+	or	3,3,3
+globl(end_ftr_fixup_prefix3)
+
+globl(ftr_fixup_prefix3_orig)
+	or	1,1,1
+	.long OP_PREFIX << 26
+	.long 0x0000000
+	or	2,2,2
+	or	3,3,3
+
+globl(ftr_fixup_prefix3_alt)
+	.long OP_PREFIX << 26
+	.long 0x0000001
+	nop
+
+globl(ftr_fixup_prefix3_expected)
+	or	1,1,1
+	.long OP_PREFIX << 26
+	.long 0x0000001
+	nop
+	or	3,3,3
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index a8238eff3a31..5144854713e6 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -689,6 +689,74 @@ static void test_lwsync_macros(void)
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
@@ -703,6 +771,11 @@ static int __init test_feature_fixups(void)
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

