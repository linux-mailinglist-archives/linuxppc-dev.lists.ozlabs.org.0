Return-Path: <linuxppc-dev+bounces-2652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0169B3B4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 21:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XclF34HCcz2yRD;
	Tue, 29 Oct 2024 07:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730106518;
	cv=none; b=oV2qSpzE2u65FTmELQS9KMAtBv8Xnvp2DNlLZme3QDBXG9F2rMCV7vAo2IirYP5DtX301AIxPPtswnH16nRdTPO3fP7OYLfBtmyXq0u/TSwdmaRV+QXTt2qX5a29f3a9z01yd/QHB8+GsnEf66+1Q5AJI866s1DHFS+xIkdnrNdOREZ/P00yICXRbIck+TytY1hx2fiHq2eus9IF8iucbpHHxjpq4UjFBAgWE/YBV1uYVnf7ki7n/oyVhLgH+bcHMdQBDf79PYdYdkpjtaYoLRMyO8CyxbC44r35PeeDYOsR5r06jDxHGKrFdMLpVVjdlgIR/hRa4uzvGU7w6xZBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730106518; c=relaxed/relaxed;
	bh=F9roz6HQF+lIsQlkmm0pxaVU+mgaxDWbARfpHo5ZXLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jdaMb/L+skehfO8h8e6iHvSh2wsG4YljNtBN5oXuGUEJn8YLvW9zTm+owydvy2aeoYEXKi6QUdTNwUq8iCEYVWx5TABTWTPH34xPISUJMkqtkusQFAZ8CwBf37zK+xyVBliyw4x5SGAqXpM1PRItz6eODWPvoN9mwD64sT99sqJA5Bwum5dPtoeRpmSCKwXLO15VRSnpy0kinl/94er1w4dXWKOHPejzcdJDl2YkElLN5Q4jUMVLgB7jhnaXi6VBaP8JvkUs8y2Y5jK1x1j++seho7UKe3zOWj3z+y7whRtp4TlSTZuCo9+FeC7dcUw/8lEOF5hLaIOEwGhiCPcWrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcSHB08Fxz2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 20:08:37 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B32A0497;
	Mon, 28 Oct 2024 02:08:36 -0700 (PDT)
Received: from udebian.localdomain (unknown [10.57.58.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B03563F66E;
	Mon, 28 Oct 2024 02:08:05 -0700 (PDT)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [PATCH v3 3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
Date: Mon, 28 Oct 2024 09:07:15 +0000
Message-Id: <20241028090715.509527-4-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028090715.509527-1-yury.khrustalev@arm.com>
References: <20241028090715.509527-1-yury.khrustalev@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Replace literal 0 with macro PKEY_UNRESTRICTED where pkey_*() functions
are used in mm selftests for memory protection keys for ppc target.

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>

---
Note that I couldn't build these tests so I would appreciate if someone
could check this patch. Thank you!

---
 tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 51729d9a7111..430cb4bd7472 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -85,7 +85,7 @@ int pkeys_unsupported(void)
 	SKIP_IF(!hash_mmu);
 
 	/* Check if the system call is supported */
-	pkey = sys_pkey_alloc(0, 0);
+	pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	SKIP_IF(pkey < 0);
 	sys_pkey_free(pkey);
 
diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 0af4f02669a1..29b91b7456eb 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -72,7 +72,7 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 
 		switch (fault_type) {
 		case PKEY_DISABLE_ACCESS:
-			pkey_set_rights(fault_pkey, 0);
+			pkey_set_rights(fault_pkey, PKEY_UNRESTRICTED);
 			break;
 		case PKEY_DISABLE_EXECUTE:
 			/*
diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
index 2db76e56d4cb..e89a164c686b 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
@@ -83,7 +83,7 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 	    mprotect(pgstart, pgsize, PROT_EXEC))
 		_exit(1);
 	else
-		pkey_set_rights(pkey, 0);
+		pkey_set_rights(pkey, PKEY_UNRESTRICTED);
 
 	fault_count++;
 }
diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index f6da4cb30cd6..64c985445cb7 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -124,16 +124,16 @@ static int child(struct shared_info *info)
 	/* Get some pkeys so that we can change their bits in the AMR. */
 	pkey1 = sys_pkey_alloc(0, PKEY_DISABLE_EXECUTE);
 	if (pkey1 < 0) {
-		pkey1 = sys_pkey_alloc(0, 0);
+		pkey1 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 		FAIL_IF(pkey1 < 0);
 
 		disable_execute = false;
 	}
 
-	pkey2 = sys_pkey_alloc(0, 0);
+	pkey2 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	FAIL_IF(pkey2 < 0);
 
-	pkey3 = sys_pkey_alloc(0, 0);
+	pkey3 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	FAIL_IF(pkey3 < 0);
 
 	info->amr |= 3ul << pkeyshift(pkey1) | 2ul << pkeyshift(pkey2);
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index d89474377f11..37794f82ed66 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -81,16 +81,16 @@ static int child(struct shared_info *info)
 	/* Get some pkeys so that we can change their bits in the AMR. */
 	pkey1 = sys_pkey_alloc(0, PKEY_DISABLE_EXECUTE);
 	if (pkey1 < 0) {
-		pkey1 = sys_pkey_alloc(0, 0);
+		pkey1 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 		CHILD_FAIL_IF(pkey1 < 0, &info->child_sync);
 
 		disable_execute = false;
 	}
 
-	pkey2 = sys_pkey_alloc(0, 0);
+	pkey2 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	CHILD_FAIL_IF(pkey2 < 0, &info->child_sync);
 
-	pkey3 = sys_pkey_alloc(0, 0);
+	pkey3 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	CHILD_FAIL_IF(pkey3 < 0, &info->child_sync);
 
 	info->amr1 |= 3ul << pkeyshift(pkey1);
-- 
2.39.5


