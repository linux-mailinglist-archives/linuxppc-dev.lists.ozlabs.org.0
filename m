Return-Path: <linuxppc-dev+bounces-9774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D3AE88B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5q34RVHz3blv;
	Thu, 26 Jun 2025 01:49:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866575;
	cv=none; b=Nf6V4KbIi7Tb+Ipl+z5UpJLtFNT0dvWcsIIr7zNsc4XMbz67j1Ar3wWoAvA25iskLrGF0gVEFt6mxAqcSzJxDzcCVynL+OdnH6d/cwtv4oHz2F3zLh2yFTNKBcQPaHEjN3fqWeFb0k9XzilLMUJXwq6iBaYFrvEH2NxBNTWGq6AeMPcZeqhVHES23JHidPDC5yK0WomvD3oZlas/WOyjdzLlTetD3uEWa657odH5PxvwUV3s995Rft8jgbiJag29SXp65PiSNGihhoi5k5kHpDfPNFGBsTwUD7m/iP2svXIPix7up5P4Wep0aIQHJ//oB/evPGepElta0ypw6j8LJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866575; c=relaxed/relaxed;
	bh=gylCuFhgejad1oVgb8O9JwGy73WohCYylFafnQGETrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQviQO/WYezf0bBh0ZWW3VbEUVUmsF1awcvQDxsfiR7Z0v4pXPG12680+rnlsFI6lLZYfxKoFZ45Sto5F9nHZtIpkQRwTMm3ohPj3J9/M4pfpxaxNcI6YjcOku2lhTrZwBkXTJp6Y9R1ujM9evN9aoOeDrfWSJF0YNik8Mo/3LUc0k1u1ybkJv/ljFCUSJnfhdYZ2aCFy4Lk14lEIPIAPowTxuSbP34z9pONggTRU2/RzgMKKAyMuMa00JqUn1mGTcgv/NxIameC8ASshm6m6070EQ2hFmdPjDS51+vX4KFyIGljdS9rmm8ztdbZClY+c+YKd6O8eS92DskLYqU2XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5q31HkJz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77FA5204C;
	Wed, 25 Jun 2025 08:48:46 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 479623F58B;
	Wed, 25 Jun 2025 08:49:00 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 08/13] scripts: Add KVMTOOL environment variable for kvmtool binary path
Date: Wed, 25 Jun 2025 16:48:08 +0100
Message-ID: <20250625154813.27254-9-alexandru.elisei@arm.com>
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

kvmtool is often used for prototyping new features, and a developer might
not want to install it system-wide. Add a KVMTOOL environment variable to
make it easier for tests to use a binary not in $PATH.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
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
index 354ce80fe3fa..c440f2162bac 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -369,7 +369,7 @@ search_kvmtool_binary ()
 {
 	local kvmtoolcmd kvmtool
 
-	for kvmtoolcmd in lkvm vm lkvm-static; do
+	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
 		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
 			kvmtool="$kvmtoolcmd"
 			break
@@ -378,6 +378,7 @@ search_kvmtool_binary ()
 
 	if [ -z "$kvmtool" ]; then
 		echo "A kvmtool binary was not found." >&2
+		echo "You can set a custom location by using the KVMTOOL=<path> environment variable." >&2
 		return 2
 	fi
 
-- 
2.50.0


