Return-Path: <linuxppc-dev+bounces-8391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F24AAE42E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM43XDyz30Ff;
	Thu,  8 May 2025 01:14:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630864;
	cv=none; b=cHELLH9qKMU5v1acb/e060MKH73/LiqWOYSv79kXpe7gHj99WNVe48gDyrZ4LLz+YqDHs5la4GtrzWRRROK8MNX2pcrhQma2SmU3EhvgHZHSJKe+/ksD/wWUVVXzqPquSPie2xVbcOg2kQuOJp7VIZKXcPRYHZZEQBkEcEI+1ZCb4/Q1xLC10qtexi4m5Z4+qEAfdlaB4NICopFjU2NSazguqU0VzdCO7UNtD2eMk/MI2Pp50Dv1Gao45qEDHQjKe9XVd629PqSSnHhfYqAE7NaCxLT04wB9dJH0c5yXIjZ8pYtt1OzB9QcJ/JzKsy5QQfaUm9kuOHGEkNZt9lDe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630864; c=relaxed/relaxed;
	bh=hqh3cXz2xEzc0FqRs6bD1NMd8iOu3FvNucdMmkPnjaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Du6tsepTjyyjOd4pp88AOZ6EQQNM/qMAqDtq4kvBfRHPO6KNx83v5CFzTJR7Z5X4VNAU5FOy/t8Kv63qFAUgWD/uzQcynyA2u8VLcSLsswUuGpD2/I60SFNbc7z3qLVR4d97CkwcuY++13FUfeZMMKeWn9UTTi+APJ5Z/7IgaFWp92tD3kVG+XWb/mglJ1XXsQr9Vc9B6mL7pnTvmTDwouEkfXJ/ct8PrLJuIeoaDtVP5QsXvz+Is8+LxfXpJAZ9QGRg4uyMg8VrMO0a2yAVimf0FvyMakT5HnVF80bwUSOhAstG9prhyKKsU2H746DUCl3mkirIIwqDCGUbqJeLrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM16l7nz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:14:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE4422F8;
	Wed,  7 May 2025 08:14:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E07313F58B;
	Wed,  7 May 2025 08:14:06 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 16/16] scripts: Enable kvmtool
Date: Wed,  7 May 2025 16:12:56 +0100
Message-ID: <20250507151256.167769-17-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
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

Everything is in place to run the tests using kvmtool:

$ ./configure --target=kvmtool
$ make clean && make
$ KVMTOOL=<path/to/kvmtool> ./run_tests.sh

so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
because the runner will generate and pass the correct environment to
kvmtool.

Missing is support for EFI tests. That's because distros don't ship a
EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
an EFI app hasn't been tested to work with kvmtool.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 README.md        | 18 +++++++++++++++++-
 arm/efi/run      |  5 +++++
 configure        |  1 -
 scripts/vmm.bash |  2 +-
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index be07dc28a094..723ce04cd978 100644
--- a/README.md
+++ b/README.md
@@ -65,6 +65,9 @@ or:
 
 to run them all.
 
+All tests can be run using QEMU. On arm and arm64, tests can also be run using
+kvmtool.
+
 By default the runner script searches for a suitable QEMU binary in the system.
 To select a specific QEMU binary though, specify the QEMU=path/to/binary
 environment variable:
@@ -78,12 +81,25 @@ ACCEL=name environment variable:
 
 For running tests that involve migration from one QEMU instance to another
 you also need to have the "ncat" binary (from the nmap.org project) installed,
-otherwise the related tests will be skipped.
+otherwise the related tests will be skipped. kvmtool does not support migration.
+
+As for running a test with kvmtool, please configure kvm-unit-tests accordingly
+first:
+
+   ./configure --arch=arm64 --target=kvmtool
+
+then run the test(s) like with QEMU above.
+
+To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
+variable. kvmtool supports only kvm as the accelerator.
 
 ## Running the tests with UEFI
 
 Check [x86/efi/README.md](./x86/efi/README.md).
 
+On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
+tests under UEFI.
+
 # Tests configuration file
 
 The test case may need specific runtime configurations, for
diff --git a/arm/efi/run b/arm/efi/run
index 53d71297cc52..0843725ec360 100755
--- a/arm/efi/run
+++ b/arm/efi/run
@@ -15,6 +15,11 @@ source scripts/vmm.bash
 
 check_vmm_supported
 
+if [[ $TARGET = "kvmtool" ]]; then
+	echo "kvmtool does not support EFI tests."
+	exit 2
+fi
+
 if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
 	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
 elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
diff --git a/configure b/configure
index 8c4400db42bc..d5f9995172f8 100755
--- a/configure
+++ b/configure
@@ -392,7 +392,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
         : "${uart_early_addr:=0x9000000}"
     elif [ "$target" = "kvmtool" ]; then
         : "${uart_early_addr:=0x1000000}"
-        errata_force=1
     else
         echo "--target must be one of 'qemu' or 'kvmtool'!"
         usage
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index ef9819f4132c..4ae60c37a6e8 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -159,7 +159,7 @@ declare -A vmm_opts=(
 function check_vmm_supported()
 {
 	case "$TARGET" in
-	qemu)
+	qemu | kvmtool)
 		return 0
 		;;
 	*)
-- 
2.49.0


