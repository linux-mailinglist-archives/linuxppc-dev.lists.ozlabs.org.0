Return-Path: <linuxppc-dev+bounces-4975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4097EA092C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 14:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3F62YCQz3cVs;
	Sat, 11 Jan 2025 00:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517594;
	cv=none; b=MvsPalU/QbNNX0eMVBH25Fu7KlpfKw2uOaaqn7suasyq04U4aAQXu08BMgYYwIsvbHBVuuyltJ7pNI3NCxXzBzw3rNTnYLdl7W7js27dE5A1oJjDK0tokuviNqNJZ7haYAgR7Neayk9RsfFbBjBuDqgO+Ngevsds+xzu4Jz7jPorK8NWb8R4gPEyPIaMrBkpQxgL4bxwyrkx9VFA2MNRnA74Dbg1YdT1O+8m7z8PpAYt3yfw25KS6EiVUcziAATbBGFSMoGoxQlxFviu5o2Fhucxd9qxnq+yifIb1qkMqLH2S/fZVo0s3mXfup4SdNMgziPdcVTYieBOJ0fSwgnpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517594; c=relaxed/relaxed;
	bh=zQxyWApcOSHuhDHHGNRpkQVlYsuwrizPx+8iWfJ37MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJVg9LWSAA9yWa14cNcbVnwYU5mKNfMUOxbBOhfn2iS/DZl6eHERkHy3jy+mHoeok5fVeLNxccyjUj09gInRpFz9oiUwuiA1/bQySZseeKwX5amid06GpNhQfLGaCOpmLd1k8sEaHmMrfHc0Za87LX00LHxSXXZt43zjBkNpszYS86I5yM/EnfLcwqXkOIGxmQDVMqbDylKvxLyJ6oQ5itsHeqhNoxhQwYIJWPb4eSkYWYvdECuEI9Cx3mJhpLH4Hzeuiv01k8kn4/bFBbce4yHQhevKGc+BlMTCJVwHWocvb/s48WdlKiGD656k7XXSQ5Qccr/xMBqhAJOQOJwUTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3F459Cmz3cCC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 00:59:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3461E32;
	Fri, 10 Jan 2025 05:59:48 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7AA83F59E;
	Fri, 10 Jan 2025 05:59:17 -0800 (PST)
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
Cc: kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v1 1/5] configure: Document that the architecture name 'aarch64' is also supported
Date: Fri, 10 Jan 2025 13:58:44 +0000
Message-ID: <20250110135848.35465-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
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

$arch, on arm64, defaults to 'aarch64', and later in the script is replaced
by 'arm64'. Intentional or not, document that the name 'aarch64' is also
supported when configuring for the arm64 architecture. This has been the
case since the initial commit that added support for the arm64
architecture, commit 39ac3f8494be ("arm64: initial drop").

The help text for --arch changes from*:

   --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64

to:

    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64

*Worth pointing out that the default architecture is 'aarch64', even though
the rest of the help text doesn't have it as one of the supported
architectures.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 86cf1da36467..5b0a2d7f39c0 100755
--- a/configure
+++ b/configure
@@ -47,7 +47,7 @@ usage() {
 
 	Options include:
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
-	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
+	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
 	    --processor=PROCESSOR  processor to compile for ($arch)
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
-- 
2.47.1


