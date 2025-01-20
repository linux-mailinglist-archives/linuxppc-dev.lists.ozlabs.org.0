Return-Path: <linuxppc-dev+bounces-5404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BDEA1706C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:44:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQ243l4z30FR;
	Tue, 21 Jan 2025 03:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391450;
	cv=none; b=ePe4uMDlRZB71I0dQhj9AJjofOlgtyRM0QCKEpMlXwhEBBpyaCt3/jXO/hg7W6k8d6Vhu5X+ERW+2lfje1l70IjXWAUwRqDI8ifXTci0Stdkn5g/HF4EZvn9QbnSL3SqEpOEbe6fclFTMmPEjdF4RcXiZxUqmfnwkcFGnoqMxqTcXuq5YyjABJDMnlrhty2mZGRyoZ59ZhWXgVyqn2wNLMPbPmAyXNd4K7hg8uMSlxnq6vwusW07BhF5STZJErH96QGlIbznwla/+ErXjkbtLXVnh7r8Je6VSfvEXPSu7w2d2Tj2jAfKln+zQ+2TtcOnaaLpwTv4i4MawZ+uRKuvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391450; c=relaxed/relaxed;
	bh=LID/oXGtXOpkBTARbpqdwbxhsAykSjQ0C3oAGHMZ9SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUNLso8pMk6kDK5bxam92cnT07cTfYx+m+wECwvcs07Ys96/+CI1bWduhqDN6UZSNtnLH4gmZKzj5Hf7Eqsyvq4uutvwB5DKe41AYAZIyCmGIYeK04/l4NnaQ3+BjSHv4g4KLajokdg7rkyQ7rRxoHyA5R46n1+TAHSLUvK66mtUlBBhWpLEkyuU02GLaZfiyCdQan4aiHnrmSWIQw/Gy0y/9pg8tQpBlyV59DiCchUuIn7sDsKYurcax4WjlXgCV/yvn9fUhK//yTlgCOL3cBko+6AfJgy6B3rVX53MzcpCtJKUczCHQAKa78KJzdgGT7/J+VwH8AjN42ebvK/52A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQ2196kz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDF701688;
	Mon, 20 Jan 2025 08:44:07 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEF843F5A1;
	Mon, 20 Jan 2025 08:43:35 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	joey.gouly@arm.com,
	andre.przywara@arm.com,
	Andrew Jones <drjones@redhat.com>
Subject: [kvm-unit-tests PATCH v2 02/18] Document environment variables
Date: Mon, 20 Jan 2025 16:43:00 +0000
Message-ID: <20250120164316.31473-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
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

Document the environment variables that influence how a test is executed
by the run_tests.sh test runner.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 docs/unittests.txt |  5 ++++-
 run_tests.sh       | 12 +++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index c4269f6230c8..dbc2c11e3b59 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -88,7 +88,8 @@ timeout
 -------
 timeout = <duration>
 
-Optional timeout in seconds, after which the test will be killed and fail.
+Optional timeout in seconds, after which the test will be killed and fail. Can
+be overwritten with the TIMEOUT=<duration> environment variable.
 
 check
 -----
@@ -99,3 +100,5 @@ can contain multiple files to check separated by a space, but each check
 parameter needs to be of the form <path>=<value>
 
 The path and value cannot contain space, =, or shell wildcard characters.
+
+Can be overwritten with the CHECK environment variable with the same syntax.
diff --git a/run_tests.sh b/run_tests.sh
index f30b6dbd131c..23d81b2caaa1 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
     -l, --list          Only output all tests list
         --probe-maxsmp  Update the maximum number of VCPUs supported by host
 
-Set the environment variable QEMU=/path/to/qemu-system-ARCH to
-specify the appropriate qemu binary for ARCH-run.
-
+The following environment variables are used:
+
+    QEMU            Path to QEMU binary for ARCH-run
+    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
+    ACCEL_PROPS     Extra argument to ACCEL
+    MACHINE         QEMU machine type
+    TIMEOUT         Timeout duration for the timeout(1) command
+    CHECK           Overwrites the 'check' unit test parameter (see
+                    docs/unittests.txt)
 EOF
 }
 
-- 
2.47.1


