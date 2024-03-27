Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2E88D8EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:27:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=WVxUG4Xk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4KXd3wf8z3vXP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 19:27:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=WVxUG4Xk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4KVS64Ksz3ddX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 19:25:20 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33edbc5932bso4518673f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527917; x=1712132717; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41GOPkTc4lXAIZ+9zm1p6sZ+N7KmKdpT4tLVWCOmpjY=;
        b=WVxUG4XkjcLc/ZoZi/wPAOROkz6SvrinMbo/0Xx316Tf1y5who2rxBGevkUj7XAH4I
         4oYFnKQy8d0aTKLTYF2ci50NiQ4kfrVbN3UgEYLgQ9nB3399VGbRiMkaBMDWSm8mtRWP
         ERZlH9k+p4uTXsnwnUDJEomwUt+A8SRhL2z+CHKASXUnCic0WmlmtCZLa64B5fwxI5zV
         40Ka/4UOaAysAX8VckSQbkbepi0mvc+qDdvQ+7+9rH1TZkJmiL3zildewowMIvglSoca
         d5uazt3Jj9oX3PHWYHSXgVKTuoVD6EDFtakYsJdXYXyWUC6OiVN2nqIUHAJ29JHhkEhk
         8UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527917; x=1712132717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41GOPkTc4lXAIZ+9zm1p6sZ+N7KmKdpT4tLVWCOmpjY=;
        b=BmSGS/Nwr1LuG8VrK9gHW34IdL2oTG2ls3lJWOxoki790KJsmbzcQnDjia6mn2EFLe
         hVg4d9m982O90/6GtxbxCH85661lWAjkz6TE1xxGRRYhlYYbnuz2S47UXdQ4C32sYkKi
         Rbe81WLJm9GrKzJ6zyzMysvYpPk+Vp5lSDqD84+VFwcKoPSvvKNqPJJqGbTfUlanscV4
         m85Atp7io3xAwzkDk9a7DoddKpdd4HXlpyk87z7RuLBculIUgQ3jwKsvmwAk56Y+JgiZ
         VpigFkrE1mq6OcBYPXMw5gRip0y5GzIRkyEnWE1FJ9uP/Jb+jUBh2GB+WAruw04sYgD/
         dYtw==
X-Forwarded-Encrypted: i=1; AJvYcCWxmDYAMOXPlNxBF9Qv4/MjM6cNyaJBO+QIJl+7ESlRIxZx078YWMvh77vif8lmRWCpFBqPTEdojVY3FoQc0E3YCrOri46zjX+Cn3PQMQ==
X-Gm-Message-State: AOJu0Yxe8cOit0PkygV3UhSQy5BC+HjyBwuF4qKidjlCZAr4kifderV8
	xXgT83GZDcmqYhrBudnH1aP8nt3WDDdVEgH/5vZUbHPtMY5kYD9wQ00UXEWepj4=
X-Google-Smtp-Source: AGHT+IHlYgiwwFkkQ0bYRo4ux1xbHOrikHhT8qJd8DY/AJq8DdShBZcoa1JSm1RCgDbg3Zs77MGl0Q==
X-Received: by 2002:adf:fd51:0:b0:33e:8c7e:608c with SMTP id h17-20020adffd51000000b0033e8c7e608cmr2580372wrs.13.1711527917000;
        Wed, 27 Mar 2024 01:25:17 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id x4-20020a5d60c4000000b00341ce1b64f0sm6951265wrt.17.2024.03.27.01.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:16 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v7 2/6] KEYS: trusted: improve scalability of trust source config
Date: Wed, 27 Mar 2024 09:24:48 +0100
Message-ID: <20240327082454.13729-3-david@sigma-star.at>
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

