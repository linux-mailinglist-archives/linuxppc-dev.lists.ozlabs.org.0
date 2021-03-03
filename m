Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1EE32B8A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 15:35:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrGky2gkMz3dHS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 01:35:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=inVGwKaD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=inVGwKaD; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrGk43XMGz3clT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 01:35:08 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id h98so23906660wrh.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 06:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4foJK0tE+WL3lsMryI6KM5lFp3YWmzugBxJCQxMDWAg=;
 b=inVGwKaDwve1QjGO3jdDapDzAs0FwzTQPLRFIf7SaA3wWNHK40p/mxs0i2GoIsGiHT
 t7lE3EBbvOM85d3bDMDXRkCIQydJou0eH5L+svxCsdQcZepoyhJyYEDqb6xT505CStDm
 4pBfUpT719TsH14oSiB+9sZgSA/A/k+k6gGITlEtZrK7j7RfU2pbR32iG/MwWvLPMcyh
 CROUzpdIQBrzk5qQbrI7lpgOQIYz1wzDxv6YlUptI6pj7WwOksxLDvuezKPgZN/IIaqC
 ozTph8dGppYHqhijDMjqB84LSBXZqxTmFlijBAAGDHdrR6Qx/BvU1mhpSwg8Jk6sxGL/
 Vo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4foJK0tE+WL3lsMryI6KM5lFp3YWmzugBxJCQxMDWAg=;
 b=gKmU3jA31E4XP1hO9uy2BOpwRzMd3U02tX4C06eBOoy4mLfvG5x3bEr5ZPgwhYYjQy
 1XUJyqC4/unOu9DUrEHdcaCNDBZ8O+gYP/m4DF7mbmn1HHthUpMQzIQA/2HYHDlDiNFD
 AiyrPsiWZdEmj3Bu20HhIpRPw6r8rhsiIK8xLJlU4o0xcsGjtXxTqUu7IDdonUwY5CKV
 hGBa6+Ws7Roo7ySINo1ypQYJXMVsDoD+2hXSviNQIPxGnJKCNXJRxcBnYb0LNJlQ6O+u
 ELtgTIliuVcuDDBTF9q5fXPu4buwcc1t4VGOyC1nmArX+Aab1JowC7FqWHwNRzHZKZON
 Fn2Q==
X-Gm-Message-State: AOAM530Xh7dbK6tF7tLyMILsxOgHqO5+2AMUzhEdktrAstURT+KGUMbm
 IODTdVt0nkSnj0ojgiK53v/Jog==
X-Google-Smtp-Source: ABdhPJzdA8pPcfZiXk+evYjz2Y3wLPi3yh1CrDiz/dUpDBPwE6XlZUV0r3+anNFsYboAx/uy9+O1yg==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr18581487wrp.118.1614782105696; 
 Wed, 03 Mar 2021 06:35:05 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id f16sm31475923wrt.21.2021.03.03.06.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 06:35:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/10] crypto: vmx: Source headers are not good kernel-doc
 candidates
Date: Wed,  3 Mar 2021 14:34:47 +0000
Message-Id: <20210303143449.3170813-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303143449.3170813-1-lee.jones@linaro.org>
References: <20210303143449.3170813-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Henrique Cerri <mhcerri@br.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/crypto/vmx/vmx.c:23: warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead

Cc: "Breno Leitão" <leitao@debian.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Henrique Cerri <mhcerri@br.ibm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/crypto/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
index a40d08e75fc0b..7eb713cc87c8c 100644
--- a/drivers/crypto/vmx/vmx.c
+++ b/drivers/crypto/vmx/vmx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
-- 
2.27.0

