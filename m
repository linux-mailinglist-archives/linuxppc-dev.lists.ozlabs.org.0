Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42C84B766
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 15:08:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=TL7MHqnQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTlT71SJHz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 01:08:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=TL7MHqnQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTlSJ4cDGz3c53
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 01:07:26 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 55B6A1C0005;
	Tue,  6 Feb 2024 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707228444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dO1lu7mTt2Z5I540dnIACd6uZE/pOpssk6saKJ+PaEA=;
	b=TL7MHqnQ0+uB5N7+X/6hGEH5W6RVRcamg9X8+7ETWscpnRHcpj73bczSJMtNWsOwJgPtmy
	M71+fHKZL6Fe4b3gCxV+ROY/+aRdyURUnpSI3HyXZrkdmzCvlcFGiuN8idSNtvaDQdhI2m
	7SKV1aevvSxQQqFrlvFtO3SEznXN9cMLnxILuoQUkiw0SUj9iOMTQbmRpOFWQZLK2qc8EM
	7iW9PPgDEJ2c/cVsIisLCb8sgCapKgw1zeKfLsSA7A3uleAsCSnzTPDERmcXoL6Z5jtY4M
	lmD+/04gOoso1QQtetWGa2h0eR03q/KFpEfWL8m0WgBy9Tt/MMRcD5h24qZkWQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 4/6] bitmap: Introduce bitmap_off()
Date: Tue,  6 Feb 2024 15:07:14 +0100
Message-ID: <20240206140717.107930-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206140717.107930-1-herve.codina@bootlin.com>
References: <20240206140717.107930-1-herve.codina@bootlin.com>
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

