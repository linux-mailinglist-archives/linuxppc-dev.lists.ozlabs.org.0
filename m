Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84838A146
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 11:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm4DF0kmmz3c01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 19:28:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fyvFyYwT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fyvFyYwT; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm4CK6VpRz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 19:27:41 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id n2so16977697wrm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rS7P8Ei6Lo3i+RlQq5zKImv/cfX/br3YBCEeZlUR+Wo=;
 b=fyvFyYwTHmysyDvUCxIUqz4GHhibyDSHfz1LJ24o5pcPss1gmV+GmcTdA5C0BZmnpL
 84K5AkNzJxeWBcNhA0BdAQ2aWQyMOvyATMjlqxbOYFrk2U60M/QKYKruXetGnSetmeqS
 I7vCvJk//2EyTCHUsbSTwa5pOdo2r36ZtpEf3PLHCJ715UCvCEebEyTGAyrS5h1S60c5
 jzZT/wq1PNaaUZU57Ej2EQJIoqvk5N0zdxPirMmP52uCWsi5tZQVG6V7rX+UPSUOZc7L
 3VMa81rJpjZE43EN/OUnJGzrn2EwfMw4tDEmXSAW27hnLioaQaGRK+da4dwWVTRlt7JE
 lY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rS7P8Ei6Lo3i+RlQq5zKImv/cfX/br3YBCEeZlUR+Wo=;
 b=ILOptdgcfWTx08kAdvvYinfeOpjh2X6NfJ380zqCeDE8jUtwbFtUqqv/bhOpLBRN/i
 ycRWNWZ30xpmfEvmhymI4eMwZrCLWPsejc9wsxNtyXFnI6MmXC6zVhudwbjnVGdq/D1A
 1IwEqUF3uXHBuNWsd4fxnYcSBGRJ49Chs0ypFjdCFbX+myIQyNiAOCXfnZ7qPDIuLDcn
 JnhiSRIIoC56o/dGOa8IyeonBcHoRH2V3/hHS7UiXWUmWg70Ghs8qkc/9+XdZjEM1r4k
 0uRd0ScIn+GxbRDFN3Ob/cPaowcj/fTuHEuTEYxNwp+PpwAYMzLNwkW6mQVS47W/1bRQ
 BEIw==
X-Gm-Message-State: AOAM530x5pboTjXpofqovAciWA/iP4reT3neymmBywW4Lort5xCxb4IA
 EcupK1+n/AtcEJj1a632+tRaxw==
X-Google-Smtp-Source: ABdhPJwhzqzv8ZBlSOOdzJVfnyeZCdwIgAf8NIgxGoUr4jQPPkKtw2EeCYoF6aW4L0gQERY0JDP8Tw==
X-Received: by 2002:a5d:5249:: with SMTP id k9mr3291616wrc.301.1621502858330; 
 Thu, 20 May 2021 02:27:38 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id u11sm722971wrw.14.2021.05.20.02.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 02:27:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 2/3] crypto: nx: nx-aes-gcm: Kernel-doc formatting should not
 be used for headers
Date: Thu, 20 May 2021 10:27:32 +0100
Message-Id: <20210520092733.3434378-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520092733.3434378-1-lee.jones@linaro.org>
References: <20210520092733.3434378-1-lee.jones@linaro.org>
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
Cc: Seth Jennings <sjenning@linux.vnet.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Robert Jennings <rcj@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/crypto/nx/nx-aes-gcm.c:26: warning: Function parameter or member 'tfm' not described in 'gcm_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-gcm.c:26: warning: Function parameter or member 'in_key' not described in 'gcm_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-gcm.c:26: warning: Function parameter or member 'key_len' not described in 'gcm_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-gcm.c:26: warning: expecting prototype for Nest Accelerators driver(). Prototype was for gcm_aes_nx_set_key() instead
 drivers/crypto/nx/nx-aes-ecb.c:24: warning: Function parameter or member 'tfm' not described in 'ecb_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ecb.c:24: warning: Function parameter or member 'in_key' not described in 'ecb_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ecb.c:24: warning: Function parameter or member 'key_len' not described in 'ecb_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ecb.c:24: warning: expecting prototype for Nest Accelerators driver(). Prototype was for ecb_aes_nx_set_key() instead
 drivers/crypto/nx/nx-aes-ccm.c:26: warning: Function parameter or member 'tfm' not described in 'ccm_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ccm.c:26: warning: Function parameter or member 'in_key' not described in 'ccm_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ccm.c:26: warning: Function parameter or member 'key_len' not described in 'ccm_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ccm.c:26: warning: expecting prototype for Nest Accelerators driver(). Prototype was for ccm_aes_nx_set_key() instead
 drivers/crypto/nx/nx-aes-ctr.c:25: warning: Function parameter or member 'tfm' not described in 'ctr_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ctr.c:25: warning: Function parameter or member 'in_key' not described in 'ctr_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ctr.c:25: warning: Function parameter or member 'key_len' not described in 'ctr_aes_nx_set_key'
 drivers/crypto/nx/nx-aes-ctr.c:25: warning: expecting prototype for Nest Accelerators driver(). Prototype was for ctr_aes_nx_set_key() instead
 drivers/crypto/nx/nx-aes-xcbc.c:22: warning: cannot understand function prototype: 'struct xcbc_state '
 drivers/crypto/nx/nx-sha256.c:21: warning: Function parameter or member 'tfm' not described in 'nx_crypto_ctx_sha256_init'
 drivers/crypto/nx/nx-sha256.c:21: warning: expecting prototype for SHA(). Prototype was for nx_crypto_ctx_sha256_init() instead
 drivers/crypto/nx/nx-sha512.c:20: warning: Function parameter or member 'tfm' not described in 'nx_crypto_ctx_sha512_init'
 drivers/crypto/nx/nx-sha512.c:20: warning: expecting prototype for SHA(). Prototype was for nx_crypto_ctx_sha512_init() instead
 drivers/crypto/nx/nx-842-pseries.c:280: warning: Function parameter or member 'wmem' not described in 'nx842_pseries_compress'
 drivers/crypto/nx/nx-842-pseries.c:280: warning: Excess function parameter 'wrkmem' description in 'nx842_pseries_compress'
 drivers/crypto/nx/nx-842-pseries.c:410: warning: Function parameter or member 'wmem' not described in 'nx842_pseries_decompress'
 drivers/crypto/nx/nx-842-pseries.c:410: warning: Excess function parameter 'wrkmem' description in 'nx842_pseries_decompress'
 drivers/crypto/nx/nx-842-pseries.c:523: warning: Function parameter or member 'devdata' not described in 'nx842_OF_set_defaults'
 drivers/crypto/nx/nx-842-pseries.c:548: warning: Function parameter or member 'prop' not described in 'nx842_OF_upd_status'
 drivers/crypto/nx/nx-842-pseries.c:582: warning: Function parameter or member 'devdata' not described in 'nx842_OF_upd_maxsglen'
 drivers/crypto/nx/nx-842-pseries.c:582: warning: Function parameter or member 'prop' not described in 'nx842_OF_upd_maxsglen'
 drivers/crypto/nx/nx-842-pseries.c:630: warning: Function parameter or member 'devdata' not described in 'nx842_OF_upd_maxsyncop'
 drivers/crypto/nx/nx-842-pseries.c:630: warning: Function parameter or member 'prop' not described in 'nx842_OF_upd_maxsyncop'
 drivers/crypto/nx/nx-842-pseries.c:692: warning: Cannot understand  *
 drivers/crypto/nx/nx-842-pseries.c:825: warning: Function parameter or member 'data' not described in 'nx842_OF_notifier'
 drivers/crypto/nx/nx-842-pseries.c:825: warning: Excess function parameter 'update' description in 'nx842_OF_notifier'

Cc: Haren Myneni <haren@us.ibm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Robert Jennings <rcj@linux.vnet.ibm.com>
Cc: Seth Jennings <sjenning@linux.vnet.ibm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/crypto/nx/nx-842-pseries.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/nx/nx-842-pseries.c b/drivers/crypto/nx/nx-842-pseries.c
index 8ee547ee378ec..67caff73f058f 100644
--- a/drivers/crypto/nx/nx-842-pseries.c
+++ b/drivers/crypto/nx/nx-842-pseries.c
@@ -264,8 +264,8 @@ static int nx842_validate_result(struct device *dev,
  * @inlen: Length of input buffer
  * @out: Pointer to output buffer
  * @outlen: Length of output buffer
- * @wrkmem: ptr to buffer for working memory, size determined by
- *          nx842_pseries_driver.workmem_size
+ * @wmem: ptr to buffer for working memory, size determined by
+ *        nx842_pseries_driver.workmem_size
  *
  * Returns:
  *   0		Success, output of length @outlen stored in the buffer at @out
@@ -393,8 +393,8 @@ static int nx842_pseries_compress(const unsigned char *in, unsigned int inlen,
  * @inlen: Length of input buffer
  * @out: Pointer to output buffer
  * @outlen: Length of output buffer
- * @wrkmem: ptr to buffer for working memory, size determined by
- *          nx842_pseries_driver.workmem_size
+ * @wmem: ptr to buffer for working memory, size determined by
+ *        nx842_pseries_driver.workmem_size
  *
  * Returns:
  *   0		Success, output of length @outlen stored in the buffer at @out
@@ -513,7 +513,7 @@ static int nx842_pseries_decompress(const unsigned char *in, unsigned int inlen,
 /**
  * nx842_OF_set_defaults -- Set default (disabled) values for devdata
  *
- * @devdata - struct nx842_devdata to update
+ * @devdata: struct nx842_devdata to update
  *
  * Returns:
  *  0 on success
@@ -538,7 +538,7 @@ static int nx842_OF_set_defaults(struct nx842_devdata *devdata)
  * The status field indicates if the device is enabled when the status
  * is 'okay'.  Otherwise the device driver will be disabled.
  *
- * @prop - struct property point containing the maxsyncop for the update
+ * @prop: struct property point containing the maxsyncop for the update
  *
  * Returns:
  *  0 - Device is available
@@ -571,8 +571,8 @@ static int nx842_OF_upd_status(struct property *prop)
  *  In this example, the maximum byte length of a scatter list is
  *  0x0ff0 (4,080).
  *
- * @devdata - struct nx842_devdata to update
- * @prop - struct property point containing the maxsyncop for the update
+ * @devdata: struct nx842_devdata to update
+ * @prop: struct property point containing the maxsyncop for the update
  *
  * Returns:
  *  0 on success
@@ -619,8 +619,8 @@ static int nx842_OF_upd_maxsglen(struct nx842_devdata *devdata,
  *  0x1000 (4,096) data byte length and 0x1f3 (510) total scatter list
  *  elements.
  *
- * @devdata - struct nx842_devdata to update
- * @prop - struct property point containing the maxsyncop for the update
+ * @devdata: struct nx842_devdata to update
+ * @prop: struct property point containing the maxsyncop for the update
  *
  * Returns:
  *  0 on success
@@ -689,7 +689,6 @@ static int nx842_OF_upd_maxsyncop(struct nx842_devdata *devdata,
 }
 
 /**
- *
  * nx842_OF_upd -- Handle OF properties updates for the device.
  *
  * Set all properties from the OF tree.  Optionally, a new property
@@ -812,8 +811,7 @@ static int nx842_OF_upd(struct property *new_prop)
  *
  * @np: notifier block
  * @action: notifier action
- * @update: struct pSeries_reconfig_prop_update pointer if action is
- *	PSERIES_UPDATE_PROPERTY
+ * @data: struct of_reconfig_data pointer
  *
  * Returns:
  *	NOTIFY_OK on success
-- 
2.31.1

