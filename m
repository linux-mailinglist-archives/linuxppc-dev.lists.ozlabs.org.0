Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4E43405EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 13:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1RZl35h9z3c5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 23:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xLCEVWKk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xLCEVWKk; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1RYk69Ttz2yQx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 23:44:40 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so3293859wmj.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJQO8bVI3b81mb68PB08R/oOF3ooV8dt2QQLb5Ex6Hw=;
 b=xLCEVWKkh857JtBePvYh95mpILww1ayRgcQloNKeaL50VqqgjDok4abtvvZuFJWyfw
 dnRyPtwBhPgmGzki0AqxfG2sSSG9B9avGDZDMVKPuxnkv8kf9HjCZbBNsuXIG0kW67D0
 7pKKWVpVt5eSAQKVisuUbMIixNVBlo2/fbE+ZvGSs2611TTmd/yYh2113XLB0mJhA7lS
 gBkOdh/lWFeTpkSWDRUeE90GLO2Isqcusm8lVACorWp5T6FCOP2830dL3UT3ljAw9jpz
 wtjWsIW27awROUFuS5LMJ6B8gtXI2OqOaaLIDVDBxp//GWNNPvucgHnco3AaTdyOHKZG
 ufyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJQO8bVI3b81mb68PB08R/oOF3ooV8dt2QQLb5Ex6Hw=;
 b=Cu2NWe0OWpWWVIBtGEJnYjHRE9tcWnbvPSuc4Nho1v9M7mL1fcKTqU5rREFhX7sL26
 6F/38kY/+SRV6SzLjyS0YTqbwUCZC6OAl2yul8iAWDWU4nmut4z/RdpQcnDSAeFcp3ap
 uEBtNDcSyn+eHlsW12jPnQzF29hPJ684LwbPPHu8IonvpcpkahUK7LlGuifvfrEwFd7e
 /FLpWbhPIUT+O3Seu0Oh9tdHsPHRbTz0N4at0R73S97uJ5PQPplx7NEQSUYvm3+mBtPB
 B4Ek4BxTfYN0iVqkWv+ft/biT9b1HedbpaTaAHgnm++mVUdLRpdUCnpimhZg7tn0cn40
 62DQ==
X-Gm-Message-State: AOAM530w9vmQdv7XZwlkrP2exF7MfkGPwk4GD3IOboOhE2fSimmXyIqX
 Y29N9+3uxFGfaLC64SABNnZoZA==
X-Google-Smtp-Source: ABdhPJxnk1k0Mb4aNBzX643EoSOfVjoAuKNDuwWX1gNK4cFB4T9rip/OdnykKJk57tfoH66Iy1z1YQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr3467410wmk.139.1616071470493; 
 Thu, 18 Mar 2021 05:44:30 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id q15sm2813900wrx.56.2021.03.18.05.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 05:44:30 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 00/10] Rid W=1 warnings in Crypto
Date: Thu, 18 Mar 2021 12:44:12 +0000
Message-Id: <20210318124422.3200180-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Aymen Sghaier <aymen.sghaier@nxp.com>, Kent Yoder <yoder1@us.ibm.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Joakim Bech <joakim.xx.bech@stericsson.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Paul Mackerras <paulus@samba.org>,
 Andreas Westin <andreas.westin@stericsson.com>,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Atul Gupta <atul.gupta@chelsio.com>,
 Niklas Hernaeus <niklas.hernaeus@stericsson.com>,
 M R Gowda <yeshaswi@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Nayna Jain <nayna@linux.ibm.com>,
 Manoj Malviya <manojmalviya@chelsio.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jonas Linde <jonas.linde@stericsson.com>, Rob Rice <rob.rice@broadcom.com>,
 Zaibo Xu <xuzaibo@huawei.com>, Harsh Jain <harsh@chelsio.com>,
 Declan Murphy <declan.murphy@intel.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Shujuan Chen <shujuan.chen@stericsson.com>,
 Henrique Cerri <mhcerri@br.ibm.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>, linux-kernel@vger.kernel.org,
 Berne Hebark <berne.herbark@stericsson.com>, linux-crypto@vger.kernel.org,
 Jitendra Lulla <jlulla@chelsio.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is set 1 of 2 sets required to fully clean Crypto.

v2: No functional changes since v1.
v3: Description change and additional struct header fix

Lee Jones (10):
  crypto: hisilicon: sec_drv: Supply missing description for
    'sec_queue_empty()'s 'queue' param
  crypto: bcm: Fix a whole host of kernel-doc misdemeanours
  crypto: chelsio: chcr_core: Fix some kernel-doc issues
  crypto: ux500: hash: hash_core: Fix worthy kernel-doc headers and
    remove others
  crypto: keembay: ocs-hcu: Fix incorrectly named functions/structs
  crypto: atmel-ecc: Struct headers need to start with keyword 'struct'
  crypto: caam: caampkc: Provide the name of the function and provide
    missing descriptions
  crypto: vmx: Source headers are not good kernel-doc candidates
  crypto: nx: nx-aes-cbc: Repair some kernel-doc problems
  crypto: cavium: nitrox_isr: Demote non-compliant kernel-doc headers

 drivers/crypto/atmel-ecc.c                |  2 +-
 drivers/crypto/bcm/cipher.c               |  7 ++--
 drivers/crypto/bcm/spu.c                  | 16 ++++-----
 drivers/crypto/bcm/spu2.c                 | 43 +++++++++++++----------
 drivers/crypto/bcm/util.c                 |  4 +--
 drivers/crypto/caam/caamalg_qi2.c         |  3 ++
 drivers/crypto/caam/caampkc.c             |  3 +-
 drivers/crypto/cavium/nitrox/nitrox_isr.c |  4 +--
 drivers/crypto/chelsio/chcr_algo.c        |  8 ++---
 drivers/crypto/chelsio/chcr_core.c        |  2 +-
 drivers/crypto/hisilicon/sec/sec_drv.c    |  1 +
 drivers/crypto/keembay/ocs-hcu.c          |  8 ++---
 drivers/crypto/nx/nx-aes-cbc.c            |  2 +-
 drivers/crypto/nx/nx.c                    |  5 +--
 drivers/crypto/nx/nx_debugfs.c            |  2 +-
 drivers/crypto/ux500/cryp/cryp.c          |  5 +--
 drivers/crypto/ux500/cryp/cryp_core.c     |  5 +--
 drivers/crypto/ux500/cryp/cryp_irq.c      |  2 +-
 drivers/crypto/ux500/hash/hash_core.c     | 15 +++-----
 drivers/crypto/vmx/vmx.c                  |  2 +-
 20 files changed, 73 insertions(+), 66 deletions(-)

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andreas Westin <andreas.westin@stericsson.com>
Cc: Atul Gupta <atul.gupta@chelsio.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Berne Hebark <berne.herbark@stericsson.com>
Cc: "Breno Leitão" <leitao@debian.org>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Declan Murphy <declan.murphy@intel.com>
Cc: Harsh Jain <harsh@chelsio.com>
Cc: Henrique Cerri <mhcerri@br.ibm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Horia Geantă" <horia.geanta@nxp.com>
Cc: Jitendra Lulla <jlulla@chelsio.com>
Cc: Joakim Bech <joakim.xx.bech@stericsson.com>
Cc: Jonas Linde <jonas.linde@stericsson.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Kent Yoder <yoder1@us.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Manoj Malviya <manojmalviya@chelsio.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: M R Gowda <yeshaswi@chelsio.com>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Niklas Hernaeus <niklas.hernaeus@stericsson.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Rob Rice <rob.rice@broadcom.com>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Cc: Shujuan Chen <shujuan.chen@stericsson.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Cc: Zaibo Xu <xuzaibo@huawei.com>
-- 
2.27.0

