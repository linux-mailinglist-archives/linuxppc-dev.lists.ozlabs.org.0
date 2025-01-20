Return-Path: <linuxppc-dev+bounces-5413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB2A17086
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQd72MGz30TF;
	Tue, 21 Jan 2025 03:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391481;
	cv=none; b=gT13TWK0c2itfCs6e12132FgFgrNoMvMZPtP/ASbiFrCMXjFcM5KHJJ6+9cCFTLlPnmixtcLbvvWq1ecW1X1456A447jxgpEjRqgPJdOlqdm24D7EgpngNVtg10IneO/+uZ7FP08xh9VsGhr4WQxwgmLGXNjS8n1jSSLhXFAfSdscj/rZp0TLmusSLfv+LhBaxTS3Vn7FOIpZqpRdWIdoZbWvSP6930GMU9j6/0C8iCNOUpJBJL6R5bLqgsSnLlDoe5/lsBWi5rTvfmw1h6LciLuwMmkxFImkidI4ay6LMIhncGpejqYmEL03kKiUtjAwagcxztQiCWeDuUNJXWdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391481; c=relaxed/relaxed;
	bh=Covy4ohUeUbKrP+MFrG9ZkNQFDNSrogc3HRamWbj47U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXd8TowY/0+X6sMOchGOM+r3X4z3y3U9baTkkVipiVtcA1325aY+TaBSkFPNz7aJRXGfSOJHqsM8yUx9PZJ1eb2RcbO/DWTcfUpeWIjr2L9ZsPEKnk5X504xgBF2MGsRx6SvpihtrPDyR5Sf5auMBTwnyBS4PtWz34Pa044A9vbK1G2NYaJfGYEdRxo5tSxnd4X2AHkjSzQE1KbH5kjOZdEAe49Uikl0MlLa87bH/STbO/cPh7PsBi0HLeeSPudGzMkyQARRdDEPbYMj02bJmDIixCCMB0z9Dmslj7ZogtHbCS/srwelwLXGDxWwNAHrSu8Nu031Jf7LVKbzZBCo1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQd378Sz30T3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 272631D13;
	Mon, 20 Jan 2025 08:44:32 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 837D33F5A1;
	Mon, 20 Jan 2025 08:44:00 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 09/18] scripts/runtime: Skip test when kvmtool and $accel is not KVM
Date: Mon, 20 Jan 2025 16:43:07 +0000
Message-ID: <20250120164316.31473-10-alexandru.elisei@arm.com>
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

kvmtool, unlike qemu, cannot emulate a different architecture than the
host's, and as a result the only $accel parameter it can support is 'kvm'.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index ee8a188b22ce..55d58eef9c7c 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -153,6 +153,11 @@ function run()
         accel="$ACCEL"
     fi
 
+    if [[ "$TARGET" = kvmtool ]] && [[ -n "$accel" ]] && [[ "$accel" != "kvm" ]]; then
+        print_result "SKIP" $testname "" "kvmtool does not support $accel"
+        return 2
+    fi
+
     # check a file for a particular value before running a test
     # the check line can contain multiple files to check separated by a space
     # but each check parameter needs to be of the form <path>=<value>
-- 
2.47.1


