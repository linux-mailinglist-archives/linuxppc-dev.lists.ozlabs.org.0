Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0620F706
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x64J5xNKzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 00:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TTWz3kQi; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x5Yr4SrNzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 23:58:56 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id o8so18921977wmh.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkBklcgolThuSqx2B9FGDRJ2fQUF+10AbLJBzITnPbk=;
 b=TTWz3kQiTzBuca298CfBMS58ag+bVWHWFEQdNDu9C1/PN/lY6EyJ+tgg5gFUVnhl5Y
 jlXcfraF1hxROmd3FRyUNLm3DWxMTagFU4Jzmxrjk03uYoJMBVmM50Fk17nCcENFff7l
 VpuFlVFptef5rsjSkbqRJOg16a9ZddGY/Btdr7e/BdQ435+Gu0zF9saFRJFU/VsYtbjH
 aKf4HahUOxW6bcYHyRwiuaWGgH2XQvgiqQzDVvnQVmDgZG7nM4/L3LYwLg8waw2y+3xB
 1TlptulEwTSHjHG+aEC0qopP/o3e/sb+oK7NvFdiJXhd6uEI6ECNffztfSwHOK5IumFc
 orCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkBklcgolThuSqx2B9FGDRJ2fQUF+10AbLJBzITnPbk=;
 b=ZqeiopbLYiyLT1sQ86H2DLJJH0ZzKtSR6m0Dt3qCrYX3boDqXPMISfG8nUDaf2gnC2
 pun5jv1/G3XLizEsO+0kxytTTdzpw11tkCGDD7ONzMIBmf2uJlZFWP6o6OgYpboEJy55
 l/+lro8ePAzihQ2VryHKh3a/f1QwH3Y9F5uKgMMw8HSp6Gv03dZko3Lx2QLJSbRIekCd
 F5LgFH2Fl7RtMjaPkj8mi7+R4VJ5M0xOK7LFJTqaoYqSR4N9BmWvhRxLRd4RWdHY1ZTR
 EBIuma+UB3OBGWquptHGPBaUgBaXI61yZZOPPVPjjJOgS7n9rnFRWPjH6EiD4kspzXgE
 alFw==
X-Gm-Message-State: AOAM533pJ66RccPUxXswJPt0cfwnB0K4Gr73e1d0py4sw59zOU1b17mG
 CuvUqlg7xgHyyr+qmxihS4g8tAMklqM=
X-Google-Smtp-Source: ABdhPJxrpKuIXyZ4jZXgdzGC5pflyyO+oF9AqHsNWY4gxzEb6UyNUUElbKvxkAnL54GMA/mXFAjShQ==
X-Received: by 2002:a1c:1b90:: with SMTP id b138mr21475735wmb.21.1593525103867; 
 Tue, 30 Jun 2020 06:51:43 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id t4sm3876746wmf.4.2020.06.30.06.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 06:51:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH 28/30] misc: ocxl: config: Provide correct formatting to
 function headers
Date: Tue, 30 Jun 2020 14:51:08 +0100
Message-Id: <20200630135110.2236389-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630135110.2236389-1-lee.jones@linaro.org>
References: <20200630135110.2236389-1-lee.jones@linaro.org>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

