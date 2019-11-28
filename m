Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617610CCFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:45:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3RG34FszDqP4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="BiUszVfH"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13B3Z68zDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:58 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id s22so9822782ljs.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Bun68+vGX0cpO8gva8KbJU3Sj9L3G/suxA//a5o0RU=;
 b=BiUszVfH4xD7TeJbkxiZNgcYZYOIlp+5P2RR1S2/Rw4kQ+d9IE9N4RrFlOWACnk7Ws
 VF2RmylZqWUGDJz4rHvV+iwDq4ISPLeUCaV7NiLCQBFZALMu33LIJqYp/YDL+Jp5UhJA
 wSTZVT532Z+h6FFEsGS5Q1g2A5XNjVwix2Dc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Bun68+vGX0cpO8gva8KbJU3Sj9L3G/suxA//a5o0RU=;
 b=TdhwfzHSkttHbtRPVy9drvrPpckm9lsA36o0MdVOU0WE80DaGbo0x8F/xF+yZj7KwC
 RrNjyrlbHiqkIwkoCbOyYWMXShEH0XwOgFhs325byXv1JAnneZNVa64amNweVrrxmXJ8
 XxJzNZNJe4l10IUeN1Pbr/ZB50ePJ/7W0wnjT+IMh2rFjMkg7/2EyBNtQpv0VIVZ+RHE
 7o9wDwHLcOQM8QGVhPP/iOLZ08+CW04xkt8nXvsI77b6YLZA43rg7aDYSdqHoUiP8ht/
 KBXrsaXfCAYUc7pccnIWtqv+GT1ktB5JlRG0KrqYRQ/n0HCB7M6yDDijwsWPqt972XOV
 O6Bg==
X-Gm-Message-State: APjAAAVjC607KN7PWqb7R/VKXqyKccKV0/xNpQf7PZOLRJW/AqJEcD+o
 4FYjfKdEUpugi7cHiO+gyPO59w==
X-Google-Smtp-Source: APXvYqwaGl/+nUJyEvEWFx2+e9Z1DYPyhWNpmKm+QNrRw4gHEm8FZ1KH1eJwfl5J9bgJnXga5KzIdQ==
X-Received: by 2002:a2e:8855:: with SMTP id z21mr36010930ljj.212.1574953075288; 
 Thu, 28 Nov 2019 06:57:55 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:54 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 38/49] soc: fsl: qe: drop broken lazy call of
 cpm_muram_init()
Date: Thu, 28 Nov 2019 15:55:43 +0100
Message-Id: <20191128145554.1297-39-linux@rasmusvillemoes.dk>
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

Reviewed-by: Timur Tabi <timur@kernel.org>
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

