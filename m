Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1093B198
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 15:27:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTZYp21MDz3dJn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 23:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tukaani.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tukaani.org (client-ip=84.34.166.10; helo=mailscanner01.zoner.fi; envelope-from=lasse.collin@tukaani.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 450 seconds by postgrey-1.37 at boromir; Wed, 24 Jul 2024 21:14:04 AEST
Received: from mailscanner01.zoner.fi (mailscanner01.zoner.fi [84.34.166.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTWcD4jP0z3cRR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 21:14:04 +1000 (AEST)
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner01.zoner.fi (Postfix) with ESMTPS id 3CC4A438B7;
	Wed, 24 Jul 2024 14:06:28 +0300 (EEST)
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.97.1)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1sWZpA-0000000DBUh-3EBh;
	Wed, 24 Jul 2024 14:06:28 +0300
From: Lasse Collin <lasse.collin@tukaani.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 17/16] xz: Remove XZ_EXTERN and extern from functions
Date: Wed, 24 Jul 2024 14:05:41 +0300
Message-ID: <20240724110544.16430-1-lasse.collin@tukaani.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240721133633.47721-1-lasse.collin@tukaani.org>
References: <20240721133633.47721-1-lasse.collin@tukaani.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Jul 2024 23:26:50 +1000
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
Cc: Lasse Collin <lasse.collin@tukaani.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Sam James <sam@gentoo.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

XZ_EXTERN was used to make internal functions static in the preboot code.
However, in other decompressors this hasn't been done. On x86-64, this
makes no difference to the kernel image size.

Omit XZ_EXTERN and let some of the internal functions be extern in the
preboot code. Omitting XZ_EXTERN from include/linux/xz.h fixes warnings
in "make htmldocs" and makes the intradocument links to xz_dec functions
work in Documentation/staging/xz.rst. The alternative would have been to
add "XZ_EXTERN" to c_id_attributes in Documentation/conf.py but omitting
XZ_EXTERN seemed cleaner.

Link: https://lore.kernel.org/lkml/20240723205437.3c0664b0@kaneli/
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
---

Notes:
    This touches xz_config.h in PowerPC boot code. I haven't tested it but
    zlib's functions are extern in the same context, thus this should be
    a safe change on PowerPC.
    
    This replaces the patch 8/16 ("docs: Add XZ_EXTERN to c_id_attributes"):
    https://lore.kernel.org/lkml/20240721133633.47721-9-lasse.collin@tukaani.org/

 Documentation/staging/xz.rst  |  3 ---
 arch/powerpc/boot/xz_config.h |  3 ---
 include/linux/xz.h            | 35 ++++++++++++-----------------------
 lib/decompress_unxz.c         |  1 -
 lib/xz/xz_crc32.c             |  4 ++--
 lib/xz/xz_dec_bcj.c           |  9 ++++-----
 lib/xz/xz_dec_lzma2.c         | 10 ++++------
 lib/xz/xz_dec_stream.c        |  8 ++++----
 lib/xz/xz_private.h           | 20 ++++++++------------
 9 files changed, 34 insertions(+), 59 deletions(-)

diff --git a/Documentation/staging/xz.rst b/Documentation/staging/xz.rst
index e1054e9a8e65..6953a189e5f2 100644
--- a/Documentation/staging/xz.rst
+++ b/Documentation/staging/xz.rst
@@ -95,7 +95,4 @@ xz_dec API
 
 This is available with ``#include <linux/xz.h>``.
 
-``XZ_EXTERN`` is a macro used in the preboot code. Ignore it when
-reading this documentation.
-
 .. kernel-doc:: include/linux/xz.h
diff --git a/arch/powerpc/boot/xz_config.h b/arch/powerpc/boot/xz_config.h
index ebfadd39e192..9506a96ebbcc 100644
--- a/arch/powerpc/boot/xz_config.h
+++ b/arch/powerpc/boot/xz_config.h
@@ -50,11 +50,8 @@ static inline void put_unaligned_be32(u32 val, void *p)
 /* prevent the inclusion of the xz-preboot MM headers */
 #define DECOMPR_MM_H
 #define memmove memmove
-#define XZ_EXTERN static
 
 /* xz.h needs to be included directly since we need enum xz_mode */
 #include "../../../include/linux/xz.h"
 
-#undef XZ_EXTERN
-
 #endif
diff --git a/include/linux/xz.h b/include/linux/xz.h
index 701d62c02b9a..58ae1d746c6f 100644
--- a/include/linux/xz.h
+++ b/include/linux/xz.h
@@ -18,11 +18,6 @@
 #	include <stdint.h>
 #endif
 
-/* In Linux, this is used to make extern functions static when needed. */
-#ifndef XZ_EXTERN
-#	define XZ_EXTERN extern
-#endif
-
 /**
  * enum xz_mode - Operation mode
  *
@@ -190,7 +185,7 @@ struct xz_dec;
  * ready to be used with xz_dec_run(). If memory allocation fails,
  * xz_dec_init() returns NULL.
  */
-XZ_EXTERN struct xz_dec *xz_dec_init(enum xz_mode mode, uint32_t dict_max);
+struct xz_dec *xz_dec_init(enum xz_mode mode, uint32_t dict_max);
 
 /**
  * xz_dec_run() - Run the XZ decoder
@@ -210,7 +205,7 @@ XZ_EXTERN struct xz_dec *xz_dec_init(enum xz_mode mode, uint32_t dict_max);
  * get that amount valid data from the beginning of the stream. You must use
  * the multi-call decoder if you don't want to uncompress the whole stream.
  */
-XZ_EXTERN enum xz_ret xz_dec_run(struct xz_dec *s, struct xz_buf *b);
+enum xz_ret xz_dec_run(struct xz_dec *s, struct xz_buf *b);
 
 /**
  * xz_dec_reset() - Reset an already allocated decoder state
@@ -223,14 +218,14 @@ XZ_EXTERN enum xz_ret xz_dec_run(struct xz_dec *s, struct xz_buf *b);
  * xz_dec_run(). Thus, explicit call to xz_dec_reset() is useful only in
  * multi-call mode.
  */
-XZ_EXTERN void xz_dec_reset(struct xz_dec *s);
+void xz_dec_reset(struct xz_dec *s);
 
 /**
  * xz_dec_end() - Free the memory allocated for the decoder state
  * @s:          Decoder state allocated using xz_dec_init(). If s is NULL,
  *              this function does nothing.
  */
-XZ_EXTERN void xz_dec_end(struct xz_dec *s);
+void xz_dec_end(struct xz_dec *s);
 
 /**
  * DOC: MicroLZMA decompressor
@@ -244,10 +239,6 @@ XZ_EXTERN void xz_dec_end(struct xz_dec *s);
  * 3/0/2, the first byte is 0xA2. This way the first byte can never be 0x00.
  * Just like with LZMA2, lc + lp <= 4 must be true. The LZMA end-of-stream
  * marker must not be used. The unused values are reserved for future use.
- *
- * These functions aren't used or available in preboot code and thus aren't
- * marked with XZ_EXTERN. This avoids warnings about static functions that
- * are never defined.
  */
 
 /*
@@ -272,8 +263,8 @@ struct xz_dec_microlzma;
  * struct xz_dec_microlzma. If memory allocation fails or
  * dict_size is invalid, NULL is returned.
  */
-extern struct xz_dec_microlzma *xz_dec_microlzma_alloc(enum xz_mode mode,
-						       uint32_t dict_size);
+struct xz_dec_microlzma *xz_dec_microlzma_alloc(enum xz_mode mode,
+						uint32_t dict_size);
 
 /**
  * xz_dec_microlzma_reset() - Reset the MicroLZMA decoder state
@@ -289,9 +280,8 @@ extern struct xz_dec_microlzma *xz_dec_microlzma_alloc(enum xz_mode mode,
  *              requiring stdbool.h. This should normally be set to true.
  *              When this is set to false, error detection is weaker.
  */
-extern void xz_dec_microlzma_reset(struct xz_dec_microlzma *s,
-				   uint32_t comp_size, uint32_t uncomp_size,
-				   int uncomp_size_is_exact);
+void xz_dec_microlzma_reset(struct xz_dec_microlzma *s, uint32_t comp_size,
+			    uint32_t uncomp_size, int uncomp_size_is_exact);
 
 /**
  * xz_dec_microlzma_run() - Run the MicroLZMA decoder
@@ -329,15 +319,14 @@ extern void xz_dec_microlzma_reset(struct xz_dec_microlzma *s,
  * may be changed normally like with XZ_PREALLOC. This way input data can be
  * provided from non-contiguous memory.
  */
-extern enum xz_ret xz_dec_microlzma_run(struct xz_dec_microlzma *s,
-					struct xz_buf *b);
+enum xz_ret xz_dec_microlzma_run(struct xz_dec_microlzma *s, struct xz_buf *b);
 
 /**
  * xz_dec_microlzma_end() - Free the memory allocated for the decoder state
  * @s:          Decoder state allocated using xz_dec_microlzma_alloc().
  *              If s is NULL, this function does nothing.
  */
-extern void xz_dec_microlzma_end(struct xz_dec_microlzma *s);
+void xz_dec_microlzma_end(struct xz_dec_microlzma *s);
 
 /*
  * Standalone build (userspace build or in-kernel build for boot time use)
@@ -358,13 +347,13 @@ extern void xz_dec_microlzma_end(struct xz_dec_microlzma *s);
  * This must be called before any other xz_* function to initialize
  * the CRC32 lookup table.
  */
-XZ_EXTERN void xz_crc32_init(void);
+void xz_crc32_init(void);
 
 /*
  * Update CRC32 value using the polynomial from IEEE-802.3. To start a new
  * calculation, the third argument must be zero. To continue the calculation,
  * the previously returned value is passed as the third argument.
  */
-XZ_EXTERN uint32_t xz_crc32(const uint8_t *buf, size_t size, uint32_t crc);
+uint32_t xz_crc32(const uint8_t *buf, size_t size, uint32_t crc);
 #endif
 #endif
diff --git a/lib/decompress_unxz.c b/lib/decompress_unxz.c
index cae00395d7a6..32138bb8ef77 100644
--- a/lib/decompress_unxz.c
+++ b/lib/decompress_unxz.c
@@ -107,7 +107,6 @@
 #ifdef __KERNEL__
 #	include <linux/decompress/mm.h>
 #endif
-#define XZ_EXTERN STATIC
 
 #ifndef XZ_PREBOOT
 #	include <linux/slab.h>
diff --git a/lib/xz/xz_crc32.c b/lib/xz/xz_crc32.c
index effdf34ec48d..6a7906a328ba 100644
--- a/lib/xz/xz_crc32.c
+++ b/lib/xz/xz_crc32.c
@@ -26,7 +26,7 @@
 
 STATIC_RW_DATA uint32_t xz_crc32_table[256];
 
-XZ_EXTERN void xz_crc32_init(void)
+void xz_crc32_init(void)
 {
 	const uint32_t poly = 0xEDB88320;
 
@@ -45,7 +45,7 @@ XZ_EXTERN void xz_crc32_init(void)
 	return;
 }
 
-XZ_EXTERN uint32_t xz_crc32(const uint8_t *buf, size_t size, uint32_t crc)
+uint32_t xz_crc32(const uint8_t *buf, size_t size, uint32_t crc)
 {
 	crc = ~crc;
 
diff --git a/lib/xz/xz_dec_bcj.c b/lib/xz/xz_dec_bcj.c
index 42d7f268726f..8237db17eee3 100644
--- a/lib/xz/xz_dec_bcj.c
+++ b/lib/xz/xz_dec_bcj.c
@@ -572,9 +572,8 @@ static void bcj_flush(struct xz_dec_bcj *s, struct xz_buf *b)
  * data in chunks of 1-16 bytes. To hide this issue, this function does
  * some buffering.
  */
-XZ_EXTERN enum xz_ret xz_dec_bcj_run(struct xz_dec_bcj *s,
-				     struct xz_dec_lzma2 *lzma2,
-				     struct xz_buf *b)
+enum xz_ret xz_dec_bcj_run(struct xz_dec_bcj *s, struct xz_dec_lzma2 *lzma2,
+			   struct xz_buf *b)
 {
 	size_t out_start;
 
@@ -682,7 +681,7 @@ XZ_EXTERN enum xz_ret xz_dec_bcj_run(struct xz_dec_bcj *s,
 	return s->ret;
 }
 
-XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool single_call)
+struct xz_dec_bcj *xz_dec_bcj_create(bool single_call)
 {
 	struct xz_dec_bcj *s = kmalloc(sizeof(*s), GFP_KERNEL);
 	if (s != NULL)
@@ -691,7 +690,7 @@ XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool single_call)
 	return s;
 }
 
-XZ_EXTERN enum xz_ret xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id)
+enum xz_ret xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id)
 {
 	switch (id) {
 #ifdef XZ_DEC_X86
diff --git a/lib/xz/xz_dec_lzma2.c b/lib/xz/xz_dec_lzma2.c
index 613939f5dd6c..83bb66b6016d 100644
--- a/lib/xz/xz_dec_lzma2.c
+++ b/lib/xz/xz_dec_lzma2.c
@@ -960,8 +960,7 @@ static bool lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
  * Take care of the LZMA2 control layer, and forward the job of actual LZMA
  * decoding or copying of uncompressed chunks to other functions.
  */
-XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
-				       struct xz_buf *b)
+enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s, struct xz_buf *b)
 {
 	uint32_t tmp;
 
@@ -1137,8 +1136,7 @@ XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
 	return XZ_OK;
 }
 
-XZ_EXTERN struct xz_dec_lzma2 *xz_dec_lzma2_create(enum xz_mode mode,
-						   uint32_t dict_max)
+struct xz_dec_lzma2 *xz_dec_lzma2_create(enum xz_mode mode, uint32_t dict_max)
 {
 	struct xz_dec_lzma2 *s = kmalloc(sizeof(*s), GFP_KERNEL);
 	if (s == NULL)
@@ -1161,7 +1159,7 @@ XZ_EXTERN struct xz_dec_lzma2 *xz_dec_lzma2_create(enum xz_mode mode,
 	return s;
 }
 
-XZ_EXTERN enum xz_ret xz_dec_lzma2_reset(struct xz_dec_lzma2 *s, uint8_t props)
+enum xz_ret xz_dec_lzma2_reset(struct xz_dec_lzma2 *s, uint8_t props)
 {
 	/* This limits dictionary size to 3 GiB to keep parsing simpler. */
 	if (props > 39)
@@ -1197,7 +1195,7 @@ XZ_EXTERN enum xz_ret xz_dec_lzma2_reset(struct xz_dec_lzma2 *s, uint8_t props)
 	return XZ_OK;
 }
 
-XZ_EXTERN void xz_dec_lzma2_end(struct xz_dec_lzma2 *s)
+void xz_dec_lzma2_end(struct xz_dec_lzma2 *s)
 {
 	if (DEC_IS_MULTI(s->dict.mode))
 		vfree(s->dict.buf);
diff --git a/lib/xz/xz_dec_stream.c b/lib/xz/xz_dec_stream.c
index 0058406ccd17..f9d003684d56 100644
--- a/lib/xz/xz_dec_stream.c
+++ b/lib/xz/xz_dec_stream.c
@@ -746,7 +746,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
  * actually succeeds (that's the price to pay of using the output buffer as
  * the workspace).
  */
-XZ_EXTERN enum xz_ret xz_dec_run(struct xz_dec *s, struct xz_buf *b)
+enum xz_ret xz_dec_run(struct xz_dec *s, struct xz_buf *b)
 {
 	size_t in_start;
 	size_t out_start;
@@ -782,7 +782,7 @@ XZ_EXTERN enum xz_ret xz_dec_run(struct xz_dec *s, struct xz_buf *b)
 	return ret;
 }
 
-XZ_EXTERN struct xz_dec *xz_dec_init(enum xz_mode mode, uint32_t dict_max)
+struct xz_dec *xz_dec_init(enum xz_mode mode, uint32_t dict_max)
 {
 	struct xz_dec *s = kmalloc(sizeof(*s), GFP_KERNEL);
 	if (s == NULL)
@@ -812,7 +812,7 @@ XZ_EXTERN struct xz_dec *xz_dec_init(enum xz_mode mode, uint32_t dict_max)
 	return NULL;
 }
 
-XZ_EXTERN void xz_dec_reset(struct xz_dec *s)
+void xz_dec_reset(struct xz_dec *s)
 {
 	s->sequence = SEQ_STREAM_HEADER;
 	s->allow_buf_error = false;
@@ -824,7 +824,7 @@ XZ_EXTERN void xz_dec_reset(struct xz_dec *s)
 	s->temp.size = STREAM_HEADER_SIZE;
 }
 
-XZ_EXTERN void xz_dec_end(struct xz_dec *s)
+void xz_dec_end(struct xz_dec *s)
 {
 	if (s != NULL) {
 		xz_dec_lzma2_end(s->lzma2);
diff --git a/lib/xz/xz_private.h b/lib/xz/xz_private.h
index a8b1cbe8d21d..5f1294a1408c 100644
--- a/lib/xz/xz_private.h
+++ b/lib/xz/xz_private.h
@@ -115,8 +115,7 @@
  * Allocate memory for LZMA2 decoder. xz_dec_lzma2_reset() must be used
  * before calling xz_dec_lzma2_run().
  */
-XZ_EXTERN struct xz_dec_lzma2 *xz_dec_lzma2_create(enum xz_mode mode,
-						   uint32_t dict_max);
+struct xz_dec_lzma2 *xz_dec_lzma2_create(enum xz_mode mode, uint32_t dict_max);
 
 /*
  * Decode the LZMA2 properties (one byte) and reset the decoder. Return
@@ -124,22 +123,20 @@ XZ_EXTERN struct xz_dec_lzma2 *xz_dec_lzma2_create(enum xz_mode mode,
  * big enough, and XZ_OPTIONS_ERROR if props indicates something that this
  * decoder doesn't support.
  */
-XZ_EXTERN enum xz_ret xz_dec_lzma2_reset(struct xz_dec_lzma2 *s,
-					 uint8_t props);
+enum xz_ret xz_dec_lzma2_reset(struct xz_dec_lzma2 *s, uint8_t props);
 
 /* Decode raw LZMA2 stream from b->in to b->out. */
-XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
-				       struct xz_buf *b);
+enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s, struct xz_buf *b);
 
 /* Free the memory allocated for the LZMA2 decoder. */
-XZ_EXTERN void xz_dec_lzma2_end(struct xz_dec_lzma2 *s);
+void xz_dec_lzma2_end(struct xz_dec_lzma2 *s);
 
 #ifdef XZ_DEC_BCJ
 /*
  * Allocate memory for BCJ decoders. xz_dec_bcj_reset() must be used before
  * calling xz_dec_bcj_run().
  */
-XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool single_call);
+struct xz_dec_bcj *xz_dec_bcj_create(bool single_call);
 
 /*
  * Decode the Filter ID of a BCJ filter. This implementation doesn't
@@ -147,16 +144,15 @@ XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool single_call);
  * is needed. Returns XZ_OK if the given Filter ID is supported.
  * Otherwise XZ_OPTIONS_ERROR is returned.
  */
-XZ_EXTERN enum xz_ret xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id);
+enum xz_ret xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id);
 
 /*
  * Decode raw BCJ + LZMA2 stream. This must be used only if there actually is
  * a BCJ filter in the chain. If the chain has only LZMA2, xz_dec_lzma2_run()
  * must be called directly.
  */
-XZ_EXTERN enum xz_ret xz_dec_bcj_run(struct xz_dec_bcj *s,
-				     struct xz_dec_lzma2 *lzma2,
-				     struct xz_buf *b);
+enum xz_ret xz_dec_bcj_run(struct xz_dec_bcj *s, struct xz_dec_lzma2 *lzma2,
+			   struct xz_buf *b);
 
 /* Free the memory allocated for the BCJ filters. */
 #define xz_dec_bcj_end(s) kfree(s)
-- 
2.45.2

