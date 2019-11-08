Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7248F4F4D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:20:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478kVT5sdwzDsRF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:20:33 +1100 (AEDT)
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
 header.b="E2itMeYz"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQy25trzF6tH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:18 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id l20so6127704lje.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nGAR/RezFR3p4yZ/WuemAtPhyGpYuWvNUP10WcDqxdQ=;
 b=E2itMeYzpcpcvPiEYcR7QgT0vf86pgTt+txJLe4ypE1iKN4ygJjlMfIdTBHaIbca7l
 8TpMr7BlmS1pHXW8Lc8yrYYMbrYpZ6OWxpbB6h/El0hJa3CJ4u+D0CSxshybjUOT8noF
 QvazWxYu0noVka+ujfegXunMpmQNGUILv+4L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nGAR/RezFR3p4yZ/WuemAtPhyGpYuWvNUP10WcDqxdQ=;
 b=ahA1W6rYkeG7xJMC+GP4HbP+hxGDOhPi5P/aj3TILH8jxG1x/vm/ag+B7P2aTzWQkB
 WMJi7LkMSwe0UefBPhKT1+ofSwNlAirUd0EM9/d7Jh+oi0NLOGJ/VXEC2wXcplji+LPD
 OWu8s4bOxCeQjz1NZJQk35jD3151gYepFHTtdt/0vAsAslvzWrBNiTGUmEOTkb4l3/1D
 m9TVG2HT6y6hjsCVRyd9npRRSq/LZJOUvCsRPT9lZN2FSNPHYBJtdcyCZ2/BDTkmQqeI
 rZXFUaPYkw0Igci+5QUcCcYcVAPvnGGxCCgC+ylWxW2emFCQcRjxAoVnYT7KHEHkrUZp
 txOA==
X-Gm-Message-State: APjAAAVD1T9v+SF774DZt+YVUtGc4RFKSYsvHtK6bW/W9tAtHmRYRgBJ
 le/R0Ha8OoAzyTGmWlUoB+t9Zg==
X-Google-Smtp-Source: APXvYqxRVlzGHosXYr2fWpCL9TuHFktXGiL0j9+nCag9bKeXu8pwMfcJUWqBOjQJYoqb1ThzLR2FBQ==
X-Received: by 2002:a2e:9b4b:: with SMTP id o11mr6798538ljj.252.1573218134744; 
 Fri, 08 Nov 2019 05:02:14 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:14 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 37/47] soc: fsl: qe: drop broken lazy call of
 cpm_muram_init()
Date: Fri,  8 Nov 2019 14:01:13 +0100
Message-Id: <20191108130123.6839-38-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
index 4437f4e14d2c..feb33ec1c3d6 100644
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

