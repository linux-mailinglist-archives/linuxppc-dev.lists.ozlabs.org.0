Return-Path: <linuxppc-dev+bounces-5418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C797BA17096
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:46:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQr4CNhz30Vb;
	Tue, 21 Jan 2025 03:44:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391492;
	cv=none; b=nPgfJTKVXv+JZnc656Uc77GnfdMeb2AHobiNwa1+XLOhm2U5t5JBw5PSNoWs23a1gWzowku9XztahknyuykNUgf0eCZ+A88pUcFDvJxidbmuJ5JccCG2q/cj+uwrSVcw4KzW21DQuwrJHCyfZImlfZHP/FfeZbh1vF+TYYYGRCg74OJEp9RxVAwfUPmfTVcZZ6vrtYMcty5D7RCcyRmIRI525qJGTHbQN9KpFd2G8/hNasIjNe6RgJqsDxqE5BsbTZYXNcNQrpuV5QaSibUmnP+8e6y1zJoHNTkqn5a+n9FQFRnz0zakfOnWZRg4hk9UHk9cxkXtNXc89AHQusGkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391492; c=relaxed/relaxed;
	bh=gGWCC9+ujI2TC54Xb7AFwULqLo8EJkVhbrxVeMzxU4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKm5WP4a7Nki0uI3os9Q1I2maYMgvdlMfWgxGOTF2DA4NJ63mkmHhdi0tqphLxhpN0vvNh8SwDP3UhqfjHIBzQ8JJM9quKXtYIkIR+74W8TXScta7nfv9Y5aMZnESvo0MJmiocNMsmx98nY+gVSO3P4OlI678CBIj1gTD2w4p4mDO1/c0662qIBXbJHeuyuAF3ZCFHck95Qj3A7Wr86rXxUdkZsyKGyM7RDganZZ/C/40eXoh5uhy/s1mEITjEVGXquNKUnRMcCpehim1qeuLUoxAfB3aZm77Iwa2vEp8vO0r6+gLxcrf3i02fcsQVls73cdL3OatwSPzMndhjuNzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQr0Pw2z30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD52169C;
	Mon, 20 Jan 2025 08:44:49 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E750E3F5A1;
	Mon, 20 Jan 2025 08:44:17 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 14/18] run_tests: Add KVMTOOL environment variable for kvmtool binary path
Date: Mon, 20 Jan 2025 16:43:12 +0000
Message-ID: <20250120164316.31473-15-alexandru.elisei@arm.com>
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

kvmtool is often used for prototyping new features, and a developer might
not want to install it system-wide. Add a KVMTOOL environment variable to
make it easier for tests to use a binary not in $PATH.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh          | 1 +
 scripts/arch-run.bash | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/run_tests.sh b/run_tests.sh
index acaaadbb879b..d38954be9093 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -36,6 +36,7 @@ The following environment variables are used:
     TIMEOUT         Timeout duration for the timeout(1) command
     CHECK           Overwrites the 'check' unit test parameter (see
                     docs/unittests.txt)
+    KVMTOOL         Path to kvmtool binary for ARCH-run
 EOF
 }
 
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 34f633cade01..5d840b72f8cb 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -457,7 +457,7 @@ search_kvmtool_binary ()
 {
 	local kvmtoolcmd kvmtool
 
-	for kvmtoolcmd in lkvm vm lkvm-static; do
+	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
 		if $kvmtoolcmd --help 2>/dev/null| grep -q 'The most commonly used'; then
 			kvmtool="$kvmtoolcmd"
 			break
-- 
2.47.1


