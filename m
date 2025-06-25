Return-Path: <linuxppc-dev+bounces-9779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42DAE88C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qX3XcBz3brc;
	Thu, 26 Jun 2025 01:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866600;
	cv=none; b=GK8/fT8bWZXqjDDCMRlW0VpfAQVPuf7KRWCQxcKAFlhp92oCfT6FcsSLp3aES7tzKtY1v1B6DPSXIy+igaTsPiZsmpr1kPGnybUDEZF0v1je8HoYjiYF7iziXUnXEh9VyewEx8dABofa4gVJEaqJjEI9YCnWgTUeMGxKVALrJi34oyULKFFWPM0ByV0Cykd56ASGceaP8w+RE+b9Erfgjlt1MwZT+Z2xIiEVJoMjjn9m/W0iv642envPMTa0Wm1SZYOd8S/6tiDdwBmdwQF508PgJUA27/iQYyrMzcMNViThGXSeTYczIE+8GGZXCIdiWor3CWeqFiILwreRQ5K90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866600; c=relaxed/relaxed;
	bh=Nan1jUKmgSwxpFA5KENfKGknAcdYrNWHwQFeEL0MhLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoVNJzyc3tgftEZv4iy6Cy1sgMh7UUg6AmzLIcbm3LFct4d7dZcGgKOgkm8SGVDnwkgVnuulg49CYcj+GlzJkSFMDz5jMfpGRXMR41cmVnXheycn9rIprSdOvWht2NVlWUXakKeid38qG1kfVqwY6y4ZS60yc1DqoPJY+NGFtcG2vHZCseLvcGvholhX9vvRL+0zmhX/F+uTILcHWMWm2kgPEAKbMa0jn15GfD0SC4vBUEGFnmFT3sbSZtcliO0ym0QFKp58faJ91ig8Jptrl6ea24Newy5o+18gQnKWaw4/e0xiofYxNTXtWClrCxX2DIlzNcAy1E4WHquelt58hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qW3vqpz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 698912682;
	Wed, 25 Jun 2025 08:49:10 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3571D3F58B;
	Wed, 25 Jun 2025 08:49:24 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 13/13] scripts: Enable kvmtool
Date: Wed, 25 Jun 2025 16:48:13 +0100
Message-ID: <20250625154813.27254-14-alexandru.elisei@arm.com>
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

Everything is in place to run the tests using kvmtool:

$ ./configure --target=kvmtool
$ make clean && make
$ KVMTOOL=<path/to/kvmtool> ./run_tests.sh

so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
because the runner will generate and pass the correct environment to
kvmtool.

Support for EFI tests is missing. That's because distros don't ship a
EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
an EFI app hasn't been tested to work with kvmtool.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
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
index 38800e8bfa13..12d7a4186230 100755
--- a/arm/efi/run
+++ b/arm/efi/run
@@ -15,6 +15,11 @@ source scripts/vmm.bash
 
 vmm_check_supported
 
+if [[ $(vmm_get_target) == "kvmtool" ]]; then
+	echo "kvmtool does not support EFI tests."
+	exit 2
+fi
+
 if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
 	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
 elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
diff --git a/configure b/configure
index 20bf5042cb9e..470f9d7cdb3b 100755
--- a/configure
+++ b/configure
@@ -378,7 +378,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
         : "${uart_early_addr:=0x9000000}"
     elif [ "$target" = "kvmtool" ]; then
         : "${uart_early_addr:=0x1000000}"
-        errata_force=1
     else
         echo "--target must be one of 'qemu' or 'kvmtool'!"
         usage
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 724c96f9e665..f2c987d92405 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -204,7 +204,7 @@ function vmm_check_supported()
 	local target=$(vmm_get_target)
 
 	case "$target" in
-	qemu)
+	qemu | kvmtool)
 		return 0
 		;;
 	*)
-- 
2.50.0


