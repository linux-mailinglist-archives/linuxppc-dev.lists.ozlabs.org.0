Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777477A4B06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 16:21:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=ohqbHXzl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq6RB2Kqkz3cSR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 00:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=ohqbHXzl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq6NM0cpqz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 00:18:41 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9adcb89b48bso407659166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1695046717; x=1695651517; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PomBX+56H7vrYuyW5mK+RISliEIE/fWMnEIx5++eWoM=;
        b=ohqbHXzlNER7R0Jy7RtVTScKdy+aU8++5V82g2xawlUBLpx80l/WH+vh4zYBmr2Wk5
         MqVeCarxvNsPhc0JogwJpAfWO8a+Yp0P7is2T5j5+dpSuchiKMtkFiCgldZlF69IkM5m
         K3fI70AX7mTbxLgmPRSyY5aJdNnSgRXsW46Lbw+6cW0nOxNgijTBokjQRYwqKqLlIyPY
         ugVFr6p4DMJ3wxvseZU9laj7Oh7uNLxjgTppKmokTvgn7Yk3Xsb8OBWqEkS8q4Eft6Xf
         wdfFj4QtoV1KW2tPZJqzAXdwvhguhvKIUsXZpbgvtjokK1hcIyFZCOQeMSJC8hXQ8CM4
         Ugcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695046717; x=1695651517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PomBX+56H7vrYuyW5mK+RISliEIE/fWMnEIx5++eWoM=;
        b=tfa5o+HdqKXVPsdabLIIbWGq8MvVMbSSOP/an2g/10HMJ0ltkO5FMD+d6117++mXo3
         jjGEa2Q9RW1TkSn7w9/xSipJ1Np3lx8v1m7tKkay04di3vwEZMOmkloxXGA4DEt2jH8/
         kfbZd0nzrtHFopjgEdHgYdU3qUWwubavSPDDEhMHsdlQtSaAfdgrlpcTGvpv6lIbBMPd
         h7LtKUgXjuntMG/K49o5eNGrsDgr/R7P2ZZxGNxtf8+m9jz73syO9fyvldp0yZXeeJdK
         BOR4LfVsS/49xkNL8WazNbx3QTMPk5tJ1t9R2dy9QPL/boXIShZjIvoPbXlqKEHqPU20
         2I9w==
X-Gm-Message-State: AOJu0Yxib+VtDM7SyOMcoxuqZFAfldPQ85hAmrczvtOOEpzGw+0gTRE0
	O2zqVblezpPYxbbLtjAAzsSjBg==
X-Google-Smtp-Source: AGHT+IE7PudVFRyVTSCFUj5G+MB8048X5oL3dmIhNpgsFEidEOg0vjf8zvgHSO8ppzPINT/Im8PoZw==
X-Received: by 2002:a17:906:3158:b0:9ad:c763:c3fd with SMTP id e24-20020a170906315800b009adc763c3fdmr7616048eje.28.1695046717137;
        Mon, 18 Sep 2023 07:18:37 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id jg36-20020a170907972400b009adc743340fsm5470921ejc.197.2023.09.18.07.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:18:36 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 1/3] crypto: mxs-dcp: Add support for hardware provided keys
Date: Mon, 18 Sep 2023 16:18:23 +0200
Message-ID: <20230918141826.8139-2-david@sigma-star.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230918141826.8139-1-david@sigma-star.at>
References: <20230918141826.8139-1-david@sigma-star.at>
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutroni
 x Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DCP is capable to performing AES with hardware-bound keys.
These keys are not stored in main memory and are therefore not directly
accessible by the operating system.

So instead of feeding the key into DCP, we need to place a
reference to such a key before initiating the crypto operation.
Keys are referenced by a one byte identifiers.

DCP supports 6 different keys: 4 slots in the secure memory area,
a one time programmable key which can be burnt via on-chip fuses
and an unique device key.

Using these keys is restricted to in-kernel users that use them as building
block for other crypto tools such as trusted keys. Allowing userspace
(e.g. via AF_ALG) to use these keys to crypt or decrypt data is a security
risk, because there is no access control mechanism.

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 drivers/crypto/mxs-dcp.c | 104 ++++++++++++++++++++++++++++++++++-----
 include/soc/fsl/dcp.h    |  17 +++++++
 2 files changed, 110 insertions(+), 11 deletions(-)
 create mode 100644 include/soc/fsl/dcp.h

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index f6b7bce0e656..2dc664fb2faf 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/stmp_device.h>
 #include <linux/clk.h>
+#include <soc/fsl/dcp.h>
 
 #include <crypto/aes.h>
 #include <crypto/sha1.h>
@@ -101,6 +102,7 @@ struct dcp_async_ctx {
 	struct crypto_skcipher		*fallback;
 	unsigned int			key_len;
 	uint8_t				key[AES_KEYSIZE_128];
+	bool				key_referenced;
 };
 
 struct dcp_aes_req_ctx {
@@ -155,6 +157,7 @@ static struct dcp *global_sdcp;
 #define MXS_DCP_CONTROL0_HASH_TERM		(1 << 13)
 #define MXS_DCP_CONTROL0_HASH_INIT		(1 << 12)
 #define MXS_DCP_CONTROL0_PAYLOAD_KEY		(1 << 11)
+#define MXS_DCP_CONTROL0_OTP_KEY		(1 << 10)
 #define MXS_DCP_CONTROL0_CIPHER_ENCRYPT		(1 << 8)
 #define MXS_DCP_CONTROL0_CIPHER_INIT		(1 << 9)
 #define MXS_DCP_CONTROL0_ENABLE_HASH		(1 << 6)
@@ -168,6 +171,8 @@ static struct dcp *global_sdcp;
 #define MXS_DCP_CONTROL1_CIPHER_MODE_ECB	(0 << 4)
 #define MXS_DCP_CONTROL1_CIPHER_SELECT_AES128	(0 << 0)
 
+#define MXS_DCP_CONTROL1_KEY_SELECT_SHIFT	8
+
 static int mxs_dcp_start_dma(struct dcp_async_ctx *actx)
 {
 	int dma_err;
@@ -224,13 +229,16 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 	struct dcp *sdcp = global_sdcp;
 	struct dcp_dma_desc *desc = &sdcp->coh->desc[actx->chan];
 	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
+	bool key_referenced = actx->key_referenced;
 	int ret;
 
-	key_phys = dma_map_single(sdcp->dev, sdcp->coh->aes_key,
-				  2 * AES_KEYSIZE_128, DMA_TO_DEVICE);
-	ret = dma_mapping_error(sdcp->dev, key_phys);
-	if (ret)
-		return ret;
+	if (!key_referenced) {
+		key_phys = dma_map_single(sdcp->dev, sdcp->coh->aes_key,
+					  2 * AES_KEYSIZE_128, DMA_TO_DEVICE);
+		ret = dma_mapping_error(sdcp->dev, key_phys);
+		if (ret)
+			return ret;
+	}
 
 	src_phys = dma_map_single(sdcp->dev, sdcp->coh->aes_in_buf,
 				  DCP_BUF_SZ, DMA_TO_DEVICE);
@@ -255,8 +263,12 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 		    MXS_DCP_CONTROL0_INTERRUPT |
 		    MXS_DCP_CONTROL0_ENABLE_CIPHER;
 
-	/* Payload contains the key. */
-	desc->control0 |= MXS_DCP_CONTROL0_PAYLOAD_KEY;
+	if (key_referenced)
+		/* Set OTP key bit to select the key via KEY_SELECT. */
+		desc->control0 |= MXS_DCP_CONTROL0_OTP_KEY;
+	else
+		/* Payload contains the key. */
+		desc->control0 |= MXS_DCP_CONTROL0_PAYLOAD_KEY;
 
 	if (rctx->enc)
 		desc->control0 |= MXS_DCP_CONTROL0_CIPHER_ENCRYPT;
@@ -270,6 +282,9 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 	else
 		desc->control1 |= MXS_DCP_CONTROL1_CIPHER_MODE_CBC;
 
+	if (key_referenced)
+		desc->control1 |= sdcp->coh->aes_key[0] << MXS_DCP_CONTROL1_KEY_SELECT_SHIFT;
+
 	desc->next_cmd_addr = 0;
 	desc->source = src_phys;
 	desc->destination = dst_phys;
@@ -284,9 +299,9 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 err_dst:
 	dma_unmap_single(sdcp->dev, src_phys, DCP_BUF_SZ, DMA_TO_DEVICE);
 err_src:
-	dma_unmap_single(sdcp->dev, key_phys, 2 * AES_KEYSIZE_128,
-			 DMA_TO_DEVICE);
-
+	if (!key_referenced)
+		dma_unmap_single(sdcp->dev, key_phys, 2 * AES_KEYSIZE_128,
+				 DMA_TO_DEVICE);
 	return ret;
 }
 
@@ -453,7 +468,7 @@ static int mxs_dcp_aes_enqueue(struct skcipher_request *req, int enc, int ecb)
 	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
 	int ret;
 
-	if (unlikely(actx->key_len != AES_KEYSIZE_128))
+	if (unlikely(actx->key_len != AES_KEYSIZE_128 && !actx->key_referenced))
 		return mxs_dcp_block_fallback(req, enc);
 
 	rctx->enc = enc;
@@ -500,6 +515,7 @@ static int mxs_dcp_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	 * there can still be an operation in progress.
 	 */
 	actx->key_len = len;
+	actx->key_referenced = false;
 	if (len == AES_KEYSIZE_128) {
 		memcpy(actx->key, key, len);
 		return 0;
@@ -516,6 +532,32 @@ static int mxs_dcp_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	return crypto_skcipher_setkey(actx->fallback, key, len);
 }
 
+static int mxs_dcp_aes_setrefkey(struct crypto_skcipher *tfm, const u8 *key,
+				 unsigned int len)
+{
+	struct dcp_async_ctx *actx = crypto_skcipher_ctx(tfm);
+
+	if (len != DCP_PAES_KEYSIZE)
+		return -EINVAL;
+
+	switch (key[0]) {
+	case DCP_PAES_KEY_SLOT0:
+	case DCP_PAES_KEY_SLOT1:
+	case DCP_PAES_KEY_SLOT2:
+	case DCP_PAES_KEY_SLOT3:
+	case DCP_PAES_KEY_UNIQUE:
+	case DCP_PAES_KEY_OTP:
+		memcpy(actx->key, key, len);
+		actx->key_len = len;
+		actx->key_referenced = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int mxs_dcp_aes_fallback_init_tfm(struct crypto_skcipher *tfm)
 {
 	const char *name = crypto_tfm_alg_name(crypto_skcipher_tfm(tfm));
@@ -539,6 +581,13 @@ static void mxs_dcp_aes_fallback_exit_tfm(struct crypto_skcipher *tfm)
 	crypto_free_skcipher(actx->fallback);
 }
 
+static int mxs_dcp_paes_init_tfm(struct crypto_skcipher *tfm)
+{
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct dcp_aes_req_ctx));
+
+	return 0;
+}
+
 /*
  * Hashing (SHA1/SHA256)
  */
@@ -889,6 +938,39 @@ static struct skcipher_alg dcp_aes_algs[] = {
 		.ivsize			= AES_BLOCK_SIZE,
 		.init			= mxs_dcp_aes_fallback_init_tfm,
 		.exit			= mxs_dcp_aes_fallback_exit_tfm,
+	}, {
+		.base.cra_name		= "ecb(paes)",
+		.base.cra_driver_name	= "ecb-paes-dcp",
+		.base.cra_priority	= 401,
+		.base.cra_alignmask	= 15,
+		.base.cra_flags		= CRYPTO_ALG_ASYNC | CRYPTO_ALG_INTERNAL,
+		.base.cra_blocksize	= AES_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct dcp_async_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= DCP_PAES_KEYSIZE,
+		.max_keysize		= DCP_PAES_KEYSIZE,
+		.setkey			= mxs_dcp_aes_setrefkey,
+		.encrypt		= mxs_dcp_aes_ecb_encrypt,
+		.decrypt		= mxs_dcp_aes_ecb_decrypt,
+		.init			= mxs_dcp_paes_init_tfm,
+	}, {
+		.base.cra_name		= "cbc(paes)",
+		.base.cra_driver_name	= "cbc-paes-dcp",
+		.base.cra_priority	= 401,
+		.base.cra_alignmask	= 15,
+		.base.cra_flags		= CRYPTO_ALG_ASYNC | CRYPTO_ALG_INTERNAL,
+		.base.cra_blocksize	= AES_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct dcp_async_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= DCP_PAES_KEYSIZE,
+		.max_keysize		= DCP_PAES_KEYSIZE,
+		.setkey			= mxs_dcp_aes_setrefkey,
+		.encrypt		= mxs_dcp_aes_cbc_encrypt,
+		.decrypt		= mxs_dcp_aes_cbc_decrypt,
+		.ivsize			= AES_BLOCK_SIZE,
+		.init			= mxs_dcp_paes_init_tfm,
 	},
 };
 
diff --git a/include/soc/fsl/dcp.h b/include/soc/fsl/dcp.h
new file mode 100644
index 000000000000..cda89e260c46
--- /dev/null
+++ b/include/soc/fsl/dcp.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 sigma star gmbh
+ */
+
+#ifndef MXS_DCP_H
+#define MXS_DCP_H
+
+#define DCP_PAES_KEYSIZE 1
+#define DCP_PAES_KEY_SLOT0 0x00
+#define DCP_PAES_KEY_SLOT1 0x01
+#define DCP_PAES_KEY_SLOT2 0x02
+#define DCP_PAES_KEY_SLOT3 0x03
+#define DCP_PAES_KEY_UNIQUE 0xfe
+#define DCP_PAES_KEY_OTP 0xff
+
+#endif /* MXS_DCP_H */
-- 
2.35.3

