Return-Path: <linuxppc-dev+bounces-8394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88269AAE436
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM65V2Cz30VF;
	Thu,  8 May 2025 01:14:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630866;
	cv=none; b=IccOAOytkgqq+21cPKArBtp4YNJ62K/d5KJUcYt7RemCWm+kDF0VcF9h3BhkDZLpxv8I5hzln2yWaxPwelA70USmzpALwpXqBJAg+oHTRFo0Q4027A+RmbphgLcwo9U49DfX+BHlBe1w6IjSQWT1XBrJfMKZSnT/+XdLMD45SoFLopnVsqvEUYCHWl70BK07S5DnZb6XAcIWg3D2PEGeSbiTqZspA7pRklA7pB9BbQnc7fHpJ1dLmvRJfOoggMlH8LL3qQ0c5wmz5l1BDrPx2Y9A8KqezF258lnWya6m+eg8n9TYtqhxgLeQsGJTahtHApnAqwu1Vc0VSYX7D7Ulig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630866; c=relaxed/relaxed;
	bh=H/nunFv7Na4VeDnCmkY4Ir6AmoOgLOBkj/kv+ihhRAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfuXCFjW16woM+FgsC4fq7nmIX82/8Rz1dzStpHaZUKbGZo3zcw/lIe5frvw6qMaz0v8YfChVWDlG6nHaWW4IaNbEXXYwnhrJiyqQ3WSdrhEMguJznGhhe6UzBjaqIUKdG5NqOhJC/tzLOb076YIGRSZDOAI6C8zec9A9vlhHvIqD5WrrwkJTJJ5fT94vMy/rREdIuPJF9OavEwih0acflulFB2k4dg3xZDVBlSiGHGIePcIaQ1hn2vYsyOoBfWBQM+Jq+KdD0NKRxrW1l2rTv+DizzUh5+wgpgjw22HV06vmhqHcYDSsewr3xifXzPoQB2F6Wa4Q6e5bIfx90FDMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM62NJ7z30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:14:26 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA4722D9;
	Wed,  7 May 2025 08:13:42 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E04B3F58B;
	Wed,  7 May 2025 08:13:49 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 11/16] scripts: Add KVMTOOL environment variable for kvmtool binary path
Date: Wed,  7 May 2025 16:12:51 +0100
Message-ID: <20250507151256.167769-12-alexandru.elisei@arm.com>
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

kvmtool is often used for prototyping new features, and a developer might
not want to install it system-wide. Add a KVMTOOL environment variable to
make it easier for tests to use a binary not in $PATH.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh          | 1 +
 scripts/arch-run.bash | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/run_tests.sh b/run_tests.sh
index dd9d27377905..150a06a91064 100755
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
index 8cf67e4f3b51..d4fc7116abbe 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -372,7 +372,7 @@ search_kvmtool_binary ()
 {
 	local kvmtoolcmd kvmtool
 
-	for kvmtoolcmd in lkvm vm lkvm-static; do
+	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
 		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
 			kvmtool="$kvmtoolcmd"
 			break
@@ -381,6 +381,7 @@ search_kvmtool_binary ()
 
 	if [ -z "$kvmtool" ]; then
 		echo "A kvmtool binary was not found." >&2
+		echo "You can set a custom location by using the KVMTOOL=<path> environment variable." >&2
 		return 2
 	fi
 
-- 
2.49.0


