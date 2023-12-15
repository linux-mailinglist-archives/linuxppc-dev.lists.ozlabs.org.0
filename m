Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31796814660
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 12:09:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=cX9ExoXj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss61S5t5jz3vcB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 22:09:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=cX9ExoXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss5yr3WPdz3cXF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 22:07:16 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3333074512bso928430f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1702638432; x=1703243232; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glgMvtXI6KkmHIaNgJkuNjVnZkyLK3+FNQI0ug3e7hI=;
        b=cX9ExoXjBXKaJ7wDOKhch6tMyFaYnlXjh0E8xC268OEu368UvUgMw5iLUqoMLrLkNs
         fpUbnnvAZPcLj1ZSCP9gP6MBLXfzo7ObFCXlIrfksxAcusp7jnCUhVLj4jK71yOhxXNp
         oLnqTt8g3HgLLAa+O9OyGKOJ28Jpw/q/vPNiMr0IvDpmuYd5DANn9UtaFhj42GJ21b3G
         T38JaZkHcfgMGMZ3VpxOsSfWvxOBCMcBM+8SJ8KmOhVjg+S4syhXmgdi7PUdusPtciFp
         xMvMbThRflEJRQXbc2MYpn+Tm0BOVzaL6UOX9qQDzxPkYaz1S5DTvosTe09id28QvGQw
         nvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702638432; x=1703243232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glgMvtXI6KkmHIaNgJkuNjVnZkyLK3+FNQI0ug3e7hI=;
        b=kbLXgSolAD8mNAqLdQtTstAcVJfgZNquDQAOF3CUw28qzd71B6nph5yJijbTI7ESl6
         mUrLBlt5sSXK1PCzNvyl9KIgACLvKMnhU0cruiBvbIy2i+wxQg+ZjyttSYOSVwKtFMnJ
         BkblK6BtNBgC63qmILXZafKqf0KK6mzOPnXQILKu6sTLnKzE3p+KUtuqLt9K38sgFCAb
         COHgNyTZ1Lr8lX4BkkJ3WQz0enyTUFsnv5mbAcd2CthTDQ3V61eywk80/o6oM/hLwi89
         lMeV5zGEw69RnZig2xEETl0Ftm78+mnFBytRvinFZDQRZB6I3kDk1D48bYgzYZrX4Avu
         iZLQ==
X-Gm-Message-State: AOJu0YzVXAxK9YToL1n/K0pLZwAG6SKYQyvg/zdC2Z9TXk5rlu3EsuTS
	0q0jVfeGUa/VKVFkzUa2JU4RGA==
X-Google-Smtp-Source: AGHT+IFvQkMHaxRZA5Zs8mkotuWDtp+T3hyCKoTiMu/ivavbVlHMH2icSqyklYImwQNURYB9+KWiSw==
X-Received: by 2002:a05:600c:4311:b0:40c:2788:2903 with SMTP id p17-20020a05600c431100b0040c27882903mr5823244wme.125.1702638432281;
        Fri, 15 Dec 2023 03:07:12 -0800 (PST)
Received: from localhost (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with UTF8SMTPSA id p8-20020a05600c358800b0040b40468c98sm30050771wmq.10.2023.12.15.03.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 03:07:12 -0800 (PST)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v5 2/6] KEYS: trusted: improve scalability of trust source config
Date: Fri, 15 Dec 2023 12:06:29 +0100
Message-ID: <20231215110639.45522-3-david@sigma-star.at>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215110639.45522-1-david@sigma-star.at>
References: <20231215110639.45522-1-david@sigma-star.at>
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.
 org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Checking if at least one valid trust source is selected does not scale
and becomes hard to read. This improves this in preparation for the DCP
trust source.

Signed-off-by: David Gstir <david@sigma-star.at>
---
 security/keys/trusted-keys/Kconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
index dbfdd8536468..553dc117f385 100644
--- a/security/keys/trusted-keys/Kconfig
+++ b/security/keys/trusted-keys/Kconfig
@@ -1,3 +1,6 @@
+config HAVE_TRUSTED_KEYS
+	bool
+
 config TRUSTED_KEYS_TPM
 	bool "TPM-based trusted keys"
 	depends on TCG_TPM >= TRUSTED_KEYS
@@ -9,6 +12,7 @@ config TRUSTED_KEYS_TPM
 	select ASN1_ENCODER
 	select OID_REGISTRY
 	select ASN1
+	select HAVE_TRUSTED_KEYS
 	help
 	  Enable use of the Trusted Platform Module (TPM) as trusted key
 	  backend. Trusted keys are random number symmetric keys,
@@ -20,6 +24,7 @@ config TRUSTED_KEYS_TEE
 	bool "TEE-based trusted keys"
 	depends on TEE >= TRUSTED_KEYS
 	default y
+	select HAVE_TRUSTED_KEYS
 	help
 	  Enable use of the Trusted Execution Environment (TEE) as trusted
 	  key backend.
@@ -29,10 +34,11 @@ config TRUSTED_KEYS_CAAM
 	depends on CRYPTO_DEV_FSL_CAAM_JR >= TRUSTED_KEYS
 	select CRYPTO_DEV_FSL_CAAM_BLOB_GEN
 	default y
+	select HAVE_TRUSTED_KEYS
 	help
 	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
 	  (CAAM) as trusted key backend.
 
-if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM
-comment "No trust source selected!"
+if !HAVE_TRUSTED_KEYS
+	comment "No trust source selected!"
 endif
-- 
2.35.3

