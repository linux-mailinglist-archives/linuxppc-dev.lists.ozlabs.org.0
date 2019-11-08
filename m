Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BDEF4CEB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 14:15:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478gk80Pg1zF6PF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 00:15:28 +1100 (AEDT)
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
 header.b="B/xZo0Rr"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQ75wJqzF6sj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:01:34 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id p18so6128209ljc.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZekbabXCPgDix0mV9AcQnO633/TLQ+c6dMS4dOgnB5g=;
 b=B/xZo0RrHCJyuvVZivt2CjwHFp/RR66mRkGQgHnOynN41VAmVQ3pl1D/E66J+ArKGL
 Gfyb0DEzvNycushflGaz+pEn1sxlOzX7sHsRCL1LiVYG/on1mH3xhc+kbmGVl4LeO5V0
 df1bV9WCV4KW8U/dTC+tlVjDuAR5cCH+el02s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZekbabXCPgDix0mV9AcQnO633/TLQ+c6dMS4dOgnB5g=;
 b=VBUqAtxTloeI41l0OsE2b4rxK0Ph/U6cBBgD8//zLhMwhdWWUJN1aGNP9VtM8j9p2+
 rukhXnq6YUIjZKIUrEyOMnppE0YafA65XYW2pdJ6fXc2IuJv02SMSzKZILKpk7ZMHA6i
 HJE7ZEqhYG3RwXnl+Od96ufh+kXRst8UyA/4ywAJvxYYF+/ORRGITB8qoYVtPWDNwJkk
 MnLZsA+DQ/WMvEsWNg3j754wSj6NKSFJMOhR0MX4EpeepYbexbdyTc/Oc4im74iaZVX2
 dO8WxO18ZEWI7caLcWw9lx5zkz7wf8H5P5isYNFNxz4+GqnbN2CWpU0XWVrbOkDVNbd8
 cEKg==
X-Gm-Message-State: APjAAAW784R3B+lRka2l20sDaJUAT6EEQl+4/bbJu0sDVPQhf2RYSspZ
 fNr4Q1or2TgcEngvI7ORLMVTYEFsGE1MWehA
X-Google-Smtp-Source: APXvYqwHe/94bHQUIiS2PHM5f7Vm4tOkuQQeHPPg8bsOABWlpDnKO27QowlfW02ScK7V7DeZLJYQpw==
X-Received: by 2002:a2e:3805:: with SMTP id f5mr6440382lja.220.1573218091677; 
 Fri, 08 Nov 2019 05:01:31 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:01:31 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 03/47] soc: fsl: qe: rename qe_(clr/set/clrset)bit* helpers
Date: Fri,  8 Nov 2019 14:00:39 +0100
Message-Id: <20191108130123.6839-4-linux@rasmusvillemoes.dk>
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
Cc: netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make it clear that these operate on big-endian registers (i.e. use the
iowrite*be primitives) before we introduce more uses of them and allow
the QE drivers to be built for platforms other than ppc32.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/net/wan/fsl_ucc_hdlc.c |  4 ++--
 drivers/soc/fsl/qe/ucc.c       | 10 +++++-----
 include/soc/fsl/qe/qe.h        | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index ca0f3be2b6bf..ce6af7d5380f 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -623,8 +623,8 @@ static int ucc_hdlc_poll(struct napi_struct *napi, int budget)
 
 	if (howmany < budget) {
 		napi_complete_done(napi, howmany);
-		qe_setbits32(priv->uccf->p_uccm,
-			     (UCCE_HDLC_RX_EVENTS | UCCE_HDLC_TX_EVENTS) << 16);
+		qe_setbits_be32(priv->uccf->p_uccm,
+				(UCCE_HDLC_RX_EVENTS | UCCE_HDLC_TX_EVENTS) << 16);
 	}
 
 	return howmany;
diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
index 024d239ac1e1..ae9f2cf560cb 100644
--- a/drivers/soc/fsl/qe/ucc.c
+++ b/drivers/soc/fsl/qe/ucc.c
@@ -540,8 +540,8 @@ int ucc_set_tdm_rxtx_clk(u32 tdm_num, enum qe_clock clock,
 	cmxs1cr = (tdm_num < 4) ? &qe_mux_reg->cmxsi1cr_l :
 				  &qe_mux_reg->cmxsi1cr_h;
 
-	qe_clrsetbits32(cmxs1cr, QE_CMXUCR_TX_CLK_SRC_MASK << shift,
-			clock_bits << shift);
+	qe_clrsetbits_be32(cmxs1cr, QE_CMXUCR_TX_CLK_SRC_MASK << shift,
+			   clock_bits << shift);
 
 	return 0;
 }
@@ -650,9 +650,9 @@ int ucc_set_tdm_rxtx_sync(u32 tdm_num, enum qe_clock clock,
 
 	shift = ucc_get_tdm_sync_shift(mode, tdm_num);
 
-	qe_clrsetbits32(&qe_mux_reg->cmxsi1syr,
-			QE_CMXUCR_TX_CLK_SRC_MASK << shift,
-			source << shift);
+	qe_clrsetbits_be32(&qe_mux_reg->cmxsi1syr,
+			   QE_CMXUCR_TX_CLK_SRC_MASK << shift,
+			   source << shift);
 
 	return 0;
 }
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index c1036d16ed03..a1aa4eb28f0c 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -241,20 +241,20 @@ static inline int qe_alive_during_sleep(void)
 #define qe_muram_offset cpm_muram_offset
 #define qe_muram_dma cpm_muram_dma
 
-#define qe_setbits32(_addr, _v) iowrite32be(ioread32be(_addr) |  (_v), (_addr))
-#define qe_clrbits32(_addr, _v) iowrite32be(ioread32be(_addr) & ~(_v), (_addr))
+#define qe_setbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) |  (_v), (_addr))
+#define qe_clrbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) & ~(_v), (_addr))
 
-#define qe_setbits16(_addr, _v) iowrite16be(ioread16be(_addr) |  (_v), (_addr))
-#define qe_clrbits16(_addr, _v) iowrite16be(ioread16be(_addr) & ~(_v), (_addr))
+#define qe_setbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) |  (_v), (_addr))
+#define qe_clrbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) & ~(_v), (_addr))
 
-#define qe_setbits8(_addr, _v) iowrite8(ioread8(_addr) |  (_v), (_addr))
-#define qe_clrbits8(_addr, _v) iowrite8(ioread8(_addr) & ~(_v), (_addr))
+#define qe_setbits_8(_addr, _v) iowrite8(ioread8(_addr) |  (_v), (_addr))
+#define qe_clrbits_8(_addr, _v) iowrite8(ioread8(_addr) & ~(_v), (_addr))
 
-#define qe_clrsetbits32(addr, clear, set) \
+#define qe_clrsetbits_be32(addr, clear, set) \
 	iowrite32be((ioread32be(addr) & ~(clear)) | (set), (addr))
-#define qe_clrsetbits16(addr, clear, set) \
+#define qe_clrsetbits_be16(addr, clear, set) \
 	iowrite16be((ioread16be(addr) & ~(clear)) | (set), (addr))
-#define qe_clrsetbits8(addr, clear, set) \
+#define qe_clrsetbits_8(addr, clear, set) \
 	iowrite8((ioread8(addr) & ~(clear)) | (set), (addr))
 
 /* Structure that defines QE firmware binary files.
-- 
2.23.0

