Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCC189584
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 07:02:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hzvY4GDlzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:02:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hzt04BP1zDqnW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 17:00:39 +1100 (AEDT)
Received: from mail-pj1-f71.google.com ([209.85.216.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1jERkp-0004y4-G7
 for linuxppc-dev@lists.ozlabs.org; Wed, 18 Mar 2020 06:00:35 +0000
Received: by mail-pj1-f71.google.com with SMTP id f94so1352308pjg.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 23:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b0/tNNqegNvmzJPE8xlSwvL87jSpyw10AJbcYVQwQMg=;
 b=Kr9a/JdH+hqajbvDbhE6XfizEK0OkBMTsIGlUn67rsYBBDOlapeIBs/kqtC10iFtTk
 a9Q6ABWISVPkXj2vQPcbATOjGfoWx8Q8evJW5ZcQDaufJuDljy5jpGk5M9mBDqxtPX78
 Y9/nq3VjXw7pwSx3frhMsCVWqfNQLNFl3/WKtEne77q1Ra9IGZy4za99PSMSVB0tAiPf
 e60nRwne1riVkRgbO6jwcVuC7CM0CVw/hjL9uJ7dRzAMlM6voOxghxwZbCFgSs68VgsK
 i74MF8A/Q8RuBFwRqSY0fHcjUv3k9phuCWEF9ncZSHsfWp6jqTOxoR6LZevkbEPHaaJS
 Fz8A==
X-Gm-Message-State: ANhLgQ2F1eR7rp7rf+Rqv4k/zQeYDS84fw9SEWTHfzeJUXh3PYKovrYL
 BTs/ZNHaZOJ/xRJo2sNkgc47kaYPSrQtXUgeC3AjECEN37v/efevqL9E/G2Vu8VEnrpoie9rGsf
 p2Lp3+zNui+s6K6/MzaKpAMFWd/SgPCgAyVXRUl2BVg==
X-Received: by 2002:a17:902:b088:: with SMTP id
 p8mr2341855plr.106.1584511233912; 
 Tue, 17 Mar 2020 23:00:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvvVGczB2g1SGGZP1BmZR4xDWO4bLplF3TV1wHlLRgWCjvk6SPk4YN9+wtndPUrGsBimOgK+w==
X-Received: by 2002:a17:902:b088:: with SMTP id
 p8mr2341818plr.106.1584511233560; 
 Tue, 17 Mar 2020 23:00:33 -0700 (PDT)
Received: from localhost.localdomain (114-136-162-243.emome-ip.hinet.net.
 [114.136.162.243])
 by smtp.gmail.com with ESMTPSA id 5sm5081619pfw.98.2020.03.17.23.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 23:00:32 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: linux-kselftest@vger.kernel.org
Subject: [PATCHv2] selftests/powerpc: Turn off timeout setting for benchmarks,
 dscr, signal, tm
Date: Wed, 18 Mar 2020 14:00:04 +0800
Message-Id: <20200318060004.10685-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
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
seconds that added in commit 852c8cbf34d3 ("selftests/kselftest/runner.sh:
Add 45 second timeout per test") to run, the following test result was
collected across 2 Power8 nodes and 1 Power9 node in our pool:
  powerpc/benchmarks/futex_bench - 52s
  powerpc/dscr/dscr_sysfs_test - 116s
  powerpc/signal/signal_fuzzer - 88s
  powerpc/tm/tm_unavailable_test - 168s
  powerpc/tm/tm-poison - 240s

Thus they will fail with TIMEOUT error. Disable the timeout setting
for these sub-tests to allow them finish properly.

https://bugs.launchpad.net/bugs/1864642
Fixes: 852c8cbf34d3 ("selftests/kselftest/runner.sh: Add 45 second timeout per test")
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
