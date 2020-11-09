Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAC2AC3CA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 19:27:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVKGM671hzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 05:27:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CJgWPOdf; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVK9b1vGJzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 05:22:59 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id o15so1971686wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Nov 2020 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=CJgWPOdfZfDFX6jowwB55bCXH/oVH+oRW/NOmFaMU7wqCfffw9BI6AX0cZLLRnoQ83
 f1Q3pJnStHDKmia5wsQ1jG/5yLT5iyXJHSbfVxF2652p73ZossGiaeADkwfMVV3VPzKl
 y3WUZ3gkpVEtts++2sjN4KN/Ate1Zx1Llx1URhWTAmp8q9vb5It/GiVpx1x00v8thRr+
 Jg0NrctCAawSlL0MlhXVbqG4J9tngKUVGjMD35l1hjxw7aj066anrVGw76eLOV6PPGpJ
 +3NJvWcQwSa1y2r2ZhJVX092wzbs8xv/E5ZSMs+rZSbQxaMrOoi1cDjRQZHpsP5bhVsw
 Wctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=gVoyuI3zuMTvSF64KXDqVL4S6hJSuVW7MXC1bmj3sY06FpwOUuzf8WKynKfKKeqBjV
 ZHmyDtTjYmarkp4GPwakzyrdIEuIKeBAuJVsm2Cb+79svhQXiHMpWtPOasDkUXkh5C9s
 bzPSPteOS/sHzt4JX+PIyJwaOaWJ0LE1hU5e8cyKYbS/NSKv+6R45Bx1/UIy7kojZW2A
 TvdQu3vD99csv41z3fuevG4VWNhewq/OeTaEIicx9X+m/RHfZYWSs76LXlqbIyL/MyQ1
 CxULILROZXnJ+GvMUggMzDXtj/4o9z2/4tgzMcQlZJX36/wrcI6RxKHxcbpkeB0acbJy
 0y4Q==
X-Gm-Message-State: AOAM530d7xvOLz4J7KbiLUxpNDQssnnq6HgyYCOMtOUeuI0ktIToEb2E
 CplCbtU4NRIMLFhXqaQNO0/ivQ==
X-Google-Smtp-Source: ABdhPJzYJ6GXTplhTN/922OmWLnE6Yxzwd1FCSkYbQl6bOCvGF6TFsl11Dt619RBL63ntiSfCz1t1g==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr2948571wrp.339.1604946175640; 
 Mon, 09 Nov 2020 10:22:55 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 23/23] mtd: devices: powernv_flash: Add function names to
 headers and fix 'dev'
Date: Mon,  9 Nov 2020 18:22:06 +0000
Message-Id: <20201109182206.3037326-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/powernv_flash.c:129: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:145: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:161: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:184: warning: Function parameter or member 'dev' not described in 'powernv_flash_set_driver_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/powernv_flash.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 0b757d9ba2f6b..6950a87648151 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -126,6 +126,7 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 }
 
 /**
+ * powernv_flash_read
  * @mtd: the device
  * @from: the offset to read from
  * @len: the number of bytes to read
@@ -142,6 +143,7 @@ static int powernv_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
+ * powernv_flash_write
  * @mtd: the device
  * @to: the offset to write to
  * @len: the number of bytes to write
@@ -158,6 +160,7 @@ static int powernv_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
+ * powernv_flash_erase
  * @mtd: the device
  * @erase: the erase info
  * Returns 0 if erase successful or -ERRNO if an error occurred
@@ -176,7 +179,7 @@ static int powernv_flash_erase(struct mtd_info *mtd, struct erase_info *erase)
 
 /**
  * powernv_flash_set_driver_info - Fill the mtd_info structure and docg3
- * structure @pdev: The platform device
+ * @dev: The device structure
  * @mtd: The structure to fill
  */
 static int powernv_flash_set_driver_info(struct device *dev,
-- 
2.25.1

