Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B3387538C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 16:42:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=KKGXYZOW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrD813m3Xz3vkN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:42:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=KKGXYZOW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrD4J3rGmz3dSB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 02:39:12 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a458850dbddso166316666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 07:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709825949; x=1710430749; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=KKGXYZOWyQRdK+cbBT7nFjZLCozio3hgWxWqPB9lJtfi44/PbZ7jwRBxed9NcBnmVL
         /5qI6gMOWwRZEF8pmIjdleN08BnIcDP1vPnFbknRO5/wT979DP160XxkpHyzjOKHRTxu
         ob3U+GI6g2qLJ0398wD5J4OoR1HkW4Ie1Q/x1huBqZXZm8qYh3LrbE+GC950Y9G17LFe
         WP1rb8ShBog1yg3QYj+i8CEKRmXHyMDEBQXzP0TrnPnLILvtXTpEP2v+pUXwoVrkJzrm
         dKhsZKVFIrnN0xv+HN4QWZQ/x1VzTz9lBtMAQq6QaIZSdyUVFIshAF6ux2+ErkzTo7CT
         Y4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825949; x=1710430749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=fZQn7CFnQSFvIg9b4QmJynI9Jv6r0QqyKTX3wfuXhYxYDm7xTTdh5UWEZ3ptVqI31J
         Gx/DUofjFbULvm0BNA+MnCGRmkMAmEk920tdXKVVfpiyeI6jpLTXDP4/AuJVm170eBxx
         TWYO5H9wMEB84zEuF/c4WSziRNB7+0Sjk9epGxf98THK9poVP6qld9TczKoZRKV8PJLC
         r79r/jB6yuqNqGZS5ZD4WyJWAdA6e+tS3g6TKUVfJCahgt+iPb0ilFdnDY5cXCfx4izf
         GB2iu7nVXhintBfzND2vjaUZCCgSqcrjop196S0mlqVzeOlzV22GJLFmapsnGKqtGrJ5
         FXxg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5jyq8uk4+ssJIfRY6v2vugMEmpQcW+5zaI3LX5mN2gEbIajTQe6mW4Z1OrQ6f1Noqk7JDA8+AwyRSyH7U3yKQ3tkDngnZr5rDtoqTg==
X-Gm-Message-State: AOJu0YxE7ed9ZqVDybKd9OEj93GHYGHMyNitAwr1ww/qcpg56TPNm45Y
	AQWKHxLJOy8fwuB0AiCeGrdYFEQivhotxzOgJD6ihtKiO283pmQDw4XLvQ07xd8=
X-Google-Smtp-Source: AGHT+IEb9uHzTYNh6kQ0uZHCI0k1QlwHmc0IaGoKGOXcT/uSlXvTVZyP49tsb/Hi9juDacNHze2C5g==
X-Received: by 2002:a17:906:3d3:b0:a3d:482f:3fc4 with SMTP id c19-20020a17090603d300b00a3d482f3fc4mr11303302eja.70.1709825949141;
        Thu, 07 Mar 2024 07:39:09 -0800 (PST)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id k14-20020a170906128e00b00a44b91ae6d4sm6687757ejb.33.2024.03.07.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:39:08 -0800 (PST)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v6 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Thu,  7 Mar 2024 16:38:31 +0100
Message-ID: <20240307153842.80033-5-david@sigma-star.at>
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

