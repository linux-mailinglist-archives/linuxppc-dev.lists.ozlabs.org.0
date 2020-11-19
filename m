Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B582B9DFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:17:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbDL5wtfzDqvT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Dz3w7lPO; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8V0wSxzDqXs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:13:45 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id t21so5641040pgl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCIa7RGrK5wRd2VRPf2XrpmKDd6Kk3p1rPfSH2v7nlg=;
 b=Dz3w7lPOOJjzcTOPpu/ie5wYA22tJrirnTU5zsYagb5BfvNZDcwrmfxairHHwEJoWl
 bjFvyLOuFiV0G/ovSXumIJ59zdta8rYDBVEadGLD9kZowDea064wqBlaUsnm9s4Gmmdo
 ztlXNyCWl1g20MtjPH6fmwOBbCcQsA3RD7+6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCIa7RGrK5wRd2VRPf2XrpmKDd6Kk3p1rPfSH2v7nlg=;
 b=EYgJK2Am+dj/DYsSytUp0tVSMMLJapL5Sf4j6YF04GFqZDjjtNIttoLRtG5bBYDiiT
 qdnLL74iIDAHzx+zIRhY2ZAXlfdM2TNRqLJu8HOYmanArjLO3/dtxMUrqR53k6Fw8f8j
 f0+yM3jq3TffB+EysMtok6cVzD0ZOh3FRTdXZo1Zho5lyg6Pj8RbB3sKarWfr2sxljgI
 eBkHRFBJ/sXDF/gEnfm5BBIbJ3ybQJCy66UjeDD3b8CG3WpWLFvJBvzAA32lBz9U67YB
 W/9KUO5iViqGBGREAMOzPfxN+ZY1QXxf0Msqyp98bPsJ4shB6SX40qfyMgJYDn21nrzp
 v30w==
X-Gm-Message-State: AOAM532aKb9Ve4xaOD782jV7F/LOpnVOUFZYHKHvE6qXFlq5pdmggI1Z
 zmKrpSKFk/G45mJIIJYT6mksDv24l8MNDw==
X-Google-Smtp-Source: ABdhPJztcESv+e87WZvK9m5LkA2jcMje6HQhhgtfW8Qr3hnFP2nNHc5vbZUNoLjUZqS4s7UHuVhi5Q==
X-Received: by 2002:aa7:868a:0:b029:197:60b6:ae1c with SMTP id
 d10-20020aa7868a0000b029019760b6ae1cmr11481675pfo.42.1605827621594; 
 Thu, 19 Nov 2020 15:13:41 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id 145sm797819pga.11.2020.11.19.15.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:13:41 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] selftests/powerpc: rfi_flush: disable entry flush if
 present
Date: Fri, 20 Nov 2020 10:13:27 +1100
Message-Id: <20201119231333.361771-2-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119231333.361771-1-dja@axtens.net>
References: <20201119231333.361771-1-dja@axtens.net>
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
Cc: dja@axtens.net, cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

We are about to add an entry flush. The rfi (exit) flush test measures
the number of L1D flushes over a syscall with the RFI flush enabled and
disabled. But if the entry flush is also enabled, the effect of enabling
and disabling the RFI flush is masked.

If there is a debugfs entry for the entry flush, disable it during the RFI
flush and restore it later.

Reported-by: Spoorthy S <spoorts2@in.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 .../selftests/powerpc/security/rfi_flush.c    | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index 93a65bd1f231..4e7b2776c367 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -85,19 +85,33 @@ int rfi_flush_test(void)
 	__u64 l1d_misses_total = 0;
 	unsigned long iterations = 100000, zero_size = 24 * 1024;
 	unsigned long l1d_misses_expected;
-	int rfi_flush_org, rfi_flush;
+	int rfi_flush_orig, rfi_flush;
+	int have_entry_flush, entry_flush_orig;
 
 	SKIP_IF(geteuid() != 0);
 
 	// The PMU event we use only works on Power7 or later
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
-	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_org)) {
+	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
 		perror("Unable to read powerpc/rfi_flush debugfs file");
 		SKIP_IF(1);
 	}
 
-	rfi_flush = rfi_flush_org;
+	if (read_debugfs_file("powerpc/entry_flush", &entry_flush_orig) < 0) {
+		have_entry_flush = 0;
+	} else {
+		have_entry_flush = 1;
+
+		if (entry_flush_orig != 0) {
+			if (write_debugfs_file("powerpc/entry_flush", 0) < 0) {
+				perror("error writing to powerpc/entry_flush debugfs file");
+				return 1;
+			}
+		}
+	}
+
+	rfi_flush = rfi_flush_orig;
 
 	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
 	FAIL_IF(fd < 0);
@@ -106,6 +120,7 @@ int rfi_flush_test(void)
 
 	FAIL_IF(perf_event_enable(fd));
 
+	// disable L1 prefetching
 	set_dscr(1);
 
 	iter = repetitions;
@@ -147,8 +162,8 @@ again:
 		       repetitions * l1d_misses_expected / 2,
 		       passes, repetitions);
 
-	if (rfi_flush == rfi_flush_org) {
-		rfi_flush = !rfi_flush_org;
+	if (rfi_flush == rfi_flush_orig) {
+		rfi_flush = !rfi_flush_orig;
 		if (write_debugfs_file("powerpc/rfi_flush", rfi_flush) < 0) {
 			perror("error writing to powerpc/rfi_flush debugfs file");
 			return 1;
@@ -164,11 +179,19 @@ again:
 
 	set_dscr(0);
 
-	if (write_debugfs_file("powerpc/rfi_flush", rfi_flush_org) < 0) {
+	if (write_debugfs_file("powerpc/rfi_flush", rfi_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/rfi_flush debugfs file");
 		return 1;
 	}
 
+	if (have_entry_flush) {
+		if (write_debugfs_file("powerpc/entry_flush", entry_flush_orig) < 0) {
+			perror("unable to restore original value of powerpc/entry_flush "
+			       "debugfs file");
+			return 1;
+		}
+	}
+
 	return rc;
 }
 
-- 
2.25.1

