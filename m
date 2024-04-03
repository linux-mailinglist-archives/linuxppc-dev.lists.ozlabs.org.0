Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81886896654
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:25:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=YwiD2Wbu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8bqw1x1Nz3vkK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 18:25:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=YwiD2Wbu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8blz0Tflz3bsd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 18:21:51 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41624c40c4bso688415e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1712128908; x=1712733708; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=YwiD2WbuXUszmUd1ZtktcUHHlkYRH+3VKUDFEAOoT/AkFbSP9V+YouesqVcPNhIMtx
         hpfa1OeKFXzAuy10ycOXwZO82vN/HFHcAXtca9gxFY32vWmbq4HjkSZ3HWrqgmFJhM/u
         4Zjd9Asz8TCuNbmSiuhGpuP8fhAJB7fcOzVT81fss2vQaot90zweOWmllD2i592RzYSh
         Qbk2zsmmP/AKsDus+kd5bysQJI53e5zWCJw8g426vH0VytatoOzYUsA+mNk/ezT73UZT
         4dNRGqQJ8lF8DZybZ7mYwREELjUJHMhat0IAigLR5KbGZ15RyxIwjso1cP0ylYWgMRye
         nVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128908; x=1712733708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=qJS0XffQSnHZ4/LQDS27aCrztUO0bSS8HT4neFY8TQxeSOKbovtK3xbeVe4MnxNPlA
         CigLDBwS1hC9heIvj0GbHRZVPivZf/dBQnpxOwoHfHBlJ5K69V3mJOtmnZoTxQK2+M6w
         NJ1XhN6sfuqx+ogLjp83W/NJknU5P8Zb03hIcwNTW/P0ehRUKJ5DweZ+Ldro6c9doxcZ
         fbaUgrix1uGfX9+j717sBHDwc7NKFsuDCBAJ2EUlw1/OTU1FWar365ngCm58MLlW7Znl
         tPNlx60Rsl94G0F+X2WltWhNq1BgRaymNuBbZx61NTtEON34GdrGp7G19/HyR0cJP/7r
         YixA==
X-Forwarded-Encrypted: i=1; AJvYcCVlBRFyEqaSXstkKwFCDIjKDXyot2csfHM9zsa9P7xIntB3k9epRHVOQtvLM/3vGOSlNUiKYxmimOk2oEPX0yDHUCAG3F1oas7lv+JCQw==
X-Gm-Message-State: AOJu0YyTvAurPYGFM6l0BUlZght+BTqQbuPVkluhIgevMj6lUNJPeYp6
	GI+JfNi/AMPNUy2otrTZAhzPD9bqIZ4xKuwM7QRJKOFxI40n8JKrjScztLlHsGE=
X-Google-Smtp-Source: AGHT+IFwfWGPzmjOkZpQ5g13bjj6w//ru+uAqGOIDa7Sctmy6coY4cw7BXdzp+Ags4F/9A/eZ2BqQQ==
X-Received: by 2002:a05:600c:3c92:b0:416:2181:bcaf with SMTP id bg18-20020a05600c3c9200b004162181bcafmr930669wmb.1.1712128908083;
        Wed, 03 Apr 2024 00:21:48 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id n30-20020a05600c501e00b0041621b3cfa8sm1724904wmr.6.2024.04.03.00.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:21:47 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v8 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Wed,  3 Apr 2024 09:21:20 +0200
Message-ID: <20240403072131.54935-5-david@sigma-star.at>
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

