Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B40100650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:19:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GqLH2j38zDqc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 00:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="E4AHDjvC"; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GmnW5nT5zDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:31 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id e6so19019248wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FL4wefDICHo32h9247H9jmqyY6zv5MUtAqMoiveQx9g=;
 b=E4AHDjvC6aXMNQjRveC5f6E2vzA0LBGQPU4cVhU95XHEvW4ndN2XtxJT8GKavd70F2
 jC9tRDlotOojTjdz6tbnx1hk+e6LRNypVnQPbIF4Bep2+cKjOdMAyk5VimxdRAI1phcT
 lwP/3vwBXv7QrZtV8x00tERfMHg5v1yR1r5Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FL4wefDICHo32h9247H9jmqyY6zv5MUtAqMoiveQx9g=;
 b=ctGl4fTXxnVbzTOafxmRme/pCV0bvHjthO7I1lX2JDl4r3hho39sifyL7uyrsr1tne
 MiNEgkVMKo8V4vdpNxhvrYCQNUK1NgJ8uS79ap3yegQuwHcxWxgxWVvmx8RzlT0q4TOE
 Ta+eoO90tpYZ9ELwpPELoXx5uXNsSxJP3fQEghPm4qeXjMLG4jC/RVe9jG3bc0LgcWYN
 t8E29uq/5apzWJufzr0yiX24EJF0a93v28DCd2+HWs474B8iUP7kHixQx90AcPz6ic4k
 s4SmYHNhf2iuobM8L4ysUU0wvGVHPfJfkV2yVWqZwY4MUyNrp+EVKonVvX6goF29W8dM
 wOPQ==
X-Gm-Message-State: APjAAAXPwqO7zOpESh05cJB2d+LaUuCqoBl4atn89SZNOQYOldhp7lQk
 GzaFaabMvttCT41F+s25UVAqBw==
X-Google-Smtp-Source: APXvYqwHH2szYVNaS4MG6r2NeMu4AnUDfPLgQecmFMGcPhOZDZXQ80z3njZwNa52cVw6dP6X8ZlqQA==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr21126896wrq.79.1574076267155; 
 Mon, 18 Nov 2019 03:24:27 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:26 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 42/48] soc: fsl: qe: drop pointless check in qe_sdma_init()
Date: Mon, 18 Nov 2019 12:23:18 +0100
Message-Id: <20191118112324.22725-43-linux@rasmusvillemoes.dk>
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

The sdma member of struct qe_immap is not at offset zero, so even if
qe_immr wasn't initialized yet (i.e. NULL), &qe_immr->sdma would not
be NULL.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 5bf279c679ef..96c2057d8d8e 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -367,9 +367,6 @@ static int qe_sdma_init(void)
 	struct sdma __iomem *sdma = &qe_immr->sdma;
 	static s32 sdma_buf_offset = -ENOMEM;
 
-	if (!sdma)
-		return -ENODEV;
-
 	/* allocate 2 internal temporary buffers (512 bytes size each) for
 	 * the SDMA */
 	if (sdma_buf_offset < 0) {
-- 
2.23.0

