Return-Path: <linuxppc-dev+bounces-8395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E7AAE439
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM7155Bz30VZ;
	Thu,  8 May 2025 01:14:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630867;
	cv=none; b=dcp5Xc07MjyOJUPaPV5GGlAkU7SuCoxs8zrrc8QCtI4iZHHmbglWop7xnRZerw97HdE+4mtrbfRtKUogT2ngkSII8gD9w5Tg3CHE2kf0OnYrQfLdYz74tsexd2pIzwXCj/IqYIXQaOB4pi9q8JXwfeO3C4FyW1CI34wnzMMf7ssFSFBgtvGpqM0gn8FdsnrH1vvZ3Tu9JKBqEsOdRL8nXet3BMsE8ym3d3Eml7zzbKEEmwLYDJBQxr69IS0V6PSrQVEHLG1sRtqfIcDK/u4DrtklWU80DgCpEux1b68IbYE+Q9pz7BPODbOQBl7boh7yF2gA3SSLUkLIy0dTo1ROeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630867; c=relaxed/relaxed;
	bh=mNVxfV7HVVhGBLhw+Qz+jvpvxO/h+LgrF8+t8dqoskU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKcCr9pInTzSWdsc5tMBuRsoX7nLwZeqqhHDndDyJT3fC6SklfawBGgRWoLtN5nYbxJtp9ygk/2Ph1Ys1n26tKIxmWpVnl5SokXUUU6pCgss9u6QNQqVANtoxZMvN/Xrqtqq+Jy47MRQuFwjs9p0sTH950IpgUUKCz1IkIZARVhEMMXLoYgpn1ZYSocD9C/CsFQU5L1C1XXJgZfPmioMQvjU3kml0Sz0cJBwTgHnO+TL/xZ1+fdpC+Zcu4Yb9zF3mADv4UdxdTOtZdvgqbmHrj6L4dT9xkknbL9QFwXzCJmF/DYQiXmYfy2mPMEJjXGi026b/2C0oIVTV40V7fxA3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM63nzQz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:14:26 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0CAA22D7;
	Wed,  7 May 2025 08:13:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0FFF3F58B;
	Wed,  7 May 2025 08:13:52 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 12/16] scripts: Detect kvmtool failure in premature_failure()
Date: Wed,  7 May 2025 16:12:52 +0100
Message-ID: <20250507151256.167769-13-alexandru.elisei@arm.com>
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

kvm-unit-tests assumes that if the VMM is able to get to where it tries to
load the kernel, then the VMM and the configuration parameters will also
work for running the test. All of this is done in premature_failure().

Teach premature_failure() about the kvmtool's error message when it fails
to load the dummy kernel.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash |  8 +++-----
 scripts/vmm.bash     | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 86d8a2cd8528..01ec8eae2bba 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -1,3 +1,5 @@
+source scripts/vmm.bash
+
 : "${RUNTIME_arch_run?}"
 : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
 : "${TIMEOUT:=90s}"
@@ -19,11 +21,7 @@ premature_failure()
 
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
-    echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-                -e "error loading" \
-                -e "failed to load" &&
-        return 1
+    ${vmm_opts[$TARGET:parse_premature_failure]} "$log" || return 1
 
     RUNTIME_log_stderr <<< "$log"
 
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index d24a4c4b8713..a1d50ed51981 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -93,6 +93,27 @@ kvmtool_fixup_return_code()
 	echo $ret
 }
 
+function qemu_parse_premature_failure()
+{
+	local log="$@"
+
+	echo "$log" | grep "_NO_FILE_4Uhere_" |
+		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+			-e "error loading" \
+			-e "failed to load" &&
+		return 1
+	return 0
+}
+
+function kvmtool_parse_premature_failure()
+{
+	local log="$@"
+
+	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
+		return 1
+	return 0
+}
+
 declare -A vmm_opts=(
 	[qemu:nr_cpus]='-smp'
 	[qemu:kernel]='-kernel'
@@ -100,6 +121,7 @@ declare -A vmm_opts=(
 	[qemu:initrd]='-initrd'
 	[qemu:default_opts]=''
 	[qemu:fixup_return_code]=qemu_fixup_return_code
+	[qemu:parse_premature_failure]=qemu_parse_premature_failure
 
 	[kvmtool:nr_cpus]='--cpus'
 	[kvmtool:kernel]='--kernel'
@@ -107,6 +129,7 @@ declare -A vmm_opts=(
 	[kvmtool:initrd]='--initrd'
 	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
+	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
 )
 
 function check_vmm_supported()
-- 
2.49.0


