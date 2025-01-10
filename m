Return-Path: <linuxppc-dev+bounces-4979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A13A092C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 15:00:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3FB4vwwz3cWw;
	Sat, 11 Jan 2025 00:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517598;
	cv=none; b=ohGl252YCyVoK6Usw3yefMpt0y4hUubGQblk7fT8IhJvlLscZ7Lq9gfOKNwsLF1YF+pgBf+81m/Rl5AKzzm43F1ozJ8md5SIERWxjsvRyE4JsCVZhUAS8YZ3ZlJ2arny7WabTxqYifDej3fKJOzuQofSm2IM6e90qi5qFv4WaxSkMQ8u2HVN1y7Cqb24+73uty5FgiMdUy6aIHHZt2kKwHDO1APpAhuukAXs/6NFXpfSLsGj+uU7OpAYOC05uhNfyh7hunXD5Qi/RcnHRii4ZcyFtOZem0fYfl8VjeYprrCC28qLaThoNOhxcFgaq+msNt/4mpIBsedHN0reS0H/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517598; c=relaxed/relaxed;
	bh=yypu9ec+B8EztyK87KbJswv+4PNCgpMJB2eIozJ8LRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idSGNPvOWd/gnMtdLyrCiARktOAAq46snG/3uBAAn6rjqd8QUjron9eca291IV3YWdxo1YANLU9LcMc6XsCkNh7iCy7nnB29xqplBkdJsGW7i/lvTfyes0cAiSkcgvFlURnCrRKaU4MFw9w8BNUjU/TWB8rdw95nknJftGgjXeYwyRVHfVUcVk9ZRbrmBrxxdGH35bZrrWMmwFqqFBysEjcj2nLkBOErdkpAi/mu6z6MJO8Wdr2Gs1kZz7lub/R4JLhzbbvxCJ22hCFhgpnL8KaStt6ed8rfX72vcuh113tMX+PmnqD7ukziSzgH+c+UIEWUElZhc+JvCaa6qW9y8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3FB0szBz3cD1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 00:59:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8033A1FC7;
	Fri, 10 Jan 2025 05:59:55 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6DF3F59E;
	Fri, 10 Jan 2025 05:59:24 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v1 4/5] arm/arm64: Add support for --processor=max
Date: Fri, 10 Jan 2025 13:58:47 +0000
Message-ID: <20250110135848.35465-5-alexandru.elisei@arm.com>
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

For arm64, newer architecture features are supported only on newer CPUs.
Instead of expecting the user to know which CPU model supports which
feature when using the TCG accelerator for qemu, let's make it easier and
add support for the --processor 'max' value.

The --processor value is passed to the compiler's -mcpu argument and to
qemu's -cpu argument. 'max' is a special value that only qemu understands -
it means that all CPU features that qemu implements are supported by the
guest CPU, and passing it to the compiler causes a build error. So omit the
-mcpu argument when $PROCESSOR=max.

This affects only the TCG accelerator; when using KVM or HVF,
kvm-unit-tests sets the cpu model to 'host'.

Note that using --processor=max with a 32 bit compiler will cause a build
error: the CPU model that the compiler defaults to when the -mcpu argument
is missing lacks support for some of the instructions that kvm-unit-tests
uses. The solution in the case is to specify a CPU model for the compiler
using --cflags:

  ./configure --arch=arm --processor=max --cflags=-mcpu=<cpu>

This patch doesn't introduce a regression for arm when --processor=max is
used, it's only the error that changes: from an unknown processor type to
using instructions that are not available on the processor.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/Makefile.common | 2 ++
 configure           | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index a5d97bcf477a..b757250dc9ae 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -25,7 +25,9 @@ AUXFLAGS ?= 0x0
 # stack.o relies on frame pointers.
 KEEP_FRAME_POINTER := y
 
+ifneq ($(PROCESSOR),max)
 CFLAGS += -mcpu=$(PROCESSOR)
+endif
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
diff --git a/configure b/configure
index 138840c3f76d..46964d36a7d8 100755
--- a/configure
+++ b/configure
@@ -67,7 +67,10 @@ usage() {
 	Options include:
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
-	    --processor=PROCESSOR  processor to compile for ($default_processor)
+	    --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
+	                           value 'max' is special and it will be passed directly to
+	                           qemu, bypassing the compiler. In this case, --cflags can be
+	                           used to compile for a specific processor.
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
-- 
2.47.1


