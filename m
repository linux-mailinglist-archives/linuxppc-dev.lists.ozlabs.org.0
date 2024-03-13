Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA487B3F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:54:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwuhqsf6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwuhqsf6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw46d3gPpz3vw6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:54:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwuhqsf6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwuhqsf6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yh1JVFz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3/QtZ/X4uy5vGDlYUaKemCeea0qTqCUbzq3qEDmZ7g=;
	b=iwuhqsf6M3TDwFA3A2j//7FTiFBJO7XC5jMzwZgH4JRQlSxng2x6VwvF2sweafVBsVp51D
	viE9hM3tkgpEzEOxMuVeOrWGX4eiV0T0MmyHF1wOWh6CgUPTvrNOnl5LyAYSHfrvVtQmC1
	5urzqw3paS1UuL9F+BtpBDIM1jXpcjI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3/QtZ/X4uy5vGDlYUaKemCeea0qTqCUbzq3qEDmZ7g=;
	b=iwuhqsf6M3TDwFA3A2j//7FTiFBJO7XC5jMzwZgH4JRQlSxng2x6VwvF2sweafVBsVp51D
	viE9hM3tkgpEzEOxMuVeOrWGX4eiV0T0MmyHF1wOWh6CgUPTvrNOnl5LyAYSHfrvVtQmC1
	5urzqw3paS1UuL9F+BtpBDIM1jXpcjI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-DEUFg5xlMq2RXfBOVr9SEA-1; Wed, 13 Mar 2024 17:47:35 -0400
X-MC-Unique: DEUFg5xlMq2RXfBOVr9SEA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6912513fc7bso1699556d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366455; x=1710971255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3/QtZ/X4uy5vGDlYUaKemCeea0qTqCUbzq3qEDmZ7g=;
        b=AhqGDMtpXd503PVyAXxG8E6WbMQi8aBAo4OTymLNboHyrIEpZLoNsJVEV9/a4Kn/u1
         0VDDsNC64SiF2tvyeK23TtPNbFJEFNe+LQNWZJypfZ9OJlEJTKZHxpCOBbtIGwHe6YP3
         f5zmgCwGoONCger11b9aGqlY9TQs7zBGj8IMS1muQdtjg7r0ofsKbKUs0VDnbt4D2Xi1
         Vdb9mtoylfal+LCAyWD3hLsCookejatjm+gd2ZXf+4X2EQtnXUgXXJxF3AOXazz9D0Nu
         kjLL6Mx2K5Ns/eFCzm5c7b27uD0kxLT7d2781vDwhNWWvc0OwTIEX6ESPVdZlhmjcJqY
         ClVg==
X-Forwarded-Encrypted: i=1; AJvYcCWPfBnXjp8g4e0bBOkdf55Xsw6EljAcplHilLsA5Kdlj4Z93vPFXr2GL25NSD2DKM4mAAQa1WWVC1TIjqGrbdXavmjJy+LrCn4yg+nc6Q==
X-Gm-Message-State: AOJu0YwJy2/0jEHkIyrZ/F+v7jxHPfRReFmW2z32XLJ0UoGWZaFy7mta
	QJeOoOpFOulFDBnWoBfVxvKQVykzqy7xSvWPim0cTHuN1Ug0c9POJQO6+rcgiUiUB0jRwk0umZQ
	lF4yO9IvQ3LfTkdKXsxeOmZ24gyAxHmInrq3jlJjX4oTvN9W9kpZZgEXbHSBDX/s=
X-Received: by 2002:a05:6214:2c:b0:690:c12f:9750 with SMTP id b12-20020a056214002c00b00690c12f9750mr2845121qvr.4.1710366455044;
        Wed, 13 Mar 2024 14:47:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/h1WlE9AZBGc/IXZwL3Hjjpc9ZAcuTEVAooWtSlvbi8OV5VzFu9Jid1QvxHh3VTvOYBscJA==
X-Received: by 2002:a05:6214:2c:b0:690:c12f:9750 with SMTP id b12-20020a056214002c00b00690c12f9750mr2845108qvr.4.1710366454748;
        Wed, 13 Mar 2024 14:47:34 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:34 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Date: Wed, 13 Mar 2024 17:47:15 -0400
Message-ID: <20240313214719.253873-10-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313214719.253873-1-peterx@redhat.com>
References: <20240313214719.253873-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

PowerPC book3s 4K mostly has the same definition on both, except pXd_huge()
constantly returns 0 for hash MMUs.  As Michael Ellerman pointed out [1],
it is safe to check _PAGE_PTE on hash MMUs, as the bit will never be set so
it will keep returning false.

As a reference, __p[mu]d_mkhuge() will trigger a BUG_ON trying to create
such huge mappings for 4K hash MMUs.  Meanwhile, the major powerpc hugetlb
pgtable walker __find_linux_pte() already used pXd_leaf() to check hugetlb
mappings.

The goal should be that we will have one API pXd_leaf() to detect all kinds
of huge mappings.  AFAICT we need to use the pXd_leaf() impl (rather than
pXd_huge() ones) to make sure ie. THPs on hash MMU will also return true.

This helps to simplify a follow up patch to drop pXd_huge() treewide.

NOTE: *_leaf() definition need to be moved before the inclusion of
asm/book3s/64/pgtable-4k.h, which defines pXd_huge() with it.

[1] https://lore.kernel.org/r/87v85zo6w7.fsf@mail.lhotse

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 .../include/asm/book3s/64/pgtable-4k.h        | 14 ++--------
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 27 +++++++++----------
 2 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index 48f21820afe2..92545981bb49 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -8,22 +8,12 @@
 #ifdef CONFIG_HUGETLB_PAGE
 static inline int pmd_huge(pmd_t pmd)
 {
-	/*
-	 * leaf pte for huge page
-	 */
-	if (radix_enabled())
-		return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-	return 0;
+	return pmd_leaf(pmd);
 }
 
 static inline int pud_huge(pud_t pud)
 {
-	/*
-	 * leaf pte for huge page
-	 */
-	if (radix_enabled())
-		return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-	return 0;
+	return pud_leaf(pud);
 }
 
 /*
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index df66dce8306f..fd7180fded75 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -262,6 +262,18 @@ extern unsigned long __kernel_io_end;
 
 extern struct page *vmemmap;
 extern unsigned long pci_io_base;
+
+#define pmd_leaf pmd_leaf
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
+}
+
+#define pud_leaf pud_leaf
+static inline bool pud_leaf(pud_t pud)
+{
+	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
+}
 #endif /* __ASSEMBLY__ */
 
 #include <asm/book3s/64/hash.h>
@@ -1436,20 +1448,5 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
-/*
- * Like pmd_huge(), but works regardless of config options
- */
-#define pmd_leaf pmd_leaf
-static inline bool pmd_leaf(pmd_t pmd)
-{
-	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-}
-
-#define pud_leaf pud_leaf
-static inline bool pud_leaf(pud_t pud)
-{
-	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-}
-
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
-- 
2.44.0

