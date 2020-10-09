Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F455289A94
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 23:27:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7LlH5g6bzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 08:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Jdp0QHHzDqbq;
 Sat, 10 Oct 2020 06:53:01 +1100 (AEDT)
IronPort-SDR: F+cRAtStmMZWPxJhFNrsbDNDweBWJFqggpxNOlrKBE6Lo3MaPi6/QVtW+Tg1MtH3CZRO8NWt3N
 sdnyRjuAbbwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162893552"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="162893552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:00 -0700
IronPort-SDR: Wf0Bi1Gs1P3ZgILN9Dk8+ODZhbqXc7J3tJZabe+2AUx5fg/nQYQB2E9E/9NHNQgBhyfVAmIu+q
 D7ag8zQ3enrg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="462300964"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:58 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 36/58] fs/ext2: Use ext2_put_page
Date: Fri,  9 Oct 2020 12:50:11 -0700
Message-Id: <20201009195033.3208459-37-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

There are 3 places in namei.c where the equivalent of ext2_put_page() is
open coded.  We want to use k[un]map_thread() instead of k[un]map() in
ext2_[get|put]_page().

Move ext2_put_page() to ext2.h and use it in namei.c in prep for
converting the k[un]map() code.

Cc: Jan Kara <jack@suse.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ext2/dir.c   |  6 ------
 fs/ext2/ext2.h  |  8 ++++++++
 fs/ext2/namei.c | 15 +++++----------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index 70355ab6740e..f3194bf20733 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -66,12 +66,6 @@ static inline unsigned ext2_chunk_size(struct inode *inode)
 	return inode->i_sb->s_blocksize;
 }
 
-static inline void ext2_put_page(struct page *page)
-{
-	kunmap(page);
-	put_page(page);
-}
-
 /*
  * Return the offset into page `page_nr' of the last valid
  * byte in that page, plus one.
diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index 5136b7289e8d..021ec8b42ac3 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -16,6 +16,8 @@
 #include <linux/blockgroup_lock.h>
 #include <linux/percpu_counter.h>
 #include <linux/rbtree.h>
+#include <linux/mm.h>
+#include <linux/highmem.h>
 
 /* XXX Here for now... not interested in restructing headers JUST now */
 
@@ -745,6 +747,12 @@ extern int ext2_delete_entry (struct ext2_dir_entry_2 *, struct page *);
 extern int ext2_empty_dir (struct inode *);
 extern struct ext2_dir_entry_2 * ext2_dotdot (struct inode *, struct page **);
 extern void ext2_set_link(struct inode *, struct ext2_dir_entry_2 *, struct page *, struct inode *, int);
+static inline void ext2_put_page(struct page *page)
+{
+	kunmap(page);
+	put_page(page);
+}
+
 
 /* ialloc.c */
 extern struct inode * ext2_new_inode (struct inode *, umode_t, const struct qstr *);
diff --git a/fs/ext2/namei.c b/fs/ext2/namei.c
index 5bf2c145643b..ea980f1e2e99 100644
--- a/fs/ext2/namei.c
+++ b/fs/ext2/namei.c
@@ -389,23 +389,18 @@ static int ext2_rename (struct inode * old_dir, struct dentry * old_dentry,
 	if (dir_de) {
 		if (old_dir != new_dir)
 			ext2_set_link(old_inode, dir_de, dir_page, new_dir, 0);
-		else {
-			kunmap(dir_page);
-			put_page(dir_page);
-		}
+		else
+			ext2_put_page(dir_page);
 		inode_dec_link_count(old_dir);
 	}
 	return 0;
 
 
 out_dir:
-	if (dir_de) {
-		kunmap(dir_page);
-		put_page(dir_page);
-	}
+	if (dir_de)
+		ext2_put_page(dir_page);
 out_old:
-	kunmap(old_page);
-	put_page(old_page);
+	ext2_put_page(old_page);
 out:
 	return err;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9

