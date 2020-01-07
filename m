Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8FD13375E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 00:25:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47spPz54d4zDqd0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 10:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="PR6tPgdZ"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47snY71Qk1zDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 09:46:18 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e150a1c0000>; Tue, 07 Jan 2020 14:45:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 14:46:05 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 07 Jan 2020 14:46:05 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:46:04 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:46:00 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 22:46:00 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e150a280002>; Tue, 07 Jan 2020 14:46:00 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 06/22] mm: fix get_user_pages_remote()'s handling of
 FOLL_LONGTERM
Date: Tue, 7 Jan 2020 14:45:42 -0800
Message-ID: <20200107224558.2362728-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107224558.2362728-1-jhubbard@nvidia.com>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578437148; bh=MKwa9FNUgW2GSdRoQWy4jgB881/WBtNchzrZ2I8BLbk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=PR6tPgdZL1rZ8ERmazBZHKe2L7e6KucH5piwq/QICqKp/Nfybqjpy68iOJhI+6ORp
 fxAfPJ5IiCUXRD+25qtq60D75IqldEu69I4BO94cZsaPE2KjRW9XccRJQ8azADvZzf
 d7OR4dlDqStDaQMJDWmWGKXRQ9Yy407eowZ0RYacMHVhNBC0i0/a4RbibwDEPyhIFE
 irDGedVFLrPzqQPIvVGd/Zi3d+AD822Q4qPxSkWCuI32B3ZkZ1Tg8bZ1ZAxzUum2f5
 WCqqFMRHNyMyrFKKSq3If9kXCCuFRO3z1S5cZ9P6HW11G32jMX1KQsJuoHpLGOVAFc
 VEbkfZSb/UhFw==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Magnus
 Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As it says in the updated comment in gup.c: current FOLL_LONGTERM
behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
FS DAX check requirement on vmas.

However, the corresponding restriction in get_user_pages_remote() was
slightly stricter than is actually required: it forbade all
FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
that do not set the "locked" arg.

Update the code and comments to loosen the restriction, allowing
FOLL_LONGTERM in some cases.

Also, copy the DAX check ("if a VMA is DAX, don't allow long term
pinning") from the VFIO call site, all the way into the internals
of get_user_pages_remote() and __gup_longterm_locked(). That is:
get_user_pages_remote() calls __gup_longterm_locked(), which in turn
calls check_dax_vmas(). This check will then be removed from the VFIO
call site in a subsequent patch.

Thanks to Jason Gunthorpe for pointing out a clean way to fix this,
and to Dan Williams for helping clarify the DAX refactoring.

Tested-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 174 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 92 insertions(+), 82 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 5938e29a5a8b..b61bd5c469ae 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1111,88 +1111,6 @@ static __always_inline long __get_user_pages_locked(=
struct task_struct *tsk,
 	return pages_done;
 }
=20
-/*
- * get_user_pages_remote() - pin user pages in memory
- * @tsk:	the task_struct to use for page fault accounting, or
- *		NULL if faults are not to be recorded.
- * @mm:		mm_struct of target mm
- * @start:	starting user address
- * @nr_pages:	number of pages from start to pin
- * @gup_flags:	flags modifying lookup behaviour
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_pages long. Or NULL, if caller
- *		only intends to ensure the pages are faulted in.
- * @vmas:	array of pointers to vmas corresponding to each page.
- *		Or NULL if the caller does not require them.
- * @locked:	pointer to lock flag indicating whether lock is held and
- *		subsequently whether VM_FAULT_RETRY functionality can be
- *		utilised. Lock must initially be held.
- *
- * Returns either number of pages pinned (which may be less than the
- * number requested), or an error. Details about the return value:
- *
- * -- If nr_pages is 0, returns 0.
- * -- If nr_pages is >0, but no pages were pinned, returns -errno.
- * -- If nr_pages is >0, and some pages were pinned, returns the number of
- *    pages pinned. Again, this may be less than nr_pages.
- *
- * The caller is responsible for releasing returned @pages, via put_page()=
.
- *
- * @vmas are valid only as long as mmap_sem is held.
- *
- * Must be called with mmap_sem held for read or write.
- *
- * get_user_pages walks a process's page tables and takes a reference to
- * each struct page that each user address corresponds to at a given
- * instant. That is, it takes the page that would be accessed if a user
- * thread accesses the given user virtual address at that instant.
- *
- * This does not guarantee that the page exists in the user mappings when
- * get_user_pages returns, and there may even be a completely different
- * page there in some cases (eg. if mmapped pagecache has been invalidated
- * and subsequently re faulted). However it does guarantee that the page
- * won't be freed completely. And mostly callers simply care that the page
- * contains data that was valid *at some point in time*. Typically, an IO
- * or similar operation cannot guarantee anything stronger anyway because
- * locks can't be held over the syscall boundary.
- *
- * If gup_flags & FOLL_WRITE =3D=3D 0, the page must not be written to. If=
 the page
- * is written to, set_page_dirty (or set_page_dirty_lock, as appropriate) =
must
- * be called after the page is finished with, and before put_page is calle=
d.
- *
- * get_user_pages is typically used for fewer-copy IO operations, to get a
- * handle on the memory by some means other than accesses via the user vir=
tual
- * addresses. The pages may be submitted for DMA to devices or accessed vi=
a
- * their kernel linear mapping (via the kmap APIs). Care should be taken t=
o
- * use the correct cache flushing APIs.
- *
- * See also get_user_pages_fast, for performance critical applications.
- *
- * get_user_pages should be phased out in favor of
- * get_user_pages_locked|unlocked or get_user_pages_fast. Nothing
- * should use get_user_pages because it cannot pass
- * FAULT_FLAG_ALLOW_RETRY to handle_mm_fault.
- */
-long get_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
-		unsigned long start, unsigned long nr_pages,
-		unsigned int gup_flags, struct page **pages,
-		struct vm_area_struct **vmas, int *locked)
-{
-	/*
-	 * FIXME: Current FOLL_LONGTERM behavior is incompatible with
-	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
-	 * vmas.  As there are no users of this flag in this call we simply
-	 * disallow this option for now.
-	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
-		return -EINVAL;
-
-	return __get_user_pages_locked(tsk, mm, start, nr_pages, pages, vmas,
-				       locked,
-				       gup_flags | FOLL_TOUCH | FOLL_REMOTE);
-}
-EXPORT_SYMBOL(get_user_pages_remote);
-
 /**
  * populate_vma_page_range() -  populate a range of pages in the vma.
  * @vma:   target vma
@@ -1626,6 +1544,98 @@ static __always_inline long __gup_longterm_locked(st=
ruct task_struct *tsk,
 }
 #endif /* CONFIG_FS_DAX || CONFIG_CMA */
=20
+/*
+ * get_user_pages_remote() - pin user pages in memory
+ * @tsk:	the task_struct to use for page fault accounting, or
+ *		NULL if faults are not to be recorded.
+ * @mm:		mm_struct of target mm
+ * @start:	starting user address
+ * @nr_pages:	number of pages from start to pin
+ * @gup_flags:	flags modifying lookup behaviour
+ * @pages:	array that receives pointers to the pages pinned.
+ *		Should be at least nr_pages long. Or NULL, if caller
+ *		only intends to ensure the pages are faulted in.
+ * @vmas:	array of pointers to vmas corresponding to each page.
+ *		Or NULL if the caller does not require them.
+ * @locked:	pointer to lock flag indicating whether lock is held and
+ *		subsequently whether VM_FAULT_RETRY functionality can be
+ *		utilised. Lock must initially be held.
+ *
+ * Returns either number of pages pinned (which may be less than the
+ * number requested), or an error. Details about the return value:
+ *
+ * -- If nr_pages is 0, returns 0.
+ * -- If nr_pages is >0, but no pages were pinned, returns -errno.
+ * -- If nr_pages is >0, and some pages were pinned, returns the number of
+ *    pages pinned. Again, this may be less than nr_pages.
+ *
+ * The caller is responsible for releasing returned @pages, via put_page()=
.
+ *
+ * @vmas are valid only as long as mmap_sem is held.
+ *
+ * Must be called with mmap_sem held for read or write.
+ *
+ * get_user_pages walks a process's page tables and takes a reference to
+ * each struct page that each user address corresponds to at a given
+ * instant. That is, it takes the page that would be accessed if a user
+ * thread accesses the given user virtual address at that instant.
+ *
+ * This does not guarantee that the page exists in the user mappings when
+ * get_user_pages returns, and there may even be a completely different
+ * page there in some cases (eg. if mmapped pagecache has been invalidated
+ * and subsequently re faulted). However it does guarantee that the page
+ * won't be freed completely. And mostly callers simply care that the page
+ * contains data that was valid *at some point in time*. Typically, an IO
+ * or similar operation cannot guarantee anything stronger anyway because
+ * locks can't be held over the syscall boundary.
+ *
+ * If gup_flags & FOLL_WRITE =3D=3D 0, the page must not be written to. If=
 the page
+ * is written to, set_page_dirty (or set_page_dirty_lock, as appropriate) =
must
+ * be called after the page is finished with, and before put_page is calle=
d.
+ *
+ * get_user_pages is typically used for fewer-copy IO operations, to get a
+ * handle on the memory by some means other than accesses via the user vir=
tual
+ * addresses. The pages may be submitted for DMA to devices or accessed vi=
a
+ * their kernel linear mapping (via the kmap APIs). Care should be taken t=
o
+ * use the correct cache flushing APIs.
+ *
+ * See also get_user_pages_fast, for performance critical applications.
+ *
+ * get_user_pages should be phased out in favor of
+ * get_user_pages_locked|unlocked or get_user_pages_fast. Nothing
+ * should use get_user_pages because it cannot pass
+ * FAULT_FLAG_ALLOW_RETRY to handle_mm_fault.
+ */
+long get_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
+		unsigned long start, unsigned long nr_pages,
+		unsigned int gup_flags, struct page **pages,
+		struct vm_area_struct **vmas, int *locked)
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
+EXPORT_SYMBOL(get_user_pages_remote);
+
 /*
  * This is the same as get_user_pages_remote(), just with a
  * less-flexible calling convention where we assume that the task
--=20
2.24.1

