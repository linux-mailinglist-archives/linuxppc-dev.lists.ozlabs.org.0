Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C87FEE4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 12:55:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zm76AxhL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zm76AxhL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgvlL0BN1z3cSN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 22:55:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zm76AxhL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zm76AxhL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgr2C4yTFz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 20:08:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701335280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCYXs7UB826Rm6Vi+S+LrP8zq1r68p6FkKq2ErN2au4=;
	b=Zm76AxhLD+quOkgWE8Y72gxFNrgJFGhMyH5KABmZ9Ox3OO0LzTYXZjYAFa/BYnHHiP5GNo
	N92wMn3HuPQTlk40M2nUsfj7P8bLKuDvhlBtkDrLB6SAD5Kp+0mGaNN5plKCmOyxmyk13b
	7UBE+QMmzxu1b4hvJR+yL/a0xrwC5E4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701335280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCYXs7UB826Rm6Vi+S+LrP8zq1r68p6FkKq2ErN2au4=;
	b=Zm76AxhLD+quOkgWE8Y72gxFNrgJFGhMyH5KABmZ9Ox3OO0LzTYXZjYAFa/BYnHHiP5GNo
	N92wMn3HuPQTlk40M2nUsfj7P8bLKuDvhlBtkDrLB6SAD5Kp+0mGaNN5plKCmOyxmyk13b
	7UBE+QMmzxu1b4hvJR+yL/a0xrwC5E4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-1X-oQLimP5qYoreV94DJ6g-1; Thu,
 30 Nov 2023 04:07:56 -0500
X-MC-Unique: 1X-oQLimP5qYoreV94DJ6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4DC51C382AF;
	Thu, 30 Nov 2023 09:07:55 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB5DB1C060AE;
	Thu, 30 Nov 2023 09:07:55 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: Andrew Jones <andrew.jones@linux.dev>,
	kvmarm@lists.linux.dev
Subject: [kvm-unit-tests PATCH v1 02/18] powerpc: Replace the physical allocator with the page allocator
Date: Thu, 30 Nov 2023 04:07:04 -0500
Message-Id: <20231130090722.2897974-3-shahuang@redhat.com>
In-Reply-To: <20231130090722.2897974-1-shahuang@redhat.com>
References: <20231130090722.2897974-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 30 Nov 2023 22:53:06 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexandru Elisei <alexandru.elisei@arm.com>

The spapr_hcall test makes two page sized allocations using the physical
allocator. Replace the physical allocator with the page allocator, which
has has more features (like support for freeing allocations), and would
allow for further simplification of the physical allocator.

CC: Laurent Vivier <lvivier@redhat.com>
CC: Thomas Huth <thuth@redhat.com>
CC: kvm-ppc@vger.kernel.org
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 lib/powerpc/setup.c     | 9 ++++++---
 powerpc/Makefile.common | 1 +
 powerpc/spapr_hcall.c   | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 1be4c030..80fd38ae 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -15,6 +15,7 @@
 #include <devicetree.h>
 #include <alloc.h>
 #include <alloc_phys.h>
+#include <alloc_page.h>
 #include <argv.h>
 #include <asm/setup.h>
 #include <asm/page.h>
@@ -111,6 +112,7 @@ static void mem_init(phys_addr_t freemem_start)
 	struct mem_region primary, mem = {
 		.start = (phys_addr_t)-1,
 	};
+	phys_addr_t base, top;
 	int nr_regs, i;
 
 	nr_regs = dt_get_memory_params(regs, NR_MEM_REGIONS);
@@ -146,9 +148,10 @@ static void mem_init(phys_addr_t freemem_start)
 	__physical_start = mem.start;	/* PHYSICAL_START */
 	__physical_end = mem.end;	/* PHYSICAL_END */
 
-	phys_alloc_init(freemem_start, primary.end - freemem_start);
-	phys_alloc_set_minimum_alignment(__icache_bytes > __dcache_bytes
-					 ? __icache_bytes : __dcache_bytes);
+	base = PAGE_ALIGN(freemem_start) >> PAGE_SHIFT;
+	top = primary.end >> PAGE_SHIFT;
+	page_alloc_init_area(0, base, top);
+	page_alloc_ops_enable();
 }
 
 void setup(const void *fdt)
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index f8f47490..ae70443a 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -34,6 +34,7 @@ include $(SRCDIR)/scripts/asm-offsets.mak
 cflatobjs += lib/util.o
 cflatobjs += lib/getchar.o
 cflatobjs += lib/alloc_phys.o
+cflatobjs += lib/alloc_page.o
 cflatobjs += lib/alloc.o
 cflatobjs += lib/devicetree.o
 cflatobjs += lib/migrate.o
diff --git a/powerpc/spapr_hcall.c b/powerpc/spapr_hcall.c
index e9b5300a..77ab4187 100644
--- a/powerpc/spapr_hcall.c
+++ b/powerpc/spapr_hcall.c
@@ -8,6 +8,7 @@
 #include <libcflat.h>
 #include <util.h>
 #include <alloc.h>
+#include <alloc_page.h>
 #include <asm/hcall.h>
 #include <asm/processor.h>
 
@@ -58,8 +59,8 @@ static void test_h_page_init(int argc, char **argv)
 	if (argc > 1)
 		report_abort("Unsupported argument: '%s'", argv[1]);
 
-	dst = memalign(PAGE_SIZE, PAGE_SIZE);
-	src = memalign(PAGE_SIZE, PAGE_SIZE);
+	dst = alloc_page();
+	src = alloc_page();
 	if (!dst || !src)
 		report_abort("Failed to alloc memory");
 
-- 
2.40.1

