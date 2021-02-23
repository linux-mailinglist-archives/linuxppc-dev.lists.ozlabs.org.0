Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD56D32262D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 08:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl9Fs3gfBz3cLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 18:11:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=hptsUtsz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l0Hgz7PP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=hptsUtsz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=l0Hgz7PP; 
 dkim-atps=neutral
X-Greylist: delayed 490 seconds by postgrey-1.36 at boromir;
 Tue, 23 Feb 2021 18:11:04 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl9FN2lWJz30N7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 18:11:04 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 5BB6CE07;
 Tue, 23 Feb 2021 02:02:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 23 Feb 2021 02:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=vJd0FJ/3sS5tFz9cqfc167wISR
 CmiNfHLC9aLREjXUM=; b=hptsUtszZBkWIT+IlDXiDEsbZL5itI3jckGB/CWIMG
 MMVOfi+pXuDDI3CSZcnYHJFM2KHA88foOstdZFd7lRqQgmtyxdPvdHIT4GaIgwB6
 MpnlLplqute6ukrnDEmqQoi5FdV+2flEUzkBAaNFFlhvjhvOvVu+ZOlac8NDqDoX
 yaCI7yf6aIrZer5TkfRxON50VHebhWtuQU05UjXA0Jq3k8zSRYmrWt8NPub/ERNy
 GFhSLpLV4eB6MpuaLo27ynomRftN8Cvz+5Kj+QQcbpWSxtexY/fEmo7zqbtCdz4Q
 mpZiaa/kcrzAwfAUSH79ESb5EIwXxINPVNeyXFj763/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vJd0FJ/3sS5tFz9cq
 fc167wISRCmiNfHLC9aLREjXUM=; b=l0Hgz7PPeZS+VZjOD2lEXyqnHbjTVl4ut
 pT/MRLLXlJy3H/iJH5AP/6hBha4rItuopiPSvkluO0607Mix+wliWdoMov6cIgk/
 8BksvSx0tSHo3QKii1vhCxzv0CYP7eMddFhdlZgTVoBUaaoSccOEftp516+vwpEY
 2oakMZ+YkHmM3Y1cefVzPjdOgkzD2QOP0QXQHGu+zPPdRTxshdlTVzacYSKEr2OY
 1USlB/MzRExXrWwVC2LC/o2z8E9yaWgRi00j5QkNJvV1g1g+LQiRntBkASjP3AqI
 7gH6Ldi0LXxmsd33xuE1JTSSyPd3Evuxi1jBinv/St9EVCqUBEZPQ==
X-ME-Sender: <xms:mag0YG0BibXnjG5wFfXpSGdzXjw4M65PEw-g2IttU4nxwCsvBVAIfQ>
 <xme:mag0YJGlD4F2NJ0dp1f7h_teKpryCViJcVrj-k6yuKb6FKf3BtnNPF1SprUZ_uKN1
 iX29eVfSvtR36edWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeeggddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepleegle
 efvdffkeegveefleevfedtieelgfdugeekueehhfevgfffkeeugfffkeefnecukfhppedu
 jedvrdduleefrdegiedrheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:mag0YO4cdln-MyqDs9llOS3DjWKaWzX2jj_iCk7lVse53HGUpNizjw>
 <xmx:mag0YH2Rk4nCpHmkiVO0MmQkTnFywTQbCu7wf392wShnFLdRPOWPig>
 <xmx:mag0YJEEC-oOgiqfOEaEgSzbr09_rwr2n563NVPteyDeZjKOaga__w>
 <xmx:mqg0YMOp5AxKWZ-A-ULfKL5yA2k1dY8bIYfxRx6jZlfVAi4s_Wn40g>
Received: from crackle.ozlabs.ibm.com.com (cpe-172-193-46-57.qld.foxtel.net.au
 [172.193.46.57])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69B9B240057;
 Tue, 23 Feb 2021 02:02:48 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] selftests/powerpc: Fix L1D flushing tests for Power10
Date: Tue, 23 Feb 2021 17:02:27 +1000
Message-Id: <20210223070227.2916871-1-ruscur@russell.cc>
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

Rather than relying on raw values, configure perf to count L1D read
misses in the most explicit way available.

This fixes the selftests to work on systems without 0x400f0 as
PM_LD_MISS_L1, and should change no behaviour for systems that the tests
already worked on.

The only potential downside is that referring to a specific perf event
requires PMU support implemented in the kernel for that platform.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: Move away from raw events as suggested by mpe

 tools/testing/selftests/powerpc/security/entry_flush.c | 2 +-
 tools/testing/selftests/powerpc/security/flush_utils.h | 4 ++++
 tools/testing/selftests/powerpc/security/rfi_flush.c   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
index 78cf914fa321..68ce377b205e 100644
--- a/tools/testing/selftests/powerpc/security/entry_flush.c
+++ b/tools/testing/selftests/powerpc/security/entry_flush.c
@@ -53,7 +53,7 @@ int entry_flush_test(void)
 
 	entry_flush = entry_flush_orig;
 
-	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
 	FAIL_IF(fd < 0);
 
 	p = (char *)memalign(zero_size, CACHELINE_SIZE);
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.h b/tools/testing/selftests/powerpc/security/flush_utils.h
index 07a5eb301466..7a3d60292916 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.h
+++ b/tools/testing/selftests/powerpc/security/flush_utils.h
@@ -9,6 +9,10 @@
 
 #define CACHELINE_SIZE 128
 
+#define PERF_L1D_READ_MISS_CONFIG	((PERF_COUNT_HW_CACHE_L1D) | 		\
+					(PERF_COUNT_HW_CACHE_OP_READ << 8) |	\
+					(PERF_COUNT_HW_CACHE_RESULT_MISS << 16))
+
 void syscall_loop(char *p, unsigned long iterations,
 		  unsigned long zero_size);
 
diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index 7565fd786640..f73484a6470f 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -54,7 +54,7 @@ int rfi_flush_test(void)
 
 	rfi_flush = rfi_flush_orig;
 
-	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
 	FAIL_IF(fd < 0);
 
 	p = (char *)memalign(zero_size, CACHELINE_SIZE);
-- 
2.30.1

