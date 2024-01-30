Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C7841E1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:43:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Uw6yrSkU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJbG3X0sz3cc0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Uw6yrSkU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPJXm4vb5z3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:40:56 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id D0F3760009;
	Tue, 30 Jan 2024 08:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706604048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ic1ckcjchbcoVTjdKWShBulE5zgYlgBqlicFqMJYpM=;
	b=Uw6yrSkUlrdIS5Zut2e2GX19e5AUteDIck4QirysvTiIcCrPwIu82YRu2a82qBPWCFVNhJ
	R3P3jWrakZ6fKJRC09dzFlszQMUxX4/CF4o+zR/WxVNrU569ZXqu0VJbLy6CxCNXOWh6Vq
	OS1NIhoPZWKoFCD33Dxr6YJHv6dOEjLD4i9Z0h5cAG9u/CL3y6wz5TmPCsZK6OXJ7qtBK4
	UqJCHzDvMdEhkL0UlCHUZLljlJ8xLHjkMuGAvHTwvfuoc0t9UU++d3K9Euo16lySiU1//z
	bmFwSCrIuMVt/F+9cqm5TAHUJ5J6Soeycpy7kU84DrBKS4P4hYfRWmSSpA8URg==
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 3/6] bitmap: Make bitmap_onto() available to users
Date: Tue, 30 Jan 2024 09:40:18 +0100
Message-ID: <20240130084035.115086-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130084035.115086-1-herve.codina@bootlin.com>
References: <20240130084035.115086-1-herve.codina@bootlin.com>
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

