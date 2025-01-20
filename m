Return-Path: <linuxppc-dev+bounces-5408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11444A17078
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:44:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQb1vJYz30NN;
	Tue, 21 Jan 2025 03:44:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391479;
	cv=none; b=UTKawYIr77CtPuy7LTbvoQz/9sggHVbm0/Zl0bZIO/tO10z100/t2P1JI9mkxg2DUnhIjAy5xKG/X6z4366I5ysPq+0D43o8NCdt1aHYc0lVuJ2kuIrTcPC2S+ZG7xDMbG7oAU4+toM2PrANsgK1VcTOCKBDiZ8RLHKFv5lpjO8qUVveaoEHD6x6d1FrWoi9xYg8+Ib0f07QePOS2zze6wrFRCSFAcaC7qxXOmxSxUP+xqQ1JXOvB9/Q+30PiGBAz5vtadbc+75Fii2zJ9qUJPIUMvgYUCS51NaRncvL0nAX02Z/g2T3ADtOMK1ego+vfEkKwa4HE6IuIS0kinQsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391479; c=relaxed/relaxed;
	bh=vmO365WN4OVZ9bpIXoW6GYZCT+s9WrRqv46INlLHilg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfQWaC0SWOeYNZf2LgmdCmP9it+0rucFa7ST6TLHAe6q+51pHRT95Sg/U47aZSlH4LC0nd6EQRCpt7Xwjs5gce0VDzqa9Grwztv0WL+sr9w/M713Sf/vi8Ny9pIuI0aEbqZ/yyrLSvaZ3lylt6dgWwt3t0XKseqvnR+IN/Hi0Q8b34qkdsPL5ol4UfltUC0xRFg5mjacbGNQcEYgz8/EcPCSVc3fk7KKQreR11FZFm5crkFYHEHMmZ0KzqKmuMNQudcaCJo1/ut7NlmIcLvvTN5//StSlwTeJX3vShH0WId8EIir5CuZpPwAkMC/rXGqk8Bn/oDTAXrHfeUMT9bgIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQZ4PLkz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7381CE0;
	Mon, 20 Jan 2025 08:44:28 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D993F5A1;
	Mon, 20 Jan 2025 08:43:56 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 08/18] scripts/runtime: Detect kvmtool failure in premature_failure()
Date: Mon, 20 Jan 2025 16:43:06 +0000
Message-ID: <20250120164316.31473-9-alexandru.elisei@arm.com>
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

kvm-unit-tests assumes that if the VMM is able to get to where it tries to
load the kernel, then the VMM and the configuration parameters will also
work for running the test. All of this is done in premature_failure().

Teach premature_failure() about the kvmtool's error message when it fails
to load the dummy kernel.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 451b5585f010..ee8a188b22ce 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -12,18 +12,27 @@ extract_summary()
     tail -5 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
 }
 
-# We assume that QEMU is going to work if it tried to load the kernel
+# We assume that the VMM is going to work if it tried to load the kernel
 premature_failure()
 {
     local log
 
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
-    echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-                -e "error loading" \
-                -e "failed to load" &&
-        return 1
+    case "$TARGET" in
+    qemu)
+
+        echo "$log" | grep "_NO_FILE_4Uhere_" |
+            grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+                    -e "error loading" \
+                    -e "failed to load" &&
+            return 1
+        ;;
+    kvmtool)
+        echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
+            return 1
+        ;;
+    esac
 
     RUNTIME_log_stderr <<< "$log"
 
-- 
2.47.1


