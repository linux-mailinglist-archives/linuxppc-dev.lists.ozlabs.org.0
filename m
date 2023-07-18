Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48D757CC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:06:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fWY2tnY+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zk93snmz3dGB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fWY2tnY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZD0cvSz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:00:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56D1C61590;
	Tue, 18 Jul 2023 13:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C201DC433D9;
	Tue, 18 Jul 2023 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685201;
	bh=lKg/kM8yxaIb5VNBrPEC0xTAYFIsda0h1dTsIkb30tY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fWY2tnY+RgWsAgMdO5garsNVtd5PpRJxi+gjqymbqeuKLPrM239MJkCuuxxw++3Tp
	 Y7jn3sOgebAmvI0gnRSfEz0HbA20NUtjMTl/I3UCWdhgz7QBOAw06R7JH1fdy4fGZU
	 044FgWjf/Y58MIDMgP8j5W0qaas3J1YmME4Xd+c2DXGj/P4AKs/WsbwHp5dFcqQGLx
	 cprfabOI1t12tHSnJzQZNxii2sjvVHAWcsx/ibhaBmtbB2sC88qoumn4oEZpnMp8dq
	 mXecmEOKXKBmqwbzfjk9ApRY6LCZqDzVlanq3gJ49bs42cYyidfZXa/rVOrUKQvduH
	 lZEwuyH1BB39w==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 07/21] ubifs: Migrate to acomp compression API
Date: Tue, 18 Jul 2023 14:58:33 +0200
Message-Id: <20230718125847.3869700-8-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17054; i=ardb@kernel.org; h=from:subject; bh=lKg/kM8yxaIb5VNBrPEC0xTAYFIsda0h1dTsIkb30tY=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT+mW3a85NCfKnZKu/Pp8YVTuzDSWNxGX9wXt3fZac rNAj9WnjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARrb8Mv9m4PjNNjjcV3Br0 8oTdJSvO78LmLZEZomotT19c6xWeX8DIsLvkSOq0pK7Pd1QMeFTuF/7+eattytmj/DNEDluk886 fwQkA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UBIFS is one of the remaining users of the obsolete 'comp' compression
API exposed by the crypto subsystem. Given that it operates strictly on
contiguous buffers that are either entirely in lowmem or covered by a
single page, the conversion to the acomp API is quite straight-forward.

Only synchronous acomp implementations are considered at the moment, and
whether or not a future conversion to permit asynchronous ones too will
be worth the effort remains to be seen.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 fs/ubifs/compress.c | 61 ++++++++++++++------
 fs/ubifs/file.c     | 46 ++++++++-------
 fs/ubifs/journal.c  | 19 ++++--
 fs/ubifs/ubifs.h    | 15 +++--
 4 files changed, 90 insertions(+), 51 deletions(-)

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 75461777c466b1c9..570919b218a0a8cc 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -82,15 +82,15 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
 /**
  * ubifs_compress - compress data.
- * @in_buf: data to compress
+ * @in_sg: data to compress
  * @in_len: length of the data to compress
  * @out_buf: output buffer where compressed data should be stored
  * @out_len: output buffer length is returned here
  * @compr_type: type of compression to use on enter, actually used compression
  *              type on exit
  *
- * This function compresses input buffer @in_buf of length @in_len and stores
- * the result in the output buffer @out_buf and the resulting length in
+ * This function compresses input scatterlist @in_sg of length @in_len and
+ * stores the result in the output buffer @out_buf and the resulting length in
  * @out_len. If the input buffer does not compress, it is just copied to the
  * @out_buf. The same happens if @compr_type is %UBIFS_COMPR_NONE or if
  * compression error occurred.
@@ -98,11 +98,12 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
  * Note, if the input buffer was not compressed, it is copied to the output
  * buffer and %UBIFS_COMPR_NONE is returned in @compr_type.
  */
-void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
+void ubifs_compress(const struct ubifs_info *c, struct scatterlist *in_sg,
 		    int in_len, void *out_buf, int *out_len, int *compr_type)
 {
 	int err;
 	struct ubifs_compressor *compr = ubifs_compressors[*compr_type];
+	struct scatterlist out_sg;
 
 	if (*compr_type == UBIFS_COMPR_NONE)
 		goto no_compr;
@@ -111,10 +112,13 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 	if (in_len < UBIFS_MIN_COMPR_LEN)
 		goto no_compr;
 
+	sg_init_one(&out_sg, out_buf, *out_len);
+
 	if (compr->comp_mutex)
 		mutex_lock(compr->comp_mutex);
-	err = crypto_comp_compress(compr->cc, in_buf, in_len, out_buf,
-				   (unsigned int *)out_len);
+	acomp_request_set_params(compr->req, in_sg, &out_sg, in_len, *out_len);
+	err = crypto_acomp_compress(compr->req);
+	*out_len = compr->req->dlen;
 	if (compr->comp_mutex)
 		mutex_unlock(compr->comp_mutex);
 	if (unlikely(err)) {
@@ -133,7 +137,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 	return;
 
 no_compr:
-	memcpy(out_buf, in_buf, in_len);
+	sg_copy_to_buffer(in_sg, 1, out_buf, in_len);
 	*out_len = in_len;
 	*compr_type = UBIFS_COMPR_NONE;
 }
@@ -142,19 +146,20 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
  * ubifs_decompress - decompress data.
  * @in_buf: data to decompress
  * @in_len: length of the data to decompress
- * @out_buf: output buffer where decompressed data should
+ * @out_sg: output buffer where decompressed data should be stored
  * @out_len: output length is returned here
  * @compr_type: type of compression
  *
- * This function decompresses data from buffer @in_buf into buffer @out_buf.
+ * This function decompresses data from buffer @in_buf into scatterlist @out_sg.
  * The length of the uncompressed data is returned in @out_len. This functions
  * returns %0 on success or a negative error code on failure.
  */
-int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
-		     int in_len, void *out_buf, int *out_len, int compr_type)
+int ubifs_decompress(const struct ubifs_info *c, const void *in_buf, int in_len,
+		     struct scatterlist *out_sg, int *out_len, int compr_type)
 {
 	int err;
 	struct ubifs_compressor *compr;
+	struct scatterlist in_sg;
 
 	if (unlikely(compr_type < 0 || compr_type >= UBIFS_COMPR_TYPES_CNT)) {
 		ubifs_err(c, "invalid compression type %d", compr_type);
@@ -169,15 +174,18 @@ int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 	}
 
 	if (compr_type == UBIFS_COMPR_NONE) {
-		memcpy(out_buf, in_buf, in_len);
+		sg_copy_from_buffer(out_sg, 1, in_buf, in_len);
 		*out_len = in_len;
 		return 0;
 	}
 
+	sg_init_one(&in_sg, in_buf, in_len);
+
 	if (compr->decomp_mutex)
 		mutex_lock(compr->decomp_mutex);
-	err = crypto_comp_decompress(compr->cc, in_buf, in_len, out_buf,
-				     (unsigned int *)out_len);
+	acomp_request_set_params(compr->req, &in_sg, out_sg, in_len, *out_len);
+	err = crypto_acomp_decompress(compr->req);
+	*out_len = compr->req->dlen;
 	if (compr->decomp_mutex)
 		mutex_unlock(compr->decomp_mutex);
 	if (err)
@@ -197,11 +205,24 @@ int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 static int __init compr_init(struct ubifs_compressor *compr)
 {
 	if (compr->capi_name) {
-		compr->cc = crypto_alloc_comp(compr->capi_name, 0, 0);
+		long ret;
+
+		compr->cc = crypto_alloc_acomp(compr->capi_name, 0,
+					       CRYPTO_ALG_ASYNC);
 		if (IS_ERR(compr->cc)) {
+			ret = PTR_ERR(compr->cc);
+		} else {
+			compr->req = acomp_request_alloc(compr->cc);
+			if (!compr->req) {
+				crypto_free_acomp(compr->cc);
+				ret = -ENOMEM;
+			}
+		}
+
+		if (ret) {
 			pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
-			       current->pid, compr->name, PTR_ERR(compr->cc));
-			return PTR_ERR(compr->cc);
+			       current->pid, compr->name, ret);
+			return ret;
 		}
 	}
 
@@ -215,8 +236,10 @@ static int __init compr_init(struct ubifs_compressor *compr)
  */
 static void compr_exit(struct ubifs_compressor *compr)
 {
-	if (compr->capi_name)
-		crypto_free_comp(compr->cc);
+	if (compr->capi_name) {
+		acomp_request_free(compr->req);
+		crypto_free_acomp(compr->cc);
+	}
 }
 
 /**
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 6738fe43040b11d3..407dcb573f5344f6 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -42,8 +42,8 @@
 #include <linux/slab.h>
 #include <linux/migrate.h>
 
-static int read_block(struct inode *inode, void *addr, unsigned int block,
-		      struct ubifs_data_node *dn)
+static int read_block(struct inode *inode, struct scatterlist *sg,
+		      unsigned int block, struct ubifs_data_node *dn)
 {
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	int err, len, out_len;
@@ -55,7 +55,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 	if (err) {
 		if (err == -ENOENT)
 			/* Not found, so it must be a hole */
-			memset(addr, 0, UBIFS_BLOCK_SIZE);
+			sg_zero_buffer(sg, 1, UBIFS_BLOCK_SIZE, 0);
 		return err;
 	}
 
@@ -74,7 +74,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 	}
 
 	out_len = UBIFS_BLOCK_SIZE;
-	err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
+	err = ubifs_decompress(c, &dn->data, dlen, sg, &out_len,
 			       le16_to_cpu(dn->compr_type));
 	if (err || len != out_len)
 		goto dump;
@@ -85,7 +85,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 	 * appending data). Ensure that the remainder is zeroed out.
 	 */
 	if (len < UBIFS_BLOCK_SIZE)
-		memset(addr + len, 0, UBIFS_BLOCK_SIZE - len);
+		sg_zero_buffer(sg, 1, UBIFS_BLOCK_SIZE - len, len);
 
 	return 0;
 
@@ -98,27 +98,29 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 
 static int do_readpage(struct page *page)
 {
-	void *addr;
 	int err = 0, i;
 	unsigned int block, beyond;
 	struct ubifs_data_node *dn;
 	struct inode *inode = page->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	loff_t i_size = i_size_read(inode);
+	struct scatterlist sg;
+	size_t offset = 0;
 
 	dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
 		inode->i_ino, page->index, i_size, page->flags);
 	ubifs_assert(c, !PageChecked(page));
 	ubifs_assert(c, !PagePrivate(page));
 
-	addr = kmap(page);
+	sg_init_table(&sg, 1);
 
 	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	beyond = (i_size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
 	if (block >= beyond) {
 		/* Reading beyond inode */
 		SetPageChecked(page);
-		memset(addr, 0, PAGE_SIZE);
+		sg_set_page(&sg, page, PAGE_SIZE, 0);
+		sg_zero_buffer(&sg, 1, PAGE_SIZE, 0);
 		goto out;
 	}
 
@@ -132,12 +134,14 @@ static int do_readpage(struct page *page)
 	while (1) {
 		int ret;
 
+		sg_set_page(&sg, page, UBIFS_BLOCK_SIZE, offset);
+
 		if (block >= beyond) {
 			/* Reading beyond inode */
 			err = -ENOENT;
-			memset(addr, 0, UBIFS_BLOCK_SIZE);
+			sg_zero_buffer(&sg, 1, UBIFS_BLOCK_SIZE, 0);
 		} else {
-			ret = read_block(inode, addr, block, dn);
+			ret = read_block(inode, &sg, block, dn);
 			if (ret) {
 				err = ret;
 				if (err != -ENOENT)
@@ -147,13 +151,13 @@ static int do_readpage(struct page *page)
 				int ilen = i_size & (UBIFS_BLOCK_SIZE - 1);
 
 				if (ilen && ilen < dlen)
-					memset(addr + ilen, 0, dlen - ilen);
+					sg_zero_buffer(&sg, 1, dlen - ilen, ilen);
 			}
 		}
 		if (++i >= UBIFS_BLOCKS_PER_PAGE)
 			break;
 		block += 1;
-		addr += UBIFS_BLOCK_SIZE;
+		offset += UBIFS_BLOCK_SIZE;
 	}
 	if (err) {
 		struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -174,7 +178,6 @@ static int do_readpage(struct page *page)
 	SetPageUptodate(page);
 	ClearPageError(page);
 	flush_dcache_page(page);
-	kunmap(page);
 	return 0;
 
 error:
@@ -182,7 +185,6 @@ static int do_readpage(struct page *page)
 	ClearPageUptodate(page);
 	SetPageError(page);
 	flush_dcache_page(page);
-	kunmap(page);
 	return err;
 }
 
@@ -627,6 +629,9 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 	page_block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	while (1) {
 		int err, len, out_len, dlen;
+		struct scatterlist sg;
+
+		sg_init_table(&sg, 1);
 
 		if (nn >= bu->cnt) {
 			hole = 1;
@@ -652,7 +657,8 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 					goto out_err;
 			}
 
-			err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
+			sg_set_page(&sg, page, out_len, zaddr - addr);
+			err = ubifs_decompress(c, &dn->data, dlen, &sg, &out_len,
 					       le16_to_cpu(dn->compr_type));
 			if (err || len != out_len)
 				goto out_err;
@@ -902,9 +908,8 @@ static int ubifs_read_folio(struct file *file, struct folio *folio)
 
 static int do_writepage(struct page *page, int len)
 {
-	int err = 0, i, blen;
+	int err = 0, i, blen, offset;
 	unsigned int block;
-	void *addr;
 	union ubifs_key key;
 	struct inode *inode = page->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -919,19 +924,19 @@ static int do_writepage(struct page *page, int len)
 	/* Update radix tree tags */
 	set_page_writeback(page);
 
-	addr = kmap(page);
+	offset = 0;
 	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	i = 0;
 	while (len) {
 		blen = min_t(int, len, UBIFS_BLOCK_SIZE);
 		data_key_init(c, &key, inode->i_ino, block);
-		err = ubifs_jnl_write_data(c, inode, &key, addr, blen);
+		err = ubifs_jnl_write_data(c, inode, &key, page, offset, blen);
 		if (err)
 			break;
 		if (++i >= UBIFS_BLOCKS_PER_PAGE)
 			break;
 		block += 1;
-		addr += blen;
+		offset += blen;
 		len -= blen;
 	}
 	if (err) {
@@ -951,7 +956,6 @@ static int do_writepage(struct page *page, int len)
 	detach_page_private(page);
 	ClearPageChecked(page);
 
-	kunmap(page);
 	unlock_page(page);
 	end_page_writeback(page);
 	return err;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 5ce618f82aed201b..0d0f966c761e572a 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -714,14 +714,16 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
  * @c: UBIFS file-system description object
  * @inode: inode the data node belongs to
  * @key: node key
- * @buf: buffer to write
+ * @page: struct page describing the page containing the source data
+ * @offset: offset in page to source data
  * @len: data length (must not exceed %UBIFS_BLOCK_SIZE)
  *
  * This function writes a data node to the journal. Returns %0 if the data node
  * was successfully written, and a negative error code in case of failure.
  */
 int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
-			 const union ubifs_key *key, const void *buf, int len)
+			 const union ubifs_key *key, struct page *page, int offset,
+			 int len)
 {
 	struct ubifs_data_node *data;
 	int err, lnum, offs, compr_type, out_len, compr_len, auth_len;
@@ -730,6 +732,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	bool encrypted = IS_ENCRYPTED(inode);
 	u8 hash[UBIFS_HASH_ARR_SZ];
+	struct scatterlist sg;
 
 	dbg_jnlk(key, "ino %lu, blk %u, len %d, key ",
 		(unsigned long)key_inum(c, key), key_block(c, key), len);
@@ -765,7 +768,9 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 		compr_type = ui->compr_type;
 
 	out_len = compr_len = dlen - UBIFS_DATA_NODE_SZ;
-	ubifs_compress(c, buf, len, &data->data, &compr_len, &compr_type);
+	sg_init_table(&sg, 1);
+	sg_set_page(&sg, page, len, offset);
+	ubifs_compress(c, &sg, len, &data->data, &compr_len, &compr_type);
 	ubifs_assert(c, compr_len <= UBIFS_BLOCK_SIZE);
 
 	if (encrypted) {
@@ -1487,6 +1492,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 {
 	void *buf = NULL;
 	int err, dlen, compr_type, out_len, data_size;
+	struct scatterlist sg_buf;
 
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	data_size = dn_size - UBIFS_DATA_NODE_SZ;
@@ -1507,12 +1513,15 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 			return -ENOMEM;
 
 		out_len *= WORST_COMPR_FACTOR;
+		sg_init_one(&sg_buf, buf, out_len);
 
-		err = ubifs_decompress(c, &dn->data, dlen, buf, &out_len, compr_type);
+		err = ubifs_decompress(c, &dn->data, dlen, &sg_buf, &out_len,
+				       compr_type);
 		if (err)
 			goto out;
 
-		ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
+		ubifs_compress(c, &sg_buf, *new_len, &dn->data, &out_len,
+			       &compr_type);
 	}
 
 	if (IS_ENCRYPTED(inode)) {
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4c36044140e7eba9..2225de5b8ef50f71 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -32,6 +32,7 @@
 #include <crypto/hash_info.h>
 #include <crypto/hash.h>
 #include <crypto/algapi.h>
+#include <crypto/acompress.h>
 
 #include <linux/fscrypt.h>
 
@@ -849,7 +850,8 @@ struct ubifs_node_range {
  */
 struct ubifs_compressor {
 	int compr_type;
-	struct crypto_comp *cc;
+	struct crypto_acomp *cc;
+	struct acomp_req *req;
 	struct mutex *comp_mutex;
 	struct mutex *decomp_mutex;
 	const char *name;
@@ -1801,7 +1803,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 		     const struct fscrypt_name *nm, const struct inode *inode,
 		     int deletion, int xent);
 int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
-			 const union ubifs_key *key, const void *buf, int len);
+			 const union ubifs_key *key, struct page *page, int offset,
+			 int len);
 int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode);
 int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode);
 int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
@@ -2101,10 +2104,10 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
 /* compressor.c */
 int __init ubifs_compressors_init(void);
 void ubifs_compressors_exit(void);
-void ubifs_compress(const struct ubifs_info *c, const void *in_buf, int in_len,
-		    void *out_buf, int *out_len, int *compr_type);
-int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
-		     void *out, int *out_len, int compr_type);
+void ubifs_compress(const struct ubifs_info *c, struct scatterlist *in_sg,
+		    int in_len, void *out_buf, int *out_len, int *compr_type);
+int ubifs_decompress(const struct ubifs_info *c, const void *in_buf, int in_len,
+		     struct scatterlist *out_sg, int *out_len, int compr_type);
 
 /* sysfs.c */
 int ubifs_sysfs_init(void);
-- 
2.39.2

