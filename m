Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C0232067
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 16:32:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGwwk1dQ1zDqsx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 00:32:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=vdronov@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=K4lttHq2; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=K4lttHq2; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGvkS3JtDzDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 23:38:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596029879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DOXSjF+eq5ZVw1CXX2lEh2VQ/pA+DU53Mrk3FRb60nI=;
 b=K4lttHq2G868jGqtZmU4K6V+4Jcrk2SNJ7Q1Kk9+pFYlJ3tpirXCrVsE7/oMJGm1wdj0Bq
 va7Slu6yGKjaAHVLFHF1eBGoor9BmoqAgztupWcKXcsEkBTV9sEWuX+lM/+J6270LD3Lq2
 N6AaEqpQgN6BcynKJPpqHs8mvI1h8u4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596029879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DOXSjF+eq5ZVw1CXX2lEh2VQ/pA+DU53Mrk3FRb60nI=;
 b=K4lttHq2G868jGqtZmU4K6V+4Jcrk2SNJ7Q1Kk9+pFYlJ3tpirXCrVsE7/oMJGm1wdj0Bq
 va7Slu6yGKjaAHVLFHF1eBGoor9BmoqAgztupWcKXcsEkBTV9sEWuX+lM/+J6270LD3Lq2
 N6AaEqpQgN6BcynKJPpqHs8mvI1h8u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-6Tn0NpQkOoeqzxnBhHOXPQ-1; Wed, 29 Jul 2020 09:37:55 -0400
X-MC-Unique: 6Tn0NpQkOoeqzxnBhHOXPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D926879EC1;
 Wed, 29 Jul 2020 13:37:52 +0000 (UTC)
Received: from rules.brq.redhat.com (unknown [10.40.208.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 411956932E;
 Wed, 29 Jul 2020 13:37:49 +0000 (UTC)
From: Vladis Dronov <vdronov@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: fix function annotations to avoid section mismatch
 warnings with gcc-10
Date: Wed, 29 Jul 2020 15:37:41 +0200
Message-Id: <20200729133741.62789-1-vdronov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mailman-Approved-At: Thu, 30 Jul 2020 00:27:46 +1000
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Vladis Dronov <vdronov@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain warnings are emitted for powerpc code when building with a gcc-10
toolset:

    WARNING: modpost: vmlinux.o(.text.unlikely+0x377c): Section mismatch in
    reference from the function remove_pmd_table() to the function
    .meminit.text:split_kernel_mapping()
    The function remove_pmd_table() references
    the function __meminit split_kernel_mapping().
    This is often because remove_pmd_table lacks a __meminit
    annotation or the annotation of split_kernel_mapping is wrong.

Add the appropriate __init and __meminit annotations to make modpost not
complain. In all the cases there are just a single callsite from another
__init or __meminit function:

__meminit remove_pagetable() -> remove_pud_table() -> remove_pmd_table()
__init prom_init() -> setup_secure_guest()
__init xive_spapr_init() -> xive_spapr_disabled()

Signed-off-by: Vladis Dronov <vdronov@redhat.com>
---
 arch/powerpc/kernel/prom_init.c          | 4 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 arch/powerpc/sysdev/xive/spapr.c         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 90c604d00b7d..f6ca7f450361 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -3262,7 +3262,7 @@ static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
 /*
  * Call the Ultravisor to transfer us to secure memory if we have an ESM blob.
  */
-static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
+static void __init setup_secure_guest(unsigned long kbase, unsigned long fdt)
 {
 	int ret;
 
@@ -3292,7 +3292,7 @@ static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
 	}
 }
 #else
-static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
+static void __init setup_secure_guest(unsigned long kbase, unsigned long fdt)
 {
 }
 #endif /* CONFIG_PPC_SVM */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index bb00e0cba119..b868c07110e3 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -800,7 +800,7 @@ static void __meminit split_kernel_mapping(unsigned long addr, unsigned long end
 	pte_clear(&init_mm, addr, pte);
 }
 
-static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
+static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 			     unsigned long end)
 {
 	unsigned long next;
@@ -825,7 +825,7 @@ static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 	}
 }
 
-static void remove_pud_table(pud_t *pud_start, unsigned long addr,
+static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
 			     unsigned long end)
 {
 	unsigned long next;
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index f0551a2be9df..1e3674d7ea7b 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -768,7 +768,7 @@ static const u8 *get_vec5_feature(unsigned int index)
 	return vec5 + index;
 }
 
-static bool xive_spapr_disabled(void)
+static bool __init xive_spapr_disabled(void)
 {
 	const u8 *vec5_xive;
 
-- 
2.26.2

