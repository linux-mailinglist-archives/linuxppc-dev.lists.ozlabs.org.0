Return-Path: <linuxppc-dev+bounces-9767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30AAE88A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:49:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5pQ0rxMz30Vn;
	Thu, 26 Jun 2025 01:49:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866542;
	cv=none; b=iGyaHj+J/AsJpgFupHPx6omZN9j2koE1SQCWIOAsiMFZ3X3Ym2UwOt1h6txnZVhQRRLWnar87xSmq4Ylt6uofXgz3zme+5TCcaMAZFRC5gx8P3IlOJinGVYWYkMn6EnCa+DKa0+8mADgBQxQdFgf7FCG2l35a16kBuoiZoGkakDPRm20U3PaG53VMveTLSRAOXS5UQESmWv6fhsYOWfbpSftPeJTSnncNYPamYphAEZqkM+grCoyRgZRMeAK1HHAXh7+vbCkBXTiU/hTvDVZqKLhKR5GV4DSwh3mx4+pBkffP+dUaxzInN4Q6zTtQV8iEscYL8yopRxFVZKAAWWioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866542; c=relaxed/relaxed;
	bh=F2ABKK9MGOfepmyOLJp4desHleNkQJV7o8SD4Gkpxz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCaF/u1HxJ/uRWjyvKbxzqHQ4LsSLC9gK6sy6TzQb1z6ktpjv5DSwRKCJNaHpESNdR+SkqRUA8mIqVUs6aXlG2zPQUtcz7xsEoP/soM9s9ZL5QWkTiiipDP0mfG/RkVTFV6t+uSGSTzx+1yYxfssI74KjBAkStoed9kH3zSK0DkQnxv5hhZhGo7jW7mZI12tuTPGuMBi91Q8k44l/POCjYiI2UnvNeXB8OJb2a2waTVWV6WJ2o6YFpLG78yYI+yDsMewkjSq2dq3CfunWAZ9r96Q0WDVvOFpQPDdUd9wOzBnWpC58ozk8ytmCyiOAC91YSryXCegFzZgNWXOaAN87w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5pP4l2zz30T3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:01 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CDAF204C;
	Wed, 25 Jun 2025 08:48:12 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06FDE3F58B;
	Wed, 25 Jun 2025 08:48:25 -0700 (PDT)
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
	shahuang@redhat.com
Subject: [kvm-unit-tests PATCH v4 01/13] run_tests.sh: Document --probe-maxsmp argument
Date: Wed, 25 Jun 2025 16:48:01 +0100
Message-ID: <20250625154813.27254-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 5dd20ec76ea63 ("runtime: Update MAX_SMP probe") added the
--probe-maxmp argument, but the help message for run_tests.sh wasn't
updated. Document --probe-maxsmp.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
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
2.50.0


