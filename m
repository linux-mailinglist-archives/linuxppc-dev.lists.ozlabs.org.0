Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6130F1E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:19:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWbfM076mzDwrm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:19:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XJX470yf; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbS55S58zDqyn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:10:10 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id 7so3061981wrz.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nlC+PhXfp+ifxVEhlW1JzBacSpYjJjXYHNmas4fv5Ds=;
 b=XJX470yfUpu4a/FA4lANKEzvueSTWsxfPj0W1Cfn9V3WbozDGwDKWnVRa6TIhBnVAs
 4LWFWuDhCanTjkjwrXkSW/2MYEzugl2aG9eyn1ApqjsEqgQsbgWpc2FusWzJoQV7lhdf
 zgWQJ21RrKQeKmi3XBHakKY9HNdswliGWOQZVaJKokVyRDEMZeAeKrhHLFc4VBaKOocu
 KQBrM54/2pMfprhRBw+7NqdnywjG7g/tY/8wvVBep3sQ58iJi853mTn7jBjGBv2pIKMO
 vgMX/GgphIpsy5g34uM4sT9YaB6sYhYzMtUDw6aM/0hUZx9YsmwRBmWHxDpVMNd0LARO
 Qncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nlC+PhXfp+ifxVEhlW1JzBacSpYjJjXYHNmas4fv5Ds=;
 b=RQXiFXP2O4mvhCU6Q0QV2pyOA+86ox5EdmJX8igpST/oP4AWLw+BOwlWAcKqA+79Ch
 yDOhuKbUebXZOlCFiVGNSyDc1/j2tM0PQAewy/0cUYVvOLxsB4ymcBBrwAFMu25wUKj5
 I4rMy3GWySK3w2cNWlp9eiSmnhYJutHLixC3am/raVyVW+lUAHbvCbsWmlhQ9emopzIW
 hBKlAA+bUT4+Z1BSCNb2n5+zMTQIYwBjzf0J+JyNeJ2uXKY1RPLLk/UUWkccdKuZew3J
 UBzb9xeBL6/GoYurpFdfMOJJPJCJvbXoHdXzaqaFcjen4Lj/cQJJEKeWTcv+32BGT52X
 pQUQ==
X-Gm-Message-State: AOAM531LM74KGtxlnlFhHMIY2Y7LWao+5vdjPEZ2Sh7TgT5PWjBguwer
 b69RvowxjjIUnc4R+HYCTG6pcw==
X-Google-Smtp-Source: ABdhPJyLKDXyanH7L5GdxNPOqprdRtf1XwWUk17K9MS9MutmvHQHiDcu2KbNGqAlqOoC8tLO+lBQhg==
X-Received: by 2002:a05:6000:1105:: with SMTP id
 z5mr8634911wrw.15.1612437003994; 
 Thu, 04 Feb 2021 03:10:03 -0800 (PST)
Received: from dell.default ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id y18sm7696218wrt.19.2021.02.04.03.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:10:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/20] Rid W=1 warnings in Crypto
Date: Thu,  4 Feb 2021 11:09:40 +0000
Message-Id: <20210204111000.2800436-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
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
 Aymen Sghaier <aymen.sghaier@nxp.com>, Takashi Iwai <tiwai@suse.de>,
 Kent Yoder <yoder1@us.ibm.com>, Ayush Sawal <ayush.sawal@chelsio.com>,
 Joakim Bech <joakim.xx.bech@stericsson.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
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
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is set 1 of 2 sets required to fully clean Crypto.

Lee Jones (20):
  crypto: hisilicon: sec_drv: Supply missing description for
    'sec_queue_empty()'s 'queue' param
  crypto: bcm: util: Repair a couple of documentation formatting issues
  crypto: chelsio: chcr_core: File headers are not good candidates for
    kernel-doc
  crypto: ux500: hash: hash_core: Fix worthy kernel-doc headers and
    remove others
  crypto: bcm: spu: Fix formatting and misspelling issues
  crypto: keembay: ocs-hcu: Fix incorrectly named functions/structs
  crypto: bcm: spu2: Fix a whole host of kernel-doc misdemeanours
  crypto: ux500: cryp: Demote some conformant non-kernel headers fix
    another
  crypto: ux500: cryp_irq: File headers are not good kernel-doc
    candidates
  crypto: chelsio: chcr_algo: Fix a couple of kernel-doc issues caused
    by doc-rot
  crypto: ux500: cryp_core: Fix formatting issue and add description for
    'session_id'
  crypto: atmel-ecc: Struct headers need to start with keyword 'struct'
  crypto: bcm: cipher: Provide description for 'req' and fix formatting
    issues
  crypto: caam: caampkc: Provide the name of the function
  crypto: caam: caamalg_qi2: Supply a couple of 'fallback' related
    descriptions
  crypto: vmx: Source headers are not good kernel-doc candidates
  crypto: nx: nx-aes-cbc: Headers comments should not be kernel-doc
  crypto: nx: nx_debugfs: Header comments should not be kernel-doc
  crypto: nx: Demote header comment and add description for 'nbytes'
  crypto: cavium: nitrox_isr: Demote non-compliant kernel-doc headers

 drivers/crypto/atmel-ecc.c                |  2 +-
 drivers/crypto/bcm/cipher.c               |  7 ++--
 drivers/crypto/bcm/spu.c                  | 16 ++++-----
 drivers/crypto/bcm/spu2.c                 | 43 +++++++++++++----------
 drivers/crypto/bcm/util.c                 |  4 +--
 drivers/crypto/caam/caamalg_qi2.c         |  2 ++
 drivers/crypto/caam/caampkc.c             |  3 +-
 drivers/crypto/cavium/nitrox/nitrox_isr.c |  4 +--
 drivers/crypto/chelsio/chcr_algo.c        |  8 ++---
 drivers/crypto/chelsio/chcr_core.c        |  2 +-
 drivers/crypto/hisilicon/sec/sec_drv.c    |  1 +
 drivers/crypto/keembay/ocs-hcu.c          |  6 ++--
 drivers/crypto/nx/nx-aes-cbc.c            |  2 +-
 drivers/crypto/nx/nx.c                    |  5 +--
 drivers/crypto/nx/nx_debugfs.c            |  2 +-
 drivers/crypto/ux500/cryp/cryp.c          |  5 +--
 drivers/crypto/ux500/cryp/cryp_core.c     |  5 +--
 drivers/crypto/ux500/cryp/cryp_irq.c      |  2 +-
 drivers/crypto/ux500/hash/hash_core.c     | 15 +++-----
 drivers/crypto/vmx/vmx.c                  |  2 +-
 20 files changed, 71 insertions(+), 65 deletions(-)

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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Cc: Zaibo Xu <xuzaibo@huawei.com>
-- 
2.25.1

