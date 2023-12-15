Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4D814670
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 12:11:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=vm0N8Fx2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss63F3zRCz3dSx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 22:11:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=vm0N8Fx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss5yv1mLgz3cXF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 22:07:19 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c6d5d8085so2037765e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 03:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1702638435; x=1703243235; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb5h6XsitjjkMwY2slc9nT1B2Witc+lbx2i0qDP2o4I=;
        b=vm0N8Fx2DqP2eUHDvOfPz2JT7rpgbefqNEE5priemKGeip2lwfxSR3BI3i3j6S69L8
         PvgjqfjmzNFKZxlkNqMOYzoeReQ2SFBRmC5/Xtp+cvvVyD4rmIuweBf9BzmN+/5MAJ0A
         5uQoa64HziVb3GuUuilfrF9GtNmEk/f5tGBFMgfsXaro5BEaUP3yPs5ixn4L/p83l3O3
         b3ImNsi/DUGY0nzJPMdSqvDwyXnl1ow6Wt7ye27iFqa0Oz+YfDFawm1XDZLUPTCsHRbb
         OXCTFUCiSmHy1EmvFozIV60BADRr0zLiV554RDb4W+nqKn10e3sgr0hXpeZ1UKLhZ3yn
         pLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702638435; x=1703243235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb5h6XsitjjkMwY2slc9nT1B2Witc+lbx2i0qDP2o4I=;
        b=cHQAxxqL5TOwGCJSJbMHtv/3DVgEzaRmofzKi70/ceZjrh2to9e3Y4TLIl3NKUhMMf
         hSt4pyUGSY4XBO3DSLPqWu2XrNySZh6Lnkzj3UjC7Ksf7dLC27jZwIJrCMCrmjYpeH4C
         Ul/g9Z7Ag2O7mukD/CinpGZlsYUXpuf9S1Qqd3Wqb16l6PixTSPq24io4JzuMMDJ32FF
         2opvS03iso/GAKBVJFHXoF9KmvbptnTImBGnKf6qNjmltiSZZ3qJYwu70JxRxCtukJl2
         ugI63aUoM0n1ShPpH0Mw4k+selaJ5P1AhgYvReEqz7D9GtMJjlYC4b+cA/QQ8DbmPAtF
         eQ6g==
X-Gm-Message-State: AOJu0YwqcJQFkcLTiWvLL8AbXsc63L/3f28m6VoYcWybhvvZfKZQtEql
	6jQBoQp5Ola7Qi/15GApiAgL8Q==
X-Google-Smtp-Source: AGHT+IEdsbr9/i/knjcb9QmHXiVXg2YmHbzXGLWJsfMPmpozde86nTn0U65DAhMf0jc7ImNg0UJToA==
X-Received: by 2002:a05:600c:5022:b0:40c:3f87:32f8 with SMTP id n34-20020a05600c502200b0040c3f8732f8mr3614945wmr.277.1702638435470;
        Fri, 15 Dec 2023 03:07:15 -0800 (PST)
Received: from localhost (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with UTF8SMTPSA id fc7-20020a05600c524700b0040c44cb251dsm21151352wmb.46.2023.12.15.03.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 03:07:15 -0800 (PST)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v5 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Fri, 15 Dec 2023 12:06:31 +0100
Message-ID: <20231215110639.45522-5-david@sigma-star.at>
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

This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
found in smaller i.MX SoCs.

Signed-off-by: David Gstir <david@sigma-star.at>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..988d01226131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11647,6 +11647,15 @@ S:	Maintained
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

