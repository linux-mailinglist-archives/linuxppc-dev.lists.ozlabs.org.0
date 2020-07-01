Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7699210667
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 10:37:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xZMv6MmVzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 18:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LtzDURPA; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xZGC2brSzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 18:32:00 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id f18so22293188wml.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkBklcgolThuSqx2B9FGDRJ2fQUF+10AbLJBzITnPbk=;
 b=LtzDURPA3UqAHJJlQZXZ4Im180vDOVf//S1nJ+4pKvBLZrgZ0BSbM4WzbEGYE1yjtk
 qYlbioS4BBKmdMJ58FMXd2IKFLG1YqsxWeHL9PLbQ9GZTGP4nbfZ+6qAi4b/MR7gmo6E
 Cd7yxYzL0lVRteVBWqtQvoUtB6heNxct3UPO1Fbsa0XweiOxkw1hrlwYht2NwUdjmp8r
 9D3PPv5ogLhvIsv6qiXm8/wubsGmmWf7/ZDjXT+z2A9MlWAwmatijI5jV2VsKH0l+nIp
 Y1+jhuV8JZlxPSSJzbJlUB8rw5rQZGsL2B7PP/j0tJqg4o0JEUSY6XWFioWb3evpAdIe
 V31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkBklcgolThuSqx2B9FGDRJ2fQUF+10AbLJBzITnPbk=;
 b=izN4B5RtLdReWlMGmxT8WHSdrE79qa6sZmZJiPWHSQ1oLLerhxqVgQKFntqoOnM1Zp
 FUoIE2W4jYJdyHLmz9CiWFc/iJB5szM10ELfWKntlTbbSs1X8o+anTwa6gwm7DU8J2XU
 49LJRFcZJPgJSPv1/0yzYhyHQaEvt24GeXHPMb8bkzID43PD9kzuPFyn3JPCrC7mget6
 Ek/Ep7CIM4IX9oZGboQY/JtSWeFI3dzMf4Jpv6zGCoqkdEghWm/m50f7T0v1NAUoTxg4
 JyPDxkEfCkvvs7+FsbhgKLtBW7UwgDh7Nuid5FdY9RODZl1GVHd3nBsmaHt+2QOXC1k+
 r1vw==
X-Gm-Message-State: AOAM530oGpUhLWVwD7o5j9T3vlfS3fErfltmudD3+bKRmhxXLKXFwwrr
 EW1ej4dJNKMlfIJKnjqTnyPqNg==
X-Google-Smtp-Source: ABdhPJyENdo7ISE62kR3pGvu0NxL7io4Snel4VVQn2CmhOlTdSs8TUoC2Dp1mmRo8kUNBTyzgERkaA==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr25108034wmh.176.1593592316584; 
 Wed, 01 Jul 2020 01:31:56 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id 59sm6717816wrj.37.2020.07.01.01.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 01:31:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 28/30] misc: ocxl: config: Provide correct formatting to
 function headers
Date: Wed,  1 Jul 2020 09:31:16 +0100
Message-Id: <20200701083118.45744-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701083118.45744-1-lee.jones@linaro.org>
References: <20200701083118.45744-1-lee.jones@linaro.org>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A nice attempt was made to provide kerneldoc headers for
read_template_version() and read_afu_lpc_memory_info() however,
the provided formatting does not match what is expected by
kerneldoc.

Fixes the following W=1 warnings:

 drivers/misc/ocxl/config.c:286: warning: Function parameter or member 'dev' not described in 'read_template_version'
 drivers/misc/ocxl/config.c:286: warning: Function parameter or member 'fn' not described in 'read_template_version'
 drivers/misc/ocxl/config.c:286: warning: Function parameter or member 'len' not described in 'read_template_version'
 drivers/misc/ocxl/config.c:286: warning: Function parameter or member 'version' not described in 'read_template_version'
 drivers/misc/ocxl/config.c:489: warning: Function parameter or member 'dev' not described in 'read_afu_lpc_memory_info'
 drivers/misc/ocxl/config.c:489: warning: Function parameter or member 'fn' not described in 'read_afu_lpc_memory_info'
 drivers/misc/ocxl/config.c:489: warning: Function parameter or member 'afu' not described in 'read_afu_lpc_memory_info'

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/misc/ocxl/config.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index c8e19bfb5ef90..e3b99a39d207e 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -273,11 +273,11 @@ static int read_afu_info(struct pci_dev *dev, struct ocxl_fn_config *fn,
 }
 
 /**
- * Read the template version from the AFU
- * dev: the device for the AFU
- * fn: the AFU offsets
- * len: outputs the template length
- * version: outputs the major<<8,minor version
+ * read_template_version - Read the template version from the AFU
+ * @dev: the device for the AFU
+ * @fn: the AFU offsets
+ * @len: outputs the template length
+ * @version: outputs the major<<8,minor version
  *
  * Returns 0 on success, negative on failure
  */
@@ -476,10 +476,10 @@ static int validate_afu(struct pci_dev *dev, struct ocxl_afu_config *afu)
 }
 
 /**
- * Populate AFU metadata regarding LPC memory
- * dev: the device for the AFU
- * fn: the AFU offsets
- * afu: the AFU struct to populate the LPC metadata into
+ * read_afu_lpc_memory_info - Populate AFU metadata regarding LPC memory
+ * @dev: the device for the AFU
+ * @fn: the AFU offsets
+ * @afu: the AFU struct to populate the LPC metadata into
  *
  * Returns 0 on success, negative on failure
  */
-- 
2.25.1

