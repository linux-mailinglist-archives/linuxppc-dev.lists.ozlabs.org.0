Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634873F1EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:18:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YbS6It5/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqqfz6c3Zz3c1V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:18:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YbS6It5/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qqqb95zRgz2yx0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:17 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5703cb4bcb4so32844767b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835714; x=1690427714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g10wkISUfh+NWh/zmhT9FX+m3ZttfvdTUqPKBonJP24=;
        b=YbS6It5/jG4gj9GV1WnqlWfE48J9CdnxNvOxOEYb2jkpFBwkcijgogv5/2FTyBYSJu
         izIlhC4BKNDwS5s1e4kK9kflroiGbN+V3CM6t7L2EFgtcSkg+ReKLemBNYF5Y3oVXg4d
         FUK6TJROlYVwfl34r2gL5piZl88lZtnh5mJi4W6rFRki4guA/8D+KKFrkkfHcSu1EJOJ
         fncA5E4mKOaGZV6UHnLSf+mughQQ2/sG6vdU9OT//BnRvDPbrV7dVSZuLKiGxg9g4JB4
         L4rqAG2yhTX1HWLW8k7KKi4wHWH5luhyXPrJQJ+E2hOyRozoqBZDlMJstEk3Y4X/0/Xj
         8nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835714; x=1690427714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g10wkISUfh+NWh/zmhT9FX+m3ZttfvdTUqPKBonJP24=;
        b=V2rNlxGi7CvK4SKPXSGwzDkoGc0/I95Uly6J66NOYYVC1aYAaP8AyOUaAf/6VdLZw0
         SrtGe36srS/bsjq54l1rn4evKioBxBXUra2tknU2MO0TcrozZF3m2qieg0JAUUdUpU3P
         j34U4l0+x3NgVna3z5A2TRhz5rRIqX0sHdXSlBBMh8/mAqccw1U7RlPFasDcCMBxm99v
         6hqfmNW8kpmNtOSeQyEjVkLkkpjLt5mxKOioQyMCjw9RTTSpXi/SJahSI58zoI57qy9+
         JYv1EcXTmMMeDLW9WKKwCm750+bb1HNmCwSlkXgIgrR0r/pkaZ8dRBh+TBL+XIS0Cixz
         4q7w==
X-Gm-Message-State: AC+VfDzKVyYz1Aj4zQbz/3gE6OfwRU5yQGkOQIS+gaujAgjnSb+rMI5h
	S+Ee/JPSIMtb0TodDoCGETE=
X-Google-Smtp-Source: ACHHUZ4trddfgXzjmNYnvfIX3UyOWVfVwt64/0k1X+1Ib62f54dPN/U9UUyskS0pcHiYwtqCWDYcTQ==
X-Received: by 2002:a81:4e44:0:b0:56f:ff55:2b74 with SMTP id c65-20020a814e44000000b0056fff552b74mr21585770ywb.37.1687835714203;
        Mon, 26 Jun 2023 20:15:14 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:13 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 03/33] pgtable: Create struct ptdesc
Date: Mon, 26 Jun 2023 20:14:01 -0700
Message-Id: <20230627031431.29653-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5063b482e34f..d46cb709ce08 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
 #endif /* CONFIG_MMU */
 
+
+/**
+ * struct ptdesc -    Memory descriptor for page tables.
+ * @__page_flags:     Same as page flags. Unused for page tables.
+ * @pt_rcu_head:      For freeing page table pages.
+ * @pt_list:          List of used page tables. Used for s390 and x86.
+ * @_pt_pad_1:        Padding that aliases with page's compound head.
+ * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
+ * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap only.
+ * @pt_mm:            Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
+ * @ptl:              Lock for the page table.
+ * @__page_type:      Same as page->page_type. Unused for page tables.
+ * @_refcount:        Same as page refcount. Used for s390 page tables.
+ * @pt_memcg_data:    Memcg data. Tracked for page tables here.
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct rcu_head pt_rcu_head;
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long _pt_s390_gaddr;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+	};
+
+	union {
+		unsigned long _pt_pad_2;
+#if ALLOC_SPLIT_PTLOCKS
+		spinlock_t *ptl;
+#else
+		spinlock_t ptl;
+#endif
+	};
+	unsigned int __page_type;
+	atomic_t _refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long pt_memcg_data;
+#endif
+};
+
+#define TABLE_MATCH(pg, pt)						\
+	static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
+TABLE_MATCH(flags, __page_flags);
+TABLE_MATCH(compound_head, pt_list);
+TABLE_MATCH(compound_head, _pt_pad_1);
+TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
+TABLE_MATCH(mapping, _pt_s390_gaddr);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+TABLE_MATCH(rcu_head, pt_rcu_head);
+#ifdef CONFIG_MEMCG
+TABLE_MATCH(memcg_data, pt_memcg_data);
+#endif
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
-- 
2.40.1

