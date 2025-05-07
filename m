Return-Path: <linuxppc-dev+bounces-8385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FAAAE41B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszLW6LH7z308b;
	Thu,  8 May 2025 01:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630835;
	cv=none; b=VsWiTdqAIWN4rrIc5UOmog67VoarVo1VotVCRR/4Vao3LUYHYUHv6yHASVYu8ssyQrmrlQ5G8yuvWa4I0ZdfC+a+f2RG+JJ4F4ToOfiMyGefdELtdG1YEVzxkKjgCRYGf8eEdFdbOsWjvtHGaoUdt7TjrJ2dff6dJA2M4S1yx8TGikxyz6GSgbvJruHz0jGs7gT9EyPSTz62hO10w0pFZbxv+/aFy+3GkwBJ/pgnwTHB+WYUJrS6xNIqu4krFSlGDq/6z3hB5xA93gqr2d/qILbstSmfw+THc44hH6pPIWD4gt9L24GrBOFo4zW9hC3GxRAYKF9kF4sKfXAltG9NpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630835; c=relaxed/relaxed;
	bh=LKZ/F/exOhXeu/hfAs53KLhngOOI7XL3GGGKV9vJWEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S01aKRMHCfmzkXO0PTilAvghPbb0KL3ULRvA5EEknFSnF3KOm9RQ9mRf/wFxEvKy2xa4+HgT/37Fhr3Nw9Rn1qq2id9DQz0d6VKZ1EEKnrWxD6IT00tKirP3LBcSX3YV9lbQKPZRgRXXemWbbjb0T2YETqkUBsWLzbGceOhE3R+e/ks/fWEBGiarqrvpCzq9okqAClT25ZKeGsrJVPUQMXf8Gn3x8DhCWkAC0vxnyf02EfIMRTPPoGt4yiio2E+AhUUPQayfi/LK0KEL62D2IthVXwADOi+4eWOeedt4N8G+bUQn9FEAN1DTgtEZYIc1J/epIGLInn34sfZroEyD9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszLW1C0Mz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:13:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 035DE204C;
	Wed,  7 May 2025 08:13:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D4C3F58B;
	Wed,  7 May 2025 08:13:20 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET unconditionally
Date: Wed,  7 May 2025 16:12:43 +0100
Message-ID: <20250507151256.167769-4-alexandru.elisei@arm.com>
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

Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
architectures can only set --target to 'qemu', which is also the default.

Needed to make the changes necessary to add support for kvmtool to the test
runner.

kvmtool also supports running the riscv tests, so it's not outside of the
realm of the possibily for the riscv tests to get support for kvmtool.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 20bf5042cb9e..8c4400db42bc 100755
--- a/configure
+++ b/configure
@@ -38,6 +38,21 @@ function get_default_qemu_cpu()
     esac
 }
 
+# Return the targets that the architecture supports
+function get_supported_targets()
+{
+    local arch=$1
+
+    case "$arch" in
+    "arm" | "arm64" | "aarch64")
+        echo "qemu kvmtool"
+	;;
+    *)
+        echo "qemu"
+	;;
+    esac
+}
+
 srcdir=$(cd "$(dirname "$0")"; pwd)
 prefix=/usr/local
 cc=gcc
@@ -79,6 +94,7 @@ fi
 usage() {
     [ "$arch" = "aarch64" ] && arch="arm64"
     [ -z "$processor" ] && processor=$(get_default_processor $arch)
+    [ -z $target ] && target=qemu
     cat <<-EOF
 	Usage: $0 [options]
 
@@ -89,8 +105,8 @@ usage() {
 	    --target-cpu=CPU       the CPU model to run on. If left unset, the run script
 	                           selects the best value based on the host system and the
 	                           test configuration.
-	    --target=TARGET        target platform that the tests will be running on (qemu or
-	                           kvmtool, default is qemu) (arm/arm64 only)
+	    --target=TARGET        target platform that the tests will be running on ($target).
+	                           Supported targets: $(get_supported_targets $arch)
 	    --cross-prefix=PREFIX  cross compiler prefix
 	    --cc=CC                c compiler to use ($cc)
 	    --cflags=FLAGS         extra options to be passed to the c compiler
@@ -281,13 +297,11 @@ if [ "$arch" = "riscv" ]; then
     exit 1
 fi
 
-if [ -z "$target" ]; then
-    target="qemu"
-else
-    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ]; then
-        echo "--target is not supported for $arch"
-        usage
-    fi
+if [ -z $target ]; then
+    target=qemu
+elif ! grep -Fq " $target " <<< " $(get_supported_targets $arch) "; then
+    echo "Target $target is not supported for $arch"
+    usage
 fi
 
 if [ "$efi" ] && [ "$arch" != "x86_64" ] &&
@@ -519,10 +533,8 @@ CONFIG_EFI=$efi
 EFI_DIRECT=$efi_direct
 CONFIG_WERROR=$werror
 GEN_SE_HEADER=$gen_se_header
+TARGET=$target
 EOF
-if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
-    echo "TARGET=$target" >> config.mak
-fi
 
 cat <<EOF > lib/config.h
 #ifndef _CONFIG_H_
-- 
2.49.0


