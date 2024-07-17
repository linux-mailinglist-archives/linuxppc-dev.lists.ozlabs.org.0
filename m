Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E2934490
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:06:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZJZGZQI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JfQlVEUV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPVPf19sHz3dHM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:05:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZJZGZQI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JfQlVEUV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPVKm1mwyz3dGt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 08:02:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ8eA1hPxoK8G44ES49PoyN6H9fuen7ZiOJ63tJzju0=;
	b=UZJZGZQI5N1saBiwJ6j2rxTh3Yq5/Dk89IZ2y4ngk+myHoaK8F2cL9hwSfgTA3IrXvlp7v
	jh7NHmDlvCue842vJv/i6yQkbqPYA5fQ7/N5A5qIy0XKGdzoaIXkiCEsDNuRyrUbM7UXsi
	7SARwxd+DhCPjKxII/5Fha8mHP0ek8Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ8eA1hPxoK8G44ES49PoyN6H9fuen7ZiOJ63tJzju0=;
	b=JfQlVEUVMOPpY652T1C1RBr+zzBkkHWWDdi4G1t5rg7cjR44Tm5rzY9tszfSWD5it2+wwg
	qitRdNyvVWN1WxDFZhZfQQjHkdSnYoMwsK0HHia5MQlpvtELx2a4Dyw3WdlFJ4m55BVLH0
	pRn2ggEuIZF41b3Yb3a3u946NNMh9Fo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-trzvn2cTMqiG-YKsGzdTMg-1; Wed, 17 Jul 2024 18:02:31 -0400
X-MC-Unique: trzvn2cTMqiG-YKsGzdTMg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b79c5c972eso514236d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 15:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253751; x=1721858551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ8eA1hPxoK8G44ES49PoyN6H9fuen7ZiOJ63tJzju0=;
        b=dKDzB1vu1K8ehi44G3fjDAaMQ2UU9CkILZuTR+2fHXuz9H0eKQh3IlOTVXNilIScb3
         2mWegZMP4PIl7V32rDprn8KKztUi6X3X6IXwcW4lCD7eX3GsWsrLnV8qp0kerJocadI/
         mP4UVYtEDcNHiP6Jsllq+HTynxqHKcZTbOlBhJ3E/KggTRAAZ/tS50udWjEVhueHZdEX
         nG3JmWZNgavT1hTR1V+9KJ8vOxOpgWTIotmVX+Ujln8MBMLCOWa9LMaBHw5zdEIKsvQ1
         I0MG0DVd2MCvz8anyJxRivG16BfPuEZFIZQAi4P9GA8ygxJAbhZAeEnwG/e8T/je6lXk
         J6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV62UBgRo+xOcQg3vBdRhrL13BdWve6x6WPMnFlXw6lrRV4N4VqHqxhMXDJA2+OO404zFeips9kx94+Z+2XiYrXotdnP+Tc8G+VRSn3LQ==
X-Gm-Message-State: AOJu0YyxatKZyPEniyYCiFf4ijM3aQxlfIJvyWLTgwktV/XphZfju/Lc
	/4EV+7bHuYsdy+A0q6/BtcfiQ6cTlKgY9gOGdOS6JzbaEilkB2q8KXl3Kawvhl2PvS5IApRVzQn
	ubrxJffz1aAAb6qjiOah3SyRChLGenenlnTtz/Oegtd0MEFnoO994rw1e5E7xEUc=
X-Received: by 2002:a05:622a:164b:b0:44e:cff7:3743 with SMTP id d75a77b69052e-44f86e7339emr21652001cf.9.1721253751287;
        Wed, 17 Jul 2024 15:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgaCdw1UOkSL+KIFT2eMjRU01W5DATHpkzikOyR2irQlfZJvXc4O4/CXTqU/rdsuwB1sVYnA==
X-Received: by 2002:a05:622a:164b:b0:44e:cff7:3743 with SMTP id d75a77b69052e-44f86e7339emr21651491cf.9.1721253750364;
        Wed, 17 Jul 2024 15:02:30 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:29 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 4/6] mm: Move huge mapping declarations from internal.h to huge_mm.h
Date: Wed, 17 Jul 2024 18:02:17 -0400
Message-ID: <20240717220219.3743374-5-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, peterx@redhat.com, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most of the huge mapping relevant helpers are declared in huge_mm.h, not
internal.h.  Move the only few from internal.h into huge_mm.h.

Here to move pmd_needs_soft_dirty_wp() over, we'll also need to move
vma_soft_dirty_enabled() into mm.h as it'll be needed in two headers
later (internal.h, huge_mm.h).

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 10 ++++++++++
 include/linux/mm.h      | 18 ++++++++++++++++++
 mm/internal.h           | 33 ---------------------------------
 3 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 37482c8445d1..d8b642ad512d 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -8,6 +8,11 @@
 #include <linux/fs.h> /* only for vma_is_dax() */
 #include <linux/kobject.h>
 
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write);
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write);
+pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
 vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
@@ -629,4 +634,9 @@ static inline int split_folio_to_order(struct folio *folio, int new_order)
 #define split_folio_to_list(f, l) split_folio_to_list_to_order(f, l, 0)
 #define split_folio(f) split_folio_to_order(f, 0)
 
+static inline bool pmd_needs_soft_dirty_wp(struct vm_area_struct *vma, pmd_t pmd)
+{
+	return vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd);
+}
+
 #endif /* _LINUX_HUGE_MM_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5f1075d19600..fa10802d8faa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1117,6 +1117,24 @@ static inline unsigned int folio_order(struct folio *folio)
 	return folio->_flags_1 & 0xff;
 }
 
+static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
+{
+	/*
+	 * NOTE: we must check this before VM_SOFTDIRTY on soft-dirty
+	 * enablements, because when without soft-dirty being compiled in,
+	 * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
+	 * will be constantly true.
+	 */
+	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
+		return false;
+
+	/*
+	 * Soft-dirty is kind of special: its tracking is enabled when the
+	 * vma flags not set.
+	 */
+	return !(vma->vm_flags & VM_SOFTDIRTY);
+}
+
 #include <linux/huge_mm.h>
 
 /*
diff --git a/mm/internal.h b/mm/internal.h
index b4d86436565b..e49941747749 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -917,8 +917,6 @@ bool need_mlock_drain(int cpu);
 void mlock_drain_local(void);
 void mlock_drain_remote(int cpu);
 
-extern pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
-
 /**
  * vma_address - Find the virtual address a page range is mapped at
  * @vma: The vma which maps this object.
@@ -1229,14 +1227,6 @@ int migrate_device_coherent_page(struct page *page);
 int __must_check try_grab_folio(struct folio *folio, int refs,
 				unsigned int flags);
 
-/*
- * mm/huge_memory.c
- */
-void touch_pud(struct vm_area_struct *vma, unsigned long addr,
-	       pud_t *pud, bool write);
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-	       pmd_t *pmd, bool write);
-
 /*
  * mm/mmap.c
  */
@@ -1342,29 +1332,6 @@ static __always_inline void vma_set_range(struct vm_area_struct *vma,
 	vma->vm_pgoff = pgoff;
 }
 
-static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
-{
-	/*
-	 * NOTE: we must check this before VM_SOFTDIRTY on soft-dirty
-	 * enablements, because when without soft-dirty being compiled in,
-	 * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
-	 * will be constantly true.
-	 */
-	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
-		return false;
-
-	/*
-	 * Soft-dirty is kind of special: its tracking is enabled when the
-	 * vma flags not set.
-	 */
-	return !(vma->vm_flags & VM_SOFTDIRTY);
-}
-
-static inline bool pmd_needs_soft_dirty_wp(struct vm_area_struct *vma, pmd_t pmd)
-{
-	return vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd);
-}
-
 static inline bool pte_needs_soft_dirty_wp(struct vm_area_struct *vma, pte_t pte)
 {
 	return vma_soft_dirty_enabled(vma) && !pte_soft_dirty(pte);
-- 
2.45.0

