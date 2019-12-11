Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF311A300
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 04:28:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xj7c2DbVzDqj1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 14:28:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="XeEwBP2p"; 
 dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XhMW51gWzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 13:53:43 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df05a240000>; Tue, 10 Dec 2019 18:53:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 18:53:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 10 Dec 2019 18:53:30 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 02:53:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:53:29 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df05a280000>; Tue, 10 Dec 2019 18:53:29 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 13/25] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Date: Tue, 10 Dec 2019 18:53:06 -0800
Message-ID: <20191211025318.457113-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211025318.457113-1-jhubbard@nvidia.com>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576032804; bh=P8nVR+kV72iD6sM0eEn6ntwngrRbmURGxrL6qNBlbv8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=XeEwBP2pTYdNaIYEG246RP/UGv4oCzI7HThRY4+SyCHY1b6FFnWIuAWaZeOk6ugC/
 peWmXwtUB0VSt/MEU11EZRwef0YJMKQooOhhE2q1kE8KXOakW3G5DvLDex1uQtZ5L9
 xb+t79vPiUYay+/jVra4UnbKZ6tzp+mSHzKGxGvgZki++im+lzwfYiEc8brUwhFWGO
 0kF6XTIHYPb+jEuGMlr854+Lo1QfggvNTmm7LG9RdpyTPyilhmHkRxEmzrxhIaAOnH
 FHHMHlkg6zfv7HpdX5KOo3hIMy+yo7B+sqK7BaEyE+LlV6MpG5DQAW5LL+EImWWv08
 3GwOSeyrsoYwg==
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
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert process_vm_access to use the new pin_user_pages_remote()
call, which sets FOLL_PIN. Setting FOLL_PIN is now required for
code that requires tracking of pinned pages.

Also, release the pages via put_user_page*().

Also, rename "pages" to "pinned_pages", as this makes for
easier reading of process_vm_rw_single_vec().

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/process_vm_access.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index 357aa7bef6c0..fd20ab675b85 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -42,12 +42,11 @@ static int process_vm_rw_pages(struct page **pages,
 		if (copy > len)
 			copy =3D len;
=20
-		if (vm_write) {
+		if (vm_write)
 			copied =3D copy_page_from_iter(page, offset, copy, iter);
-			set_page_dirty_lock(page);
-		} else {
+		else
 			copied =3D copy_page_to_iter(page, offset, copy, iter);
-		}
+
 		len -=3D copied;
 		if (copied < copy && iov_iter_count(iter))
 			return -EFAULT;
@@ -96,7 +95,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
 		flags |=3D FOLL_WRITE;
=20
 	while (!rc && nr_pages && iov_iter_count(iter)) {
-		int pages =3D min(nr_pages, max_pages_per_loop);
+		int pinned_pages =3D min(nr_pages, max_pages_per_loop);
 		int locked =3D 1;
 		size_t bytes;
=20
@@ -106,14 +105,15 @@ static int process_vm_rw_single_vec(unsigned long add=
r,
 		 * current/current->mm
 		 */
 		down_read(&mm->mmap_sem);
-		pages =3D get_user_pages_remote(task, mm, pa, pages, flags,
-					      process_pages, NULL, &locked);
+		pinned_pages =3D pin_user_pages_remote(task, mm, pa, pinned_pages,
+						     flags, process_pages,
+						     NULL, &locked);
 		if (locked)
 			up_read(&mm->mmap_sem);
-		if (pages <=3D 0)
+		if (pinned_pages <=3D 0)
 			return -EFAULT;
=20
-		bytes =3D pages * PAGE_SIZE - start_offset;
+		bytes =3D pinned_pages * PAGE_SIZE - start_offset;
 		if (bytes > len)
 			bytes =3D len;
=20
@@ -122,10 +122,12 @@ static int process_vm_rw_single_vec(unsigned long add=
r,
 					 vm_write);
 		len -=3D bytes;
 		start_offset =3D 0;
-		nr_pages -=3D pages;
-		pa +=3D pages * PAGE_SIZE;
-		while (pages)
-			put_page(process_pages[--pages]);
+		nr_pages -=3D pinned_pages;
+		pa +=3D pinned_pages * PAGE_SIZE;
+
+		/* If vm_write is set, the pages need to be made dirty: */
+		put_user_pages_dirty_lock(process_pages, pinned_pages,
+					  vm_write);
 	}
=20
 	return rc;
--=20
2.24.0

