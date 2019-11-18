Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 768391004BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 12:52:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GnPv2tjTzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 22:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="G64zeN1s"; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmmd22CxzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:23:45 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id l7so18972496wrp.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=td9IeMtAnKP3TNZfmfJvazvskLsY9wm2/Illqt7TzBU=;
 b=G64zeN1sRuWJalczBb4PcQsQpdk8AHwaM9zcHSLXuqOvP5z4JH7E9AP76uvffGy3zY
 yjRjr2asra7B1qPqQ/fI0qbAgipxM8OEVMFbLZ0C/GpWiqxCk1f8PPb1AHMEFvY4WNYP
 gENB4iPaF1vsQQWQhDFs6zCOfSvffYUQVX+vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=td9IeMtAnKP3TNZfmfJvazvskLsY9wm2/Illqt7TzBU=;
 b=VrUKPx1mcL2NnTYmQZ88dT9HPXTmBqR3CwzXAvm3+Yt6tesvzA/kmgJIgzWUNw1lNV
 eET8K1kNlcYqcbdxdg2xyG+UIf7Mbxb3DIw9BRip1/koWCqgEji/rA8a/b4+06fLk1Zz
 t518kFmY8OntdOqLUh3/ZzHvC3X6f00RUm+JnJH7BMmE2/LGC/B5HY0StFlWd5AQgnwt
 aZWa+C7/t0s3paIxttAwCgBg6NfZKgDzuOlU7zm0DzEiQeXpkeO58or660Au/A1Ugomy
 DgMGAsQOd0rO0OouOSML7fOPXu/bVeOtrWSaeqj7Gc1ttLqxtmWDSr0EGAC1PDgRnVCH
 NcCQ==
X-Gm-Message-State: APjAAAV2QnDEpQZgIr+vbKR8ShVB7d6Vhghfobkxzv7ZsdnRx02VRE3O
 gJd5eEcBL244/b2p3d/Sm1rQ4A==
X-Google-Smtp-Source: APXvYqzirelmZJRfngi/39rVlWqXESUNTo+aHeVFXR3g/cUeCUfTGitgRt+Ga84uxToqgzwRUh8Unw==
X-Received: by 2002:adf:db4b:: with SMTP id f11mr2022844wrj.239.1574076221874; 
 Mon, 18 Nov 2019 03:23:41 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:23:41 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 09/48] soc: fsl: qe: drop assign-only high_active in
 qe_ic_init
Date: Mon, 18 Nov 2019 12:22:45 +0100
Message-Id: <20191118112324.22725-10-linux@rasmusvillemoes.dk>
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

high_active is only assigned to but never used. Remove it.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 8c874372416b..4b03060d8079 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -320,7 +320,7 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 {
 	struct qe_ic *qe_ic;
 	struct resource res;
-	u32 temp = 0, ret, high_active = 0;
+	u32 temp = 0, ret;
 
 	ret = of_address_to_resource(node, 0, &res);
 	if (ret)
@@ -366,10 +366,8 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 		temp |= CICR_GRTB;
 
 	/* choose destination signal for highest priority interrupt */
-	if (flags & QE_IC_HIGH_SIGNAL) {
+	if (flags & QE_IC_HIGH_SIGNAL)
 		temp |= (SIGNAL_HIGH << CICR_HPIT_SHIFT);
-		high_active = 1;
-	}
 
 	qe_ic_write(qe_ic->regs, QEIC_CICR, temp);
 
-- 
2.23.0

