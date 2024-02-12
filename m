Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF2850E8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 09:05:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=d+EVX4fX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYH7r5fgrz3vtX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:05:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=d+EVX4fX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYGyL1Tkrz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 18:57:13 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 99A0040015;
	Mon, 12 Feb 2024 07:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707724630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ic1ckcjchbcoVTjdKWShBulE5zgYlgBqlicFqMJYpM=;
	b=d+EVX4fXrBpPi5OnvfiAxOR/AVAaZXiiWFWazenSFUiOY7aLN1+aPeicFZxLPbalVnLfqE
	+74n8hb2gXcVk9Jgzgu546dfIMUa/Ay4kFwhx9R8miohZQs5/T/PwK+fP3OlfacqP4imOV
	r6Iw+f9T6LPKWafnO+tzQ5YUbV0FoROupPZEE6ELxRsKotp3J0nf9HkoUeXTBzF4hWhKV5
	7ZlxXuaamjoKiFtV3lSvUsqI9MiTp3jpGNuEM6a3lQ8RpmVNVP+kdbj++EnIWnmPSfC/QO
	OfYf3pd+xBKrznWisCqtQ0y9Sd3pwlM4CJuvaHv0pAlrKg7QGrOYelPJka1/3Q==
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
Subject: [RESEND PATCH v3 3/6] bitmap: Make bitmap_onto() available to users
Date: Mon, 12 Feb 2024 08:56:38 +0100
Message-ID: <20240212075646.19114-11-herve.codina@bootlin.com>
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

Currently the bitmap_onto() is available only for CONFIG_NUMA=y case,
while some users may benefit out of it and being independent to NUMA
code.

Make it available to users by moving out of ifdeffery and exporting for
modules.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 lib/bitmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/bitmap.c b/lib/bitmap.c
index 09522af227f1..2feccb5047dc 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -547,7 +547,6 @@ int bitmap_bitremap(int oldbit, const unsigned long *old,
 }
 EXPORT_SYMBOL(bitmap_bitremap);
 
-#ifdef CONFIG_NUMA
 /**
  * bitmap_onto - translate one bitmap relative to another
  *	@dst: resulting translated bitmap
@@ -681,7 +680,9 @@ void bitmap_onto(unsigned long *dst, const unsigned long *orig,
 		m++;
 	}
 }
+EXPORT_SYMBOL(bitmap_onto);
 
+#ifdef CONFIG_NUMA
 /**
  * bitmap_fold - fold larger bitmap into smaller, modulo specified size
  *	@dst: resulting smaller bitmap
-- 
2.43.0

