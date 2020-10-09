Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE82899C8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 22:31:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7KVH6PPQzDqfV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 07:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Jc82ZfTzDqXs;
 Sat, 10 Oct 2020 06:51:35 +1100 (AEDT)
IronPort-SDR: WqfTI4XLDpR4QPIQhq16kwm7aJ9WxwWQAw9otoI8RSZeWNFUwSG++ydFisKpkTfnj7MbzrwZt7
 e5tdrU5uqtxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="152450837"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="152450837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:33 -0700
IronPort-SDR: HIW7PNpXrID3gOC4BJBiMK8gMhcX7pYwx4FKSDabG5rp79Jg8ur1teAkpcUK61qJFFQS9ID+ws
 9ehpgS1/cOeQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="349957192"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:33 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 13/58] fs/btrfs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:48 -0700
Message-Id: <20201009195033.3208459-14-ira.weiny@intel.com>
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
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/btrfs/check-integrity.c |  4 ++--
 fs/btrfs/compression.c     |  4 ++--
 fs/btrfs/inode.c           | 16 ++++++++--------
 fs/btrfs/lzo.c             | 24 ++++++++++++------------
 fs/btrfs/raid56.c          | 34 +++++++++++++++++-----------------
 fs/btrfs/reflink.c         |  8 ++++----
 fs/btrfs/send.c            |  4 ++--
 fs/btrfs/zlib.c            | 32 ++++++++++++++++----------------
 fs/btrfs/zstd.c            | 20 ++++++++++----------
 9 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/fs/btrfs/check-integrity.c b/fs/btrfs/check-integrity.c
index 81a8c87a5afb..9e5a02512ab5 100644
--- a/fs/btrfs/check-integrity.c
+++ b/fs/btrfs/check-integrity.c
@@ -2706,7 +2706,7 @@ static void __btrfsic_submit_bio(struct bio *bio)
 
 		bio_for_each_segment(bvec, bio, iter) {
 			BUG_ON(bvec.bv_len != PAGE_SIZE);
-			mapped_datav[i] = kmap(bvec.bv_page);
+			mapped_datav[i] = kmap_thread(bvec.bv_page);
 			i++;
 
 			if (dev_state->state->print_mask &
@@ -2720,7 +2720,7 @@ static void __btrfsic_submit_bio(struct bio *bio)
 					      bio, &bio_is_patched,
 					      bio->bi_opf);
 		bio_for_each_segment(bvec, bio, iter)
-			kunmap(bvec.bv_page);
+			kunmap_thread(bvec.bv_page);
 		kfree(mapped_datav);
 	} else if (NULL != dev_state && (bio->bi_opf & REQ_PREFLUSH)) {
 		if (dev_state->state->print_mask &
diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 1ab56a734e70..5944fb36d68a 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -1626,7 +1626,7 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 	curr_sample_pos = 0;
 	while (index < index_end) {
 		page = find_get_page(inode->i_mapping, index);
-		in_data = kmap(page);
+		in_data = kmap_thread(page);
 		/* Handle case where the start is not aligned to PAGE_SIZE */
 		i = start % PAGE_SIZE;
 		while (i < PAGE_SIZE - SAMPLING_READ_SIZE) {
@@ -1639,7 +1639,7 @@ static void heuristic_collect_sample(struct inode *inode, u64 start, u64 end,
 			start += SAMPLING_INTERVAL;
 			curr_sample_pos += SAMPLING_READ_SIZE;
 		}
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 
 		index++;
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 9570458aa847..9710a52c6c42 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -4603,7 +4603,7 @@ int btrfs_truncate_block(struct inode *inode, loff_t from, loff_t len,
 	if (offset != blocksize) {
 		if (!len)
 			len = blocksize - offset;
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		if (front)
 			memset(kaddr + (block_start - page_offset(page)),
 				0, offset);
@@ -4611,7 +4611,7 @@ int btrfs_truncate_block(struct inode *inode, loff_t from, loff_t len,
 			memset(kaddr + (block_start - page_offset(page)) +  offset,
 				0, len);
 		flush_dcache_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 	}
 	ClearPageChecked(page);
 	set_page_dirty(page);
@@ -6509,9 +6509,9 @@ static noinline int uncompress_inline(struct btrfs_path *path,
 	 */
 
 	if (max_size + pg_offset < PAGE_SIZE) {
-		char *map = kmap(page);
+		char *map = kmap_thread(page);
 		memset(map + pg_offset + max_size, 0, PAGE_SIZE - max_size - pg_offset);
-		kunmap(page);
+		kunmap_thread(page);
 	}
 	kfree(tmp);
 	return ret;
@@ -6704,7 +6704,7 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
 					goto out;
 				}
 			} else {
-				map = kmap(page);
+				map = kmap_thread(page);
 				read_extent_buffer(leaf, map + pg_offset, ptr,
 						   copy_size);
 				if (pg_offset + copy_size < PAGE_SIZE) {
@@ -6712,7 +6712,7 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
 					       PAGE_SIZE - pg_offset -
 					       copy_size);
 				}
-				kunmap(page);
+				kunmap_thread(page);
 			}
 			flush_dcache_page(page);
 		}
@@ -8326,10 +8326,10 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
 		zero_start = PAGE_SIZE;
 
 	if (zero_start != PAGE_SIZE) {
-		kaddr = kmap(page);
+		kaddr = kmap_thread(page);
 		memset(kaddr + zero_start, 0, PAGE_SIZE - zero_start);
 		flush_dcache_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 	}
 	ClearPageChecked(page);
 	set_page_dirty(page);
diff --git a/fs/btrfs/lzo.c b/fs/btrfs/lzo.c
index aa9cd11f4b78..f29dcc9ec573 100644
--- a/fs/btrfs/lzo.c
+++ b/fs/btrfs/lzo.c
@@ -140,7 +140,7 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 	*total_in = 0;
 
 	in_page = find_get_page(mapping, start >> PAGE_SHIFT);
-	data_in = kmap(in_page);
+	data_in = kmap_thread(in_page);
 
 	/*
 	 * store the size of all chunks of compressed data in
@@ -151,7 +151,7 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 		ret = -ENOMEM;
 		goto out;
 	}
-	cpage_out = kmap(out_page);
+	cpage_out = kmap_thread(out_page);
 	out_offset = LZO_LEN;
 	tot_out = LZO_LEN;
 	pages[0] = out_page;
@@ -209,7 +209,7 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 				if (out_len == 0 && tot_in >= len)
 					break;
 
-				kunmap(out_page);
+				kunmap_thread(out_page);
 				if (nr_pages == nr_dest_pages) {
 					out_page = NULL;
 					ret = -E2BIG;
@@ -221,7 +221,7 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 					ret = -ENOMEM;
 					goto out;
 				}
-				cpage_out = kmap(out_page);
+				cpage_out = kmap_thread(out_page);
 				pages[nr_pages++] = out_page;
 
 				pg_bytes_left = PAGE_SIZE;
@@ -243,12 +243,12 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 			break;
 
 		bytes_left = len - tot_in;
-		kunmap(in_page);
+		kunmap_thread(in_page);
 		put_page(in_page);
 
 		start += PAGE_SIZE;
 		in_page = find_get_page(mapping, start >> PAGE_SHIFT);
-		data_in = kmap(in_page);
+		data_in = kmap_thread(in_page);
 		in_len = min(bytes_left, PAGE_SIZE);
 	}
 
@@ -258,10 +258,10 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 	}
 
 	/* store the size of all chunks of compressed data */
-	cpage_out = kmap(pages[0]);
+	cpage_out = kmap_thread(pages[0]);
 	write_compress_length(cpage_out, tot_out);
 
-	kunmap(pages[0]);
+	kunmap_thread(pages[0]);
 
 	ret = 0;
 	*total_out = tot_out;
@@ -269,10 +269,10 @@ int lzo_compress_pages(struct list_head *ws, struct address_space *mapping,
 out:
 	*out_pages = nr_pages;
 	if (out_page)
-		kunmap(out_page);
+		kunmap_thread(out_page);
 
 	if (in_page) {
-		kunmap(in_page);
+		kunmap_thread(in_page);
 		put_page(in_page);
 	}
 
@@ -305,7 +305,7 @@ int lzo_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 	u64 disk_start = cb->start;
 	struct bio *orig_bio = cb->orig_bio;
 
-	data_in = kmap(pages_in[0]);
+	data_in = kmap_thread(pages_in[0]);
 	tot_len = read_compress_length(data_in);
 	/*
 	 * Compressed data header check.
@@ -387,7 +387,7 @@ int lzo_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 				else
 					kunmap(pages_in[page_in_index]);
 
-				data_in = kmap(pages_in[++page_in_index]);
+				data_in = kmap_thread(pages_in[++page_in_index]);
 
 				in_page_bytes_left = PAGE_SIZE;
 				in_offset = 0;
diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index 255490f42b5d..34e646e4548c 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -262,13 +262,13 @@ static void cache_rbio_pages(struct btrfs_raid_bio *rbio)
 		if (!rbio->bio_pages[i])
 			continue;
 
-		s = kmap(rbio->bio_pages[i]);
-		d = kmap(rbio->stripe_pages[i]);
+		s = kmap_thread(rbio->bio_pages[i]);
+		d = kmap_thread(rbio->stripe_pages[i]);
 
 		copy_page(d, s);
 
-		kunmap(rbio->bio_pages[i]);
-		kunmap(rbio->stripe_pages[i]);
+		kunmap_thread(rbio->bio_pages[i]);
+		kunmap_thread(rbio->stripe_pages[i]);
 		SetPageUptodate(rbio->stripe_pages[i]);
 	}
 	set_bit(RBIO_CACHE_READY_BIT, &rbio->flags);
@@ -1241,13 +1241,13 @@ static noinline void finish_rmw(struct btrfs_raid_bio *rbio)
 		/* first collect one page from each data stripe */
 		for (stripe = 0; stripe < nr_data; stripe++) {
 			p = page_in_rbio(rbio, stripe, pagenr, 0);
-			pointers[stripe] = kmap(p);
+			pointers[stripe] = kmap_thread(p);
 		}
 
 		/* then add the parity stripe */
 		p = rbio_pstripe_page(rbio, pagenr);
 		SetPageUptodate(p);
-		pointers[stripe++] = kmap(p);
+		pointers[stripe++] = kmap_thread(p);
 
 		if (has_qstripe) {
 
@@ -1257,7 +1257,7 @@ static noinline void finish_rmw(struct btrfs_raid_bio *rbio)
 			 */
 			p = rbio_qstripe_page(rbio, pagenr);
 			SetPageUptodate(p);
-			pointers[stripe++] = kmap(p);
+			pointers[stripe++] = kmap_thread(p);
 
 			raid6_call.gen_syndrome(rbio->real_stripes, PAGE_SIZE,
 						pointers);
@@ -1269,7 +1269,7 @@ static noinline void finish_rmw(struct btrfs_raid_bio *rbio)
 
 
 		for (stripe = 0; stripe < rbio->real_stripes; stripe++)
-			kunmap(page_in_rbio(rbio, stripe, pagenr, 0));
+			kunmap_thread(page_in_rbio(rbio, stripe, pagenr, 0));
 	}
 
 	/*
@@ -1835,7 +1835,7 @@ static void __raid_recover_end_io(struct btrfs_raid_bio *rbio)
 			} else {
 				page = rbio_stripe_page(rbio, stripe, pagenr);
 			}
-			pointers[stripe] = kmap(page);
+			pointers[stripe] = kmap_thread(page);
 		}
 
 		/* all raid6 handling here */
@@ -1940,7 +1940,7 @@ static void __raid_recover_end_io(struct btrfs_raid_bio *rbio)
 			} else {
 				page = rbio_stripe_page(rbio, stripe, pagenr);
 			}
-			kunmap(page);
+			kunmap_thread(page);
 		}
 	}
 
@@ -2379,18 +2379,18 @@ static noinline void finish_parity_scrub(struct btrfs_raid_bio *rbio,
 		/* first collect one page from each data stripe */
 		for (stripe = 0; stripe < nr_data; stripe++) {
 			p = page_in_rbio(rbio, stripe, pagenr, 0);
-			pointers[stripe] = kmap(p);
+			pointers[stripe] = kmap_thread(p);
 		}
 
 		/* then add the parity stripe */
-		pointers[stripe++] = kmap(p_page);
+		pointers[stripe++] = kmap_thread(p_page);
 
 		if (has_qstripe) {
 			/*
 			 * raid6, add the qstripe and call the
 			 * library function to fill in our p/q
 			 */
-			pointers[stripe++] = kmap(q_page);
+			pointers[stripe++] = kmap_thread(q_page);
 
 			raid6_call.gen_syndrome(rbio->real_stripes, PAGE_SIZE,
 						pointers);
@@ -2402,17 +2402,17 @@ static noinline void finish_parity_scrub(struct btrfs_raid_bio *rbio,
 
 		/* Check scrubbing parity and repair it */
 		p = rbio_stripe_page(rbio, rbio->scrubp, pagenr);
-		parity = kmap(p);
+		parity = kmap_thread(p);
 		if (memcmp(parity, pointers[rbio->scrubp], PAGE_SIZE))
 			copy_page(parity, pointers[rbio->scrubp]);
 		else
 			/* Parity is right, needn't writeback */
 			bitmap_clear(rbio->dbitmap, pagenr, 1);
-		kunmap(p);
+		kunmap_thread(p);
 
 		for (stripe = 0; stripe < nr_data; stripe++)
-			kunmap(page_in_rbio(rbio, stripe, pagenr, 0));
-		kunmap(p_page);
+			kunmap_thread(page_in_rbio(rbio, stripe, pagenr, 0));
+		kunmap_thread(p_page);
 	}
 
 	__free_page(p_page);
diff --git a/fs/btrfs/reflink.c b/fs/btrfs/reflink.c
index 5cd02514cf4d..10e53d7eba8c 100644
--- a/fs/btrfs/reflink.c
+++ b/fs/btrfs/reflink.c
@@ -92,10 +92,10 @@ static int copy_inline_to_page(struct inode *inode,
 	if (comp_type == BTRFS_COMPRESS_NONE) {
 		char *map;
 
-		map = kmap(page);
+		map = kmap_thread(page);
 		memcpy(map, data_start, datal);
 		flush_dcache_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 	} else {
 		ret = btrfs_decompress(comp_type, data_start, page, 0,
 				       inline_size, datal);
@@ -119,10 +119,10 @@ static int copy_inline_to_page(struct inode *inode,
 	if (datal < block_size) {
 		char *map;
 
-		map = kmap(page);
+		map = kmap_thread(page);
 		memset(map + datal, 0, block_size - datal);
 		flush_dcache_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 	}
 
 	SetPageUptodate(page);
diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index d9813a5b075a..06c383d3dc43 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -4863,9 +4863,9 @@ static ssize_t fill_read_buf(struct send_ctx *sctx, u64 offset, u32 len)
 			}
 		}
 
-		addr = kmap(page);
+		addr = kmap_thread(page);
 		memcpy(sctx->read_buf + ret, addr + pg_offset, cur_len);
-		kunmap(page);
+		kunmap_thread(page);
 		unlock_page(page);
 		put_page(page);
 		index++;
diff --git a/fs/btrfs/zlib.c b/fs/btrfs/zlib.c
index 05615a1099db..45b7a907bab3 100644
--- a/fs/btrfs/zlib.c
+++ b/fs/btrfs/zlib.c
@@ -126,7 +126,7 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 		ret = -ENOMEM;
 		goto out;
 	}
-	cpage_out = kmap(out_page);
+	cpage_out = kmap_thread(out_page);
 	pages[0] = out_page;
 	nr_pages = 1;
 
@@ -149,12 +149,12 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 
 				for (i = 0; i < in_buf_pages; i++) {
 					if (in_page) {
-						kunmap(in_page);
+						kunmap_thread(in_page);
 						put_page(in_page);
 					}
 					in_page = find_get_page(mapping,
 								start >> PAGE_SHIFT);
-					data_in = kmap(in_page);
+					data_in = kmap_thread(in_page);
 					memcpy(workspace->buf + i * PAGE_SIZE,
 					       data_in, PAGE_SIZE);
 					start += PAGE_SIZE;
@@ -162,12 +162,12 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 				workspace->strm.next_in = workspace->buf;
 			} else {
 				if (in_page) {
-					kunmap(in_page);
+					kunmap_thread(in_page);
 					put_page(in_page);
 				}
 				in_page = find_get_page(mapping,
 							start >> PAGE_SHIFT);
-				data_in = kmap(in_page);
+				data_in = kmap_thread(in_page);
 				start += PAGE_SIZE;
 				workspace->strm.next_in = data_in;
 			}
@@ -196,7 +196,7 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 		 * the stream end if required
 		 */
 		if (workspace->strm.avail_out == 0) {
-			kunmap(out_page);
+			kunmap_thread(out_page);
 			if (nr_pages == nr_dest_pages) {
 				out_page = NULL;
 				ret = -E2BIG;
@@ -207,7 +207,7 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 				ret = -ENOMEM;
 				goto out;
 			}
-			cpage_out = kmap(out_page);
+			cpage_out = kmap_thread(out_page);
 			pages[nr_pages] = out_page;
 			nr_pages++;
 			workspace->strm.avail_out = PAGE_SIZE;
@@ -234,7 +234,7 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 			goto out;
 		} else if (workspace->strm.avail_out == 0) {
 			/* get another page for the stream end */
-			kunmap(out_page);
+			kunmap_thread(out_page);
 			if (nr_pages == nr_dest_pages) {
 				out_page = NULL;
 				ret = -E2BIG;
@@ -245,7 +245,7 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 				ret = -ENOMEM;
 				goto out;
 			}
-			cpage_out = kmap(out_page);
+			cpage_out = kmap_thread(out_page);
 			pages[nr_pages] = out_page;
 			nr_pages++;
 			workspace->strm.avail_out = PAGE_SIZE;
@@ -265,10 +265,10 @@ int zlib_compress_pages(struct list_head *ws, struct address_space *mapping,
 out:
 	*out_pages = nr_pages;
 	if (out_page)
-		kunmap(out_page);
+		kunmap_thread(out_page);
 
 	if (in_page) {
-		kunmap(in_page);
+		kunmap_thread(in_page);
 		put_page(in_page);
 	}
 	return ret;
@@ -289,7 +289,7 @@ int zlib_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 	u64 disk_start = cb->start;
 	struct bio *orig_bio = cb->orig_bio;
 
-	data_in = kmap(pages_in[page_in_index]);
+	data_in = kmap_thread(pages_in[page_in_index]);
 	workspace->strm.next_in = data_in;
 	workspace->strm.avail_in = min_t(size_t, srclen, PAGE_SIZE);
 	workspace->strm.total_in = 0;
@@ -311,7 +311,7 @@ int zlib_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 
 	if (Z_OK != zlib_inflateInit2(&workspace->strm, wbits)) {
 		pr_warn("BTRFS: inflateInit failed\n");
-		kunmap(pages_in[page_in_index]);
+		kunmap_thread(pages_in[page_in_index]);
 		return -EIO;
 	}
 	while (workspace->strm.total_in < srclen) {
@@ -339,13 +339,13 @@ int zlib_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 
 		if (workspace->strm.avail_in == 0) {
 			unsigned long tmp;
-			kunmap(pages_in[page_in_index]);
+			kunmap_thread(pages_in[page_in_index]);
 			page_in_index++;
 			if (page_in_index >= total_pages_in) {
 				data_in = NULL;
 				break;
 			}
-			data_in = kmap(pages_in[page_in_index]);
+			data_in = kmap_thread(pages_in[page_in_index]);
 			workspace->strm.next_in = data_in;
 			tmp = srclen - workspace->strm.total_in;
 			workspace->strm.avail_in = min(tmp,
@@ -359,7 +359,7 @@ int zlib_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 done:
 	zlib_inflateEnd(&workspace->strm);
 	if (data_in)
-		kunmap(pages_in[page_in_index]);
+		kunmap_thread(pages_in[page_in_index]);
 	if (!ret)
 		zero_fill_bio(orig_bio);
 	return ret;
diff --git a/fs/btrfs/zstd.c b/fs/btrfs/zstd.c
index 9a4871636c6c..48e03f6dcef7 100644
--- a/fs/btrfs/zstd.c
+++ b/fs/btrfs/zstd.c
@@ -399,7 +399,7 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 
 	/* map in the first page of input data */
 	in_page = find_get_page(mapping, start >> PAGE_SHIFT);
-	workspace->in_buf.src = kmap(in_page);
+	workspace->in_buf.src = kmap_thread(in_page);
 	workspace->in_buf.pos = 0;
 	workspace->in_buf.size = min_t(size_t, len, PAGE_SIZE);
 
@@ -411,7 +411,7 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 		goto out;
 	}
 	pages[nr_pages++] = out_page;
-	workspace->out_buf.dst = kmap(out_page);
+	workspace->out_buf.dst = kmap_thread(out_page);
 	workspace->out_buf.pos = 0;
 	workspace->out_buf.size = min_t(size_t, max_out, PAGE_SIZE);
 
@@ -446,7 +446,7 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 		if (workspace->out_buf.pos == workspace->out_buf.size) {
 			tot_out += PAGE_SIZE;
 			max_out -= PAGE_SIZE;
-			kunmap(out_page);
+			kunmap_thread(out_page);
 			if (nr_pages == nr_dest_pages) {
 				out_page = NULL;
 				ret = -E2BIG;
@@ -458,7 +458,7 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 				goto out;
 			}
 			pages[nr_pages++] = out_page;
-			workspace->out_buf.dst = kmap(out_page);
+			workspace->out_buf.dst = kmap_thread(out_page);
 			workspace->out_buf.pos = 0;
 			workspace->out_buf.size = min_t(size_t, max_out,
 							PAGE_SIZE);
@@ -479,7 +479,7 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 			start += PAGE_SIZE;
 			len -= PAGE_SIZE;
 			in_page = find_get_page(mapping, start >> PAGE_SHIFT);
-			workspace->in_buf.src = kmap(in_page);
+			workspace->in_buf.src = kmap_thread(in_page);
 			workspace->in_buf.pos = 0;
 			workspace->in_buf.size = min_t(size_t, len, PAGE_SIZE);
 		}
@@ -518,7 +518,7 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 			goto out;
 		}
 		pages[nr_pages++] = out_page;
-		workspace->out_buf.dst = kmap(out_page);
+		workspace->out_buf.dst = kmap_thread(out_page);
 		workspace->out_buf.pos = 0;
 		workspace->out_buf.size = min_t(size_t, max_out, PAGE_SIZE);
 	}
@@ -565,7 +565,7 @@ int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 		goto done;
 	}
 
-	workspace->in_buf.src = kmap(pages_in[page_in_index]);
+	workspace->in_buf.src = kmap_thread(pages_in[page_in_index]);
 	workspace->in_buf.pos = 0;
 	workspace->in_buf.size = min_t(size_t, srclen, PAGE_SIZE);
 
@@ -601,14 +601,14 @@ int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 			break;
 
 		if (workspace->in_buf.pos == workspace->in_buf.size) {
-			kunmap(pages_in[page_in_index++]);
+			kunmap_thread(pages_in[page_in_index++]);
 			if (page_in_index >= total_pages_in) {
 				workspace->in_buf.src = NULL;
 				ret = -EIO;
 				goto done;
 			}
 			srclen -= PAGE_SIZE;
-			workspace->in_buf.src = kmap(pages_in[page_in_index]);
+			workspace->in_buf.src = kmap_thread(pages_in[page_in_index]);
 			workspace->in_buf.pos = 0;
 			workspace->in_buf.size = min_t(size_t, srclen, PAGE_SIZE);
 		}
@@ -617,7 +617,7 @@ int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 	zero_fill_bio(orig_bio);
 done:
 	if (workspace->in_buf.src)
-		kunmap(pages_in[page_in_index]);
+		kunmap_thread(pages_in[page_in_index]);
 	return ret;
 }
 
-- 
2.28.0.rc0.12.gb6a658bd00c9

