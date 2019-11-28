Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B510CD08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:48:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3V40Q4RzDr6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:47:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="JgiuAeAr"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13C2rkyzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:59 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id e28so4649070ljo.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06uKXQqvrr0zZOJsLmQ0X59rlZ+fACJwVhesQKP6zWk=;
 b=JgiuAeArS47wsHZWM0BK/bezVFi7ZvWamm9FoPUC9tdZMXp4VCy5jWfx2t686hMUOy
 VybX+a/F0IKQZSS1QHbM5u49tyQhqGGkkQnWZHi/zYpbIT20YQl0gPFiNwUmHSxFIuiI
 9dTQWrvv9HWzBW01vfuUWbyvYrzaWvZFOcIyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06uKXQqvrr0zZOJsLmQ0X59rlZ+fACJwVhesQKP6zWk=;
 b=EoHZL9VvMdetfq2rNkQeRMFE7esCjx6whC9JTuDfck5/hL1U2xaq0bTpTTvuScn/FY
 MLJBCgPynuIuFANhD1ON5e/J1AY3bC9og5qdtRfHXQD+AZleuMk6fowNBQrNqE/jUuX+
 Sb7I+ZY/lUJEdwutbXgOHXaFmCm5Y9HAjTMdcCfAq4yVV02NMm3uLhmTyDRBJ5EnsPZW
 p8vDYmE88yTMFNr61296VijhEFlgOHTrfk8qqx835lxv3XtJTYUbCbsVaUL8L4Y1yHoQ
 LaaSm5LF3lDHeg7R4me/c4GXNfGuNZeZMuT8xlnEM86BJbWcOQraTAqIcftW8V4s0J9W
 RoXg==
X-Gm-Message-State: APjAAAXs20IGelgkysJTBXhFJCf2OZH1QZZ6bM825U+83BHAMtxyYRVE
 ZCzjJgmVdBMySe/UBUWtEKVNlA==
X-Google-Smtp-Source: APXvYqyK7wVR6d3zwjKZ2mFM/WM8Cw60uivy1/bMNQ6D4J5Uyd1DQ6s5FG/7hVfz49aG1uqyrcyxDw==
X-Received: by 2002:a2e:2a43:: with SMTP id q64mr35566264ljq.242.1574953076393; 
 Thu, 28 Nov 2019 06:57:56 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:56 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 39/49] soc: fsl: qe: refactor cpm_muram_alloc_common to
 prevent BUG on error path
Date: Thu, 28 Nov 2019 15:55:44 +0100
Message-Id: <20191128145554.1297-40-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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

If the kmalloc() fails, we try to undo the gen_pool allocation we've
just done. Unfortunately, start has already been modified to subtract
the GENPOOL_OFFSET bias, so we're freeing something that very likely
doesn't exist in the gen_pool, meaning we hit the

 kernel BUG at lib/genalloc.c:399!
 Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
 ...
 [<803fd0e8>] (gen_pool_free) from [<80426bc8>] (cpm_muram_alloc_common+0xb0/0xc8)
 [<80426bc8>] (cpm_muram_alloc_common) from [<80426c28>] (cpm_muram_alloc+0x48/0x80)
 [<80426c28>] (cpm_muram_alloc) from [<80428214>] (ucc_slow_init+0x110/0x4f0)
 [<80428214>] (ucc_slow_init) from [<8044a718>] (qe_uart_request_port+0x3c/0x1d8)

(this was tested by just injecting a random failure by adding
"|| (get_random_int()&7) == 0" to the "if (!entry)" condition).

Refactor the code so we do the kmalloc() first, meaning that's the
thing that needs undoing in case gen_pool_alloc_algo() then
fails. This allows a later cleanup to move the locking from the
callers into the _common function, keeping the kmalloc() out of the
critical region and then, hopefully (if all the muram_alloc callers
allow) change it to a GFP_KERNEL allocation.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index dcb267567d76..a81a1a79f1ca 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -119,23 +119,21 @@ static s32 cpm_muram_alloc_common(unsigned long size,
 	struct muram_block *entry;
 	s32 start;
 
+	entry = kmalloc(sizeof(*entry), GFP_ATOMIC);
+	if (!entry)
+		return -ENOMEM;
 	start = gen_pool_alloc_algo(muram_pool, size, algo, data);
-	if (!start)
-		goto out2;
+	if (!start) {
+		kfree(entry);
+		return -ENOMEM;
+	}
 	start = start - GENPOOL_OFFSET;
 	memset_io(cpm_muram_addr(start), 0, size);
-	entry = kmalloc(sizeof(*entry), GFP_ATOMIC);
-	if (!entry)
-		goto out1;
 	entry->start = start;
 	entry->size = size;
 	list_add(&entry->head, &muram_block_list);
 
 	return start;
-out1:
-	gen_pool_free(muram_pool, start, size);
-out2:
-	return -ENOMEM;
 }
 
 /*
-- 
2.23.0

