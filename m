Return-Path: <linuxppc-dev+bounces-4980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0BDA092CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 15:00:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3Fk3H0qz3cXK;
	Sat, 11 Jan 2025 01:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517626;
	cv=none; b=KZ23Yx6yINJcGw9CItLMXSEW/d2H61T+3+8q75WkkwpzWNVq/QivpYUM+GaFd13X90AlJuKP1DmZx7jebZ7Qr4Yb+JRk8skYIh8fc+UCT8mEYTlHO0Kl2z0JTGKMkbc/dUjw/5UFnqsUV+VrvRdxZqBzKA2qon2NZe/bVk+zScBIu1SrYPjde9WXX37vgEhSBysL5HtmnV58C9dibI4WtA/uSQtNs6dh8nhlY0rMeufFqa5K4ppWGj/RC2dJeOsLRr8DTu2fQNFldpg5UYYJBOrGHo2i0xWDHyo7x/NSbgD0191O2gB/vzmwg1sFpp7DwYL/InBwXvfyXgZ0BZ2pUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517626; c=relaxed/relaxed;
	bh=KSoIec1R/SRtUgrDqE+pZg7SgJWjF3pBJ9DfT7zQTno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnYfJLV00MAvuj8idBvC69ohnN9n3b2gE/bFOm1ZazJwt9N1FRK0oxAznd8jdqyLzv1nv30rqBlP7X0Z0ZO7klkqQoiLmwlJ4hgAjUNPrKIhK2NrZXQilWhW9PMw8n7M0rH6126uFrW9YlbkgXfcotPujkzlaDtPe3xXPng6SaVibEP3A+aDfa339zVMoEi6NceHcc4DZHmmPQ1/RVIgubog+4HjSrguBcGsmib0ZFN/ZeOrSGTWsQzSAsi0nZyDcnkH5FwBZ/Z6DzVxfq1/vcwVk4NUuB3ox2gkuqR/84l6yoz2sc0jeJWRla3FQk9EoNJNlGtUEfAs0LrZ0fhukQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3Fj47j5z3cWY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 01:00:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67DF1FCD;
	Fri, 10 Jan 2025 05:59:57 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825AB3F59E;
	Fri, 10 Jan 2025 05:59:27 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v1 5/5] configure: arm64: Make 'max' the default for --processor
Date: Fri, 10 Jan 2025 13:58:48 +0000
Message-ID: <20250110135848.35465-6-alexandru.elisei@arm.com>
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

Newer architecture features are supported by qemu TCG on newer CPUs. When
writing a test for such architecture features, it is necessary to pass the
correct -cpu argument to qemu. Make it easier on users and test authors
alike by making 'max' the default value for --processor. The 'max' CPU
model contains all the features of the cortex-a57 CPU (the old default), so
no regression should be possible.

A side effect is that, by default, the compiler will not receive a -mcpu
argument for compiling the code. The expectation is that this is fine,
since support for -mcpu=$PROCESSOR has only been added for arm64 in the
last commit.

The default for arm (cortex-a15) has been kept unchanged, because passing
--processor=max will cause compilation to break. If the user wants the qemu
CPU model to be 'max', the user will also have to supply a suitable compile
CPU target via --cflags=-mcpu=<cpu> configure option.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 46964d36a7d8..3ab0ec208e10 100755
--- a/configure
+++ b/configure
@@ -14,7 +14,7 @@ function get_default_processor()
         default_processor="cortex-a15"
         ;;
     "arm64" | "aarch64")
-        default_processor="cortex-a57"
+        default_processor="max"
         ;;
     *)
         default_processor=$arch
-- 
2.47.1


