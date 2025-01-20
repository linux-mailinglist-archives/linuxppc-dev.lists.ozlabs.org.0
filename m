Return-Path: <linuxppc-dev+bounces-5414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA6A1708A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQf4Xs8z30T3;
	Tue, 21 Jan 2025 03:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391482;
	cv=none; b=J+/QCv2Caw2ztgf4zbh3/Rid+p/Cvz2tVJXUYEwUr+drh9h0hGfImsF9RjYlqVLab9KUA451Z1BvADNXflBsYQHoaasTI0UN0Q7G48Sp+SzfpuuM84j2vd0D0Gqqglp0PAxItr6GQBwUEbOo3rQaKauy089IEZLDGE7phHXE8UrkmWEE4Y3fskHZPNmh3naePcVRcKoDEiLEuTkOBMmPqoJ4w1GiNP64Q3dE7TZ0Fq0+VXz2SxLHmSXslFiiqrUeLfeJJhXb8N6PyoI5b1oWDid+DmpTQpuyuchRwI0UsDvvU4/EolVYZIbd09djIXb82eqbh2sjruM5Ycixa4XMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391482; c=relaxed/relaxed;
	bh=fEYENRyI+vXzjU5umQc2rllQNsN9vawKqi4oDYR8SK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlAu5ywGEHHa1jEClMXJaXf7FqGFA96UaBDT0lAhXLCnXy13A5anNSz3sDIRJUqD56Z6KcOj14t2fPVhhbcjyotTTr8IfTBFfXYK/OMrtn3/jlYR9sP/iKxceHBdOWbb1TBjMDlR91xWBVlFYX+qHBLXpn66w47tLPoombYt1ShrBRlsyK3DXCiXjIjRrAm0FFt2T8O2H1mhq7UCXIaF1l2+SI4EJWQ3AfrUcIkOwtKLo3wEZBfts1gxD1ESU19dWGdeZmu1aUr8YqgmCvaks4xlSZqfjFpM9sJkNen43nGhSofDWQ49QfL8f6smDEMIDTAWQxRPf4FXeg1Zz+QxIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQb4ztrz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00BE31D6F;
	Mon, 20 Jan 2025 08:45:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08CEE3F5A1;
	Mon, 20 Jan 2025 08:44:31 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 18/18] run_tests: Enable kvmtool
Date: Mon, 20 Jan 2025 16:43:16 +0000
Message-ID: <20250120164316.31473-19-alexandru.elisei@arm.com>
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

Should I also revert commit 35145f140442 ("arm/arm64: kvmtool: force all tests
to run") which introduced ERRATA_FORCE? I didn't do this now in case other
architectures use it/planning to use it.

 README.md               | 15 +++++++++++++++
 arm/run                 |  2 +-
 configure               |  1 -
 run_tests.sh            |  2 +-
 scripts/mkstandalone.sh |  2 +-
 5 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index be07dc28a094..5e7706f02553 100644
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
@@ -80,10 +83,22 @@ For running tests that involve migration from one QEMU instance to another
 you also need to have the "ncat" binary (from the nmap.org project) installed,
 otherwise the related tests will be skipped.
 
+To run a test with kvmtool, please configure kvm-unit-tests accordingly first:
+
+   ./configure --arch=arm64 --target=kvmtool
+
+then run the test(s) like with QEMU above.
+
+To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
+variable. kvmtool supports only kvm as the accelerator.
+
 ## Running the tests with UEFI
 
 Check [x86/efi/README.md](./x86/efi/README.md).
 
+On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
+tests under UEFI.
+
 # Tests configuration file
 
 The test case may need specific runtime configurations, for
diff --git a/arm/run b/arm/run
index 880d5afae86d..438a2617e564 100755
--- a/arm/run
+++ b/arm/run
@@ -10,7 +10,7 @@ if [ -z "$KUT_STANDALONE" ]; then
 fi
 
 case "$TARGET" in
-qemu)
+qemu | kvmtool)
     ;;
 *)
    echo "'$TARGET' not supported"
diff --git a/configure b/configure
index 86cf1da36467..17d3d931f2c0 100755
--- a/configure
+++ b/configure
@@ -299,7 +299,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
         arm_uart_early_addr=0x09000000
     elif [ "$target" = "kvmtool" ]; then
         arm_uart_early_addr=0x1000000
-        errata_force=1
     else
         echo "--target must be one of 'qemu' or 'kvmtool'!"
         usage
diff --git a/run_tests.sh b/run_tests.sh
index d38954be9093..3921dcdcb344 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -110,7 +110,7 @@ while [ $# -gt 0 ]; do
 done
 
 case "$TARGET" in
-qemu)
+qemu | kvmtool)
     ;;
 *)
     echo "$0 does not support '$TARGET'"
diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 10abb5e191b7..16383b05adfa 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -8,7 +8,7 @@ source config.mak
 source scripts/common.bash
 
 case "$TARGET" in
-qemu)
+qemu | kvmtool)
     ;;
 *)
     echo "'$TARGET' not supported for standlone tests"
-- 
2.47.1


