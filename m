Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207587537B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 16:40:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=O5XOSIJG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrD6J5dPMz3vf5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:40:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=O5XOSIJG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrD4D6bVyz3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 02:39:08 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d3b93e992aso12875991fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709825944; x=1710430744; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5byLpxSkDHpWtFqk+o0iXmSYvszrS7+YdXxWavlXQY=;
        b=O5XOSIJG3S0CtmFbCn9JrZSo+RrOiLb8GEUBU1SgB2XBuDRTh+7Dc22XL5ZqyABDZm
         i7Jl+D2d9ttNq09WigrP6KM2ibz+haj9EQ5LaOj+YxcuwB2bA92tL6r9H9QNpmvd/H5n
         DuZoU0Z4erL7zhQlzLHIPRKnGWfErHU6JwuQpJ6FqkVKorW/rNgHrzz1vjkIEqZtYfDb
         g/onUNvNn+cFkZu/RHosWVMxIzQlxev9+GxfCaC0beGnaW5m/WVmt+zS4RgKwhqsGJrA
         HT3XRn8b7OJBfUdBvAS0Sa+629oZFSl6ThjoKn+HEsPgxJFMvSlrj8iHIWHsSC3s190w
         o11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825944; x=1710430744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5byLpxSkDHpWtFqk+o0iXmSYvszrS7+YdXxWavlXQY=;
        b=T09itAIKCYYTGEcJjNSl9J12yKSgioFyrLBRlpjdHzc+5IVMkICPxSg4/xhXY+tEOL
         VtOv31XSzjW3sJTzeypnN7lUroRoG31DV0m0GHuXeTUnw2ds0zv7SIyUMuPtdh5/7wz8
         9GlTPloCAfdw7qwf1/RbFOBOvo5Gg2E74ljaFV0xHP6ufv/VIaJ2FtKhiJZb4E3CFJhc
         IP8bMf5I0zrSziYtddRRBRjILDRAD2L5OaUFCo/edG4EQNUygrF6kyXYzw2Mm0ntqefF
         RWR30JRcjgtWJ65NaGymgc4b4xQCP7U+AW3HOsce6nE8m68fblhkXdqOxK19Ml8BlOQR
         HAZw==
X-Forwarded-Encrypted: i=1; AJvYcCXFISCHpscqOZeyL0vE/4xuX+IuSGpNRvsQYc1APIM/lhKzlVHZO+3TzNsVLD5yjhrp1Z5LVlpubRSBaqYGH/9RmdJbjAQkETT3tj2wAA==
X-Gm-Message-State: AOJu0Yzg36c1pDPtImCpmdbtCuWg+Oi5yQplHGsHo7CHWQZxJy4v9nGQ
	79rDXV+7AlpPZTU99fz8JbhiXrDwiVwo/wkmaJkw7MBq9qh6A+qTM8KB4Fq0wOA=
X-Google-Smtp-Source: AGHT+IH+LPdv4uI8ZtpLAROMjGCY94DX6j2AvsclNLplVSroc4bHXuz/v1iWuKlTq88uAf/Bob4Hwg==
X-Received: by 2002:a2e:a99f:0:b0:2d3:2a95:6f0b with SMTP id x31-20020a2ea99f000000b002d32a956f0bmr1921680ljq.12.1709825944291;
        Thu, 07 Mar 2024 07:39:04 -0800 (PST)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id n24-20020a05640204d800b00566f92f1facsm6501964edw.36.2024.03.07.07.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:39:04 -0800 (PST)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v6 2/6] KEYS: trusted: improve scalability of trust source config
Date: Thu,  7 Mar 2024 16:38:29 +0100
Message-ID: <20240307153842.80033-3-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307153842.80033-1-david@sigma-star.at>
References: <20240307153842.80033-1-david@sigma-star.at>
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
are added.

Add config HAVE_TRUSTED_KEYS which is set to true by each trust source
once its enabled and adapt the check for having at least one active trust
source to use this option. Whenever a new trust source is added, it now
needs to select HAVE_TRUSTED_KEYS.

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

