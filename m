Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B77E2A9F44
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 22:41:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSYk712j3zDrNf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 08:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sJW30ndV; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSYdT5LkxzDrQ0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 08:37:33 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id d142so2814389wmd.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 13:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=sJW30ndVh1qGXkUaw3pZaZEjF2ef9gfmBHcrLUN8CKyAoBZToeJQQGOgveJ9pOnH9G
 iLnj25fAUb5CHE4pzNXFTP4bhMNeVU9zyQDF1cWEHGd11k8kQJFQMEHxT3Dl1zjar9i1
 fLeGKBfoVm5SSIuvPhaI1FnA013nnfZJ8yjEL9YynAZGNTKmaaPzx1Z8entolXVdwDXF
 CpfAG963D1ALbbrNpXiYanN/0p8rW8kbDmkOIfYRs2zp7QT0lXC2BhMYgEqAXpdrHyfE
 U/pK0fH1kVdmS6ynQhtxJ6E8bO3EBpBdOD+PU9rYMIdej1Dw7doRpC+V18xrgEa4Q7rq
 2Adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=VhH8m1a7odnFSfWCR90pNqFIVGt1FzEmWZMtMKSNpan0zDGNuneEUAh3Y17Ax9woMV
 ug8cLz7ejwkJAd7FhJd+qR7Ll/D7A5jYa9q5Voj37QaaItWKY5njjjdDS3clM3i+aNv+
 tPjiN0ZAWFYDsSkH1sGv+y/4sLjc5Gvo5g18h+fFngmN0Y6NGpCQ3Kxpvaryhk71esOx
 eekXcBEnOcQKIunmNRVkG06hsQEc2MOW81ro7Enc2in+PJEzoBcmzBpVEPZI5KtGKfbN
 LuvPz3shJmEN4vAqJBx0xkNO5FqzEqLsfIJOzQVbwKKaDD4ytKlcvTewLR33MyQ8nzVl
 HrNw==
X-Gm-Message-State: AOAM531Gou8oDi9GQ+YpYfwSSIVwDnbwfFgz+YvJILpYvPZaQ08zjVCy
 fMpGr733Fuz/hLIHx3AOIxNjtQ==
X-Google-Smtp-Source: ABdhPJxG+LiIYfVShEQWJVAJMZtLl+cVPcfShbpulxjLFaLqCc0rq0BMZWwZRXF2wVzCbzIu7Bfcjg==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr1574214wma.14.1604698649574;
 Fri, 06 Nov 2020 13:37:29 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 23/23] mtd: devices: powernv_flash: Add function names to
 headers and fix 'dev'
Date: Fri,  6 Nov 2020 21:36:55 +0000
Message-Id: <20201106213655.1838861-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
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

