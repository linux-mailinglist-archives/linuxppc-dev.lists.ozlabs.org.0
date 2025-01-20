Return-Path: <linuxppc-dev+bounces-5409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3559A1707C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQc2DFFz30ML;
	Tue, 21 Jan 2025 03:44:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391479;
	cv=none; b=NzVZGDVD4edftUxN1NxrcXc7SzHeedIyLrAaKPMMHt/bTBz+TbOMTx/80y/M9Bgz2r78EH/0XaXH5omZ5XYcgQPMUJfKFPmmHfJOsQdXA9r7afM5gTmlQXmFHV+jqd7w/Hq2Czm+3OuqFrFPuIM0ZwXkz5p7GCL2qQLOLhPsRYuqOTc/L+6b47R9AtsH+zR235oW96Gya3N6qYiWW3UzPksDX92+xz8rFLr0A1B45qibaI8sSGUeFAXipYs59Mt/hNlsKQV5V5VgLLcXJ4GXJT6ybt9Mgu1kMIe1+STvcpU+0VZGZffS4PaAy4pbhzxBowmtRZHf0H8uFBRcwP58/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391479; c=relaxed/relaxed;
	bh=XEP0x+T3zEryUVhk81xYdr9VZYx70SLaqUp0Sba2pYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AChutjqRw+plSxyD04l6z3vH5I+WXjfCecb6KCG2oVNLd/KkWR/u2J6pne+V7i1YHNRUfud5L/vLEF52LWMDbsiU+/QOp81uDHsk0N+MfK/4ydr+QBKJdlLIpXew+mAwPd8TUAOPJkjte9N36iMolEXMyEBqMSnfStl/grCM3L3SRABbSUwW3sfe+91mB+Fi4I6qH76d6rgYNrBblpBHv0azuFIVZPi8BUEfmV/bY/Y5yJYnR1J9Cg5FZ1bQHvMbmzv57bd5FjDiMFWnVegXwYSfqegEX01ZeUWCFqtq2VB9tZodot3gaYymMjYFReIt2ofZfOixhTKpBrx/wDkA4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQZ4CjHz30H7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 500531C0A;
	Mon, 20 Jan 2025 08:44:18 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C4353F5A1;
	Mon, 20 Jan 2025 08:43:46 -0800 (PST)
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
	Alexandru Elisei <alexandru.elisei@gmail.com>
Subject: [kvm-unit-tests PATCH v2 05/18] scripts: Rename run_qemu_status -> run_test_status
Date: Mon, 20 Jan 2025 16:43:03 +0000
Message-ID: <20250120164316.31473-6-alexandru.elisei@arm.com>
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

From: Alexandru Elisei <alexandru.elisei@gmail.com>

For the arm/arm64 architectures, kvm-unit-tests can also be run using the
kvmtool virtual machine manager. Rename run_qemu_status to run_test_status
to make it more generic, in preparation to add support for kvmtool.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/run               | 4 ++--
 powerpc/run           | 2 +-
 riscv/run             | 4 ++--
 s390x/run             | 2 +-
 scripts/arch-run.bash | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arm/run b/arm/run
index 6db32cf09c88..9b11feafffdd 100755
--- a/arm/run
+++ b/arm/run
@@ -85,9 +85,9 @@ command+=" -display none -serial stdio"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
 if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
+	ENVIRON_DEFAULT=n run_test_status $command "$@"
 elif [ "$EFI_USE_ACPI" = "y" ]; then
-	run_qemu_status $command -kernel "$@"
+	run_test_status $command -kernel "$@"
 else
 	run_qemu $command -kernel "$@"
 fi
diff --git a/powerpc/run b/powerpc/run
index 27abf1ef6a4d..9b5fbc1197ed 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -63,4 +63,4 @@ command="$(migration_cmd) $(timeout_cmd) $command"
 # to fixup the fixup below by parsing the true exit code from the output.
 # The second fixup is also a FIXME, because once we add chr-testdev
 # support for powerpc, we won't need the second fixup.
-run_qemu_status $command "$@"
+run_test_status $command "$@"
diff --git a/riscv/run b/riscv/run
index 73f2bf54dc32..2a846d361a4d 100755
--- a/riscv/run
+++ b/riscv/run
@@ -34,8 +34,8 @@ command+=" $mach $acc $firmware -cpu $processor "
 command="$(migration_cmd) $(timeout_cmd) $command"
 
 if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
+	ENVIRON_DEFAULT=n run_test_status $command "$@"
 else
 	# We return the exit code via stdout, not via the QEMU return code
-	run_qemu_status $command -kernel "$@"
+	run_test_status $command -kernel "$@"
 fi
diff --git a/s390x/run b/s390x/run
index 34552c2747d4..9ecfaf983a3d 100755
--- a/s390x/run
+++ b/s390x/run
@@ -47,4 +47,4 @@ command+=" -kernel"
 command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
 
 # We return the exit code via stdout, not via the QEMU return code
-run_qemu_status $command "$@"
+run_test_status $command "$@"
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 8643bab3b252..d6eaf0ee5f09 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -75,7 +75,7 @@ run_qemu ()
 	return $ret
 }
 
-run_qemu_status ()
+run_test_status ()
 {
 	local stdout ret
 
-- 
2.47.1


