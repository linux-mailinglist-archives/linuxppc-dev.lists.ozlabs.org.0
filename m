Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 602BDEC327
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 13:48:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474MSL4clKzF5gR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 23:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="FJGEyUjD"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKD1KSQzF4ng
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:21 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id y6so7146839lfj.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7uK8xEnPEigQ7dFIza6M7Wg35/gDKz/RHXvPNwcggqY=;
 b=FJGEyUjDMyY3qQwDxrXdaq6kbDtEuWaQ9DdM3JQbmkDv5/TqT279el/27e2uU9No1a
 f+iz8Vxf6Hy5Yia656Z3D2IFrlqCrNAHpa+4MZwbyXZwnzKLGOuyKeoeouKUynNENL+w
 9N/0jeI/nf5AWsvbX8qp/uDqSP/sxEhYzWMsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uK8xEnPEigQ7dFIza6M7Wg35/gDKz/RHXvPNwcggqY=;
 b=DTx5JvQoXO4jGZ//5gLylq9cFJZKPatow2VnxUWrlz3wcMviLhk2EkQYwlmWyboc/y
 mtBAiaYNywlLspDiWVb5Xb1Qw5GhWujrdprkC+t8ClZv5o3fpmbrVenapcUeAP84uzLL
 9DyqrwfIlFh6ZTvvPLUQLa/7JW/DI2oubg08g5z/V+kmZLLIFPbhW23mfCPC/ebpCjwL
 n6KRPaIjrYIpiTE5QZAr2MncRJT8ILTvLeep0YSjfTQIx5mw5c5cIY29zhmW2OJvhk6t
 OCTzaCK5FQmDs5vwOzwLac9MB3cNyJqD1xtUdpuU+eykg5BX0eCMn2P7CUsIMmtcDrWP
 8uJg==
X-Gm-Message-State: APjAAAXlcjqbSA3Y6EK9CamJD+EIiAuzndMdB+aQ2miS49VliD4fYSJv
 KfK8NDVZGIQ+LXuv01iTuAlzyg==
X-Google-Smtp-Source: APXvYqx10tC45xnMYXxbHsIhOZZte50RDX5EOtgZaSoKO0iY2QuiQYHpnCYFw+LsHLxAu07eF6ZXqA==
X-Received: by 2002:ac2:424c:: with SMTP id m12mr7265781lfl.140.1572612136042; 
 Fri, 01 Nov 2019 05:42:16 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:15 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 01/36] soc: fsl: qe: remove space-before-tab
Date: Fri,  1 Nov 2019 13:41:35 +0100
Message-Id: <20191101124210.14510-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
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

