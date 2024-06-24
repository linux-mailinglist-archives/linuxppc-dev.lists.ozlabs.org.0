Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5EA915369
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Csm0cFSz3dS9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:22:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.49; helo=mail-ej1-f49.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7CsL43Bhz30VS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:21:58 +1000 (AEST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a725d756d41so123328066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 09:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246115; x=1719850915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShLo8usNRCEFu5wG7vvAmQF6Nr70DMxisgaHAPu+cb8=;
        b=v10zj5XWOaIG4qVat2JEFKTjzR6FiLvaJEwvBr2DwvL+HRH8M+3q6eF3F6gjz7ukE3
         6ncgHXV/UR+HLK/9ibDw7sRfJAvn1AdoIM5ENJ3Kkf+Lq3gHCOZEqqv1bStTFcNuKpr9
         P/I2ghy4IxMo5GXFpF7Di+rX9u6hvssiLoH7gbkwBef0H6fXF3I0jjI2nRkX3ub+6Pqy
         yR0aD5G0SiVxfL74ihWfyL5wq+wChGTGjpJ2cQeyKlf0CMiEqwlAuCfYIxfmR0PQoPK2
         HDcCxu621eRxEODLgug2sFt4mN1K8hMJx1SMGmhZk7IHepYH+TrGXIaNd4nRkB/IonE6
         v5yg==
X-Gm-Message-State: AOJu0YyEcHqaaVr4Qfd2mctn+Lpu/2DpgRMNC1wCSHG8IPgK7AcD8F3y
	DIW3wNkrWuFBrfgFkjo8D13NwtvpMHCMZZIg+mvgxj1a4wc109ifoaYgOU1P
X-Google-Smtp-Source: AGHT+IHtN7PVpKI1Bv6EZwPIbNhldtK+jt6XAQQqnMxsDG/fcv/XeasNmP2zn3fSmCQDg4rud7njSg==
X-Received: by 2002:a17:906:c0c9:b0:a6f:dcb6:223d with SMTP id a640c23a62f3a-a6ffe27056amr503424866b.8.1719246115138;
        Mon, 24 Jun 2024 09:21:55 -0700 (PDT)
Received: from localhost (fwdproxy-lla-113.fbsv.net. [2a03:2880:30ff:71::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30535005sm4848954a12.69.2024.06.24.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:21:54 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH 2/4] crypto: caam: Depend on COMPILE_TEST also
Date: Mon, 24 Jun 2024 09:21:20 -0700
Message-ID: <20240624162128.1665620-2-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624162128.1665620-1-leitao@debian.org>
References: <20240624162128.1665620-1-leitao@debian.org>
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
Cc: kuba@kernel.org, Roy.Pledge@nxp.com, "open list:FREESCALE CAAM Cryptographic Acceleration and...,
	linux-kernel@vger.kernel.org open list" <linux-crypto@vger.kernel.org>, horms@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As most of the drivers that depend on ARCH_LAYERSCAPE, make
CRYPTO_DEV_FSL_CAAM depend on COMPILE_TEST for compilation and testing.

    # grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
    29

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/crypto/caam/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/caam/Kconfig b/drivers/crypto/caam/Kconfig
index c631f99e415f..05210a0edb8a 100644
--- a/drivers/crypto/caam/Kconfig
+++ b/drivers/crypto/caam/Kconfig
@@ -10,7 +10,7 @@ config CRYPTO_DEV_FSL_CAAM_AHASH_API_DESC
 
 config CRYPTO_DEV_FSL_CAAM
 	tristate "Freescale CAAM-Multicore platform driver backend"
-	depends on FSL_SOC || ARCH_MXC || ARCH_LAYERSCAPE
+	depends on FSL_SOC || ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
 	select SOC_BUS
 	select CRYPTO_DEV_FSL_CAAM_COMMON
 	imply FSL_MC_BUS
-- 
2.43.0

