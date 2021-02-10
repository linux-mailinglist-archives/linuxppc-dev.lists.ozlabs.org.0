Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D6315F13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:33:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db7hC2Y1RzDvZb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=cHmKUEQH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OdAq4dSU; 
 dkim-atps=neutral
X-Greylist: delayed 500 seconds by postgrey-1.36 at bilbo;
 Wed, 10 Feb 2021 16:31:15 AEDT
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db7fC6QSqzDrSq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 16:31:15 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 94781E1F;
 Wed, 10 Feb 2021 00:22:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 10 Feb 2021 00:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=W+5w9HsZU7/hL6m+urnQzcrdAE
 YaocMSlZx+KMfYvGY=; b=cHmKUEQHVv1433KD5yTFtJLusw+y13AdJFHVJ6aHmU
 GZ1BFAHDkdUqvv8hAkOfi+wuIN7bOP8Rkdc9M2NkltHQkWL/M8l4ok+hynnCo0Fa
 CELZoHxjI1V3HJTnW8vGpw69EXf1oaiab5AyaunvrCWvosMvYd12yO3JVYEGWG1n
 B4+GwbI01YyrtxQ9JGsTJ0ho+0xFVQoAQ8M/A+wTTFN4QMbs6Ax//4s0pfejkSBd
 vwoF7QAs8AOu7CVzQ8sUmgBR2b4QNiwYynxdacPtIr/tDjunqfvcKNQYuzHxklLy
 26sgd+nvmBoYbdkwocDLChPSmof+hDgNvhAv/Ed2NPAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=W+5w9HsZU7/hL6m+u
 rnQzcrdAEYaocMSlZx+KMfYvGY=; b=OdAq4dSULPtJgLUSIGaBYnUYhTj22PCUD
 8PB/26k4nOzuqTiu/IqE7OOa7RebBqd5OEhkdtkq79q46GDGRsEIMZgMon7Ho1b3
 fM/aeUFDOU/PB/nrgVsINHKscegSq2ZP/exFupMxyNvXpJBjGRRXPkhFYmLDxv7K
 MWtYkWTZsECYZ8OS1KuColPETcdeb0OaGJ+HN1oKnxUm9bBdqGVb3u9aI5WfwiT8
 CC7oSc8wfJDNiyoCU+Sk/L52YONfYFdvTSRt/aHoaZiSlfHTJOQI8U3T+M2KkbOQ
 Ay60FET2urClF0vWsM+IfomaDoVCvoNVaxpOc0CJfBi0JB40G8KTg==
X-ME-Sender: <xms:qm0jYJA74TbXYJ4IQeGi9ymdjpCUC6NyxKdznHONjKibM8BXocaXqQ>
 <xme:qm0jYHjYH8oFMEcVDd6hFVrhHvwXhUmlJrwtOhP_gWBsnmkvx23tOVg2KyPwz8HCs
 q7-6ORNS3LCrbzExQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeigdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeelgeelfe
 dvffekgeevfeelveeftdeilefgudegkeeuhefhvefgffekuefgffekfeenucfkphepudej
 vddrudelfedrgeeirdehjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:qm0jYElTC0LoN0KjtcdGjRVwLQ0T_HdzSraZoDI1JNhaiutRhnevvw>
 <xmx:qm0jYDx41aWNgUStJUiwCsKSrKp1WCvYLPEfhNJaHDiaUpwE-b0_vA>
 <xmx:qm0jYOTdfYEGNKV_u5QIWq9QGoDq_zA55OIHynSK4C5wCoF2yqU5Fg>
 <xmx:q20jYH4wChUhCzrn203YqKVQMwO-zkOTNclptqMG-41irwx3f-ZbNg>
Received: from crackle.ozlabs.ibm.com.com (cpe-172-193-46-57.qld.foxtel.net.au
 [172.193.46.57])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3D0E1080059;
 Wed, 10 Feb 2021 00:22:49 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix L1D flushing tests for Power10
Date: Wed, 10 Feb 2021 15:22:42 +1000
Message-Id: <20210210052242.2862462-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.30.1
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
Cc: Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The rfi_flush and entry_flush selftests work by using the PM_LD_MISS_L1
perf event to count L1D misses.  The value of this event has changed
over time:

- Power7 uses 0x400f0
- Power8 and Power9 use both 0x400f0 and 0x3e054
- Power10 uses only 0x3e054

Update these selftests to use the value 0x3e054 on P10 and later,
fixing the tests from finding 0 events.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 tools/testing/selftests/powerpc/security/entry_flush.c | 4 +++-
 tools/testing/selftests/powerpc/security/flush_utils.c | 9 +++++++++
 tools/testing/selftests/powerpc/security/flush_utils.h | 9 ++++++++-
 tools/testing/selftests/powerpc/security/rfi_flush.c   | 4 +++-
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
index 78cf914fa321..ffcc93be7df1 100644
--- a/tools/testing/selftests/powerpc/security/entry_flush.c
+++ b/tools/testing/selftests/powerpc/security/entry_flush.c
@@ -26,6 +26,7 @@ int entry_flush_test(void)
 	__u64 l1d_misses_total = 0;
 	unsigned long iterations = 100000, zero_size = 24 * 1024;
 	unsigned long l1d_misses_expected;
+	unsigned long perf_l1d_miss_event;
 	int rfi_flush_orig;
 	int entry_flush, entry_flush_orig;
 
@@ -53,7 +54,8 @@ int entry_flush_test(void)
 
 	entry_flush = entry_flush_orig;
 
-	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	perf_l1d_miss_event = get_perf_l1d_miss_event();
+	fd = perf_event_open_counter(PERF_TYPE_RAW, perf_l1d_miss_event, -1);
 	FAIL_IF(fd < 0);
 
 	p = (char *)memalign(zero_size, CACHELINE_SIZE);
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.c b/tools/testing/selftests/powerpc/security/flush_utils.c
index 0c3c4c40c7fb..7a5ef1a7a228 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.c
+++ b/tools/testing/selftests/powerpc/security/flush_utils.c
@@ -68,3 +68,12 @@ void set_dscr(unsigned long val)
 
 	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
 }
+
+unsigned long get_perf_l1d_miss_event(void)
+{
+	bool is_p10_or_later = ((mfspr(SPRN_PVR) >>  16) & 0xFFFF) >= 0x80;
+
+	if (is_p10_or_later)
+		return PERF_L1D_MISS_P10;
+	return PERF_L1D_MISS_P7;
+}
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.h b/tools/testing/selftests/powerpc/security/flush_utils.h
index 07a5eb301466..c60d15f3eb4b 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.h
+++ b/tools/testing/selftests/powerpc/security/flush_utils.h
@@ -7,11 +7,18 @@
 #ifndef _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H
 #define _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H
 
-#define CACHELINE_SIZE 128
+#define CACHELINE_SIZE		128
+
+#define SPRN_PVR		287
+
+#define PERF_L1D_MISS_P7	0x400f0
+#define PERF_L1D_MISS_P10	0x3e054
 
 void syscall_loop(char *p, unsigned long iterations,
 		  unsigned long zero_size);
 
 void set_dscr(unsigned long val);
 
+unsigned long get_perf_l1d_miss_event(void);
+
 #endif /* _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H */
diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index 7565fd786640..edf67c91ef79 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -26,6 +26,7 @@ int rfi_flush_test(void)
 	__u64 l1d_misses_total = 0;
 	unsigned long iterations = 100000, zero_size = 24 * 1024;
 	unsigned long l1d_misses_expected;
+	unsigned long perf_l1d_miss_event;
 	int rfi_flush_orig, rfi_flush;
 	int have_entry_flush, entry_flush_orig;
 
@@ -54,7 +55,8 @@ int rfi_flush_test(void)
 
 	rfi_flush = rfi_flush_orig;
 
-	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	perf_l1d_miss_event = get_perf_l1d_miss_event();
+	fd = perf_event_open_counter(PERF_TYPE_RAW, perf_l1d_miss_event, -1);
 	FAIL_IF(fd < 0);
 
 	p = (char *)memalign(zero_size, CACHELINE_SIZE);
-- 
2.30.1

