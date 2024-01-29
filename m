Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F78408B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 15:39:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ilKzGA6K;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ilKzGA6K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNrXb27PZz3vld
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ilKzGA6K;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ilKzGA6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNrPp37sxz3cVV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:33:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hD+wJlVoYoeun3CtWSKYM8LYSFldaYp0TLUcFe85aZ0=;
	b=ilKzGA6K83NT3nPIrZV4TtwoXIn+0F9L3vwpSpwm99ekN9fNyi67UXWWX4kQ7Pr7wJyx8h
	FIMzE77KeUMy7JJrOP6MZRFKRf2+IsxBjNXSbyzZYXhDxqKI5iaCy5UVn2v96Z1tH05KSf
	BcY7H5RCJIwBgk4lMN5wBD35HxmkTH8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hD+wJlVoYoeun3CtWSKYM8LYSFldaYp0TLUcFe85aZ0=;
	b=ilKzGA6K83NT3nPIrZV4TtwoXIn+0F9L3vwpSpwm99ekN9fNyi67UXWWX4kQ7Pr7wJyx8h
	FIMzE77KeUMy7JJrOP6MZRFKRf2+IsxBjNXSbyzZYXhDxqKI5iaCy5UVn2v96Z1tH05KSf
	BcY7H5RCJIwBgk4lMN5wBD35HxmkTH8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-0ZkSAIR7N62aRzlXnFbltw-1; Mon,
 29 Jan 2024 09:33:09 -0500
X-MC-Unique: 0ZkSAIR7N62aRzlXnFbltw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88CF43C13A9D;
	Mon, 29 Jan 2024 14:33:07 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1D40AD1;
	Mon, 29 Jan 2024 14:33:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/9] mm/mmu_gather: add tlb_remove_tlb_entries()
Date: Mon, 29 Jan 2024 15:32:20 +0100
Message-ID: <20240129143221.263763-9-david@redhat.com>
In-Reply-To: <20240129143221.263763-1-david@redhat.com>
References: <20240129143221.263763-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's add a helper that lets us batch-process multiple consecutive PTEs.

Note that the loop will get optimized out on all architectures except on
powerpc. We have to add an early define of __tlb_remove_tlb_entry() on
ppc to make the compiler happy (and avoid making tlb_remove_tlb_entries() a
macro).

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/tlb.h |  2 ++
 include/asm-generic/tlb.h      | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index b3de6102a907..1ca7d4c4b90d 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -19,6 +19,8 @@
 
 #include <linux/pagemap.h>
 
+static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
+					  unsigned long address);
 #define __tlb_remove_tlb_entry	__tlb_remove_tlb_entry
 
 #define tlb_flush tlb_flush
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 428c3f93addc..bd00dd238b79 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -616,6 +616,26 @@ static inline void tlb_flush_p4d_range(struct mmu_gather *tlb,
 		__tlb_remove_tlb_entry(tlb, ptep, address);	\
 	} while (0)
 
+/**
+ * tlb_remove_tlb_entries - remember unmapping of multiple consecutive ptes for
+ *			    later tlb invalidation.
+ *
+ * Similar to tlb_remove_tlb_entry(), but remember unmapping of multiple
+ * consecutive ptes instead of only a single one.
+ */
+static inline void tlb_remove_tlb_entries(struct mmu_gather *tlb,
+		pte_t *ptep, unsigned int nr, unsigned long address)
+{
+	tlb_flush_pte_range(tlb, address, PAGE_SIZE * nr);
+	for (;;) {
+		__tlb_remove_tlb_entry(tlb, ptep, address);
+		if (--nr == 0)
+			break;
+		ptep++;
+		address += PAGE_SIZE;
+	}
+}
+
 #define tlb_remove_huge_tlb_entry(h, tlb, ptep, address)	\
 	do {							\
 		unsigned long _sz = huge_page_size(h);		\
-- 
2.43.0

