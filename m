Return-Path: <linuxppc-dev+bounces-5415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA3A1708E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQk18yhz30Tc;
	Tue, 21 Jan 2025 03:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391486;
	cv=none; b=AvPoHjXZ9CuDbu2OxXyG16nN6qvTZj4I9qLSizjc/cdj+ZnyD8ID+Aocg/dASJK5wtldvxc2dcCxt97uonZeZVn+Sbiw3Je7ikekolveEU6EzlxVPF6Idehr2kqPoe2HDj+mOtCcHTozAhfPNF/k8uuD23QCnQNaXPUAHSrkdW2HD3j5YSfs+VVZ7H66C2SrfFJRWzEb4JBF5j7ag3ADrhOIrOUnRjZc/EHrYkYkEarSA8lyDRJCrqW3danHZCzAHrPktD5wL25yKj1mF5b/ptJrHLFLUFtxl0umNV2oRD8UYNdbVQD9QuRfoVHywIl5/rtGuYS9sY8aDPCv1Vhedg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391486; c=relaxed/relaxed;
	bh=mq9KvfktIFBRFX3x4QfGidjiJA0HGhS8TMeU4Lsc8TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7AVrCsudhLmvS736fvXIBU1PlZcX3T8PjsVfvtuedFO9JJ8uOJGiYtpwNLwQviGJeGMR5N+1QsOY8aWs6eWM4s+G6XiTmRWw8epr88uP+O7LxJDSDFq3QVG5f1PzMzv9vx9/wE6qIM7kn0Yz7Oz1ev9hr9AoomoaDe124tLa+LkvvJodo9eVWqrBm+IALYKlrCF1KQh2u9JxA4jdUlai4Pu9nErIvtobNViBy7tkyMncKr/zMfkaSHvaYF12knL+v1m+YHjVjXKUjYPihES2IaUQRFh+EAioUcOmnjE9vlAQpvKGKesuJ0Jc9C/CrK+pXiz50Pdszs7uUoqo4SDFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQj35G3z30JH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:45 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FDAE1063;
	Mon, 20 Jan 2025 08:44:42 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59EC3F5A1;
	Mon, 20 Jan 2025 08:44:10 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 12/18] scripts/runtime: Add default arguments for kvmtool
Date: Mon, 20 Jan 2025 16:43:10 +0000
Message-ID: <20250120164316.31473-13-alexandru.elisei@arm.com>
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

kvmtool, unless told otherwise, will do its best to make sure that a kernel
successfully boots in a virtual machine. Among things like automatically
creating a rootfs, it also adds extra parameters to the kernel command
line. This is actively harmful to kvm-unit-tests, because some tests parse
the kernel command line and they will fail if they encounter the options
added by kvmtool.

Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
line argument") addded the --nodefaults kvmtool parameter which disables
all the implicit virtual machine configuration that cannot be disabled by
using other parameters, like modifying the kernel command line. Always use
--nodefaults to allow a test to run.

kvmtool can be too verbose when running a virtual machine, and this is
controlled with parameters. Add those to the default kvmtool command line
to reduce this verbosity to a minimum.

Before:

$ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
  Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
Unknown subtest

EXIT: STATUS=127
  Warning: KVM compatibility warning.
	virtio-9p device was not detected.
	While you have requested a virtio-9p device, the guest kernel did not initialize it.
	Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
  Warning: KVM compatibility warning.
	virtio-net device was not detected.
	While you have requested a virtio-net device, the guest kernel did not initialize it.
	Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
  Info: KVM session ended normally.

After:

$ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
PASS: selftest: setup: smp: number of CPUs matches expectation
INFO: selftest: setup: smp: found 2 CPUs
PASS: selftest: setup: mem: memory size matches expectation
INFO: selftest: setup: mem: found 256 MB
SUMMARY: 2 tests

EXIT: STATUS=1

Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
variable with the same name, but it's not documented in the help string for
run_tests.sh. This has been done on purpose, since overwritting
KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
purposes.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 55d58eef9c7c..abfd1e67b2ef 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -2,6 +2,17 @@
 : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
 : "${TIMEOUT:=90s}"
 
+# The following parameters are enabled by default when running a test with
+# kvmtool:
+# --nodefaults: suppress VM configuration that cannot be disabled otherwise
+#               (like modifying the supplied kernel command line). Tests that
+#               use the command line will fail without this parameter.
+# --network mode=none: do not create a network device. kvmtool tries to help the
+#                user by automatically create one, and then prints a warning
+#                when the VM terminates if the device hasn't been initialized.
+# --loglevel=warning: reduce verbosity
+: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
+
 PASS() { echo -ne "\e[32mPASS\e[0m"; }
 SKIP() { echo -ne "\e[33mSKIP\e[0m"; }
 FAIL() { echo -ne "\e[31mFAIL\e[0m"; }
@@ -103,7 +114,7 @@ function run()
         opts="-smp $smp $qemu_opts"
         ;;
     kvmtool)
-        opts="--cpus $smp $kvmtool_opts"
+        opts="$KVMTOOL_DEFAULT_OPTS --cpus $smp $kvmtool_opts"
         ;;
     esac
 
-- 
2.47.1


