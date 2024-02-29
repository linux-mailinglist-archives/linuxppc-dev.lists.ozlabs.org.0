Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9D86CB49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 15:18:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=GpI2ZnZs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tltcs5Zfbz3vjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 01:18:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=GpI2ZnZs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TltYn3pRHz3vXT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 01:16:13 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id ABBFB40014;
	Thu, 29 Feb 2024 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709216170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DH9AY36t6ftOYkJYolT6fZyzo9stuzEZHYjE4uSOcUk=;
	b=GpI2ZnZsCQ1ZZJqeCBwQ5hpzP3tD3KzNuDwvLLrOX0Kjxtf6KEFJggGPSIEGwQb+rYDlV/
	3r/GYzwvbyMLEX3mih8D9AJfWs+5hRWhtETm7d4yO6YAie7RlJ51ynlpdCSR7WtaxctH1H
	J34TlpF3F7qTcZ60idvmSaHllZGnFkQg0RRfz6UMn9QapfdONrRDcqo+fLHrPEDyyvtZeN
	SPN+smVV2FHPZhHFjipXTdDlNnSFvyKA/CxuFgYijwlBWeCeyHRRRSyXLw6vlDj6L4+FSw
	30WKqSjep9/uU6LtB4wDTk2npHJM6XBH3VFf5WnZghYay+Ykh0GmpKbZWW1h9A==
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v5 3/5] lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers
Date: Thu, 29 Feb 2024 15:15:51 +0100
Message-ID: <20240229141554.836867-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229141554.836867-1-herve.codina@bootlin.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

These helpers scatters or gathers a bitmap with the help of the mask
position bits parameter.

bitmap_scatter() does the following:
  src:  0000000001011010
                  ||||||
           +------+|||||
           |  +----+||||
           |  |+----+|||
           |  ||   +-+||
           |  ||   |  ||
  mask: ...v..vv...v..vv
        ...0..11...0..10
  dst:  0000001100000010

and bitmap_gather() performs this one:
   mask: ...v..vv...v..vv
   src:  0000001100000010
            ^  ^^   ^   0
            |  ||   |  10
            |  ||   > 010
            |  |+--> 1010
            |  +--> 11010
            +----> 011010
   dst:  0000000000011010

bitmap_gather() can the seen as the reverse bitmap_scatter() operation.

The original work was done by Andy Shevchenko.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/lkml/20230926052007.3917389-3-andriy.shevchenko@linux.intel.com/
Co-developed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/linux/bitmap.h | 101 +++++++++++++++++++++++++++++++++++++++++
 lib/test_bitmap.c      |  42 +++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 99451431e4d6..6d3f6ff1b4d6 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -62,6 +62,8 @@ struct device;
  *  bitmap_shift_left(dst, src, n, nbits)       *dst = *src << n
  *  bitmap_cut(dst, src, first, n, nbits)       Cut n bits from first, copy rest
  *  bitmap_replace(dst, old, new, mask, nbits)  *dst = (*old & ~(*mask)) | (*new & *mask)
+ *  bitmap_scatter(dst, src, mask, nbits)	*dst = map(dense, sparse)(src)
+ *  bitmap_gather(dst, src, mask, nbits)	*dst = map(sparse, dense)(src)
  *  bitmap_remap(dst, src, old, new, nbits)     *dst = map(old, new)(src)
  *  bitmap_bitremap(oldbit, old, new, nbits)    newbit = map(old, new)(oldbit)
  *  bitmap_onto(dst, orig, relmap, nbits)       *dst = orig relative to relmap
@@ -487,6 +489,105 @@ static inline void bitmap_replace(unsigned long *dst,
 		__bitmap_replace(dst, old, new, mask, nbits);
 }
 
+/**
+ * bitmap_scatter - Scatter a bitmap according to the given mask
+ * @dst: scattered bitmap
+ * @src: gathered bitmap
+ * @mask: mask representing bits to assign to in the scattered bitmap
+ * @nbits: number of bits in each of these bitmaps
+ *
+ * Scatters bitmap with sequential bits according to the given @mask.
+ *
+ * Example:
+ * If @src bitmap = 0x005a, with @mask = 0x1313, @dst will be 0x0302.
+ *
+ * Or in binary form
+ * @src			@mask			@dst
+ * 0000000001011010	0001001100010011	0000001100000010
+ *
+ * (Bits 0, 1, 2, 3, 4, 5 are copied to the bits 0, 1, 4, 8, 9, 12)
+ *
+ * A more 'visual' description of the operation:
+ * src:  0000000001011010
+ *                 ||||||
+ *          +------+|||||
+ *          |  +----+||||
+ *          |  |+----+|||
+ *          |  ||   +-+||
+ *          |  ||   |  ||
+ * mask: ...v..vv...v..vv
+ *       ...0..11...0..10
+ * dst:  0000001100000010
+ *
+ * A relationship exists between bitmap_scatter() and bitmap_gather().
+ * bitmap_gather() can be seen as the 'reverse' bitmap_scatter() operation.
+ * See bitmap_scatter() for details related to this relationship.
+ */
+static inline void bitmap_scatter(unsigned long *dst, const unsigned long *src,
+				  const unsigned long *mask, unsigned int nbits)
+{
+	unsigned int n = 0;
+	unsigned int bit;
+
+	bitmap_zero(dst, nbits);
+
+	for_each_set_bit(bit, mask, nbits)
+		__assign_bit(bit, dst, test_bit(n++, src));
+}
+
+/**
+ * bitmap_gather - Gather a bitmap according to given mask
+ * @dst: gathered bitmap
+ * @src: scattered bitmap
+ * @mask: mask representing bits to extract from in the scattered bitmap
+ * @nbits: number of bits in each of these bitmaps
+ *
+ * Gathers bitmap with sparse bits according to the given @mask.
+ *
+ * Example:
+ * If @src bitmap = 0x0302, with @mask = 0x1313, @dst will be 0x001a.
+ *
+ * Or in binary form
+ * @src			@mask			@dst
+ * 0000001100000010	0001001100010011	0000000000011010
+ *
+ * (Bits 0, 1, 4, 8, 9, 12 are copied to the bits 0, 1, 2, 3, 4, 5)
+ *
+ * A more 'visual' description of the operation:
+ * mask: ...v..vv...v..vv
+ * src:  0000001100000010
+ *          ^  ^^   ^   0
+ *          |  ||   |  10
+ *          |  ||   > 010
+ *          |  |+--> 1010
+ *          |  +--> 11010
+ *          +----> 011010
+ * dst:  0000000000011010
+ *
+ * A relationship exists between bitmap_gather() and bitmap_scatter(). See
+ * bitmap_scatter() for the bitmap scatter detailed operations.
+ * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
+ * The operation bitmap_gather(result, scattered, mask, n) leads to a result
+ * equal or equivalent to src.
+ *
+ * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
+ * are not bijective.
+ * The result and src values are equivalent in that sense that a call to
+ * bitmap_scatter(res, src, mask, n) and a call to bitmap_scatter(res, result,
+ * mask, n) will lead to the same res value.
+ */
+static inline void bitmap_gather(unsigned long *dst, const unsigned long *src,
+				 const unsigned long *mask, unsigned int nbits)
+{
+	unsigned int n = 0;
+	unsigned int bit;
+
+	bitmap_zero(dst, nbits);
+
+	for_each_set_bit(bit, mask, nbits)
+		__assign_bit(n++, dst, test_bit(bit, src));
+}
+
 static inline void bitmap_next_set_region(unsigned long *bitmap,
 					  unsigned int *rs, unsigned int *re,
 					  unsigned int end)
diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65f22c2578b0..6b2b33579f56 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -380,6 +380,47 @@ static void __init test_replace(void)
 	expect_eq_bitmap(bmap, exp3_1_0, nbits);
 }
 
+static const unsigned long sg_mask[] __initconst = {
+	BITMAP_FROM_U64(0x000000000000035aULL),
+};
+
+static const unsigned long sg_src[] __initconst = {
+	BITMAP_FROM_U64(0x0000000000000667ULL),
+};
+
+static const unsigned long sg_gather_exp[] __initconst = {
+	BITMAP_FROM_U64(0x0000000000000029ULL),
+};
+
+static const unsigned long sg_scatter_exp[] __initconst = {
+	BITMAP_FROM_U64(0x000000000000021aULL),
+};
+
+static void __init test_bitmap_sg(void)
+{
+	unsigned int nbits = 64;
+	DECLARE_BITMAP(bmap_gather, 100);
+	DECLARE_BITMAP(bmap_scatter, 100);
+	DECLARE_BITMAP(bmap_tmp, 100);
+	DECLARE_BITMAP(bmap_res, 100);
+
+	/* Simple gather call */
+	bitmap_zero(bmap_gather, 100);
+	bitmap_gather(bmap_gather, sg_src, sg_mask, nbits);
+	expect_eq_bitmap(sg_gather_exp, bmap_gather, nbits);
+
+	/* Simple scatter call */
+	bitmap_zero(bmap_scatter, 100);
+	bitmap_scatter(bmap_scatter, sg_src, sg_mask, nbits);
+	expect_eq_bitmap(sg_scatter_exp, bmap_scatter, nbits);
+
+	/* Scatter/gather relationship */
+	bitmap_zero(bmap_tmp, 100);
+	bitmap_gather(bmap_tmp, bmap_scatter, sg_mask, nbits);
+	bitmap_scatter(bmap_res, bmap_tmp, sg_mask, nbits);
+	expect_eq_bitmap(bmap_scatter, bmap_res, nbits);
+}
+
 #define PARSE_TIME	0x1
 #define NO_LEN		0x2
 
@@ -1252,6 +1293,7 @@ static void __init selftest(void)
 	test_copy();
 	test_bitmap_region();
 	test_replace();
+	test_bitmap_sg();
 	test_bitmap_arr32();
 	test_bitmap_arr64();
 	test_bitmap_parse();
-- 
2.43.0

