Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51D2899BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 22:27:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7KPY1Fr5zDqf4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 07:27:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Jc31jj6zDqZp;
 Sat, 10 Oct 2020 06:51:31 +1100 (AEDT)
IronPort-SDR: /pDVvzPYw3zJspvSAikc8D5FzdXUUn1GTuOhj2Fa5vSW7LIGh9iTGRRKq4fcXmVBjOM26AeQrE
 HBL0vqnWJ5iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162893291"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="162893291"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:29 -0700
IronPort-SDR: 0+lGONiHFSeyE/0kQGUe/v/Z0vqstKsQGCedA4TvP63fkNzDWGjPYFj9hsR1yECUQTFrwG697Z
 McTBAsxZaLwQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="298419323"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:28 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 12/58] fs/afs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:47 -0700
Message-Id: <20201009195033.3208459-13-ira.weiny@intel.com>
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
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/afs/dir.c      | 16 ++++++++--------
 fs/afs/dir_edit.c | 16 ++++++++--------
 fs/afs/mntpt.c    |  4 ++--
 fs/afs/write.c    |  4 ++--
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 1d2e61e0ab04..5d01cdb590de 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -127,14 +127,14 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 	qty /= sizeof(union afs_xdr_dir_block);
 
 	/* check them */
-	dbuf = kmap(page);
+	dbuf = kmap_thread(page);
 	for (tmp = 0; tmp < qty; tmp++) {
 		if (dbuf->blocks[tmp].hdr.magic != AFS_DIR_MAGIC) {
 			printk("kAFS: %s(%lx): bad magic %d/%d is %04hx\n",
 			       __func__, dvnode->vfs_inode.i_ino, tmp, qty,
 			       ntohs(dbuf->blocks[tmp].hdr.magic));
 			trace_afs_dir_check_failed(dvnode, off, i_size);
-			kunmap(page);
+			kunmap_thread(page);
 			trace_afs_file_error(dvnode, -EIO, afs_file_error_dir_bad_magic);
 			goto error;
 		}
@@ -146,7 +146,7 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 		((u8 *)&dbuf->blocks[tmp])[AFS_DIR_BLOCK_SIZE - 1] = 0;
 	}
 
-	kunmap(page);
+	kunmap_thread(page);
 
 checked:
 	afs_stat_v(dvnode, n_read_dir);
@@ -177,13 +177,13 @@ static bool afs_dir_check_pages(struct afs_vnode *dvnode, struct afs_read *req)
 		req->pos, req->index, req->nr_pages, req->offset);
 
 	for (i = 0; i < req->nr_pages; i++) {
-		dbuf = kmap(req->pages[i]);
+		dbuf = kmap_thread(req->pages[i]);
 		for (j = 0; j < qty; j++) {
 			union afs_xdr_dir_block *block = &dbuf->blocks[j];
 
 			pr_warn("[%02x] %32phN\n", i * qty + j, block);
 		}
-		kunmap(req->pages[i]);
+		kunmap_thread(req->pages[i]);
 	}
 	return false;
 }
@@ -481,7 +481,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 
 		limit = blkoff & ~(PAGE_SIZE - 1);
 
-		dbuf = kmap(page);
+		dbuf = kmap_thread(page);
 
 		/* deal with the individual blocks stashed on this page */
 		do {
@@ -489,7 +489,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 					       sizeof(union afs_xdr_dir_block)];
 			ret = afs_dir_iterate_block(dvnode, ctx, dblock, blkoff);
 			if (ret != 1) {
-				kunmap(page);
+				kunmap_thread(page);
 				goto out;
 			}
 
@@ -497,7 +497,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 
 		} while (ctx->pos < dir->i_size && blkoff < limit);
 
-		kunmap(page);
+		kunmap_thread(page);
 		ret = 0;
 	}
 
diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index b108528bf010..35ed6828e205 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -218,7 +218,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 	need_slots = round_up(12 + name->len + 1 + 4, AFS_DIR_DIRENT_SIZE);
 	need_slots /= AFS_DIR_DIRENT_SIZE;
 
-	meta_page = kmap(page0);
+	meta_page = kmap_thread(page0);
 	meta = &meta_page->blocks[0];
 	if (i_size == 0)
 		goto new_directory;
@@ -247,7 +247,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 				set_page_private(page, 1);
 				SetPagePrivate(page);
 			}
-			dir_page = kmap(page);
+			dir_page = kmap_thread(page);
 		}
 
 		/* Abandon the edit if we got a callback break. */
@@ -284,7 +284,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 
 		if (page != page0) {
 			unlock_page(page);
-			kunmap(page);
+			kunmap_thread(page);
 			put_page(page);
 		}
 	}
@@ -323,7 +323,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 	afs_set_contig_bits(block, slot, need_slots);
 	if (page != page0) {
 		unlock_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 	}
 
@@ -337,7 +337,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 
 out_unmap:
 	unlock_page(page0);
-	kunmap(page0);
+	kunmap_thread(page0);
 	put_page(page0);
 	_leave("");
 	return;
@@ -346,7 +346,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 	trace_afs_edit_dir(vnode, why, afs_edit_dir_create_inval, 0, 0, 0, 0, name->name);
 	clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
 	if (page != page0) {
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 	}
 	goto out_unmap;
@@ -398,7 +398,7 @@ void afs_edit_dir_remove(struct afs_vnode *vnode,
 	need_slots = round_up(12 + name->len + 1 + 4, AFS_DIR_DIRENT_SIZE);
 	need_slots /= AFS_DIR_DIRENT_SIZE;
 
-	meta_page = kmap(page0);
+	meta_page = kmap_thread(page0);
 	meta = &meta_page->blocks[0];
 
 	/* Find a page that has sufficient slots available.  Each VM page
@@ -410,7 +410,7 @@ void afs_edit_dir_remove(struct afs_vnode *vnode,
 			page = find_lock_page(vnode->vfs_inode.i_mapping, index);
 			if (!page)
 				goto error;
-			dir_page = kmap(page);
+			dir_page = kmap_thread(page);
 		} else {
 			page = page0;
 			dir_page = meta_page;
diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index 79bc5f1338ed..562454e2fd5c 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -139,11 +139,11 @@ static int afs_mntpt_set_params(struct fs_context *fc, struct dentry *mntpt)
 			return ret;
 		}
 
-		buf = kmap(page);
+		buf = kmap_thread(page);
 		ret = -EINVAL;
 		if (buf[size - 1] == '.')
 			ret = vfs_parse_fs_string(fc, "source", buf, size - 1);
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 		if (ret < 0)
 			return ret;
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 4b2265cb1891..c56e5b4db4ae 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -38,9 +38,9 @@ static int afs_fill_page(struct afs_vnode *vnode, struct key *key,
 	if (pos >= vnode->vfs_inode.i_size) {
 		p = pos & ~PAGE_MASK;
 		ASSERTCMP(p + len, <=, PAGE_SIZE);
-		data = kmap(page);
+		data = kmap_thread(page);
 		memset(data + p, 0, len);
-		kunmap(page);
+		kunmap_thread(page);
 		return 0;
 	}
 
-- 
2.28.0.rc0.12.gb6a658bd00c9

