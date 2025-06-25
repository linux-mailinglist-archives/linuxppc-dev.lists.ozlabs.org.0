Return-Path: <linuxppc-dev+bounces-9775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE7AE88B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:50:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5q932krz3bnr;
	Thu, 26 Jun 2025 01:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866581;
	cv=none; b=VhY8BTsm/HyPt6wtgGbJrGTf4idG1SnYhN0mCpTswWaATlT2SsSWRAxMalCCS9SsiAT89LvmEZIEjLrn4bVbswIiLHm0+n3GBlLVSi2JduyX6WO+P02N/3DoZ5YTEgj+8NPSsRL5qAvWvHjy0O17peZ7YjdJVdOtrcUoNtZxO/jqqHAjjHtwbOYe8rGt6IgVL4sHmuz6555LHWPpu88bhGvB/MmdQdaehQt4xo9gOsMWDW1ovjVk6/IMhenFje+qijK0ejhSZyjZjWjc3JA3j/HeRHv7xfq/Gc/cJS56zDlxNioinFlhcz8p9bZGz6cw5VxvCjypGUtPlZnJ5AgMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866581; c=relaxed/relaxed;
	bh=BW4JgUFATBZVsqoENXjOqiAdvd4NmLtihT0zspbhyuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjHdM9dECx0Xsqjxpd6Yftqv+iV6Lvzjne0pGcBD40pRToQjOpLpsXl9mLbNtlG55Jz+BfFN3YioDs7PK0OV4zOFcIcoOS9E9QtkzjlFG6W5OdnkNubqwembIQ9cRWGy7X8psPDPOOqPntPdxi4q2gjQoBq6yG3ATbOfeqIRLSMW6Y5K0HGqsnsWzzDmRfioyCJyc12vupSgbW+l76eNAJeYrRQS5KL+DvjwFiuqIcZs2OBCvhBoBztzA2ZDGPsvOy3fbS0D5GoF1Jd61U3wk+eaO92pqDtpbjkNHm7WFWmnivZGQkT3yol2MYszT1wzRaqpb930B8i7j6pRuvQTlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5q83R4Hz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:40 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4245A22E6;
	Wed, 25 Jun 2025 08:48:51 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 118DB3F58B;
	Wed, 25 Jun 2025 08:49:04 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 09/13] scripts: Detect kvmtool failure in premature_failure()
Date: Wed, 25 Jun 2025 16:48:09 +0100
Message-ID: <20250625154813.27254-10-alexandru.elisei@arm.com>
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

kvm-unit-tests assumes that if the VMM is able to get to where it tries to
load the kernel, then the VMM and the configuration parameters will also
work for running the test. All of this is done in premature_failure().

Teach premature_failure() about the kvmtool's error message when it fails
to load the dummy kernel.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Changes v3->v4:

* Use vmm_parse_premature_failure() in
scripts/runtime.bash::premature_failure().
* Do not source scripts/vmm.bash in scripts/runtime.bash to avoid errors in
the standalone tests.

 scripts/mkstandalone.sh |  1 +
 scripts/runtime.bash    |  6 +-----
 scripts/vmm.bash        | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 9c5768563757..ebf425564af5 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -81,6 +81,7 @@ generate_test ()
 	echo "RUNTIME_log_stdout () { cat >&\$stdout; }"
 	echo "RUNTIME_log_stderr () { cat >&2; }"
 
+	cat scripts/vmm.bash
 	cat scripts/runtime.bash
 
 	echo "run ${args[*]}"
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 86d8a2cd8528..5839ca5ca665 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -19,11 +19,7 @@ premature_failure()
 
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
-    echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-                -e "error loading" \
-                -e "failed to load" &&
-        return 1
+    vmm_parse_premature_failure "$log" || return 1
 
     RUNTIME_log_stderr <<< "$log"
 
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 368690d62473..44954a711cad 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -79,6 +79,18 @@ function qemu_fixup_return_code()
 	echo $ret
 }
 
+function qemu_parse_premature_failure()
+{
+	local log=$*
+
+	echo "$log" | grep "_NO_FILE_4Uhere_" |
+		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+			-e "error loading" \
+			-e "failed to load" &&
+		return 1
+	return 0
+}
+
 function kvmtool_fixup_return_code()
 {
 	local ret=$1
@@ -91,18 +103,29 @@ function kvmtool_fixup_return_code()
 	echo $ret
 }
 
+function kvmtool_parse_premature_failure()
+{
+	local log=$*
+
+	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
+		return 1
+	return 0
+}
+
 declare -A vmm_optname=(
 	[qemu,args]='-append'
 	[qemu,default_opts]=''
 	[qemu,fixup_return_code]=qemu_fixup_return_code
 	[qemu,initrd]='-initrd'
 	[qemu,nr_cpus]='-smp'
+	[qemu,parse_premature_failure]=qemu_parse_premature_failure
 
 	[kvmtool,args]='--params'
 	[kvmtool,default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool,fixup_return_code]=kvmtool_fixup_return_code
 	[kvmtool,initrd]='--initrd'
 	[kvmtool,nr_cpus]='--cpus'
+	[kvmtool,parse_premature_failure]=kvmtool_parse_premature_failure
 )
 
 function vmm_optname_args()
@@ -130,6 +153,11 @@ function vmm_optname_nr_cpus()
 	echo ${vmm_optname[$(vmm_get_target),nr_cpus]}
 }
 
+function vmm_parse_premature_failure()
+{
+	${vmm_optname[$(vmm_get_target),parse_premature_failure]} "$@"
+}
+
 function vmm_get_target()
 {
 	if [[ -z "$TARGET" ]]; then
-- 
2.50.0


