Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C387EAE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:26:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y83Cv5wk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y83Cv5wk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyxxh4zwdz3vnq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y83Cv5wk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y83Cv5wk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyxrW1hhxz3dBn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:22:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKTxTfeu0kP46EkkGNeeOEWSSdSnmFAW9kbc1VMhmsg=;
	b=Y83Cv5wkiorA1HXvLzZ4MyOYOeMwOWDXgObv8zt/wmsdK7v3dZ+i1dKf01OVYTztXPsgEE
	g76FrCSIpclYYZM9RPT+N8UkjD14GwqOH07tWhuHrvvUfymzwVtuYhjE+L0W0CxQaX5r9G
	Y74uJL7qK5Bgx2RisKww3YfEWGxdzik=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKTxTfeu0kP46EkkGNeeOEWSSdSnmFAW9kbc1VMhmsg=;
	b=Y83Cv5wkiorA1HXvLzZ4MyOYOeMwOWDXgObv8zt/wmsdK7v3dZ+i1dKf01OVYTztXPsgEE
	g76FrCSIpclYYZM9RPT+N8UkjD14GwqOH07tWhuHrvvUfymzwVtuYhjE+L0W0CxQaX5r9G
	Y74uJL7qK5Bgx2RisKww3YfEWGxdzik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-GqW5-K1AMTGX1X-eXiw5PA-1; Mon, 18 Mar 2024 10:22:12 -0400
X-MC-Unique: GqW5-K1AMTGX1X-eXiw5PA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBA65101A588;
	Mon, 18 Mar 2024 14:22:11 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB3EC492BC4;
	Mon, 18 Mar 2024 14:22:08 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH 6/6] mm/mm_init.c: remove arch_reserved_kernel_pages()
Date: Mon, 18 Mar 2024 22:21:38 +0800
Message-ID: <20240318142138.783350-7-bhe@redhat.com>
In-Reply-To: <20240318142138.783350-1-bhe@redhat.com>
References: <20240318142138.783350-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: Baoquan He <bhe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the current calculation of calc_nr_kernel_pages() has taken into
consideration of kernel reserved memory, no need to have
arch_reserved_kernel_pages() any more.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/include/asm/mmu.h |  4 ----
 arch/powerpc/kernel/fadump.c   |  5 -----
 include/linux/mm.h             |  3 ---
 mm/mm_init.c                   | 12 ------------
 4 files changed, 24 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 3b72c7ed24cf..aa5c0fd5edb1 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -406,9 +406,5 @@ extern void *abatron_pteptrs[2];
 #include <asm/nohash/mmu.h>
 #endif
 
-#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
-#define __HAVE_ARCH_RESERVED_KERNEL_PAGES
-#endif
-
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_MMU_H_ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index d14eda1e8589..ae8c7619e597 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1735,8 +1735,3 @@ static void __init fadump_reserve_crash_area(u64 base)
 		memblock_reserve(mstart, msize);
 	}
 }
-
-unsigned long __init arch_reserved_kernel_pages(void)
-{
-	return memblock_reserved_size() / PAGE_SIZE;
-}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1888b1935103..8147b1302413 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3221,9 +3221,6 @@ static inline void show_mem(void)
 extern long si_mem_available(void);
 extern void si_meminfo(struct sysinfo * val);
 extern void si_meminfo_node(struct sysinfo *val, int nid);
-#ifdef __HAVE_ARCH_RESERVED_KERNEL_PAGES
-extern unsigned long arch_reserved_kernel_pages(void);
-#endif
 
 extern __printf(3, 4)
 void warn_alloc(gfp_t gfp_mask, nodemask_t *nodemask, const char *fmt, ...);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9ed4b9e77c4a..370a057dae97 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2383,17 +2383,6 @@ void __init page_alloc_init_late(void)
 	page_alloc_sysctl_init();
 }
 
-#ifndef __HAVE_ARCH_RESERVED_KERNEL_PAGES
-/*
- * Returns the number of pages that arch has reserved but
- * is not known to alloc_large_system_hash().
- */
-static unsigned long __init arch_reserved_kernel_pages(void)
-{
-	return 0;
-}
-#endif
-
 /*
  * Adaptive scale is meant to reduce sizes of hash tables on large memory
  * machines. As memory size is increased the scale is also increased but at
@@ -2436,7 +2425,6 @@ void *__init alloc_large_system_hash(const char *tablename,
 	if (!numentries) {
 		/* round applicable memory size up to nearest megabyte */
 		numentries = nr_kernel_pages;
-		numentries -= arch_reserved_kernel_pages();
 
 		/* It isn't necessary when PAGE_SIZE >= 1MB */
 		if (PAGE_SIZE < SZ_1M)
-- 
2.41.0

