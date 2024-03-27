Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1288D8FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:28:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=Zc9g/8sz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4KYY2CmGz3vfD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 19:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=Zc9g/8sz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4KVW3njDz3vYg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 19:25:23 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d68cf90ec4so104924471fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527919; x=1712132719; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk3bunkUZB3eJdbTI0pWomxdZHb/buVMZM8Xz7Iwzes=;
        b=Zc9g/8szFXzvc+nWpJOclojH6w2td4Imdbd+CsKsNNGigj9EWVsTRVIqs3NBGhvNGg
         uEl2yIO9PAlZiWauE8UG3EgC3CkpxboKkypHoS/tOxIPhdubLTeelAxrsX6MxlS1WZhd
         glPaeZdtOCHbHxo/yBC9GQvK/kaL3fgp/QK1d+I3l6CTeC2Itn/sKstp8vdN3OWOr78N
         6ditxXaZDjSCCuAB6ShT8G0CDf/I3ZmPYITUlBEsyuo++Khvgrp5F2/+TlPeu0dE/o4O
         m/7gfRn+2f6y153W6PFqu/QUFiqbiYwleeIWH0Z06KvJbUMo66R/ldiSNkK7BaIrdai9
         LOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527919; x=1712132719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jk3bunkUZB3eJdbTI0pWomxdZHb/buVMZM8Xz7Iwzes=;
        b=o08UZLSHkk/pz3I2t4RhHSEbo+mrSvhZWoyb6WeNtrqKz0RkiCs1vVGPrwsJJHGuKh
         ABMGAHYvej/tZsktjqcG4FcbeD3PhWniteySQ2VWElpDEwXGLZpLhpvc1dXIfllcBaUY
         0b/47KWrc2MhRlHTDRetTa+HvZkSNCVIh+b4skcB3kkQkWk1CIt7kRG0IcNZydj/sRrJ
         nPkkEVlHVOth3E/I1m+KH0kw2dPO99oBhPBublA2SLMSeFaINVXggRNMCFJyoRcgby3C
         P0bssL6OraNUfnfOEG2Na8nbA2YaXh1gmdyedk+8lgB6hSRmOKRrYLg46xDGM2hzCeeM
         z9pw==
X-Forwarded-Encrypted: i=1; AJvYcCVXClzQ/bvQFdAZfewuStohRXnBzoELRlXNS5+9ReW8MF4lDA6UC+M2kfT+MeKXwsqD6cSb+R58cWNJ+N141ym9KC6D25sOEvgTiRAUtg==
X-Gm-Message-State: AOJu0YzN07rdymIOnWueKLh+Du7NlTqqA734kcSXjRNLLZGkgC5lyiAG
	KbX/U5OlxfRN6tspljKxA/XMsalT8cacI5mGTatiFKZoq38PzEdoKyju6SbBLpI=
X-Google-Smtp-Source: AGHT+IEM391LUYmEPaT8ccBKiwLMlS9XmR7KE15SwhPNXIWtYqROn5S6SRHvk8RLW96qDVtiFrc1AQ==
X-Received: by 2002:a05:651c:a04:b0:2d6:a7a1:17ad with SMTP id k4-20020a05651c0a0400b002d6a7a117admr2472680ljq.51.1711527919170;
        Wed, 27 Mar 2024 01:25:19 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id c9-20020a7bc2a9000000b0041493615585sm1376019wmk.39.2024.03.27.01.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:18 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v7 3/6] KEYS: trusted: Introduce NXP DCP-backed trusted keys
Date: Wed, 27 Mar 2024 09:24:49 +0100
Message-ID: <20240327082454.13729-4-david@sigma-star.at>
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

DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
Beside of accelerated crypto operations, it also offers support for
hardware-bound keys. Using this feature it is possible to implement a blob
mechanism similar to what CAAM offers. Unlike on CAAM, constructing and
parsing the blob has to happen in software (i.e. the kernel).

The software-based blob format used by DCP trusted keys encrypts
the payload using AES-128-GCM with a freshly generated random key and nonce.
The random key itself is AES-128-ECB encrypted using the DCP unique
or OTP key.

The DCP trusted key blob format is:
/*
 * struct dcp_blob_fmt - DCP BLOB format.
 *
 * @fmt_version: Format version, currently being %1
 * @blob_key: Random AES 128 key which is used to encrypt @payload,
 *            @blob_key itself is encrypted with OTP or UNIQUE device key in
 *            AES-128-ECB mode by DCP.
 * @nonce: Random nonce used for @payload encryption.
 * @payload_len: Length of the plain text @payload.
 * @payload: The payload itself, encrypted using AES-128-GCM and @blob_key,
 *           GCM auth tag of size AES_BLOCK_SIZE is attached at the end of it.
 *
 * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload_len +
 * AES_BLOCK_SIZE.
 */
struct dcp_blob_fmt {
	__u8 fmt_version;
	__u8 blob_key[AES_KEYSIZE_128];
	__u8 nonce[AES_KEYSIZE_128];
	__le32 payload_len;
	__u8 payload[];
} __packed;

By default the unique key is used. It is also possible to use the
OTP key. While the unique key should be unique it is not documented how
this key is derived. Therefore selection the OTP key is supported as
well via the use_otp_key module parameter.

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 include/keys/trusted_dcp.h                |  11 +
 security/keys/trusted-keys/Kconfig        |   8 +
 security/keys/trusted-keys/Makefile       |   2 +
 security/keys/trusted-keys/trusted_core.c |   6 +-
 security/keys/trusted-keys/trusted_dcp.c  | 313 ++++++++++++++++++++++
 5 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 include/keys/trusted_dcp.h
 create mode 100644 security/keys/trusted-keys/trusted_dcp.c

diff --git a/include/keys/trusted_dcp.h b/include/keys/trusted_dcp.h
new file mode 100644
index 000000000000..9aaa42075b40
--- /dev/null
+++ b/include/keys/trusted_dcp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 sigma star gmbh
+ */
+
+#ifndef TRUSTED_DCP_H
+#define TRUSTED_DCP_H
+
+extern struct trusted_key_ops dcp_trusted_key_ops;
+
+#endif
diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
index 553dc117f385..1fb8aa001995 100644
--- a/security/keys/trusted-keys/Kconfig
+++ b/security/keys/trusted-keys/Kconfig
@@ -39,6 +39,14 @@ config TRUSTED_KEYS_CAAM
 	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
 	  (CAAM) as trusted key backend.
 
+config TRUSTED_KEYS_DCP
+	bool "DCP-based trusted keys"
+	depends on CRYPTO_DEV_MXS_DCP >= TRUSTED_KEYS
+	default y
+	select HAVE_TRUSTED_KEYS
+	help
+	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
+
 if !HAVE_TRUSTED_KEYS
 	comment "No trust source selected!"
 endif
diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
index 735aa0bc08ef..f0f3b27f688b 100644
--- a/security/keys/trusted-keys/Makefile
+++ b/security/keys/trusted-keys/Makefile
@@ -14,3 +14,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TPM) += tpm2key.asn1.o
 trusted-$(CONFIG_TRUSTED_KEYS_TEE) += trusted_tee.o
 
 trusted-$(CONFIG_TRUSTED_KEYS_CAAM) += trusted_caam.o
+
+trusted-$(CONFIG_TRUSTED_KEYS_DCP) += trusted_dcp.o
diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
index fee1ab2c734d..5113aeae5628 100644
--- a/security/keys/trusted-keys/trusted_core.c
+++ b/security/keys/trusted-keys/trusted_core.c
@@ -10,6 +10,7 @@
 #include <keys/trusted-type.h>
 #include <keys/trusted_tee.h>
 #include <keys/trusted_caam.h>
+#include <keys/trusted_dcp.h>
 #include <keys/trusted_tpm.h>
 #include <linux/capability.h>
 #include <linux/err.h>
@@ -30,7 +31,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
 
 static char *trusted_key_source;
 module_param_named(source, trusted_key_source, charp, 0);
-MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee or caam)");
+MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or dcp)");
 
 static const struct trusted_key_source trusted_key_sources[] = {
 #if defined(CONFIG_TRUSTED_KEYS_TPM)
@@ -42,6 +43,9 @@ static const struct trusted_key_source trusted_key_sources[] = {
 #if defined(CONFIG_TRUSTED_KEYS_CAAM)
 	{ "caam", &trusted_key_caam_ops },
 #endif
+#if defined(CONFIG_TRUSTED_KEYS_DCP)
+	{ "dcp", &dcp_trusted_key_ops },
+#endif
 };
 
 DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/trusted-keys/trusted_dcp.c
new file mode 100644
index 000000000000..16c44aafeab3
--- /dev/null
+++ b/security/keys/trusted-keys/trusted_dcp.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 sigma star gmbh
+ */
+
+#include <crypto/aead.h>
+#include <crypto/aes.h>
+#include <crypto/algapi.h>
+#include <crypto/gcm.h>
+#include <crypto/skcipher.h>
+#include <keys/trusted-type.h>
+#include <linux/key-type.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/random.h>
+#include <linux/scatterlist.h>
+#include <soc/fsl/dcp.h>
+
+#define DCP_BLOB_VERSION 1
+#define DCP_BLOB_AUTHLEN 16
+
+/**
+ * struct dcp_blob_fmt - DCP BLOB format.
+ *
+ * @fmt_version: Format version, currently being %1.
+ * @blob_key: Random AES 128 key which is used to encrypt @payload,
+ *            @blob_key itself is encrypted with OTP or UNIQUE device key in
+ *            AES-128-ECB mode by DCP.
+ * @nonce: Random nonce used for @payload encryption.
+ * @payload_len: Length of the plain text @payload.
+ * @payload: The payload itself, encrypted using AES-128-GCM and @blob_key,
+ *           GCM auth tag of size DCP_BLOB_AUTHLEN is attached at the end of it.
+ *
+ * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + @payload_len +
+ * DCP_BLOB_AUTHLEN.
+ */
+struct dcp_blob_fmt {
+	__u8 fmt_version;
+	__u8 blob_key[AES_KEYSIZE_128];
+	__u8 nonce[AES_KEYSIZE_128];
+	__le32 payload_len;
+	__u8 payload[];
+} __packed;
+
+static bool use_otp_key;
+module_param_named(dcp_use_otp_key, use_otp_key, bool, 0);
+MODULE_PARM_DESC(dcp_use_otp_key, "Use OTP instead of UNIQUE key for sealing");
+
+static bool skip_zk_test;
+module_param_named(dcp_skip_zk_test, skip_zk_test, bool, 0);
+MODULE_PARM_DESC(dcp_skip_zk_test, "Don't test whether device keys are zero'ed");
+
+static unsigned int calc_blob_len(unsigned int payload_len)
+{
+	return sizeof(struct dcp_blob_fmt) + payload_len + DCP_BLOB_AUTHLEN;
+}
+
+static int do_dcp_crypto(u8 *in, u8 *out, bool do_encrypt)
+{
+	struct skcipher_request *req = NULL;
+	struct scatterlist src_sg, dst_sg;
+	struct crypto_skcipher *tfm;
+	u8 paes_key[DCP_PAES_KEYSIZE];
+	DECLARE_CRYPTO_WAIT(wait);
+	int res = 0;
+
+	if (use_otp_key)
+		paes_key[0] = DCP_PAES_KEY_OTP;
+	else
+		paes_key[0] = DCP_PAES_KEY_UNIQUE;
+
+	tfm = crypto_alloc_skcipher("ecb-paes-dcp", CRYPTO_ALG_INTERNAL,
+				    CRYPTO_ALG_INTERNAL);
+	if (IS_ERR(tfm)) {
+		res = PTR_ERR(tfm);
+		tfm = NULL;
+		goto out;
+	}
+
+	req = skcipher_request_alloc(tfm, GFP_NOFS);
+	if (!req) {
+		res = -ENOMEM;
+		goto out;
+	}
+
+	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
+				      CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, &wait);
+	res = crypto_skcipher_setkey(tfm, paes_key, sizeof(paes_key));
+	if (res < 0)
+		goto out;
+
+	sg_init_one(&src_sg, in, AES_KEYSIZE_128);
+	sg_init_one(&dst_sg, out, AES_KEYSIZE_128);
+	skcipher_request_set_crypt(req, &src_sg, &dst_sg, AES_KEYSIZE_128,
+				   NULL);
+
+	if (do_encrypt)
+		res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	else
+		res = crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
+
+out:
+	skcipher_request_free(req);
+	crypto_free_skcipher(tfm);
+
+	return res;
+}
+
+static int do_aead_crypto(u8 *in, u8 *out, size_t len, u8 *key, u8 *nonce,
+			  bool do_encrypt)
+{
+	struct aead_request *aead_req = NULL;
+	struct scatterlist src_sg, dst_sg;
+	struct crypto_aead *aead;
+	int ret;
+
+	aead = crypto_alloc_aead("gcm(aes)", 0, CRYPTO_ALG_ASYNC);
+	if (IS_ERR(aead)) {
+		ret = PTR_ERR(aead);
+		goto out;
+	}
+
+	ret = crypto_aead_setauthsize(aead, DCP_BLOB_AUTHLEN);
+	if (ret < 0) {
+		pr_err("Can't set crypto auth tag len: %d\n", ret);
+		goto free_aead;
+	}
+
+	aead_req = aead_request_alloc(aead, GFP_KERNEL);
+	if (!aead_req) {
+		ret = -ENOMEM;
+		goto free_aead;
+	}
+
+	sg_init_one(&src_sg, in, len);
+	if (do_encrypt) {
+		/*
+		 * If we encrypt our buffer has extra space for the auth tag.
+		 */
+		sg_init_one(&dst_sg, out, len + DCP_BLOB_AUTHLEN);
+	} else {
+		sg_init_one(&dst_sg, out, len);
+	}
+
+	aead_request_set_crypt(aead_req, &src_sg, &dst_sg, len, nonce);
+	aead_request_set_callback(aead_req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL,
+				  NULL);
+	aead_request_set_ad(aead_req, 0);
+
+	if (crypto_aead_setkey(aead, key, AES_KEYSIZE_128)) {
+		pr_err("Can't set crypto AEAD key\n");
+		ret = -EINVAL;
+		goto free_req;
+	}
+
+	if (do_encrypt)
+		ret = crypto_aead_encrypt(aead_req);
+	else
+		ret = crypto_aead_decrypt(aead_req);
+
+free_req:
+	aead_request_free(aead_req);
+free_aead:
+	crypto_free_aead(aead);
+out:
+	return ret;
+}
+
+static int decrypt_blob_key(u8 *key)
+{
+	return do_dcp_crypto(key, key, false);
+}
+
+static int encrypt_blob_key(u8 *key)
+{
+	return do_dcp_crypto(key, key, true);
+}
+
+static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablob)
+{
+	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
+	int blen, ret;
+
+	blen = calc_blob_len(p->key_len);
+	if (blen > MAX_BLOB_SIZE)
+		return -E2BIG;
+
+	b->fmt_version = DCP_BLOB_VERSION;
+	get_random_bytes(b->nonce, AES_KEYSIZE_128);
+	get_random_bytes(b->blob_key, AES_KEYSIZE_128);
+
+	ret = do_aead_crypto(p->key, b->payload, p->key_len, b->blob_key,
+			     b->nonce, true);
+	if (ret) {
+		pr_err("Unable to encrypt blob payload: %i\n", ret);
+		return ret;
+	}
+
+	ret = encrypt_blob_key(b->blob_key);
+	if (ret) {
+		pr_err("Unable to encrypt blob key: %i\n", ret);
+		return ret;
+	}
+
+	b->payload_len = get_unaligned_le32(&p->key_len);
+	p->blob_len = blen;
+	return 0;
+}
+
+static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datablob)
+{
+	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
+	int blen, ret;
+
+	if (b->fmt_version != DCP_BLOB_VERSION) {
+		pr_err("DCP blob has bad version: %i, expected %i\n",
+		       b->fmt_version, DCP_BLOB_VERSION);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	p->key_len = le32_to_cpu(b->payload_len);
+	blen = calc_blob_len(p->key_len);
+	if (blen != p->blob_len) {
+		pr_err("DCP blob has bad length: %i != %i\n", blen,
+		       p->blob_len);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = decrypt_blob_key(b->blob_key);
+	if (ret) {
+		pr_err("Unable to decrypt blob key: %i\n", ret);
+		goto out;
+	}
+
+	ret = do_aead_crypto(b->payload, p->key, p->key_len + DCP_BLOB_AUTHLEN,
+			     b->blob_key, b->nonce, false);
+	if (ret) {
+		pr_err("Unwrap of DCP payload failed: %i\n", ret);
+		goto out;
+	}
+
+	ret = 0;
+out:
+	return ret;
+}
+
+static int test_for_zero_key(void)
+{
+	/*
+	 * Encrypting a plaintext of all 0x55 bytes will yield
+	 * this ciphertext in case the DCP test key is used.
+	 */
+	static const u8 bad[] = {0x9a, 0xda, 0xe0, 0x54, 0xf6, 0x3d, 0xfa, 0xff,
+				 0x5e, 0xa1, 0x8e, 0x45, 0xed, 0xf6, 0xea, 0x6f};
+	void *buf = NULL;
+	int ret = 0;
+
+	if (skip_zk_test)
+		goto out;
+
+	buf = kmalloc(AES_BLOCK_SIZE, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	memset(buf, 0x55, AES_BLOCK_SIZE);
+
+	ret = do_dcp_crypto(buf, buf, true);
+	if (ret)
+		goto out;
+
+	if (memcmp(buf, bad, AES_BLOCK_SIZE) == 0) {
+		pr_warn("Device neither in secure nor trusted mode!\n");
+		ret = -EINVAL;
+	}
+out:
+	kfree(buf);
+	return ret;
+}
+
+static int trusted_dcp_init(void)
+{
+	int ret;
+
+	if (use_otp_key)
+		pr_info("Using DCP OTP key\n");
+
+	ret = test_for_zero_key();
+	if (ret) {
+		pr_warn("Test for zero'ed keys failed: %i\n", ret);
+
+		return -EINVAL;
+	}
+
+	return register_key_type(&key_type_trusted);
+}
+
+static void trusted_dcp_exit(void)
+{
+	unregister_key_type(&key_type_trusted);
+}
+
+struct trusted_key_ops dcp_trusted_key_ops = {
+	.exit = trusted_dcp_exit,
+	.init = trusted_dcp_init,
+	.seal = trusted_dcp_seal,
+	.unseal = trusted_dcp_unseal,
+	.migratable = 0,
+};
-- 
2.35.3

