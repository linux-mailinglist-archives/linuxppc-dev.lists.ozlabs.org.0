Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8083896656
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:26:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=shNXlhfN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8brr3RVjz3vmY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 18:26:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=shNXlhfN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8bm11SD7z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 18:21:53 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-415446af364so3311235e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 00:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1712128910; x=1712733710; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXAm+jrLSudJosqOThMSAUphAoCkUssK7J5hWO/tUg8=;
        b=shNXlhfNX55NxkHuMRxL1H6WAWBYew5mIbB1KFx7q6NvnAF4ifValRErQmRp/CJA08
         69rN8xDhYIYaEgBDUC//pQeoUopvJiq+5878FSTHHCGoOgPehMAB8qFgInH7EcQIGWbt
         1nzTcQOUwznJ1UL9ZjpttwlafJFKqMx44hDzKVh7fMmZbQymCzO4bi/662TTNF/nl9Go
         VIKeOXxWciPlTjEg+VPEIA5KmbZ1BSRmzfdpWc7aWfqX2u51jZpeZaaSzKFt0YhTYSaL
         eHp9a9odUW2A6Sc9QX6ByX7yuMMp0OjT+wnZ0HTFo6hLGsvuSqnA1vk0pGfM5pgYNyCR
         o0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128910; x=1712733710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXAm+jrLSudJosqOThMSAUphAoCkUssK7J5hWO/tUg8=;
        b=fJ+70lLLXW9+HscmXEaso/3sKuI31BH6NGVv8pEq2iTl5ezSac9mGBH4ufdSXV3FOj
         hGArSp2RreWP0ORFw4Z+9kNuo+PNWiAULbsjo3FcKK9IP3DdtErOi69TBUEZofXAy1LC
         NXQqS8iGEegnSE37S+PFcT3gzxNSVNEz7a/1zbfgZnVfZjREQK9ksJxz9q0GHAmNcpDc
         Y98DfR2evTPxdawSLO3yE/vMKt0Y7W+GicCONWiChFL6QbwwUtoFYkkh4Fdy8HZwdNRP
         PwULqdgkaE4M3NcGxaPOMwuXTnzqEs0DNB1DTq4SsuM9/7vPp4u4GRfjZipY6UbfRpRY
         2xEg==
X-Forwarded-Encrypted: i=1; AJvYcCVWCdE5TXfKG6NrDTpW/OhFfGjFvYVVMpA7xSp6u/FZAtOB0Qey8r0Ylj+e8wH59kN3BncY1JghNIYOHjDny/yufNHNxKYn20eutqBcLQ==
X-Gm-Message-State: AOJu0YxhEJYERGyJuBEMtlnIiEYgfLmgN2NTLrYtWMgU45NWKKR1HQiR
	mCiMdCy98ipsTInHcPm200W0NlR9JigoVAz5u1g09nIqjL22VW13h7OxBZPemDg=
X-Google-Smtp-Source: AGHT+IHMXJyB4E69/ab6cpDC6ve2WzDG37buI/9MLXEGacy21VN01NO4piAk3DTCP7MyWInRIdzfrA==
X-Received: by 2002:a05:600c:1c14:b0:416:24a1:4313 with SMTP id j20-20020a05600c1c1400b0041624a14313mr358429wms.19.1712128910048;
        Wed, 03 Apr 2024 00:21:50 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id m6-20020a05600c4f4600b004147db8a91asm23762409wmq.40.2024.04.03.00.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:21:49 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v8 5/6] docs: document DCP-backed trusted keys kernel params
Date: Wed,  3 Apr 2024 09:21:21 +0200
Message-ID: <20240403072131.54935-6-david@sigma-star.at>
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutroni
 x Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Document the kernel parameters trusted.dcp_use_otp_key
and trusted.dcp_skip_zk_test for DCP-backed trusted keys.

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 24c02c704049..3a59abf06039 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6698,6 +6698,7 @@
 			- "tpm"
 			- "tee"
 			- "caam"
+			- "dcp"
 			If not specified then it defaults to iterating through
 			the trust source list starting with TPM and assigns the
 			first trust source as a backend which is initialized
@@ -6713,6 +6714,18 @@
 			If not specified, "default" is used. In this case,
 			the RNG's choice is left to each individual trust source.
 
+	trusted.dcp_use_otp_key
+			This is intended to be used in combination with
+			trusted.source=dcp and will select the DCP OTP key
+			instead of the DCP UNIQUE key blob encryption.
+
+	trusted.dcp_skip_zk_test
+			This is intended to be used in combination with
+			trusted.source=dcp and will disable the check if the
+			blob key is all zeros. This is helpful for situations where
+			having this key zero'ed is acceptable. E.g. in testing
+			scenarios.
+
 	tsc=		Disable clocksource stability checks for TSC.
 			Format: <string>
 			[x86] reliable: mark tsc clocksource as reliable, this
-- 
2.35.3

