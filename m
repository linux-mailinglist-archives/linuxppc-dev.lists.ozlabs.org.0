Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40494121EB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 00:07:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cH3q2ZxjzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 10:07:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="KQjn9EGP"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cG7x2Vw5zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 09:26:02 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8045d0003>; Mon, 16 Dec 2019 14:25:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 14:25:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 14:25:42 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:41 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 22:25:41 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df804650006>; Mon, 16 Dec 2019 14:25:41 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 23/25] mm/gup: track FOLL_PIN pages
Date: Mon, 16 Dec 2019 14:25:35 -0800
Message-ID: <20191216222537.491123-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216222537.491123-1-jhubbard@nvidia.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576535134; bh=RhlGSKnGsO2L+s0Me4u+1D98LAHGpCbF8JNkGzChPvg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=KQjn9EGPkyHe+C/0eZajq24zopFLiSvdV2LxL6Z/Oig2tHh6tO5mvXmp6s2A64OT4
 kihFou0bq0GQ7z/mQXZXYUMNlFr7lkQPFvuhlE4GSNwiipq4hdTFI2VvjpUka7OWN6
 7cUY0/U4smr75MJV2GE7LfGZ/g9Ud/PoeMCczsNQh11EtOXK0Z+ECrucigQrkHvwuJ
 FxYmqD/ZVXwN5SP4d2igS35dVLlD9ZzPJ+BxuCLFS2P39WSfiWaz80SkwaMuJd116+
 yvGlRCaGdmiOGHrWUPKdKvjw7dTJoCMg4E1fYtKUA4nBlMg79yxxFZRcUS/Y3jd7DM
 4s0rEJw4ZS7Ng==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>, "Kirill A
 . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add tracking of pages that were pinned via FOLL_PIN.

As mentioned in the FOLL_PIN documentation, callers who effectively set
FOLL_PIN are required to ultimately free such pages via unpin_user_page().
The effect is similar to FOLL_GET, and may be thought of as "FOLL_GET
for DIO and/or RDMA use".

Pages that have been pinned via FOLL_PIN are identifiable via a
new function call:

   bool page_dma_pinned(struct page *page);

What to do in response to encountering such a page, is left to later
patchsets. There is discussion about this in [1], [2], and [3].

This also changes a BUG_ON(), to a WARN_ON(), in follow_page_mask().

[1] Some slow progress on get_user_pages() (Apr 2, 2019):
    https://lwn.net/Articles/784574/
[2] DMA and get_user_pages() (LPC: Dec 12, 2018):
    https://lwn.net/Articles/774411/
[3] The trouble with get_user_pages() (Apr 30, 2018):
    https://lwn.net/Articles/753027/

Reviewed-by: Jan Kara <jack@suse.cz>
Suggested-by: Jan Kara <jack@suse.cz>
Suggested-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/core-api/pin_user_pages.rst |   2 +-
 include/linux/mm.h                        |  83 ++++-
 include/linux/mmzone.h                    |   2 +
 include/linux/page_ref.h                  |  10 +
 mm/gup.c                                  | 409 +++++++++++++++++-----
 mm/huge_memory.c                          |  29 +-
 mm/hugetlb.c                              |  38 +-
 mm/vmstat.c                               |   2 +
 8 files changed, 439 insertions(+), 136 deletions(-)

diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core=
-api/pin_user_pages.rst
index 1d490155ecd7..2db14df1f2d7 100644
--- a/Documentation/core-api/pin_user_pages.rst
+++ b/Documentation/core-api/pin_user_pages.rst
@@ -53,7 +53,7 @@ Which flags are set by each wrapper
 For these pin_user_pages*() functions, FOLL_PIN is OR'd in with whatever g=
up
 flags the caller provides. The caller is required to pass in a non-null st=
ruct
 pages* array, and the function then pin pages by incrementing each by a sp=
ecial
-value. For now, that value is +1, just like get_user_pages*().::
+value: GUP_PIN_COUNTING_BIAS.::
=20
  Function
  --------
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6a1a357e7d86..bb44c4d2ada7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1016,6 +1016,8 @@ static inline void get_page(struct page *page)
 	page_ref_inc(page);
 }
=20
+bool __must_check try_grab_page(struct page *page, unsigned int flags);
+
 static inline __must_check bool try_get_page(struct page *page)
 {
 	page =3D compound_head(page);
@@ -1044,29 +1046,80 @@ static inline void put_page(struct page *page)
 		__put_page(page);
 }
=20
-/**
- * unpin_user_page() - release a gup-pinned page
- * @page:            pointer to page to be released
+/*
+ * GUP_PIN_COUNTING_BIAS, and the associated functions that use it, overlo=
ad
+ * the page's refcount so that two separate items are tracked: the origina=
l page
+ * reference count, and also a new count of how many pin_user_pages() call=
s were
+ * made against the page. ("gup-pinned" is another term for the latter).
+ *
+ * With this scheme, pin_user_pages() becomes special: such pages are mark=
ed as
+ * distinct from normal pages. As such, the unpin_user_page() call (and it=
s
+ * variants) must be used in order to release gup-pinned pages.
+ *
+ * Choice of value:
+ *
+ * By making GUP_PIN_COUNTING_BIAS a power of two, debugging of page refer=
ence
+ * counts with respect to pin_user_pages() and unpin_user_page() becomes
+ * simpler, due to the fact that adding an even power of two to the page
+ * refcount has the effect of using only the upper N bits, for the code th=
at
+ * counts up using the bias value. This means that the lower bits are left=
 for
+ * the exclusive use of the original code that increments and decrements b=
y one
+ * (or at least, by much smaller values than the bias value).
  *
- * Pages that were pinned via pin_user_pages*() must be released via eithe=
r
- * unpin_user_page(), or one of the unpin_user_pages*() routines. This is =
so
- * that eventually such pages can be separately tracked and uniquely handl=
ed. In
- * particular, interactions with RDMA and filesystems need special handlin=
g.
+ * Of course, once the lower bits overflow into the upper bits (and this i=
s
+ * OK, because subtraction recovers the original values), then visual insp=
ection
+ * no longer suffices to directly view the separate counts. However, for n=
ormal
+ * applications that don't have huge page reference counts, this won't be =
an
+ * issue.
  *
- * unpin_user_page() and put_page() are not interchangeable, despite this =
early
- * implementation that makes them look the same. unpin_user_page() calls m=
ust
- * be perfectly matched up with pin*() calls.
+ * Locking: the lockless algorithm described in page_cache_get_speculative=
()
+ * and page_cache_gup_pin_speculative() provides safe operation for
+ * get_user_pages and page_mkclean and other calls that race to set up pag=
e
+ * table entries.
  */
-static inline void unpin_user_page(struct page *page)
-{
-	put_page(page);
-}
+#define GUP_PIN_COUNTING_BIAS (1U << 10)
=20
+void unpin_user_page(struct page *page);
 void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages=
,
 				 bool make_dirty);
-
 void unpin_user_pages(struct page **pages, unsigned long npages);
=20
+/**
+ * page_dma_pinned() - report if a page is pinned for DMA.
+ *
+ * This function checks if a page has been pinned via a call to
+ * pin_user_pages*().
+ *
+ * The return value is partially fuzzy: false is not fuzzy, because it mea=
ns
+ * "definitely not pinned for DMA", but true means "probably pinned for DM=
A, but
+ * possibly a false positive due to having at least GUP_PIN_COUNTING_BIAS =
worth
+ * of normal page references".
+ *
+ * False positives are OK, because: a) it's unlikely for a page to get tha=
t many
+ * refcounts, and b) all the callers of this routine are expected to be ab=
le to
+ * deal gracefully with a false positive.
+ *
+ * For more information, please see Documentation/vm/pin_user_pages.rst.
+ *
+ * @page:	pointer to page to be queried.
+ * @Return:	True, if it is likely that the page has been "dma-pinned".
+ *		False, if the page is definitely not dma-pinned.
+ */
+static inline bool page_dma_pinned(struct page *page)
+{
+	/*
+	 * page_ref_count() is signed. If that refcount overflows, then
+	 * page_ref_count() returns a negative value, and callers will avoid
+	 * further incrementing the refcount.
+	 *
+	 * Here, for that overflow case, use the signed bit to count a little
+	 * bit higher via unsigned math, and thus still get an accurate result
+	 * from page_dma_pinned().
+	 */
+	return ((unsigned int)page_ref_count(compound_head(page))) >=3D
+		GUP_PIN_COUNTING_BIAS;
+}
+
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 #define SECTION_IN_PAGE_FLAGS
 #endif
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 89d8ff06c9ce..a7418f7a44da 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -244,6 +244,8 @@ enum node_stat_item {
 	NR_DIRTIED,		/* page dirtyings since bootup */
 	NR_WRITTEN,		/* page writings since bootup */
 	NR_KERNEL_MISC_RECLAIMABLE,	/* reclaimable non-slab kernel pages */
+	NR_FOLL_PIN_REQUESTED,	/* via: pin_user_page(), gup flag: FOLL_PIN */
+	NR_FOLL_PIN_RETURNED,	/* pages returned via unpin_user_page() */
 	NR_VM_NODE_STAT_ITEMS
 };
=20
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 14d14beb1f7f..b9cbe553d1e7 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -102,6 +102,16 @@ static inline void page_ref_sub(struct page *page, int=
 nr)
 		__page_ref_mod(page, -nr);
 }
=20
+static inline int page_ref_sub_return(struct page *page, int nr)
+{
+	int ret =3D atomic_sub_return(nr, &page->_refcount);
+
+	if (page_ref_tracepoint_active(__tracepoint_page_ref_mod))
+		__page_ref_mod(page, -nr);
+
+	return ret;
+}
+
 static inline void page_ref_inc(struct page *page)
 {
 	atomic_inc(&page->_refcount);
diff --git a/mm/gup.c b/mm/gup.c
index 73aedcefa4bd..c2793a86450e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -36,6 +36,20 @@ static __always_inline long __gup_longterm_locked(struct=
 task_struct *tsk,
 						  struct page **pages,
 						  struct vm_area_struct **vmas,
 						  unsigned int flags);
+
+#ifdef CONFIG_DEBUG_VM
+static inline void __update_proc_vmstat(struct page *page,
+					enum node_stat_item item, int count)
+{
+	mod_node_page_state(page_pgdat(page), item, count);
+}
+#else
+static inline void __update_proc_vmstat(struct page *page,
+					enum node_stat_item item, int count)
+{
+}
+#endif
+
 /*
  * Return the compound head page with ref appropriately incremented,
  * or NULL if that failed.
@@ -51,6 +65,156 @@ static inline struct page *try_get_compound_head(struct=
 page *page, int refs)
 	return head;
 }
=20
+/**
+ * try_pin_compound_head() - mark a compound page as being used by
+ * pin_user_pages*().
+ *
+ * This is the FOLL_PIN counterpart to try_get_compound_head().
+ *
+ * @page:	pointer to page to be marked
+ * @Return:	the compound head page, with ref appropriately incremented,
+ * or NULL upon failure.
+ */
+__must_check struct page *try_pin_compound_head(struct page *page, int ref=
s)
+{
+	struct page *head =3D try_get_compound_head(page,
+						  GUP_PIN_COUNTING_BIAS * refs);
+	if (!head)
+		return NULL;
+
+	__update_proc_vmstat(page, NR_FOLL_PIN_REQUESTED, refs);
+	return head;
+}
+
+/*
+ * try_grab_compound_head() - attempt to elevate a page's refcount, by a
+ * flags-dependent amount.
+ *
+ * "grab" names in this file mean, "look at flags to decide whether to use
+ * FOLL_PIN or FOLL_GET behavior, when incrementing the page's refcount.
+ *
+ * Either FOLL_PIN or FOLL_GET (or neither) must be set, but not both at t=
he
+ * same time. (That's true throughout the get_user_pages*() and
+ * pin_user_pages*() APIs.) Cases:
+ *
+ *    FOLL_GET: page's refcount will be incremented by 1.
+ *    FOLL_PIN: page's refcount will be incremented by GUP_PIN_COUNTING_BI=
AS.
+ *
+ * Return: head page (with refcount appropriately incremented) for success=
, or
+ * NULL upon failure. If neither FOLL_GET nor FOLL_PIN was set, that's
+ * considered failure, and furthermore, a likely bug in the caller, so a w=
arning
+ * is also emitted.
+ */
+static __maybe_unused struct page *try_grab_compound_head(struct page *pag=
e,
+							  int refs,
+							  unsigned int flags)
+{
+	if (flags & FOLL_GET)
+		return try_get_compound_head(page, refs);
+	else if (flags & FOLL_PIN)
+		return try_pin_compound_head(page, refs);
+
+	WARN_ON_ONCE(1);
+	return NULL;
+}
+
+/**
+ * try_grab_page() - elevate a page's refcount by a flag-dependent amount
+ *
+ * This might not do anything at all, depending on the flags argument.
+ *
+ * "grab" names in this file mean, "look at flags to decide whether to use
+ * FOLL_PIN or FOLL_GET behavior, when incrementing the page's refcount.
+ *
+ * @page:    pointer to page to be grabbed
+ * @flags:   gup flags: these are the FOLL_* flag values.
+ *
+ * Either FOLL_PIN or FOLL_GET (or neither) may be set, but not both at th=
e same
+ * time. Cases:
+ *
+ *    FOLL_GET: page's refcount will be incremented by 1.
+ *    FOLL_PIN: page's refcount will be incremented by GUP_PIN_COUNTING_BI=
AS.
+ *
+ * Return: true for success, or if no action was required (if neither FOLL=
_PIN
+ * nor FOLL_GET was set, nothing is done). False for failure: FOLL_GET or
+ * FOLL_PIN was set, but the page could not be grabbed.
+ */
+bool __must_check try_grab_page(struct page *page, unsigned int flags)
+{
+	if (flags & FOLL_GET)
+		return try_get_page(page);
+	else if (flags & FOLL_PIN) {
+		page =3D compound_head(page);
+		WARN_ON_ONCE(flags & FOLL_GET);
+
+		if (WARN_ON_ONCE(page_ref_count(page) <=3D 0))
+			return false;
+
+		page_ref_add(page, GUP_PIN_COUNTING_BIAS);
+		__update_proc_vmstat(page, NR_FOLL_PIN_REQUESTED, 1);
+	}
+
+	return true;
+}
+
+#ifdef CONFIG_DEV_PAGEMAP_OPS
+static bool __unpin_devmap_managed_user_page(struct page *page)
+{
+	bool is_devmap =3D page_is_devmap_managed(page);
+
+	if (is_devmap) {
+		int count =3D page_ref_sub_return(page, GUP_PIN_COUNTING_BIAS);
+
+		__update_proc_vmstat(page, NR_FOLL_PIN_RETURNED, 1);
+		/*
+		 * devmap page refcounts are 1-based, rather than 0-based: if
+		 * refcount is 1, then the page is free and the refcount is
+		 * stable because nobody holds a reference on the page.
+		 */
+		if (count =3D=3D 1)
+			free_devmap_managed_page(page);
+		else if (!count)
+			__put_page(page);
+	}
+
+	return is_devmap;
+}
+#else
+static bool __unpin_devmap_managed_user_page(struct page *page)
+{
+	return false;
+}
+#endif /* CONFIG_DEV_PAGEMAP_OPS */
+
+/**
+ * unpin_user_page() - release a dma-pinned page
+ * @page:            pointer to page to be released
+ *
+ * Pages that were pinned via pin_user_pages*() must be released via eithe=
r
+ * unpin_user_page(), or one of the unpin_user_pages*() routines. This is =
so
+ * that such pages can be separately tracked and uniquely handled. In
+ * particular, interactions with RDMA and filesystems need special handlin=
g.
+ */
+void unpin_user_page(struct page *page)
+{
+	page =3D compound_head(page);
+
+	/*
+	 * For devmap managed pages we need to catch refcount transition from
+	 * GUP_PIN_COUNTING_BIAS to 1, when refcount reach one it means the
+	 * page is free and we need to inform the device driver through
+	 * callback. See include/linux/memremap.h and HMM for details.
+	 */
+	if (__unpin_devmap_managed_user_page(page))
+		return;
+
+	if (page_ref_sub_and_test(page, GUP_PIN_COUNTING_BIAS))
+		__put_page(page);
+
+	__update_proc_vmstat(page, NR_FOLL_PIN_RETURNED, 1);
+}
+EXPORT_SYMBOL(unpin_user_page);
+
 /**
  * unpin_user_pages_dirty_lock() - release and optionally dirty gup-pinned=
 pages
  * @pages:  array of pages to be maybe marked dirty, and definitely releas=
ed.
@@ -237,10 +401,11 @@ static struct page *follow_page_pte(struct vm_area_st=
ruct *vma,
 	}
=20
 	page =3D vm_normal_page(vma, address, pte);
-	if (!page && pte_devmap(pte) && (flags & FOLL_GET)) {
+	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
 		/*
-		 * Only return device mapping pages in the FOLL_GET case since
-		 * they are only valid while holding the pgmap reference.
+		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
+		 * case since they are only valid while holding the pgmap
+		 * reference.
 		 */
 		*pgmap =3D get_dev_pagemap(pte_pfn(pte), *pgmap);
 		if (*pgmap)
@@ -278,11 +443,10 @@ static struct page *follow_page_pte(struct vm_area_st=
ruct *vma,
 		goto retry;
 	}
=20
-	if (flags & FOLL_GET) {
-		if (unlikely(!try_get_page(page))) {
-			page =3D ERR_PTR(-ENOMEM);
-			goto out;
-		}
+	/* try_grab_page() does nothing unless FOLL_GET or FOLL_PIN is set. */
+	if (unlikely(!try_grab_page(page, flags))) {
+		page =3D ERR_PTR(-ENOMEM);
+		goto out;
 	}
 	if (flags & FOLL_TOUCH) {
 		if ((flags & FOLL_WRITE) &&
@@ -544,7 +708,7 @@ static struct page *follow_page_mask(struct vm_area_str=
uct *vma,
 	/* make this handle hugepd */
 	page =3D follow_huge_addr(mm, address, flags & FOLL_WRITE);
 	if (!IS_ERR(page)) {
-		BUG_ON(flags & FOLL_GET);
+		WARN_ON_ONCE(flags & (FOLL_GET | FOLL_PIN));
 		return page;
 	}
=20
@@ -1131,6 +1295,36 @@ static __always_inline long __get_user_pages_locked(=
struct task_struct *tsk,
 	return pages_done;
 }
=20
+static long __get_user_pages_remote(struct task_struct *tsk,
+				    struct mm_struct *mm,
+				    unsigned long start, unsigned long nr_pages,
+				    unsigned int gup_flags, struct page **pages,
+				    struct vm_area_struct **vmas, int *locked)
+{
+	/*
+	 * Parts of FOLL_LONGTERM behavior are incompatible with
+	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
+	 * vmas. However, this only comes up if locked is set, and there are
+	 * callers that do request FOLL_LONGTERM, but do not set locked. So,
+	 * allow what we can.
+	 */
+	if (gup_flags & FOLL_LONGTERM) {
+		if (WARN_ON_ONCE(locked))
+			return -EINVAL;
+		/*
+		 * This will check the vmas (even if our vmas arg is NULL)
+		 * and return -ENOTSUPP if DAX isn't allowed in this case:
+		 */
+		return __gup_longterm_locked(tsk, mm, start, nr_pages, pages,
+					     vmas, gup_flags | FOLL_TOUCH |
+					     FOLL_REMOTE);
+	}
+
+	return __get_user_pages_locked(tsk, mm, start, nr_pages, pages, vmas,
+				       locked,
+				       gup_flags | FOLL_TOUCH | FOLL_REMOTE);
+}
+
 /*
  * get_user_pages_remote() - pin user pages in memory
  * @tsk:	the task_struct to use for page fault accounting, or
@@ -1205,28 +1399,8 @@ long get_user_pages_remote(struct task_struct *tsk, =
struct mm_struct *mm,
 	if (WARN_ON_ONCE(gup_flags & FOLL_PIN))
 		return -EINVAL;
=20
-	/*
-	 * Parts of FOLL_LONGTERM behavior are incompatible with
-	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
-	 * vmas. However, this only comes up if locked is set, and there are
-	 * callers that do request FOLL_LONGTERM, but do not set locked. So,
-	 * allow what we can.
-	 */
-	if (gup_flags & FOLL_LONGTERM) {
-		if (WARN_ON_ONCE(locked))
-			return -EINVAL;
-		/*
-		 * This will check the vmas (even if our vmas arg is NULL)
-		 * and return -ENOTSUPP if DAX isn't allowed in this case:
-		 */
-		return __gup_longterm_locked(tsk, mm, start, nr_pages, pages,
-					     vmas, gup_flags | FOLL_TOUCH |
-					     FOLL_REMOTE);
-	}
-
-	return __get_user_pages_locked(tsk, mm, start, nr_pages, pages, vmas,
-				       locked,
-				       gup_flags | FOLL_TOUCH | FOLL_REMOTE);
+	return __get_user_pages_remote(tsk, mm, start, nr_pages, gup_flags,
+				       pages, vmas, locked);
 }
 EXPORT_SYMBOL(get_user_pages_remote);
=20
@@ -1421,10 +1595,11 @@ static long __get_user_pages_locked(struct task_str=
uct *tsk,
 	return i ? : -EFAULT;
 }
=20
-long get_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
-			   unsigned long start, unsigned long nr_pages,
-			   unsigned int gup_flags, struct page **pages,
-			   struct vm_area_struct **vmas, int *locked)
+static long __get_user_pages_remote(struct task_struct *tsk,
+				    struct mm_struct *mm,
+				    unsigned long start, unsigned long nr_pages,
+				    unsigned int gup_flags, struct page **pages,
+				    struct vm_area_struct **vmas, int *locked)
 {
 	return 0;
 }
@@ -1864,13 +2039,17 @@ static inline pte_t gup_get_pte(pte_t *ptep)
 #endif /* CONFIG_GUP_GET_PTE_LOW_HIGH */
=20
 static void __maybe_unused undo_dev_pagemap(int *nr, int nr_start,
+					    unsigned int flags,
 					    struct page **pages)
 {
 	while ((*nr) - nr_start) {
 		struct page *page =3D pages[--(*nr)];
=20
 		ClearPageReferenced(page);
-		put_page(page);
+		if (flags & FOLL_PIN)
+			unpin_user_page(page);
+		else
+			put_page(page);
 	}
 }
=20
@@ -1903,7 +2082,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long add=
r, unsigned long end,
=20
 			pgmap =3D get_dev_pagemap(pte_pfn(pte), pgmap);
 			if (unlikely(!pgmap)) {
-				undo_dev_pagemap(nr, nr_start, pages);
+				undo_dev_pagemap(nr, nr_start, flags, pages);
 				goto pte_unmap;
 			}
 		} else if (pte_special(pte))
@@ -1912,7 +2091,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long add=
r, unsigned long end,
 		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 		page =3D pte_page(pte);
=20
-		head =3D try_get_compound_head(page, 1);
+		head =3D try_grab_compound_head(page, 1, flags);
 		if (!head)
 			goto pte_unmap;
=20
@@ -1957,7 +2136,8 @@ static int gup_pte_range(pmd_t pmd, unsigned long add=
r, unsigned long end,
=20
 #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HUGE=
PAGE)
 static int __gup_device_huge(unsigned long pfn, unsigned long addr,
-		unsigned long end, struct page **pages, int *nr)
+			     unsigned long end, unsigned int flags,
+			     struct page **pages, int *nr)
 {
 	int nr_start =3D *nr;
 	struct dev_pagemap *pgmap =3D NULL;
@@ -1967,12 +2147,15 @@ static int __gup_device_huge(unsigned long pfn, uns=
igned long addr,
=20
 		pgmap =3D get_dev_pagemap(pfn, pgmap);
 		if (unlikely(!pgmap)) {
-			undo_dev_pagemap(nr, nr_start, pages);
+			undo_dev_pagemap(nr, nr_start, flags, pages);
 			return 0;
 		}
 		SetPageReferenced(page);
 		pages[*nr] =3D page;
-		get_page(page);
+		if (unlikely(!try_grab_page(page, flags))) {
+			undo_dev_pagemap(nr, nr_start, flags, pages);
+			return 0;
+		}
 		(*nr)++;
 		pfn++;
 	} while (addr +=3D PAGE_SIZE, addr !=3D end);
@@ -1983,48 +2166,52 @@ static int __gup_device_huge(unsigned long pfn, uns=
igned long addr,
 }
=20
 static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long ad=
dr,
-		unsigned long end, struct page **pages, int *nr)
+				 unsigned long end, unsigned int flags,
+				 struct page **pages, int *nr)
 {
 	unsigned long fault_pfn;
 	int nr_start =3D *nr;
=20
 	fault_pfn =3D pmd_pfn(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
+	if (!__gup_device_huge(fault_pfn, addr, end, flags, pages, nr))
 		return 0;
=20
 	if (unlikely(pmd_val(orig) !=3D pmd_val(*pmdp))) {
-		undo_dev_pagemap(nr, nr_start, pages);
+		undo_dev_pagemap(nr, nr_start, flags, pages);
 		return 0;
 	}
 	return 1;
 }
=20
 static int __gup_device_huge_pud(pud_t orig, pud_t *pudp, unsigned long ad=
dr,
-		unsigned long end, struct page **pages, int *nr)
+				 unsigned long end, unsigned int flags,
+				 struct page **pages, int *nr)
 {
 	unsigned long fault_pfn;
 	int nr_start =3D *nr;
=20
 	fault_pfn =3D pud_pfn(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-	if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
+	if (!__gup_device_huge(fault_pfn, addr, end, flags, pages, nr))
 		return 0;
=20
 	if (unlikely(pud_val(orig) !=3D pud_val(*pudp))) {
-		undo_dev_pagemap(nr, nr_start, pages);
+		undo_dev_pagemap(nr, nr_start, flags, pages);
 		return 0;
 	}
 	return 1;
 }
 #else
 static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long ad=
dr,
-		unsigned long end, struct page **pages, int *nr)
+				 unsigned long end, unsigned int flags,
+				 struct page **pages, int *nr)
 {
 	BUILD_BUG();
 	return 0;
 }
=20
 static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long add=
r,
-		unsigned long end, struct page **pages, int *nr)
+				 unsigned long end, unsigned int flags,
+				 struct page **pages, int *nr)
 {
 	BUILD_BUG();
 	return 0;
@@ -2042,8 +2229,11 @@ static int record_subpages(struct page *page, unsign=
ed long addr,
 	return nr;
 }
=20
-static void put_compound_head(struct page *page, int refs)
+static void put_compound_head(struct page *page, int refs, unsigned int fl=
ags)
 {
+	if (flags & FOLL_PIN)
+		refs *=3D GUP_PIN_COUNTING_BIAS;
+
 	/* Do a get_page() first, in case refs =3D=3D page->_refcount */
 	get_page(page);
 	page_ref_sub(page, refs);
@@ -2083,12 +2273,12 @@ static int gup_hugepte(pte_t *ptep, unsigned long s=
z, unsigned long addr,
 	page =3D head + ((addr & (sz-1)) >> PAGE_SHIFT);
 	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
-	head =3D try_get_compound_head(head, refs);
+	head =3D try_grab_compound_head(head, refs, flags);
 	if (!head)
 		return 0;
=20
 	if (unlikely(pte_val(pte) !=3D pte_val(*ptep))) {
-		put_compound_head(head, refs);
+		put_compound_head(head, refs, flags);
 		return 0;
 	}
=20
@@ -2136,18 +2326,19 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
 	if (pmd_devmap(orig)) {
 		if (unlikely(flags & FOLL_LONGTERM))
 			return 0;
-		return __gup_device_huge_pmd(orig, pmdp, addr, end, pages, nr);
+		return __gup_device_huge_pmd(orig, pmdp, addr, end, flags,
+					     pages, nr);
 	}
=20
 	page =3D pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
-	head =3D try_get_compound_head(pmd_page(orig), refs);
+	head =3D try_grab_compound_head(pmd_page(orig), refs, flags);
 	if (!head)
 		return 0;
=20
 	if (unlikely(pmd_val(orig) !=3D pmd_val(*pmdp))) {
-		put_compound_head(head, refs);
+		put_compound_head(head, refs, flags);
 		return 0;
 	}
=20
@@ -2157,7 +2348,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsi=
gned long addr,
 }
=20
 static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages, int *nr)
+			unsigned long end, unsigned int flags,
+			struct page **pages, int *nr)
 {
 	struct page *head, *page;
 	int refs;
@@ -2168,18 +2360,19 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, un=
signed long addr,
 	if (pud_devmap(orig)) {
 		if (unlikely(flags & FOLL_LONGTERM))
 			return 0;
-		return __gup_device_huge_pud(orig, pudp, addr, end, pages, nr);
+		return __gup_device_huge_pud(orig, pudp, addr, end, flags,
+					     pages, nr);
 	}
=20
 	page =3D pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
 	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
-	head =3D try_get_compound_head(pud_page(orig), refs);
+	head =3D try_grab_compound_head(pud_page(orig), refs, flags);
 	if (!head)
 		return 0;
=20
 	if (unlikely(pud_val(orig) !=3D pud_val(*pudp))) {
-		put_compound_head(head, refs);
+		put_compound_head(head, refs, flags);
 		return 0;
 	}
=20
@@ -2203,12 +2396,12 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, un=
signed long addr,
 	page =3D pgd_page(orig) + ((addr & ~PGDIR_MASK) >> PAGE_SHIFT);
 	refs =3D record_subpages(page, addr, end, pages + *nr);
=20
-	head =3D try_get_compound_head(pgd_page(orig), refs);
+	head =3D try_grab_compound_head(pgd_page(orig), refs, flags);
 	if (!head)
 		return 0;
=20
 	if (unlikely(pgd_val(orig) !=3D pgd_val(*pgdp))) {
-		put_compound_head(head, refs);
+		put_compound_head(head, refs, flags);
 		return 0;
 	}
=20
@@ -2371,6 +2564,14 @@ int __get_user_pages_fast(unsigned long start, int n=
r_pages, int write,
 	unsigned long len, end;
 	unsigned long flags;
 	int nr =3D 0;
+	/*
+	 * Internally (within mm/gup.c), gup fast variants must set FOLL_GET,
+	 * because gup fast is always a "pin with a +1 page refcount" request.
+	 */
+	unsigned int gup_flags =3D FOLL_GET;
+
+	if (write)
+		gup_flags |=3D FOLL_WRITE;
=20
 	start =3D untagged_addr(start) & PAGE_MASK;
 	len =3D (unsigned long) nr_pages << PAGE_SHIFT;
@@ -2396,7 +2597,7 @@ int __get_user_pages_fast(unsigned long start, int nr=
_pages, int write,
 	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
 	    gup_fast_permitted(start, end)) {
 		local_irq_save(flags);
-		gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
+		gup_pgd_range(start, end, gup_flags, pages, &nr);
 		local_irq_restore(flags);
 	}
=20
@@ -2435,7 +2636,7 @@ static int internal_get_user_pages_fast(unsigned long=
 start, int nr_pages,
 	int nr =3D 0, ret =3D 0;
=20
 	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
-				       FOLL_FORCE | FOLL_PIN)))
+				       FOLL_FORCE | FOLL_PIN | FOLL_GET)))
 		return -EINVAL;
=20
 	start =3D untagged_addr(start) & PAGE_MASK;
@@ -2478,11 +2679,11 @@ static int internal_get_user_pages_fast(unsigned lo=
ng start, int nr_pages,
=20
 /**
  * get_user_pages_fast() - pin user pages in memory
- * @start:	starting user address
- * @nr_pages:	number of pages from start to pin
- * @gup_flags:	flags modifying pin behaviour
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_pages long.
+ * @start:      starting user address
+ * @nr_pages:   number of pages from start to pin
+ * @gup_flags:  flags modifying pin behaviour
+ * @pages:      array that receives pointers to the pages pinned.
+ *              Should be at least nr_pages long.
  *
  * Attempt to pin user pages in memory without taking mm->mmap_sem.
  * If not successful, it will fall back to taking the lock and
@@ -2502,6 +2703,13 @@ int get_user_pages_fast(unsigned long start, int nr_=
pages,
 	if (WARN_ON_ONCE(gup_flags & FOLL_PIN))
 		return -EINVAL;
=20
+	/*
+	 * The caller may or may not have explicitly set FOLL_GET; either way is
+	 * OK. However, internally (within mm/gup.c), gup fast variants must set
+	 * FOLL_GET, because gup fast is always a "pin with a +1 page refcount"
+	 * request.
+	 */
+	gup_flags |=3D FOLL_GET;
 	return internal_get_user_pages_fast(start, nr_pages, gup_flags, pages);
 }
 EXPORT_SYMBOL_GPL(get_user_pages_fast);
@@ -2509,9 +2717,12 @@ EXPORT_SYMBOL_GPL(get_user_pages_fast);
 /**
  * pin_user_pages_fast() - pin user pages in memory without taking locks
  *
- * For now, this is a placeholder function, until various call sites are
- * converted to use the correct get_user_pages*() or pin_user_pages*() API=
. So,
- * this is identical to get_user_pages_fast().
+ * Nearly the same as get_user_pages_fast(), except that FOLL_PIN is set. =
See
+ * get_user_pages_fast() for documentation on the function arguments, beca=
use
+ * the arguments here are identical.
+ *
+ * FOLL_PIN means that the pages must be released via unpin_user_page(). P=
lease
+ * see Documentation/vm/pin_user_pages.rst for further details.
  *
  * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rs=
t. It
  * is NOT intended for Case 2 (RDMA: long-term pins).
@@ -2519,21 +2730,24 @@ EXPORT_SYMBOL_GPL(get_user_pages_fast);
 int pin_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages)
 {
-	/*
-	 * This is a placeholder, until the pin functionality is activated.
-	 * Until then, just behave like the corresponding get_user_pages*()
-	 * routine.
-	 */
-	return get_user_pages_fast(start, nr_pages, gup_flags, pages);
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
+		return -EINVAL;
+
+	gup_flags |=3D FOLL_PIN;
+	return internal_get_user_pages_fast(start, nr_pages, gup_flags, pages);
 }
 EXPORT_SYMBOL_GPL(pin_user_pages_fast);
=20
 /**
  * pin_user_pages_remote() - pin pages of a remote process (task !=3D curr=
ent)
  *
- * For now, this is a placeholder function, until various call sites are
- * converted to use the correct get_user_pages*() or pin_user_pages*() API=
. So,
- * this is identical to get_user_pages_remote().
+ * Nearly the same as get_user_pages_remote(), except that FOLL_PIN is set=
. See
+ * get_user_pages_remote() for documentation on the function arguments, be=
cause
+ * the arguments here are identical.
+ *
+ * FOLL_PIN means that the pages must be released via unpin_user_page(). P=
lease
+ * see Documentation/vm/pin_user_pages.rst for details.
  *
  * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rs=
t. It
  * is NOT intended for Case 2 (RDMA: long-term pins).
@@ -2543,22 +2757,24 @@ long pin_user_pages_remote(struct task_struct *tsk,=
 struct mm_struct *mm,
 			   unsigned int gup_flags, struct page **pages,
 			   struct vm_area_struct **vmas, int *locked)
 {
-	/*
-	 * This is a placeholder, until the pin functionality is activated.
-	 * Until then, just behave like the corresponding get_user_pages*()
-	 * routine.
-	 */
-	return get_user_pages_remote(tsk, mm, start, nr_pages, gup_flags, pages,
-				     vmas, locked);
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
+		return -EINVAL;
+
+	gup_flags |=3D FOLL_PIN;
+	return __get_user_pages_remote(tsk, mm, start, nr_pages, gup_flags,
+				       pages, vmas, locked);
 }
 EXPORT_SYMBOL(pin_user_pages_remote);
=20
 /**
  * pin_user_pages() - pin user pages in memory for use by other devices
  *
- * For now, this is a placeholder function, until various call sites are
- * converted to use the correct get_user_pages*() or pin_user_pages*() API=
. So,
- * this is identical to get_user_pages().
+ * Nearly the same as get_user_pages(), except that FOLL_TOUCH is not set,=
 and
+ * FOLL_PIN is set.
+ *
+ * FOLL_PIN means that the pages must be released via unpin_user_page(). P=
lease
+ * see Documentation/vm/pin_user_pages.rst for details.
  *
  * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rs=
t. It
  * is NOT intended for Case 2 (RDMA: long-term pins).
@@ -2567,11 +2783,12 @@ long pin_user_pages(unsigned long start, unsigned l=
ong nr_pages,
 		    unsigned int gup_flags, struct page **pages,
 		    struct vm_area_struct **vmas)
 {
-	/*
-	 * This is a placeholder, until the pin functionality is activated.
-	 * Until then, just behave like the corresponding get_user_pages*()
-	 * routine.
-	 */
-	return get_user_pages(start, nr_pages, gup_flags, pages, vmas);
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
+		return -EINVAL;
+
+	gup_flags |=3D FOLL_PIN;
+	return __gup_longterm_locked(current, current->mm, start, nr_pages,
+				     pages, vmas, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 41a0fbddc96b..a71646a4c4d4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -945,6 +945,11 @@ struct page *follow_devmap_pmd(struct vm_area_struct *=
vma, unsigned long addr,
 	 */
 	WARN_ONCE(flags & FOLL_COW, "mm: In follow_devmap_pmd with FOLL_COW set")=
;
=20
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) =3D=3D
+			 (FOLL_PIN | FOLL_GET)))
+		return NULL;
+
 	if (flags & FOLL_WRITE && !pmd_write(*pmd))
 		return NULL;
=20
@@ -960,7 +965,7 @@ struct page *follow_devmap_pmd(struct vm_area_struct *v=
ma, unsigned long addr,
 	 * device mapped pages can only be returned if the
 	 * caller will manage the page reference count.
 	 */
-	if (!(flags & FOLL_GET))
+	if (!(flags & (FOLL_GET | FOLL_PIN)))
 		return ERR_PTR(-EEXIST);
=20
 	pfn +=3D (addr & ~PMD_MASK) >> PAGE_SHIFT;
@@ -968,7 +973,8 @@ struct page *follow_devmap_pmd(struct vm_area_struct *v=
ma, unsigned long addr,
 	if (!*pgmap)
 		return ERR_PTR(-EFAULT);
 	page =3D pfn_to_page(pfn);
-	get_page(page);
+	if (!try_grab_page(page, flags))
+		page =3D ERR_PTR(-ENOMEM);
=20
 	return page;
 }
@@ -1088,6 +1094,11 @@ struct page *follow_devmap_pud(struct vm_area_struct=
 *vma, unsigned long addr,
 	if (flags & FOLL_WRITE && !pud_write(*pud))
 		return NULL;
=20
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) =3D=3D
+			 (FOLL_PIN | FOLL_GET)))
+		return NULL;
+
 	if (pud_present(*pud) && pud_devmap(*pud))
 		/* pass */;
 	else
@@ -1099,8 +1110,10 @@ struct page *follow_devmap_pud(struct vm_area_struct=
 *vma, unsigned long addr,
 	/*
 	 * device mapped pages can only be returned if the
 	 * caller will manage the page reference count.
+	 *
+	 * At least one of FOLL_GET | FOLL_PIN must be set, so assert that here:
 	 */
-	if (!(flags & FOLL_GET))
+	if (!(flags & (FOLL_GET | FOLL_PIN)))
 		return ERR_PTR(-EEXIST);
=20
 	pfn +=3D (addr & ~PUD_MASK) >> PAGE_SHIFT;
@@ -1108,7 +1121,8 @@ struct page *follow_devmap_pud(struct vm_area_struct =
*vma, unsigned long addr,
 	if (!*pgmap)
 		return ERR_PTR(-EFAULT);
 	page =3D pfn_to_page(pfn);
-	get_page(page);
+	if (!try_grab_page(page, flags))
+		page =3D ERR_PTR(-ENOMEM);
=20
 	return page;
 }
@@ -1484,8 +1498,13 @@ struct page *follow_trans_huge_pmd(struct vm_area_st=
ruct *vma,
=20
 	page =3D pmd_page(*pmd);
 	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
+
+	if (!try_grab_page(page, flags))
+		return ERR_PTR(-ENOMEM);
+
 	if (flags & FOLL_TOUCH)
 		touch_pmd(vma, addr, pmd, flags);
+
 	if ((flags & FOLL_MLOCK) && (vma->vm_flags & VM_LOCKED)) {
 		/*
 		 * We don't mlock() pte-mapped THPs. This way we can avoid
@@ -1522,8 +1541,6 @@ struct page *follow_trans_huge_pmd(struct vm_area_str=
uct *vma,
 skip_mlock:
 	page +=3D (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
 	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
-	if (flags & FOLL_GET)
-		get_page(page);
=20
 out:
 	return page;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ac65bb5e38ac..0e21bbe9f017 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4326,19 +4326,6 @@ long follow_hugetlb_page(struct mm_struct *mm, struc=
t vm_area_struct *vma,
 		pfn_offset =3D (vaddr & ~huge_page_mask(h)) >> PAGE_SHIFT;
 		page =3D pte_page(huge_ptep_get(pte));
=20
-		/*
-		 * Instead of doing 'try_get_page()' below in the same_page
-		 * loop, just check the count once here.
-		 */
-		if (unlikely(page_count(page) <=3D 0)) {
-			if (pages) {
-				spin_unlock(ptl);
-				remainder =3D 0;
-				err =3D -ENOMEM;
-				break;
-			}
-		}
-
 		/*
 		 * If subpage information not requested, update counters
 		 * and skip the same_page loop below.
@@ -4356,7 +4343,13 @@ long follow_hugetlb_page(struct mm_struct *mm, struc=
t vm_area_struct *vma,
 same_page:
 		if (pages) {
 			pages[i] =3D mem_map_offset(page, pfn_offset);
-			get_page(pages[i]);
+			if (!try_grab_page(pages[i], flags)) {
+				spin_unlock(ptl);
+				remainder =3D 0;
+				err =3D -ENOMEM;
+				WARN_ON_ONCE(1);
+				break;
+			}
 		}
=20
 		if (vmas)
@@ -4916,6 +4909,12 @@ follow_huge_pmd(struct mm_struct *mm, unsigned long =
address,
 	struct page *page =3D NULL;
 	spinlock_t *ptl;
 	pte_t pte;
+
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) =3D=3D
+			 (FOLL_PIN | FOLL_GET)))
+		return NULL;
+
 retry:
 	ptl =3D pmd_lockptr(mm, pmd);
 	spin_lock(ptl);
@@ -4928,8 +4927,11 @@ follow_huge_pmd(struct mm_struct *mm, unsigned long =
address,
 	pte =3D huge_ptep_get((pte_t *)pmd);
 	if (pte_present(pte)) {
 		page =3D pmd_page(*pmd) + ((address & ~PMD_MASK) >> PAGE_SHIFT);
-		if (flags & FOLL_GET)
-			get_page(page);
+		if (unlikely(!try_grab_page(page, flags))) {
+			WARN_ON_ONCE(1);
+			page =3D NULL;
+			goto out;
+		}
 	} else {
 		if (is_hugetlb_entry_migration(pte)) {
 			spin_unlock(ptl);
@@ -4950,7 +4952,7 @@ struct page * __weak
 follow_huge_pud(struct mm_struct *mm, unsigned long address,
 		pud_t *pud, int flags)
 {
-	if (flags & FOLL_GET)
+	if (flags & (FOLL_GET | FOLL_PIN))
 		return NULL;
=20
 	return pte_page(*(pte_t *)pud) + ((address & ~PUD_MASK) >> PAGE_SHIFT);
@@ -4959,7 +4961,7 @@ follow_huge_pud(struct mm_struct *mm, unsigned long a=
ddress,
 struct page * __weak
 follow_huge_pgd(struct mm_struct *mm, unsigned long address, pgd_t *pgd, i=
nt flags)
 {
-	if (flags & FOLL_GET)
+	if (flags & (FOLL_GET | FOLL_PIN))
 		return NULL;
=20
 	return pte_page(*(pte_t *)pgd) + ((address & ~PGDIR_MASK) >> PAGE_SHIFT);
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 78d53378db99..b56808bae1b4 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1168,6 +1168,8 @@ const char * const vmstat_text[] =3D {
 	"nr_dirtied",
 	"nr_written",
 	"nr_kernel_misc_reclaimable",
+	"nr_foll_pin_requested",
+	"nr_foll_pin_returned",
=20
 	/* enum writeback_stat_item counters */
 	"nr_dirty_threshold",
--=20
2.24.1

