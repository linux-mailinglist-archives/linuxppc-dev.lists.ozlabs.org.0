Return-Path: <linuxppc-dev+bounces-8387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35199AAE421
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:14:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM14CHGz30HB;
	Thu,  8 May 2025 01:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630861;
	cv=none; b=EnHUDfBiZ6U4oJLIs79NouKTR9IzWwwqYfQaTbGS5I/235hVQ17Jj2u38zY5TrNFx98s1x2I3Xu1hMaHeRNOTwcqEcxujw064JdLu8u6L9EIo9lvhlgxqdlClQvCABQjVkX/eoe1QAJ6E9QmAPya/O3oA15jHRW43oMFGxZGy6tsrx2M8+qGnZvLhENIuDoAS7gTW0BTdsP19Bc+l5rNYvnGCiwlo4zaEXd8M/EzHjlqVtvOCL3Zdo9bSHXgXiFf9dJbyehGRezUi0z1+rkySTMsMSZTsOpW/e+g/CVcg1VLaMc9wiRI/ZgEq0MEkBbW/nOVq58pMMkgdfRa2ThsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630861; c=relaxed/relaxed;
	bh=wI6Sgxb6mqFTu+vSkRePS3uMWb7Hp15xVoL+Kxm71YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggEOIl4RJ+hS1rtO/yg5Kk7Q422Ic24Hz+SAlq9Ih8LowGTg+jKd4GUJWNXmqZXr6d1tlPhZflZtM6zLL/K/XICqe/2JiegGUo1yi16uHH38SQueUroBxw5SSMlmj62xJ5PIpd7t4NxkjQwGlclN/CTuk4mwsNRjYIWyRx/rWPorhIZMOXP+siQW52yXXRGXUsp9TDqmmT+2KGi+43S7jS1iiQiQwOlGewWWA237+i4Z/CxVbfOnGHjzXgnLPKj0M5uXHoVEzA8XXJ/Dkqw9yVc9v7eyLb9u29gT0+waGWlnWtXKIM6RVl0EgQeDV4ob7Xoy0l3LHNTAE0xZed8XLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM04wrqz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:14:20 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B19620E3;
	Wed,  7 May 2025 08:13:21 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 026B03F58B;
	Wed,  7 May 2025 08:13:27 -0700 (PDT)
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
	Andrew Jones <drjones@redhat.com>
Subject: [kvm-unit-tests PATCH v3 05/16] scripts: Document environment variables
Date: Wed,  7 May 2025 16:12:45 +0100
Message-ID: <20250507151256.167769-6-alexandru.elisei@arm.com>
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

Document the environment variables that influence how a test is executed
by the run_tests.sh test runner.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 docs/unittests.txt |  5 ++++-
 run_tests.sh       | 12 +++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index 6eb315618dbd..ea0da959f008 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -102,7 +102,8 @@ timeout
 -------
 timeout = <duration>
 
-Optional timeout in seconds, after which the test will be killed and fail.
+Optional timeout in seconds, after which the test will be killed and fail. Can
+be overwritten with the TIMEOUT=<duration> environment variable.
 
 check
 -----
@@ -113,3 +114,5 @@ can contain multiple files to check separated by a space, but each check
 parameter needs to be of the form <path>=<value>
 
 The path and value cannot contain space, =, or shell wildcard characters.
+
+Can be overwritten with the CHECK environment variable with the same syntax.
diff --git a/run_tests.sh b/run_tests.sh
index f30b6dbd131c..dd9d27377905 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
     -l, --list          Only output all tests list
         --probe-maxsmp  Update the maximum number of VCPUs supported by host
 
-Set the environment variable QEMU=/path/to/qemu-system-ARCH to
-specify the appropriate qemu binary for ARCH-run.
-
+The following environment variables are used:
+
+    QEMU            Path to QEMU binary for ARCH-run
+    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
+    ACCEL_PROPS     Extra argument(s) to ACCEL
+    MACHINE         QEMU machine type
+    TIMEOUT         Timeout duration for the timeout(1) command
+    CHECK           Overwrites the 'check' unit test parameter (see
+                    docs/unittests.txt)
 EOF
 }
 
-- 
2.49.0


