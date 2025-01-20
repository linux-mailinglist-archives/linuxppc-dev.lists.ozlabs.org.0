Return-Path: <linuxppc-dev+bounces-5407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E1A17076
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:44:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQb16WBz30N8;
	Tue, 21 Jan 2025 03:44:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391479;
	cv=none; b=kCfQqWmY0DvOnskS8bbGvfcenIey3zpnGTl82O3SgsQe85BS5VhSzvhSaxPemM8I+hxFwEDBE2nAMv/hRhYZsCyn5VIQsEA4G3WIPRa7Q3VZN28uPevqYm8N5yBs6FGx9tzURvfTRaDRN/J72Xv6dJg2BwQI2Le2z3wePJrJ9EyamaAoJRNNxiQMkDB+ppdMBu9RBn/cSAE7ONw/YQf0+YlG10bz4Vty87veYrs9BH88DJfiDzbcomJUbGnGCB+I6auvxE8mI+aN0LI3J2jG6WmDdpLgFlhpQI5LK6H22x5WsRR1zH814k6ZuF/bZh8Ujz2D/7J+ssdaydR2igu5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391479; c=relaxed/relaxed;
	bh=twvInRqGevS2fFLPSQniIyTY4cEjWqFPSmHIIf+7Pes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8dIuLH1T4VKLnf2bL3ZDZARUW/52zi3vT+jfiRCMIsAN+wRZjAAWqUm1ncWiauoN6dyJlSsgG+cPEC3idwePfHTxtAHj0c6kuj11EcCbfgSqUGgvopUwBaANdVb7wy+78roZFqTuzcyEFhBRMus7md6IRvFgQqBqAB3uUfs+nkQeukXnRUqY37mOCl/EZ6IaJ0EFLI9vsypWbdJghqco04u/7gxNephqF2x1Aks4aT06BsWH4GbqUpyAUH9OJv+fMVaucW6QgCmOnLEqqACs8go0ZyWOQUdlS2Fm2rYsGnisbYfTMjOKnpTJmJnkd7ZdlH5oS+EIgAVKXfPhrxaDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQZ3wRmz30Ds
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C18EE1CC4;
	Mon, 20 Jan 2025 08:44:21 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9F03F5A1;
	Mon, 20 Jan 2025 08:43:50 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 06/18] scripts: Merge the qemu parameter -smp into $qemu_opts
Date: Mon, 20 Jan 2025 16:43:04 +0000
Message-ID: <20250120164316.31473-7-alexandru.elisei@arm.com>
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

kvmtool has a different command line parameter to specify the number of
VCPUs (-c/--cpus). To make it easier to accommodate it, merge the qemu
specific parameter -smp into $qemu_opts when passing it to the
$RUNTIME_arch_run script.

This is safe to do because the $RUNTIME_arch_run script, on all
architectures, passes the parameters right back to run_qemu() et co, and
do not treat individual parameters separately.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index e5d661684ceb..a89f2d10ab78 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -34,7 +34,8 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $qemu_opts"
+
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $qemu_opts"
 }
 
 skip_nodefault()
@@ -87,6 +88,8 @@ function run()
     local accel="$9"
     local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
 
+    qemu_opts="-smp $smp $qemu_opts"
+
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
     fi
-- 
2.47.1


