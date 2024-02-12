Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C61850E72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 09:03:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dTj0L8CU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYH5S2cSpz3dV5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dTj0L8CU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYGyK5vkkz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 18:57:13 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 89FA640013;
	Mon, 12 Feb 2024 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707724631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dO1lu7mTt2Z5I540dnIACd6uZE/pOpssk6saKJ+PaEA=;
	b=dTj0L8CUPn2xJHC/hWxnBaRNxEwVgoRfzQnMxFRgwd/yOia4U4+FtVuXb3r4d21WVoWnwJ
	s4oHRXy4yAcxKfXMeD+GT7Vt7wdJIxB2kBQQbYDaMBijGqh6gNPOBq0zsFLYMVkQwUB20u
	seFbF09SmNRgT3KZtBvZcj3u081a4q7Q87NINExrU+4R5iftejtlX6nGn2Hczdij/MQGN8
	1BYkC8dY6UpyNf/q6q+c1Z36Q69Fg7FuP29o0nkmqlg/ibfIuqCm0Hhh8yofq8A7oaKvgz
	T2i/gNrfa7sLBmuA0sC5vysK6GKgtYC8kVP7W57/I8XYXyoRt8JVnA36/pBazQ==
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
Subject: [RESEND PATCH v3 4/6] bitmap: Introduce bitmap_off()
Date: Mon, 12 Feb 2024 08:56:39 +0100
Message-ID: <20240212075646.19114-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212075646.19114-1-herve.codina@bootlin.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
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

The bitmap_onto() function translates one bitmap relative to another but
no function are present to perform the reverse translation.

Introduce bitmap_off() to fill this hole.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/linux/bitmap.h |  3 +++
 lib/bitmap.c           | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 99451431e4d6..5ecfcbbc91f4 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -65,6 +65,7 @@ struct device;
  *  bitmap_remap(dst, src, old, new, nbits)     *dst = map(old, new)(src)
  *  bitmap_bitremap(oldbit, old, new, nbits)    newbit = map(old, new)(oldbit)
  *  bitmap_onto(dst, orig, relmap, nbits)       *dst = orig relative to relmap
+ *  bitmap_off(dst, orig, relmap, nbits)        *dst = bitmap_onto() reverse operation
  *  bitmap_fold(dst, orig, sz, nbits)           dst bits = orig bits mod sz
  *  bitmap_parse(buf, buflen, dst, nbits)       Parse bitmap dst from kernel buf
  *  bitmap_parse_user(ubuf, ulen, dst, nbits)   Parse bitmap dst from user buf
@@ -208,6 +209,8 @@ int bitmap_bitremap(int oldbit,
 		const unsigned long *old, const unsigned long *new, int bits);
 void bitmap_onto(unsigned long *dst, const unsigned long *orig,
 		const unsigned long *relmap, unsigned int bits);
+void bitmap_off(unsigned long *dst, const unsigned long *orig,
+		const unsigned long *relmap, unsigned int bits);
 void bitmap_fold(unsigned long *dst, const unsigned long *orig,
 		unsigned int sz, unsigned int nbits);
 
diff --git a/lib/bitmap.c b/lib/bitmap.c
index 2feccb5047dc..71343967335e 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -682,6 +682,48 @@ void bitmap_onto(unsigned long *dst, const unsigned long *orig,
 }
 EXPORT_SYMBOL(bitmap_onto);
 
+/**
+ * bitmap_off - revert operation done by bitmap_onto()
+ *     @dst: resulting translated bitmap
+ *     @orig: original untranslated bitmap
+ *     @relmap: bitmap relative to which translated
+ *     @bits: number of bits in each of these bitmaps
+ *
+ * Suppose onto computed using bitmap_onto(onto, src, relmap, n)
+ * The operation bitmap_off(result, onto, relmap, n) leads to a
+ * result equal or equivalent to src.
+ *
+ * The result can be 'equivalent' because bitmap_onto() and
+ * bitmap_off() are not bijective.
+ * The result and src values are equivalent in that sense that a
+ * call to bitmap_onto(onto, src, relmap, n) and a call to
+ * bitmap_onto(onto, result, relmap, n) will lead to the same onto
+ * value.
+ *
+ * If either of @orig or @relmap is empty (no set bits), then @dst
+ * will be returned empty.
+ *
+ * All bits in @dst not set by the above rule are cleared.
+ */
+void bitmap_off(unsigned long *dst, const unsigned long *orig,
+		const unsigned long *relmap, unsigned int bits)
+{
+	unsigned int n, m;      /* same meaning as in above comment */
+
+	if (dst == orig)        /* following doesn't handle inplace mappings */
+		return;
+	bitmap_zero(dst, bits);
+
+	m = 0;
+	for_each_set_bit(n, relmap, bits) {
+		/* m == bitmap_pos_to_ord(relmap, n, bits) */
+		if (test_bit(n, orig))
+			set_bit(m, dst);
+		m++;
+	}
+}
+EXPORT_SYMBOL(bitmap_off);
+
 #ifdef CONFIG_NUMA
 /**
  * bitmap_fold - fold larger bitmap into smaller, modulo specified size
-- 
2.43.0

