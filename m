Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A944A10CB30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:01:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P17Y75npzDr0v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 02:01:45 +1100 (AEDT)
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
 header.b="f/W/exb9"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12G027vzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:08 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id y19so20245448lfl.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0Z99m46uTitiY7EAqUjdsfnbt8T6jBnOkYMa/lxzFc=;
 b=f/W/exb9eqrLZUZU7hVxEY41tbm7yL1+b7JHIp/+HXGPW6D57B7kArjlPKFQAP795y
 JFFg6GJoWjgAQzfamqMMSl7siZ5vtxRSyA6w4/O5Y0YSqBAYYsiufM8Jod3NrLYjb9DT
 QDUuJMw+ZdkL9v/N3IHXbu7xg+vS9msqIMmXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0Z99m46uTitiY7EAqUjdsfnbt8T6jBnOkYMa/lxzFc=;
 b=AOivDbhguud9cQJuctkNVAQWUhOSzdJlVVLNuLVcdNli/CujHbMNoKkBA3V74z3NQ4
 oYjdEfSUaByPHzdFpqpIQ8e5/x6MF11ncaKGbdTFPsj5usmg64uKgcP2k2da/paDNcOd
 Va6+y6aV7dL+pw/BRcRbTfWx/9in9hIZCpYSIXNThDWLhMJsyPZs5G2UGH5y9g0qzEB4
 LF248GgVXH/8VF9G1WyEhrNaAEuLqadyTMnTdel/S0VnbFZwkZyJ91sGV3njOysftWN6
 GxSN7IKlTjHaPx+miY69Bx7vsLG48K5M0ySlrXimf+ISlOGH50fviqNdii3runVTI3M1
 Rfzg==
X-Gm-Message-State: APjAAAXIlrKlTrOckElDM37eAWK7nr7DWIKVn+DhXzMckckn8ayffoLm
 7FcmFxLDJvWFQ8jjJUosCXGpjQ==
X-Google-Smtp-Source: APXvYqxb8GWt/9RrETi2+yLMb/nDXIK4UMHDkk05wdq/zOJZC8k6Rm4tzODOn7GKBe/vlKCItiPr3w==
X-Received: by 2002:a19:756:: with SMTP id 83mr6609479lfh.173.1574953025427;
 Thu, 28 Nov 2019 06:57:05 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:04 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 01/49] soc: fsl: qe: remove space-before-tab
Date: Thu, 28 Nov 2019 15:55:06 +0100
Message-Id: <20191128145554.1297-2-linux@rasmusvillemoes.dk>
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

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 417df7e19281..2a0e6e642776 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -378,8 +378,8 @@ static int qe_sdma_init(void)
 	}
 
 	out_be32(&sdma->sdebcr, (u32) sdma_buf_offset & QE_SDEBCR_BA_MASK);
- 	out_be32(&sdma->sdmr, (QE_SDMR_GLB_1_MSK |
- 					(0x1 << QE_SDMR_CEN_SHIFT)));
+	out_be32(&sdma->sdmr, (QE_SDMR_GLB_1_MSK |
+		 (0x1 << QE_SDMR_CEN_SHIFT)));
 
 	return 0;
 }
-- 
2.23.0

