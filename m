Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4AC100643
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:14:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GqDw44dmzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 00:14:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="ZyUJ5WMn"; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GmnV6bbrzDqSl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:30 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id q70so16936194wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u67M6iMnQRPeWGbUjU6/8zjKJ8MPzlxCYb6wzRlTUzI=;
 b=ZyUJ5WMnth3SU48aYvS4fzK8hUXIaPpYljpdKoErKfrhzAmKvOTIG8Lv0aPWgk2RxT
 ZP67+R3KRm5OJwrOYPHHE3tk4Y//im0p1QB5M0gz5HuEGSCuTRoUZobX2Y3BeyIr8Osj
 7vaYJIjKqRt2NVkR9YYnzVUZAb3xO9OfGiUJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u67M6iMnQRPeWGbUjU6/8zjKJ8MPzlxCYb6wzRlTUzI=;
 b=QrCqsVW7h+MrSmuQ/U5vKZv6CpwCn/jnfqUFMNt91IftPZ6xAeIgvFM0K7pHaSE8yW
 bOatQxgjV7Hll1v4RlFj1doFvni/1O3qE57hSqqGv1XxfXy6i7Wd/EuMZKWtrLSmaaS0
 A+DWh/1K2pv7MbLrJa1PRhDqiLwUAq0upVR7y0X/n+IUhTG25E6T2kap2rO8zNgjbMZf
 ajLfbO4E6YPh0ARnXxoDWmf4BN7I34XLTBbNHi7zjS2igHGfgQgR0xpLehz7XI4hwo6Z
 Ru0UGJVgrPxGx9/fm3yYlf0L5S8cPe/1vvhBINMIX04Wskw6OhbjbjpzEs/AzY2dsB+V
 7kag==
X-Gm-Message-State: APjAAAWMBpZV5dgjjgf9S9U+Bj6qH0MdkP5Um8M2CLE1KkvUQlx+Uyed
 0SdYMexf1xway6ewEp8tv2vJfg==
X-Google-Smtp-Source: APXvYqyvwQK7ZNvJAAcJjBPFCHxzOq/iR38P0uIeZFJ2nKarTxjyW1A/whUUJQYA2dtQxAXwNIZrhQ==
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr29379317wma.95.1574076261570; 
 Mon, 18 Nov 2019 03:24:21 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:21 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 38/48] soc: fsl: qe: drop broken lazy call of
 cpm_muram_init()
Date: Mon, 18 Nov 2019 12:23:14 +0100
Message-Id: <20191118112324.22725-39-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpm_muram_alloc_common() tries to support a kind of lazy
initialization - if the muram_pool has not been created yet, it calls
cpm_muram_init(). Now, cpm_muram_alloc_common() is always called under

	spin_lock_irqsave(&cpm_muram_lock, flags);

and cpm_muram_init() does gen_pool_create() (which implies a
GFP_KERNEL allocation) and ioremap(), not to mention the fun that
ensues from cpm_muram_init() doing

	spin_lock_init(&cpm_muram_lock);

In other words, this has never worked, so nobody can have been relying
on it.

cpm_muram_init() is called from a subsys_initcall (either from
cpm_init() in arch/powerpc/sysdev/cpm_common.c or, via qe_reset(),
from qe_init() in drivers/soc/fsl/qe/qe.c).

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 48c77bb92846..dcb267567d76 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -119,9 +119,6 @@ static s32 cpm_muram_alloc_common(unsigned long size,
 	struct muram_block *entry;
 	s32 start;
 
-	if (!muram_pool && cpm_muram_init())
-		goto out2;
-
 	start = gen_pool_alloc_algo(muram_pool, size, algo, data);
 	if (!start)
 		goto out2;
-- 
2.23.0

