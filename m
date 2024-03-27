Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3188D90E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:28:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=Wx+AxN0u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4KZL42hlz3vnF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 19:28:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=Wx+AxN0u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4KVX6pB1z3vY5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 19:25:24 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so355911f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527921; x=1712132721; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=Wx+AxN0uDacSqQgWX3p4cImIPFxUW3aswIJl/DaRR1hRnae9TpYNhDMELW3wv2ebGI
         JEZoJGTWKIbG2YNBjQCyMCqua+GWcgzvQYkJvE74+qX6gAVxYod4hm5rLZ8CbTXLeVMc
         DpdfphRzCsxhb4QIa415SR05ZtbtRFJkU8OPsAVLNIRA17SyWGELDDWKC2Nd4GV56fLV
         RNfTdgXdbVDDpVuX7ktS1sYSS9cu2LUsOrko7i9dJPti6DU7IAg/XeTLEeZTvhVs3Wyj
         kAMOhK1FyoFf2QOvzguEVvzJ8tsKMxe1I07uzqNdf7MKkdhu0Z/DTZNUVKebOL84RZrB
         6ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527921; x=1712132721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=bM6l6LNULQdlUiXNFyMOU+cLMUvwVkqH7ITmP0c7RwWnVfvMR/zYlqh+DncxmwbIao
         y/LXUVvFYnK18Cz4Xb9iHkjoXqQRHObG/RScLZ9we9HjAIs0P/xFX/xT0HEhwDG7noQj
         J84H2OMSEfLCwMb+Jv9B/AYfE+rrw4tgschzRpkws+7Bp8SdKnI7k5umYvujKoIZcCgL
         0f5eDAIYhWOUz+wOUtFnIlYCh0lBZ6DZvZODSeuc7gpEmqxgUs6ltdRp1SRMzYxpZ+5Y
         U3CylB03kt7rQIG1MJJ7MnMUl5nyyw/IA5wUH1RUMPFaxd62bAxr8R3vU/vjMARdwUv8
         EldA==
X-Forwarded-Encrypted: i=1; AJvYcCWaBzeENuezR20KyymQW7lMQtfYtY/LcLkQtuvIJRd5TQyQr2qRIOLtJKyLCKtcNSQcL+IvnEllrht1dHgtcHtTG1LvvBfZmOmLB7k+rA==
X-Gm-Message-State: AOJu0YzdRL6Zkz1AYMJRZrYcZ38WmoUXfVob8yAp68rdWr5gvT2tzvBR
	MoqVoMdr59ASXPtcc13sxKITrbstV4vrM3JKXpQmXQL+OteDRxgy+6E+SxhQ0Eo=
X-Google-Smtp-Source: AGHT+IEi6DJCe+eRQesc9WaCfXzgJ1OMWtJfkq8NT9bPs2vNWQls9qa5Cc9KIdoWDe4T00OA6qEG8g==
X-Received: by 2002:a5d:67c6:0:b0:33e:764b:ab17 with SMTP id n6-20020a5d67c6000000b0033e764bab17mr3298532wrw.14.1711527921136;
        Wed, 27 Mar 2024 01:25:21 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id cl1-20020a5d5f01000000b0033e72e104c5sm13308800wrb.34.2024.03.27.01.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:20 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v7 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Wed, 27 Mar 2024 09:24:50 +0100
Message-ID: <20240327082454.13729-5-david@sigma-star.at>
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

This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
found in smaller i.MX SoCs.

Signed-off-by: David Gstir <david@sigma-star.at>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 976a5cea1577..ca7f42ca9338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12019,6 +12019,15 @@ S:	Maintained
 F:	include/keys/trusted_caam.h
 F:	security/keys/trusted-keys/trusted_caam.c
 
+KEYS-TRUSTED-DCP
+M:	David Gstir <david@sigma-star.at>
+R:	sigma star Kernel Team <upstream+dcp@sigma-star.at>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_dcp.h
+F:	security/keys/trusted-keys/trusted_dcp.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@linaro.org>
 L:	linux-integrity@vger.kernel.org
-- 
2.35.3

