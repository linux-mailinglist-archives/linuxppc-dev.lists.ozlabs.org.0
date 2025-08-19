Return-Path: <linuxppc-dev+bounces-11156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB7FB2CF87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 00:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c64Zf1HHfz2xcD;
	Wed, 20 Aug 2025 08:51:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755606822;
	cv=none; b=Af91RtIXKDxH/fORu4oKRtO0HDBdCp7Fx4dLUwh4GthITedFmroJRqxkSjl9lKGkgtcq4RdYnjcvSf28vse68dawZf6qVShOlQcpZNgqpNTBnPGtLUxXRWz6NHibGn8mTTbN9WIQLZFnhgo2l+fxRfAmTLOjP1iIThANSfaVgrGpHY+r99JFNKoWpxa3DJyW76Lo2zNs0hHwIC8g+DskSYORrPiTPN+/RRDQgAI5rSHFFD0pbEJEmjm2Bz8y7Wc46ss6BVkYfXqYXfYcV6fqjXF8FZYGt1Y9dQWTGezLayT1FbuELpXpWv4hVWSr9WuQe8e7zHXOuYpUEuKFUnNq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755606822; c=relaxed/relaxed;
	bh=1NTraUDhkyJj/nkQEAY36vAk9FsJbBrZQ6MRp6OEOMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCPElbZwXt2HtKCKXm23aMMVovytyGToPvPaMYndxosbsNRjvL2k1kDhAyEWTnLnhSrgby4s7o76vSVsMnbPl8PXBntnqZwBbP7Wq2fbxVSK8t1co2ZZ5zMJb2vd9+GjqraOAIOEjKOAvxzpZxlc5qmGXCZq7dd37qWLHM8QGBqTlSNZnKCAIjZJnz2pnK92VfQIwOLDZTx3ia8YEo2GLRNp0ecH1cUZnw3cIe0zaS6oUcMnD2myZ0knbTshDgWuWpmAG+dsHLCogxUcqpANxNAKFRYgC5x5jWV+zRoixOC1e8eJ+4BOo+CdWVDvgtLRmKFH2c/m6Z4gwNe6sPoj9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Udq91UCX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=rakuram.e96@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Udq91UCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=rakuram.e96@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5psd216Hz3d1B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 22:33:40 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24458317464so58171085ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755606817; x=1756211617; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1NTraUDhkyJj/nkQEAY36vAk9FsJbBrZQ6MRp6OEOMw=;
        b=Udq91UCXDwvhSm9zkqheqg9g9MrnlL4SxFdtGUVp8514wFIIPK0iqQsGftcN/gaI4G
         GkU7yEEpI54Lyl8Ep6l5vTn5xjnLJ/+gJ+VY4EgZ21pmfvpNMz6ciIIXnw670Z9yltpO
         mhVNAlgXKjdMqgR8NTLS0WftTXgCpfZmhaqHlZTX5k9oSUdhwMwQV8sn+bo6qb/ff/Dc
         3WosuPdeVBheghh0G52ZgtJ97fD+Q0TEdIMFG9ymwnfQk1r1IP6YZnImtDUuBowUlpDH
         pEsT3v8ULp15UEWDKg5vBbHiYbc+3oYNKJb0aEkq3bCZbY/JweC7fqGGCJFcxwYpUK5+
         4g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606817; x=1756211617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NTraUDhkyJj/nkQEAY36vAk9FsJbBrZQ6MRp6OEOMw=;
        b=pCv4zzP9YU9D/3nEnoNVUUw1YfJmK0ayPQAFyEX/NGDoa/L69Ypr/CwHoulmg3I1wg
         FyHA7slHOaLoZd+9uxxaWnQlwfbIu+QH5AOlY4JnMexlYbYrZeMMxI34hLFe6OjqkXpm
         WVpLOa4vpcFCCg+n4ZHRxSC0pmVV3jzW2wqBP0Jl68E3Vg5XWCX2Y22YG71RrsTMosvR
         rQdYCM2mquwhx1czX8oDgqhcoEdrWeEN7aFdzwI4bS2mh/QN8VVUIQR8JZIoigHGXrml
         3UCMlJhWALHFgN7GLdYa+BzjcrxM00JDYAn/MpZ7gQFRbIrNtZuIM2ZDLmPw/6rT8RZZ
         f43g==
X-Forwarded-Encrypted: i=1; AJvYcCUqM4BX7aWehjyqbapWoEifRhPyd6BsuaC+Ze/r26Vylaehae/o0t7EbwtGzfWfYSymYpYZlT//4Iiq1Xo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yynts5EvgktMLYJrZ9WKh7QVEsUCOdiSScEnKscQzYRWiS0bCqD
	dUMKM3qZUPbFqqTYrwdCFYPRJRUgRbYkaaM1CsEbskVSoQkD7HMuuXtR
X-Gm-Gg: ASbGncv8z623p3LDc8JcwgI1aanRwysmCtj/wmqyv4o51OkYuG2yc1///ZEYi2DBMac
	Aoq5UG13WL/BVZIUCz2Gm+n8n177j0+bxQSch694p9lfbnY0cqB5XxYA6pXis0h6Q5Fv3kUxOh9
	TDFFF/0PLQbnctoWCARdjPJX5a+lUcpNrDZW7swf93e6da2/bDXK8BBsXZjJUFqZr318gga4A42
	dw7P0cDM08/SVO7X5DEUdQmEn09ddspYAos3iohD3JrghuY9R4T4a32HcdVuvWw2yo/NWih5dWX
	CEjzJ6YvJ/DqfOUzryI0VwkpUSJQGp+UjIcmV6Ff0v2SWKwZwAviVlE6HciAnZlwMXb99rCjaPt
	Vt4l+NnSXSXeRksGcLx2txcMTzna8Jho=
X-Google-Smtp-Source: AGHT+IEXaqcZCFwVyWzf3fBFdyAYI0sebebias2NvND61h1LRj8yB2jNSmL/MraH8e8UtRwT+WiV6A==
X-Received: by 2002:a17:902:ce81:b0:234:d431:ec6e with SMTP id d9443c01a7336-245e04346e4mr25629865ad.3.1755606816970;
        Tue, 19 Aug 2025 05:33:36 -0700 (PDT)
Received: from lkmp.. ([157.51.92.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ef6dsm108012945ad.10.2025.08.19.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:33:36 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: mpe@ellerman.id.au,
	skhan@linuxfoundation.org,
	maddy@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	npiggin@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	rakuram.e96@gmail.com
Subject: [PATCH] selftests/powerpc: fix typos in tm
Date: Tue, 19 Aug 2025 18:03:24 +0530
Message-ID: <20250819123326.7025-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fixed multiple typos in powerpc/tm reported by Codespell

Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-signal-msr-resv.c | 2 +-
 tools/testing/selftests/powerpc/tm/tm-signal-stack.c    | 4 ++--
 tools/testing/selftests/powerpc/tm/tm-sigreturn.c       | 2 +-
 tools/testing/selftests/powerpc/tm/tm-tar.c             | 2 +-
 tools/testing/selftests/powerpc/tm/tm-tmspr.c           | 2 +-
 tools/testing/selftests/powerpc/tm/tm-trap.c            | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-msr-resv.c b/tools/testing/selftests/powerpc/tm/tm-signal-msr-resv.c
index 4a61e9bd12b4..8aee18819603 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-msr-resv.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-msr-resv.c
@@ -42,7 +42,7 @@ void signal_usr1(int signum, siginfo_t *info, void *uc)
 #else
 	ucp->uc_mcontext.uc_regs->gregs[PT_MSR] |= (7ULL);
 #endif
-	/* Should segv on return becuase of invalid context */
+	/* Should segv on return because of invalid context */
 	segv_expected = 1;
 }
 
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
index 68807aac8dd3..e793b5d97c48 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
@@ -2,7 +2,7 @@
 /*
  * Copyright 2015, Michael Neuling, IBM Corp.
  *
- * Test the kernel's signal delievery code to ensure that we don't
+ * Test the kernel's signal delivery code to ensure that we don't
  * trelaim twice in the kernel signal delivery code.  This can happen
  * if we trigger a signal when in a transaction and the stack pointer
  * is bogus.
@@ -52,7 +52,7 @@ int tm_signal_stack()
 
 	/*
 	 * The flow here is:
-	 * 1) register a signal handler (so signal delievery occurs)
+	 * 1) register a signal handler (so signal delivery occurs)
 	 * 2) make stack pointer (r1) = NULL
 	 * 3) start transaction
 	 * 4) cause segv
diff --git a/tools/testing/selftests/powerpc/tm/tm-sigreturn.c b/tools/testing/selftests/powerpc/tm/tm-sigreturn.c
index ffe4e5515f33..4dfb25409393 100644
--- a/tools/testing/selftests/powerpc/tm/tm-sigreturn.c
+++ b/tools/testing/selftests/powerpc/tm/tm-sigreturn.c
@@ -5,7 +5,7 @@
  *
  * Test the kernel's signal returning code to check reclaim is done if the
  * sigreturn() is called while in a transaction (suspended since active is
- * already dropped trough the system call path).
+ * already dropped through the system call path).
  *
  * The kernel must discard the transaction when entering sigreturn, since
  * restoring the potential TM SPRS from the signal frame is requiring to not be
diff --git a/tools/testing/selftests/powerpc/tm/tm-tar.c b/tools/testing/selftests/powerpc/tm/tm-tar.c
index f2a9137f3c1e..ea420caa3961 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tar.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tar.c
@@ -50,7 +50,7 @@ int test_tar(void)
 			"bne	2b;"
 			"tend.;"
 
-			/* Transaction sucess! TAR should be 3 */
+			/* Transaction success! TAR should be 3 */
 			"mfspr  7, %[tar];"
 			"ori	%[res], 7, 4;"  // res = 3|4 = 7
 			"b	4f;"
diff --git a/tools/testing/selftests/powerpc/tm/tm-tmspr.c b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
index dd5ddffa28b7..e2c3ae7c9035 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tmspr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
@@ -9,7 +9,7 @@
  * - TFIAR  - stores address of location of transaction failure
  * - TFHAR  - stores address of software failure handler (if transaction
  *   fails)
- * - TEXASR - lots of info about the transacion(s)
+ * - TEXASR - lots of info about the transaction(s)
  *
  * (1) create more threads than cpus
  * (2) in each thread:
diff --git a/tools/testing/selftests/powerpc/tm/tm-trap.c b/tools/testing/selftests/powerpc/tm/tm-trap.c
index 97cb74768e30..99acb7c78403 100644
--- a/tools/testing/selftests/powerpc/tm/tm-trap.c
+++ b/tools/testing/selftests/powerpc/tm/tm-trap.c
@@ -91,9 +91,9 @@ void trap_signal_handler(int signo, siginfo_t *si, void *uc)
 			 * LE endianness does in effect nothing, instruction (2)
 			 * is then executed again as 'trap', generating a second
 			 * trap event (note that in that case 'trap' is caught
-			 * not in transacional mode). On te other hand, if after
+			 * not in transactional mode). On the other hand, if after
 			 * the return from the signal handler the endianness in-
-			 * advertently flipped, instruction (1) is tread as a
+			 * advertently flipped, instruction (1) is thread as a
 			 * branch instruction, i.e. b .+8, hence instruction (3)
 			 * and (4) are executed (tbegin.; trap;) and we get sim-
 			 * ilaly on the trap signal handler, but now in TM mode.
-- 
2.43.0


