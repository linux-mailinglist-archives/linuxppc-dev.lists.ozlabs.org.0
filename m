Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC7B1005BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:39:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GpS81QbMzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 23:39:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="BtVtcRzO"; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmn75PfVzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:11 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id f2so18983908wrs.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4h2w9DiO+4P3jPc0w1TT3xARdv8ATB93lgz8xw4vxA=;
 b=BtVtcRzODZ8MQHGzYCVSDPVdMWLdRIEn5FSDxW2pv1/RNrvGTyDeG/pgWB86cSvaIv
 TNZNSFsrEdvVIiE/woLEJuWE8Lw+0gQ9MXrSekMCN9clwVZSZaJ+i5oBqoP2hIOTM4Dr
 AtwK+Z0xVzRVdRSAV1aHZtBvtqhp4cgkNfOQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4h2w9DiO+4P3jPc0w1TT3xARdv8ATB93lgz8xw4vxA=;
 b=jtofThX/XDkbtQ7jwBJJLeSPKd/8gH74zz6m5oO+NWjb5UU4RjuPmgJPhO5j1uU1J8
 NGEN2ip5cRqt1s0RtbgdtM3jQg+3PFzNzXNWMIVIvPplBhV0x+sW4N22GkZXV2XWJn3I
 roys58oRSiih6oex1OiYgQbT/vT3YXTTSU/oVC89aZqBV5TUNulzpC4YBIvNm3uBRr2l
 Vq3kbzuDZXSQLLDRicjNaTG+Wdxo/k3ZF9ci3ezHhN6yOWDQShLBKcBRaKxvtnTfuTrt
 eUe2TAjD7pVuuo24rGadNqdYYoVmsstqEJ8F827XGKrxhNEbCrSw6BB5HCxo54RVsI3e
 TeUg==
X-Gm-Message-State: APjAAAXwSHyAEXyHZWwaCarAFmdUiHYDm5FqrhsCIoHSxVl9r9F+HC3M
 25xrXAQ8YsWrfZVGoSuewRNNHw==
X-Google-Smtp-Source: APXvYqySwYyYLwaAMIcShPAMqzsR8c5V+8U/1LZVhB9UFBPpSlbgcxnFk8Ug1vEVntOXvm4iiz96Mg==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr20477009wrv.367.1574076246235; 
 Mon, 18 Nov 2019 03:24:06 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:05 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 27/48] soc/fsl/qe/qe.h: update include path for cpm.h
Date: Mon, 18 Nov 2019 12:23:03 +0100
Message-Id: <20191118112324.22725-28-linux@rasmusvillemoes.dk>
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

asm/cpm.h under arch/powerpc is now just a wrapper for including
soc/fsl/cpm.h. In order to make the qe.h header usable on other
architectures, use the latter path directly.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/soc/fsl/qe/qe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 9cac04c692fd..521fa3a177e0 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -17,7 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/errno.h>
 #include <linux/err.h>
-#include <asm/cpm.h>
+#include <soc/fsl/cpm.h>
 #include <soc/fsl/qe/immap_qe.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
2.23.0

