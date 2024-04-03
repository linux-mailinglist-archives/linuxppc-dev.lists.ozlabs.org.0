Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1432896645
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:23:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=d6M+HKEv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8bpC4V8Cz3vdD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 18:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=d6M+HKEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8blt56l0z3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 18:21:46 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41624e8e16aso359695e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1712128904; x=1712733704; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLnAdyE+lMa8L2TlOW7Lr0VmL77gsDlT8pRhecvobmg=;
        b=d6M+HKEvzEA3idLF2V5P5GFvc5vwyB+Ik8+SPDtuFICzmctDjHJxus1dAN6jBG45Lz
         bKaNbjc0EAvmCxlQhy5gpN688mE30/m6Y3tOKIsUBxg4LDCDCt7y2Kyl5s56dcI3zECA
         5Klubk47DWEvacJsX6HCdIN2gZqNhAI6yy0Vi+q+gBOKWiRF7fcrch4ELP25zXPkh9k1
         VVvM1Zl6mV06QjUNSregZFofKd7mLj3tbSEhdc4TV43B+akOmOxCMgX4mttqEIndBcG9
         gHjzshNgSSI6WFB1Iod7jdWy8NG3OBtJ/2UudXRktIuIkCYn1iVvXuVwUzq+fQWjpDpe
         lC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128904; x=1712733704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLnAdyE+lMa8L2TlOW7Lr0VmL77gsDlT8pRhecvobmg=;
        b=nSyQJnYdwisSOTA6++okwM9tRqUT6c68WvnjfKXZ6caWj/NjiwxVLZMjBhWjJj/9Cd
         CXPIc1DxbKkhKlSiTfbsKHJmh+IMTkMJ7Ao7K6k2D/jPankRYHVCmTZFQW3CKZIwClEi
         yDOmmeSxiE6QT+5bBwnSPxXqzH+99bbyhieJwlSKj8S8IGJu9JfuU9NgCnCmP6CAemAG
         ASzVsTzhEtv/gIWACyehac7PmGU7Y25QTJ/dG/EbJMsoI/At/dt99a2ZqikEAo5C9omP
         fn7RFhfcfpkrUmq13eP5bg/l8L0jlk4TOpwnU6vFXPTCdEEPOIS1oc5+uZpuX2wEs2pq
         utQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFohAg2SYivT2FGU0A2DUByO2ynCSOKdRXZhQDgBpSHKzNlmHOKbqk/VVr/IfKrLlNlUdERpWsrp8+me95TQQJTyS8akCHf/TbF4N2pw==
X-Gm-Message-State: AOJu0YxhPSEVJrs/7MpSq//xQ4qP/t275eA4Sj8AdgAphvFb30Ja01Wy
	sxwZFNo5dYacqRBz2gtuq4W6Qkjyhlu/BcrooB5rwjd1kcLIerHonkB1W2CZA60=
X-Google-Smtp-Source: AGHT+IGBKQFCUXIuGuB/3ITVSTmpwBRNnzhoeJUE1hf5xtsCdWq2cIwS9vpwQ4hO/jWGP/x1CquarA==
X-Received: by 2002:a05:600c:3c99:b0:414:8e3:d8e0 with SMTP id bg25-20020a05600c3c9900b0041408e3d8e0mr11942948wmb.17.1712128903715;
        Wed, 03 Apr 2024 00:21:43 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id v13-20020a5d4b0d000000b0034356c434d0sm1436269wrq.117.2024.04.03.00.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:21:43 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v8 2/6] KEYS: trusted: improve scalability of trust source config
Date: Wed,  3 Apr 2024 09:21:18 +0200
Message-ID: <20240403072131.54935-3-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403072131.54935-1-david@sigma-star.at>
References: <20240403072131.54935-1-david@sigma-star.at>
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

Enabling trusted keys requires at least one trust source implementation
(currently TPM, TEE or CAAM) to be enabled. Currently, this is
done by checking each trust source's config option individually.
This does not scale when more trust sources like the one for DCP
are added, because the condition will get long and hard to read.

Add config HAVE_TRUSTED_KEYS which is set to true by each trust source
once its enabled and adapt the check for having at least one active trust
source to use this option. Whenever a new trust source is added, it now
needs to select HAVE_TRUSTED_KEYS.

Signed-off-by: David Gstir <david@sigma-star.at>
Tested-by: Jarkko Sakkinen <jarkko@kernel.org> # for TRUSTED_KEYS_TPM
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
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

