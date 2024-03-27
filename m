Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71CE88D8DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:26:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=EdS7Vomc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4KWr3GLZz3vcx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 19:26:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=EdS7Vomc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4KVR0qhSz3vXB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 19:25:18 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41492504233so5598875e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527915; x=1712132715; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIG2sL6TE413lQBd5tWYvh6NYan1WxgVQ6EtXfg8N2A=;
        b=EdS7Vomc+d6cSLshD/JxbxD9v1vJ+68atXD6nOaROuV1EPhvq8B8ix+Sq2P/YrruGk
         GQzC7Gp1MOPPHGgQxhPurVI0sUr5jXZrZ916KKtMzCGw63eUADcW4Tl66Dlk3eDENd9B
         z3oEAPz+2oiEMpQ2OnT3TaoH5kbDCmb4J4jxCff3Y+n6v6Npyts7ICNgeyn5eoabDjqE
         xtoSd4Sgegt+QRAK8jWkT96+Q+AmtaNPWLXm5wAeFUxGi1ttx8lkju6cfNQ1+/NnoUbL
         XHTLwgKeh4HXRnTEbsz4zYbUJuO/N+DfeH7myZpo4TZiRVQUE7qXvig2YjvzUF+WzUXW
         kXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527915; x=1712132715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIG2sL6TE413lQBd5tWYvh6NYan1WxgVQ6EtXfg8N2A=;
        b=Fmi6NagbuZZU7HzxZnasnA1T/55XtniZFiBA7NOht3NbD9howefUYDL44bSmd2dzBt
         zFegSmdqDWIrr4F1qYUgBXddN8gy3qC9TtMdSCjnrB4xbChbyhZCPUy6F5jGB/aCVuJr
         efA4+9aJirZe1/lxPiwu26ssa1zm+wap1RIl7IK7xIQYJkhpznfU843LLCB3aKtUxfED
         rzLzJkXVJRUSm1mRVC5S+JXGF3V2kmsmQ1ACOAJWNGnfvUqCHEyF3vEJ1S0lqcLWb1uL
         oU0DHQI7k3E11lNc1Ft6wa0m4QrchEXDaDs52xPYG5bpdoOH0GLpESWHn6G7quhSuKKN
         xMTw==
X-Forwarded-Encrypted: i=1; AJvYcCXNgupappj0KgcBnnzpuCa9lSqkyrSOaFjo43aeqIHI5aloD2wzTvaamYZ2GGd8KhnwlQfpgvYcGTmDZ9fsEjoUTSJWEdD9Co6fqkxctQ==
X-Gm-Message-State: AOJu0YyCOznsFporbtRxCLBV7nHP1ZmBHVfNEbJTTvyp1rhTv2fqsxVa
	LJ6z09HXl8KD8C+UndDc9rvv6lKz6avlgSXkwm8waJIYUvzpsKKlX0z2dimpkw4=
X-Google-Smtp-Source: AGHT+IEUBokWW14nEEsfcjU72XwPMjuCyLWTsZK5+UrFL8nopADE3T2FgbMg6suHqMZtRZFl/jfgUQ==
X-Received: by 2002:a05:600c:1d08:b0:414:624c:aaf with SMTP id l8-20020a05600c1d0800b00414624c0aafmr385438wms.35.1711527915141;
        Wed, 27 Mar 2024 01:25:15 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id u8-20020a05600c19c800b0041478393b8fsm1367394wmq.42.2024.03.27.01.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:14 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v7 1/6] crypto: mxs-dcp: Add support for hardware-bound keys
Date: Wed, 27 Mar 2024 09:24:47 +0100
Message-ID: <20240327082454.13729-2-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327082454.13729-1-david@sigma-star.at>
References: <20240327082454.13729-1-david@sigma-star.at>
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

DCP (Data Co-Processor) is able to derive private keys for a fused
random seed, which can be referenced by handle but not accessed by
the CPU. Similarly, DCP is able to store arbitrary keys in four
dedicated key slots located in its secure memory area (internal SRAM).
These keys can be used to perform AES encryption.

Expose these derived keys and key slots through the crypto API via their
handle. The main purpose is to add DCP-backed trusted keys. Other
use cases are possible too (see similar existing paes implementations),
but these should carefully be evaluated as e.g. enabling AF_ALG will
give userspace full access to use keys. In scenarios with untrustworthy
userspace, this will enable en-/decryption oracles.

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/crypto/mxs-dcp.c | 104 ++++++++++++++++++++++++++++++++++-----
 include/soc/fsl/dcp.h    |  20 ++++++++
 2 files changed, 113 insertions(+), 11 deletions(-)
 create mode 100644 include/soc/fsl/dcp.h

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 2b3ebe0db3a6..057d73c370b7 100644
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
index 000000000000..3ec335d8ca8b
--- /dev/null
+++ b/include/soc/fsl/dcp.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 sigma star gmbh
+ *
+ * Specifies paes key slot handles for NXP's DCP (Data Co-Processor) to be used
+ * with the crypto_skcipher_setkey().
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

