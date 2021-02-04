Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0130F211
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:27:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWbqy6wv0zDws7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:27:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Fwbq732n; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbSN5pGGzDwhF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:10:28 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id u14so3031624wri.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WH1ZkfxgQ3lo4eJG51Uh12VlkOp1jMaFfnNoEjI139M=;
 b=Fwbq732n3XUVYiF70e2xZk4Vv0WePzbXGtV9K9CQP0xq5MmYe2c1lY5kO8By5tRjBe
 h/KA0K8rJ45UbLKMQLzOekJPUNVk5R0Om5p11Ff0vp99wZakGBPCBj8dWsHSAvV/t1Jy
 Em53nt90VnSrtADHul75DC0T1PvBiYW6mxchyjXt+UDaBOqcW3io+1cHBqMULe5ZSN9k
 9VaxajxrSgxEtiTW6jkWSFCATt4sKdT1RhryJqH+6qBX9rzO/9FE9T8WR7IlAugxKF4f
 AKRQOxG56UXsyGqq9pkdFUnBuY5dZU6VpUrZCTdsDpJvbLR08WYPESgjONFzBpadKw1x
 3MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WH1ZkfxgQ3lo4eJG51Uh12VlkOp1jMaFfnNoEjI139M=;
 b=bvX9GQD79Fdp1Gr5ibYcnYHbo3uxOOE7BjaqqF7jefksgzMspBAAPMKidZ1qp0zfwp
 CadEn24sC6K/nnwIsHhMXIfs628+OYEZA8sdGErVQPqLoFICCMiFlrf/vJCUVaClSUYj
 3jL9S+QJLTNr2ZY/qDfNH5MkGKegJnnP2e3eC0sY0uWf5z5einL6ouwolP+hiNywZd52
 uRL/tAl0Rk2ScVLsU0itE1B44+uXqzJ1gYGViHh59NUk3KasPQt65eISl2jck92Dh0I8
 MsBH961yNKlnA0T8Nl3m3UWmFgafidcfRA4ELoXg8mvKnY+H6EZqO3ITwfL2IfAqaMRe
 0N5g==
X-Gm-Message-State: AOAM533V5L0Qa+f7VOj+W6Jv5MeDppELZqUIkis2CgEzvzRZpaqgy4h0
 BYqCxkdA+2q+6LSaxJPUhw8wvQ==
X-Google-Smtp-Source: ABdhPJzjUp9+e7p/dg0UnaZ0rUY3UY0nKqEvrLN6uQoqxKKkifC3adrh0/+QNGokJy751vuZFU+CFw==
X-Received: by 2002:a5d:420d:: with SMTP id n13mr8658453wrq.320.1612437023472; 
 Thu, 04 Feb 2021 03:10:23 -0800 (PST)
Received: from dell.default ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id y18sm7696218wrt.19.2021.02.04.03.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:10:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/20] crypto: nx: nx-aes-cbc: Headers comments should not be
 kernel-doc
Date: Thu,  4 Feb 2021 11:09:57 +0000
Message-Id: <20210204111000.2800436-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204111000.2800436-1-lee.jones@linaro.org>
References: <20210204111000.2800436-1-lee.jones@linaro.org>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Kent Yoder <yoder1@us.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/crypto/nx/nx-aes-cbc.c:24: warning: Function parameter or member 'tfm' not described in 'cbc_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-cbc.c:24: warning: Function parameter or member 'in_key' not described in 'cbc_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-cbc.c:24: warning: Function parameter or member 'key_len' not described in 'cbc_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-cbc.c:24: warning: expecting prototype for Nest Accelerators driver(). Prototype was for cbc_aes_nx_set_key() instead

Cc: "Breno Leitão" <leitao@debian.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Kent Yoder <yoder1@us.ibm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/crypto/nx/nx-aes-cbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx-aes-cbc.c b/drivers/crypto/nx/nx-aes-cbc.c
index 92e921eceed75..d6314ea9ae896 100644
--- a/drivers/crypto/nx/nx-aes-cbc.c
+++ b/drivers/crypto/nx/nx-aes-cbc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CBC routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
-- 
2.25.1

