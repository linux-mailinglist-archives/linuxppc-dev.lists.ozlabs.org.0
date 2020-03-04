Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965C179CE8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 01:41:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XsPT21Z8zDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 11:41:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=po-hsu.lin@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XZC02ptzzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 00:16:10 +1100 (AEDT)
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1j9Tsb-0007Ma-BF
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Mar 2020 13:16:05 +0000
Received: by mail-pl1-f199.google.com with SMTP id 102so950301pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 05:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FoiB6hzDhu7zhsE/qqdlngAwyG5TADZ8ljLTza6EBz0=;
 b=mQ9AqfTfZLnMza9Y4czB6Pk4YMnbYnuXVIOjN4azUa9zapg3ooHkyLzMO3CYWtikFf
 HdQrP/gubhQGFVqGRnhRRMSha53Tfh4ki6qIwfLrL14iT//pSIFP5A6F9+GCFhWuBxaR
 07NI/5w5CRLFT3QnKCiE4w3hvkjPNwV3wlAJEKyHDaad/cciJHiMNwWRWhYKUsw4bQBo
 M0WdcN0znL3MFHr5qsn5T8koqEs16m4aprGouAJ2ef809TkJwohpfW8ikrK61LvvYAtn
 x/O75PBiGWjPOA9lXslc9GSLWBSYBM7feBG/b5YUZPrgb0ysjnqzrzv/Xsxq/zg0Lf3m
 2lHQ==
X-Gm-Message-State: ANhLgQ3A2p44JncAsAXEhhVAr19tKdF3N5P8tIYd3H6WdrNSejwCtrE9
 dLA1xGNEHJhILpEuDTwd8xHTfOEraGv7MnbH1jith6JM85fkHgw3oQHSuU/IntE9Y7IibCAha5o
 NQIMT9zY1Zf7lAFr2wBDu0ovSrXUc8Vxk1ZyVgq5BVQ==
X-Received: by 2002:a17:902:d90f:: with SMTP id
 c15mr3056605plz.190.1583327763907; 
 Wed, 04 Mar 2020 05:16:03 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvK4uTGiKzjtuDXnV1Gfy92QDaS45ZMs1S30Dw1XFtBScjRpPMHg0ViyThdR/UnPOLJjZ/fzQ==
X-Received: by 2002:a17:902:d90f:: with SMTP id
 c15mr3056579plz.190.1583327763544; 
 Wed, 04 Mar 2020 05:16:03 -0800 (PST)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id a143sm3394286pfd.108.2020.03.04.05.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 05:16:02 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/powerpc: Turn off timeout setting for benchmarks,
 dscr, signal, tm
Date: Wed,  4 Mar 2020 21:15:53 +0800
Message-Id: <20200304131553.27582-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 05 Mar 2020 11:39:51 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some specific tests in powerpc can take longer than the default 45
seconds that added in commit 852c8cbf (selftests/kselftest/runner.sh:
Add 45 second timeout per test) to run, the following test result was
collected across 2 Power8 nodes and 1 Power9 node in our pool:
  powerpc/benchmarks/futex_bench - 52s
  powerpc/dscr/dscr_sysfs_test - 116s
  powerpc/signal/signal_fuzzer - 88s
  powerpc/tm/tm_unavailable_test - 168s
  powerpc/tm/tm-poison - 240s

Thus they will fail with TIMEOUT error. Disable the timeout setting
for these sub-tests to allow them finish properly.

https://bugs.launchpad.net/bugs/1864642
Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 tools/testing/selftests/powerpc/benchmarks/Makefile | 2 ++
 tools/testing/selftests/powerpc/benchmarks/settings | 1 +
 tools/testing/selftests/powerpc/dscr/Makefile       | 2 ++
 tools/testing/selftests/powerpc/dscr/settings       | 1 +
 tools/testing/selftests/powerpc/signal/Makefile     | 2 ++
 tools/testing/selftests/powerpc/signal/settings     | 1 +
 tools/testing/selftests/powerpc/tm/Makefile         | 2 ++
 tools/testing/selftests/powerpc/tm/settings         | 1 +
 8 files changed, 12 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/benchmarks/settings
 create mode 100644 tools/testing/selftests/powerpc/dscr/settings
 create mode 100644 tools/testing/selftests/powerpc/signal/settings
 create mode 100644 tools/testing/selftests/powerpc/tm/settings

diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
index d40300a..a32a6ab 100644
--- a/tools/testing/selftests/powerpc/benchmarks/Makefile
+++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
@@ -2,6 +2,8 @@
 TEST_GEN_PROGS := gettimeofday context_switch fork mmap_bench futex_bench null_syscall
 TEST_GEN_FILES := exec_target
 
+TEST_FILES := settings
+
 CFLAGS += -O2
 
 top_srcdir = ../../../../..
diff --git a/tools/testing/selftests/powerpc/benchmarks/settings b/tools/testing/selftests/powerpc/benchmarks/settings
new file mode 100644
index 0000000..e7b9417
--- /dev/null
+++ b/tools/testing/selftests/powerpc/benchmarks/settings
@@ -0,0 +1 @@
+timeout=0
diff --git a/tools/testing/selftests/powerpc/dscr/Makefile b/tools/testing/selftests/powerpc/dscr/Makefile
index 5df4763..cfa6eed 100644
--- a/tools/testing/selftests/powerpc/dscr/Makefile
+++ b/tools/testing/selftests/powerpc/dscr/Makefile
@@ -3,6 +3,8 @@ TEST_GEN_PROGS := dscr_default_test dscr_explicit_test dscr_user_test	\
 	      dscr_inherit_test dscr_inherit_exec_test dscr_sysfs_test	\
 	      dscr_sysfs_thread_test
 
+TEST_FILES := settings
+
 top_srcdir = ../../../../..
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/powerpc/dscr/settings b/tools/testing/selftests/powerpc/dscr/settings
new file mode 100644
index 0000000..e7b9417
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dscr/settings
@@ -0,0 +1 @@
+timeout=0
diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index 113838f..153fafc 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -5,6 +5,8 @@ CFLAGS += -maltivec
 $(OUTPUT)/signal_tm: CFLAGS += -mhtm
 $(OUTPUT)/sigfuz: CFLAGS += -pthread -m64
 
+TEST_FILES := settings
+
 top_srcdir = ../../../../..
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/powerpc/signal/settings b/tools/testing/selftests/powerpc/signal/settings
new file mode 100644
index 0000000..e7b9417
--- /dev/null
+++ b/tools/testing/selftests/powerpc/signal/settings
@@ -0,0 +1 @@
+timeout=0
diff --git a/tools/testing/selftests/powerpc/tm/Makefile b/tools/testing/selftests/powerpc/tm/Makefile
index b15a1a3..7b99d09 100644
--- a/tools/testing/selftests/powerpc/tm/Makefile
+++ b/tools/testing/selftests/powerpc/tm/Makefile
@@ -7,6 +7,8 @@ TEST_GEN_PROGS := tm-resched-dscr tm-syscall tm-signal-msr-resv tm-signal-stack
 	$(SIGNAL_CONTEXT_CHK_TESTS) tm-sigreturn tm-signal-sigreturn-nt \
 	tm-signal-context-force-tm tm-poison
 
+TEST_FILES := settings
+
 top_srcdir = ../../../../..
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/powerpc/tm/settings b/tools/testing/selftests/powerpc/tm/settings
new file mode 100644
index 0000000..e7b9417
--- /dev/null
+++ b/tools/testing/selftests/powerpc/tm/settings
@@ -0,0 +1 @@
+timeout=0
-- 
2.7.4

