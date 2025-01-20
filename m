Return-Path: <linuxppc-dev+bounces-5406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE4A17072
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:44:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQ96MJ9z30K6;
	Tue, 21 Jan 2025 03:44:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391457;
	cv=none; b=XnlmEKstr+Oq4AsL9K2Hu5Xrycutxn3GI24O0lA2oJcEiPm8APIa5I2cUIggGfrGGu7fYogp/MULYr4h0OnCPxIuPDF0+BbWXfgOMtWGtv+Pzs8/6ok0Q1r+xVT2Wz8/KlhV2WHeIUEyifX7UfrvGN9awxv0RrEL+uggNArx2faY3SkRJxUdiX7nz6zYRGgad9/rGVr+sY15BxZuUT3kKDllu/xViGRjiqHNjXN8Xw2IlGiQbmJfJQ0ykyGdotGU53RGL0iuLR7y+qB5EftCmU/uYwOD6MpAHpyMViB4Hoq58DZzpB1Gl0A749QdM2WAZPAsq2GFvMmsMO8+egZ7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391457; c=relaxed/relaxed;
	bh=mR2QAd92QfwxJmHukGqOLtw2COGtKrBMLjNQ9W9K4Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8uaMI91q54lzkxZnbaPrRJXf5qAnG8sM3sDJaW2zZaWCnLoAHE6rz4Hf2y2gzL/bpy8lQ3eMmU1NLXXTetDiliENxM2Wygi6CtHw9It++QXNNMV9e45GuUXE7m4YwytjpxsZLOOKC4zaG7KFqH7+SQ14WWrBZjH380vHzCbK18Z7Np5WLWHUAIaUOMFtS3+2/KMaUb5IByRGVGw4go0D3tr2lR/zZXRawISujhi+QsiQ9acF5uRooetFJOcLD4UNh9drOkxsqcv9+3YwjXfe5QoCz8sS/X6g2Qau/VMvdCl8xuO8YZ2WIGnn8E5yFBcFX5DxbO6eMTK9wazk0GOHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQ91jrHz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:17 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3E66169C;
	Mon, 20 Jan 2025 08:44:14 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191683F5A1;
	Mon, 20 Jan 2025 08:43:42 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 04/18] run_tests: Introduce unittest parameter 'qemu_params'
Date: Mon, 20 Jan 2025 16:43:02 +0000
Message-ID: <20250120164316.31473-5-alexandru.elisei@arm.com>
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

Tests for the arm and arm64 architectures can also be run with kvmtool, and
work is under way to have it supported by the run_tests.sh test runner. Not
suprisingly, kvmtool has a different syntax than qemu when configuring and
running a virtual machine.

Add a new unittest parameter, 'qemu_params', with the goal to add a similar
parameter for each virtual machine manager that run_tests.sh supports.

'qemu_params' and 'extra_params' are interchangeable, but it is expected
that going forward new tests will use 'qemu_params'. A test should have
only one of the two parameters.

While we're at it, rename the variable opts to qemu_opts to match the new
unit configuration name, and to make it easier to distinguish from the
kvmtool parameters when they'll be added.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 docs/unittests.txt   | 17 +++++++++-----
 scripts/common.bash  | 53 ++++++++++++++++++++++++++------------------
 scripts/runtime.bash | 10 ++++-----
 3 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index dbc2c11e3b59..3e1a9e563016 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -24,9 +24,9 @@ param = value format.
 
 Available parameters
 ====================
-Note! Some parameters like smp and extra_params modify how a test is run,
-while others like arch and accel restrict the configurations in which the
-test is run.
+Note! Some parameters like smp and qemu_params/extra_params modify how a
+test is run, while others like arch and accel restrict the configurations
+in which the test is run.
 
 file
 ----
@@ -56,13 +56,18 @@ smp = <number>
 Optional, the number of processors created in the machine to run the test.
 Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
 
-extra_params
-------------
+qemu_params
+-----------
 These are extra parameters supplied to the QEMU process. -append '...' can
 be used to pass arguments into the test case argv. Multiple parameters can
 be added, for example:
 
-extra_params = -m 256 -append 'smp=2'
+qemu_params = -m 256 -append 'smp=2'
+
+extra_params
+------------
+Alias for 'qemu_params', supported for compatibility purposes. Use
+'qemu_params' for new tests.
 
 groups
 ------
diff --git a/scripts/common.bash b/scripts/common.bash
index 3aa557c8c03d..a40c28121b6a 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -1,5 +1,28 @@
 source config.mak
 
+function parse_opts()
+{
+	local opts="$1"
+	local fd="$2"
+
+	while read -r -u $fd; do
+		#escape backslash newline, but not double backslash
+		if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
+			if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
+				opts=${opts%\\$'\n'}
+			fi
+		fi
+		if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
+			opts+=${BASH_REMATCH[1]}
+			break
+		else
+			opts+=$REPLY$'\n'
+		fi
+	done
+
+	echo "$opts"
+}
+
 function for_each_unittest()
 {
 	local unittests="$1"
@@ -7,7 +30,7 @@ function for_each_unittest()
 	local testname
 	local smp
 	local kernel
-	local opts
+	local qemu_opts
 	local groups
 	local arch
 	local machine
@@ -22,12 +45,12 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
 			smp=1
 			kernel=""
-			opts=""
+			qemu_opts=""
 			groups=""
 			arch=""
 			machine=""
@@ -38,24 +61,10 @@ function for_each_unittest()
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
 			smp=${BASH_REMATCH[1]}
-		elif [[ $line =~ ^extra_params\ *=\ *'"""'(.*)$ ]]; then
-			opts=${BASH_REMATCH[1]}$'\n'
-			while read -r -u $fd; do
-				#escape backslash newline, but not double backslash
-				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
-					if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
-						opts=${opts%\\$'\n'}
-					fi
-				fi
-				if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
-					opts+=${BASH_REMATCH[1]}
-					break
-				else
-					opts+=$REPLY$'\n'
-				fi
-			done
-		elif [[ $line =~ ^extra_params\ *=\ *(.*)$ ]]; then
-			opts=${BASH_REMATCH[1]}
+		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
+			qemu_opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
+		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
+			qemu_opts=${BASH_REMATCH[2]}
 		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
 			groups=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
@@ -71,7 +80,7 @@ function for_each_unittest()
 		fi
 	done
 	if [ -n "${testname}" ]; then
-		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 	fi
 	exec {fd}<&-
 }
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 4b9c7d6b7c39..e5d661684ceb 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -34,7 +34,7 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $qemu_opts"
 }
 
 skip_nodefault()
@@ -80,7 +80,7 @@ function run()
     local groups="$2"
     local smp="$3"
     local kernel="$4"
-    local opts="$5"
+    local qemu_opts="$5"
     local arch="$6"
     local machine="$7"
     local check="${CHECK:-$8}"
@@ -179,9 +179,9 @@ function run()
         echo $cmdline
     fi
 
-    # extra_params in the config file may contain backticks that need to be
-    # expanded, so use eval to start qemu.  Use "> >(foo)" instead of a pipe to
-    # preserve the exit status.
+    # qemu_params/extra_params in the config file may contain backticks that
+    # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
+    # a pipe to preserve the exit status.
     summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
                              > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
     ret=$?
-- 
2.47.1


