Return-Path: <linuxppc-dev+bounces-5403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB972A17067
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGPz62Csz300g;
	Tue, 21 Jan 2025 03:44:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391447;
	cv=none; b=GAKMHcAAvtNzYmum9vD1w3M/f2TOUL2TLIOvnHEezl4Fg80NweXvCHa0Lzw6zBbpBQ6gkkgdIGSN39vfmy/rirwz5b+Kvd6TL7ZUXd+2zAVroNWQkceGWi3N8qlHj5HUTL1pqVK9xvoXzPaG3zsR5yglrIfx+b64uXJt8qxWUlmEpDWHX/x0nJcFyT/rJrELACiWavEAIX9jlgi22mh9hC0tJMoLkDZQxyq8xsVn5x1YOVGa+pgI40O0Ckee+BCECsAMI7xdMoBwtJ/aU1TTr04Wly1o/QHi1e/ellGwMin9+6dh2zdACFwpKRyxJJvHRAa/Zzqb/C/XmqEA+yBOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391447; c=relaxed/relaxed;
	bh=kZ0oUvVPU4mYJxi3HehQyhYbS/vGealiJ7roYkMAFp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOhLguGrdJAWvNNnSq1/qinDb2LAmvig1S0duGGeOywvdtMTMWe7D9SobQpO7lqMzX0g6RA8i0w+atts5MNNRLfJlBlXzBIO2jQ1v3kgtCWVIXQTlPe6B71ObVQm5mNQ9E69ITmEh1s4/zkwawsw2ilBhsj09a9tC6Rt5QLYOWG5joDNIbK3KkL661wN3xj1AjchoMc9EWm5wnd7IB/1Ias7OfS/hxd9zZysoXmRB9Zb++/GzsgX7RSgzu9Hdzki951vlHT+i0Ocqls4XHkk5t2g0lUlK5sbhle44tdcekcU6t/ACe86Mpp+sQk3bW1172yCyfeIC3EF/gKpekoQRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGPy6Jlpz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22C0E1063;
	Mon, 20 Jan 2025 08:44:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D2A93F5A1;
	Mon, 20 Jan 2025 08:43:32 -0800 (PST)
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
	andre.przywara@arm.com
Subject: [kvm-unit-tests PATCH v2 01/18] run_tests: Document --probe-maxsmp argument
Date: Mon, 20 Jan 2025 16:42:59 +0000
Message-ID: <20250120164316.31473-2-alexandru.elisei@arm.com>
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

Commit 5dd20ec76ea63 ("runtime: Update MAX_SMP probe") added the
--probe-maxmp argument, but the help message for run_tests.sh wasn't
updated. Document --probe-maxsmp.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 152323ffc8a2..f30b6dbd131c 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -17,14 +17,15 @@ cat <<EOF
 
 Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
 
-    -h, --help      Output this help text
-    -v, --verbose   Enables verbose mode
-    -a, --all       Run all tests, including those flagged as 'nodefault'
-                    and those guarded by errata.
-    -g, --group     Only execute tests in the given group
-    -j, --parallel  Execute tests in parallel
-    -t, --tap13     Output test results in TAP format
-    -l, --list      Only output all tests list
+    -h, --help          Output this help text
+    -v, --verbose       Enables verbose mode
+    -a, --all           Run all tests, including those flagged as 'nodefault'
+                        and those guarded by errata.
+    -g, --group         Only execute tests in the given group
+    -j, --parallel      Execute tests in parallel
+    -t, --tap13         Output test results in TAP format
+    -l, --list          Only output all tests list
+        --probe-maxsmp  Update the maximum number of VCPUs supported by host
 
 Set the environment variable QEMU=/path/to/qemu-system-ARCH to
 specify the appropriate qemu binary for ARCH-run.
-- 
2.47.1


