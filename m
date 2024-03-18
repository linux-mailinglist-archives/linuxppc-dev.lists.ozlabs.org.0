Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A987F0F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:10:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6WNaJJu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6WNaJJu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5ZJ0mDGz3vv6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6WNaJJu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6WNaJJu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RF5mxmz3dVj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vy04FBLzPG5Zls0F5g74nprsAX71rsrg1jdch17dleE=;
	b=D6WNaJJuaJzZ/z/klT1RNOWAYRu5zRbBXDZ+uPPTWzH3fkJ+ZDyTcvOXpqhQr7BzLinklE
	wExxIcQhIqCAw06zbrp9FY7X73dAYizqfkZYfmDnH3Gztwfo7taH4YWwdMqSkgzOTJktiM
	yiBv+QyroXnjdkvP9L5Neg+nfiRhtFg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vy04FBLzPG5Zls0F5g74nprsAX71rsrg1jdch17dleE=;
	b=D6WNaJJuaJzZ/z/klT1RNOWAYRu5zRbBXDZ+uPPTWzH3fkJ+ZDyTcvOXpqhQr7BzLinklE
	wExxIcQhIqCAw06zbrp9FY7X73dAYizqfkZYfmDnH3Gztwfo7taH4YWwdMqSkgzOTJktiM
	yiBv+QyroXnjdkvP9L5Neg+nfiRhtFg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-vJRvOTJJNeeY-5D7OyJruw-1; Mon, 18 Mar 2024 16:04:20 -0400
X-MC-Unique: vJRvOTJJNeeY-5D7OyJruw-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42f30752eb4so15656671cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792260; x=1711397060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy04FBLzPG5Zls0F5g74nprsAX71rsrg1jdch17dleE=;
        b=r6S6d77R31EAk6WIazF8riaRHO5zTCsprKIqSMmbQC+0fzWma5LCNTP0dAAXEVcr6Q
         WJlJ5hVrszZx11kx4QJ86JpouJb9W9qtAsCUh4fu1chz1mV35fAk7tktbpiYZhlAPZYQ
         62MeHbyeF+d+zDoIJ3kozOy2QKwAmkFg+UnGHkzMZMp4aVRpC6QLM2MXNdpIgyTZs4yK
         8QL6VPvLtfDCbKdR1HkNpkwxaNMFfVOZ9X8LmB2BLgKxjXMXB7fq8Ce506QtcmFa04IM
         rUJDqKizc/3GEjX+21HzpVOUT3XD6qHAktwm8OI70WA+H1DYsvkx3YqSTbyy4lehYI/b
         nskw==
X-Forwarded-Encrypted: i=1; AJvYcCXiXoZGZ4ATM661qU1qt4E7fgjjjBzQkYF4ofcMj3j8tKaMsMrsocapvLAhc5ijXOui91VK3AIASjp8KrvnA8l10QrIyTGj80IpJ6OCHQ==
X-Gm-Message-State: AOJu0Yy+OAr1Goo5opftRbRBUO0r2Y3Djr3o/MTOGCMOrKEJ2dlJBOgI
	c2/XaZHc3b6uioeeTpGHyTSXwDqVIhn+9hK8SbFbI5cLev11B9Komu5EysrJ+5ch0Lb1LK466C5
	IsCARec+DLvZCRrCS4WKtlbB30gJpAgAZI9CUN2HbR5qjDlhEevGvw0OT0E6MwQ4=
X-Received: by 2002:ac8:4c86:0:b0:430:c314:d150 with SMTP id j6-20020ac84c86000000b00430c314d150mr275842qtv.6.1710792259897;
        Mon, 18 Mar 2024 13:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpXWUncergFjfMSFDTE8/2jUGQ81NOYysiHRDsucc9G0cV8OOvdubCssw9QQ67SSZupi5Ulw==
X-Received: by 2002:ac8:4c86:0:b0:430:c314:d150 with SMTP id j6-20020ac84c86000000b00430c314d150mr275803qtv.6.1710792259416;
        Mon, 18 Mar 2024 13:04:19 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:19 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 09/14] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Date: Mon, 18 Mar 2024 16:03:59 -0400
Message-ID: <20240318200404.448346-10-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, Nicholas Piggin <npiggin@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

PowerPC book3s 4K mostly has the same definition on both, except pXd_huge()
constantly returns 0 for hash MMUs.  As Michael Ellerman pointed out [1],
it is safe to check _PAGE_PTE on hash MMUs, as the bit will never be set so
it will keep returning false.

As a reference, __p[mu]d_mkhuge() will trigger a BUG_ON trying to create
such huge mappings for 4K hash MMUs.  Meanwhile, the major powerpc hugetlb
pgtable walker __find_linux_pte() already used pXd_leaf() to check leaf
hugetlb mappings.

The goal should be that we will have one API pXd_leaf() to detect all kinds
of huge mappings (hugepd is still special in this case, though).  AFAICT we
need to use the pXd_leaf() impl (rather than pXd_huge()'s) to make sure
ie. THPs on hash MMU will also return true.

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

