Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43830F232
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:31:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWbwQ1QPxzDwkD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yoOOHsJm; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbSM5bXSzDqyn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:10:27 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id j11so2752487wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZFcUa8z9ij8GsVZGG8CeCF7Ivx0FCQR9n9Ud5IB6q0=;
 b=yoOOHsJmUFa9/ZMIOvUiWAVGaV0lecpKRROSNn73bOTaoWxilhWpNvougW3IaJU11M
 BVkhVn/LG7rzlvj+VFlMOu2jZ16XdmDP7j7nFPRSoQfbQGizNQ0MysoTX/Ih0sURIkkJ
 jj2NKa4nkkgpng7ay0Yb/XckBZF6BoHaNRvJxyE0CFDhvk/OQMGNw6P52ILsu/BLONMX
 sGU9ch76oz25jqxjuLtMuFlH5wg1GQjs8Su8XyxDU7H84HQ6aUmAroBCLgq4h+/I22QB
 U8SZRrv4BsmpmnvZt6lJ9Y4abHaGLyIEQ9BJGCbmgZEEN4Cbv/Cjar+aCibvBqgV7jDz
 IW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZFcUa8z9ij8GsVZGG8CeCF7Ivx0FCQR9n9Ud5IB6q0=;
 b=sxXFNhQVx/luTBd+IrjbmEtrCDFxfCqvglJHsZLvHJlyL2AggPIggd8Yex34JchYcw
 mBjizCps+JqGbdZATJKDba50dWJl9KudYYCrjcZuYYI6UIx98NzihhfuOP/9Otyeuxs+
 QKoPIBWwYLkWNrKwY6zIk8G7meZ8rkMsE3rWMcREXuRft2cJqcXiGsVNRY5k/tI6poBC
 ccPxlB+ybAnjNN3Xk5BQNz+hqMSH+lETzbGepMgTkq+96hOWdR3P6kgQ9uCAARV6qMLF
 zUVkNC9pwjfnRifb13xKNQGT18dYq3UpOEuz/QD/mHN7ZK+09hGOAOJ3FuHGE59PeH+o
 QK0Q==
X-Gm-Message-State: AOAM530hkhwMjyx4CRy0iruv9vw78bsY1ZYBi2DCpkSjpG6tUwnfez+h
 zHNOsCtsEefC/EXtVRlsKqzGDw==
X-Google-Smtp-Source: ABdhPJyH2Oy1OTUDZXbRtCQuenPHqsyeaSnIpQ8LSjm16+yMUa9mogmKK1zeOQjPoP79U3cAkVO7Jg==
X-Received: by 2002:a1c:1f4d:: with SMTP id f74mr7213122wmf.12.1612437022191; 
 Thu, 04 Feb 2021 03:10:22 -0800 (PST)
Received: from dell.default ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id y18sm7696218wrt.19.2021.02.04.03.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:10:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/20] crypto: vmx: Source headers are not good kernel-doc
 candidates
Date: Thu,  4 Feb 2021 11:09:56 +0000
Message-Id: <20210204111000.2800436-17-lee.jones@linaro.org>
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
2.25.1

