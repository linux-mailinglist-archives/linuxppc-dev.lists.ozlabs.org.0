Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F414D10062A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 14:07:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gq4k0tWFzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 00:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="iW0UQYAz"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GmnQ1Q4SzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:24:26 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id l14so6817169lfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmzEwbR7z9MB2kX6E+hxPBjMMxkrgbCI0SqbDjInDjs=;
 b=iW0UQYAzkmH8Ll/M9PRrq939jlpUbSW0NRlVO9QY+D4clTNrJOZfMDBDFUbjyL4Cs7
 AafHw+ZYUyVMiRkn9UVwi3pQGytY4uNU4TxcdyErLNYAINbJRSnVaWhXPyXoBkVDZ0AE
 l3Fg7abGNnEPO4rdJFSDHZaKL7SSwwOkiiOlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmzEwbR7z9MB2kX6E+hxPBjMMxkrgbCI0SqbDjInDjs=;
 b=X4lp9dfrnnMOz3XHHVAcslO/P94xINDPDvhbRC6AuUQm3RPrq1iNShKxHNSkPCl5ce
 macM0t4V3hxbAvtanKgbQPkqdIqlEtcxBzql0COdIz/ulJo0Z+fg57fwDq9IlY0AMlck
 u3iZVXc3dFLSm5GdX94j1qRwzm9hllenofzhoD38ymf1OHMeLdBgDPTc4Axodw0ylzpA
 yEfgO3uH7jwwSebPGNCb1bTsfB/B2mQnSbszWTVr6k/jo3uF4GuhjHfIF/FLVa22gcG6
 2jXoZyKR5WC1xKj1sP7tdchH2L8scF5r2G5NSjiCGP9OIoUMi1nzuWh8kvKb0DRjzvyO
 wdow==
X-Gm-Message-State: APjAAAX5LagJ5udojy2R4B66KiDXz8Kk0KYkHUf7S6EbmOAvb1kuqbxc
 fdb6aX+iCRvFi15Xj7ailEyzF2o6GW5MeA==
X-Google-Smtp-Source: APXvYqx95kajCqCxz/PSbS8ItEnY/XM8/CDgL5w+eRk/tL2D6xJCZl9iTwQDhJviE4PdC/OwznLwrA==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr29937876wrv.247.1574076260319; 
 Mon, 18 Nov 2019 03:24:20 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:24:19 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 37/48] soc: fsl: qe: make cpm_muram_free() ignore a
 negative offset
Date: Mon, 18 Nov 2019 12:23:13 +0100
Message-Id: <20191118112324.22725-38-linux@rasmusvillemoes.dk>
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

This allows one to simplify callers since they can store a negative
value as a sentinel to indicate "this was never allocated" (or store
the -ENOMEM from an allocation failure) and then call cpm_muram_free()
unconditionally.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 962835488f66..48c77bb92846 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -176,6 +176,9 @@ void cpm_muram_free(s32 offset)
 	int size;
 	struct muram_block *tmp;
 
+	if (offset < 0)
+		return;
+
 	size = 0;
 	spin_lock_irqsave(&cpm_muram_lock, flags);
 	list_for_each_entry(tmp, &muram_block_list, head) {
-- 
2.23.0

