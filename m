Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814602A2A58
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 13:05:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPs793JwGzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 23:05:25 +1100 (AEDT)
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
 header.s=google header.b=JS+Kwdsw; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPrty50JBzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 22:54:46 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so9213302wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 03:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRzuWaCfIw4UTs2aF+5rmwioSm/r/nvXMg3tmaX+2L0=;
 b=JS+KwdswLAieYiaVeglSx5ggqAhqLpcikTROj7r7BZ55giY22O3qr5VILyrUR4yONv
 UAruY8PiBxCqihxjeC67TcC7ye9Au72twge4l2BcSioJyYz1PMNuh41qs3FzprrNPvbI
 FHLyC0K835GWyx+1GV9YalD1Bd8Sce/mRu8mP2CPSUSmo/6F9XuEYdh73H5Jqw8pojNJ
 aTD22WfqdQq2A8BhX0GeNNwaNjMv6U1rPQJzCmNu81+Vr1fqwcquHFk+NKPDlYt3/K5e
 adHhhB2e2J+MIVdkHOdnx1VyZWF99+Kqaep73B7geFO2cQgTGZCefO10Quqw/jDYQM5X
 s0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRzuWaCfIw4UTs2aF+5rmwioSm/r/nvXMg3tmaX+2L0=;
 b=FpT72NQGzDd2F29ar9sKgd+SDqFbg+Vk2GRSu/FQglAMcnjMNr5pugJ3d0HWaMbE3v
 TTNdgcZ/QOC4YdQz92SV1ddn8YBluzpmTOEhqKwRz1ewHABq00FFC2wOcHQCLIbGM46B
 m0iBG0CHq3LTpLW8YKdPrNFaeNYqKQvsi2T4tLO4NTOf7W2OQ+C9W6GgfdiniYhMho9t
 tNWv+VVDmFmY5sqWeR3FhNSZ5ccDiiOkvQ/eRJ+HItYKKJJy7onNmmrcsSYevI7Pn3gz
 kjepStsJ6CaRO0gcAoE2/U6eCHzmuMLIeTlgN+3NXRugc0e7r+5LfRZ6lQjIfENJijQJ
 86Xw==
X-Gm-Message-State: AOAM532ZKL9vmN/unZgD3vnTYft28juyW7NNk/sJAp+fobRpBmLSNaRI
 iE+4A1gvRcSSyHWw/WoylJBgfw==
X-Google-Smtp-Source: ABdhPJwqyLdi+hvK8ABATLFZsgWDxfRSJ/d6F8En9RgoXNzWtzAm3miqfTQw75V5SnGsKn+a3h1n3A==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr10168153wmi.136.1604318082123; 
 Mon, 02 Nov 2020 03:54:42 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 23/23] mtd: devices: powernv_flash: Add function names to
 headers and fix 'dev'
Date: Mon,  2 Nov 2020 11:54:06 +0000
Message-Id: <20201102115406.1074327-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Cyril Bur <cyril.bur@au1.ibm.com>
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
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/powernv_flash.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 0b757d9ba2f6b..32cb0e649096f 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -126,6 +126,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 }
 
 /**
+ * powernv_flash_read
+ *
  * @mtd: the device
  * @from: the offset to read from
  * @len: the number of bytes to read
@@ -142,6 +144,7 @@ static int powernv_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
+ * powernv_flash_write
  * @mtd: the device
  * @to: the offset to write to
  * @len: the number of bytes to write
@@ -158,6 +161,7 @@ static int powernv_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
+ * powernv_flash_erase
  * @mtd: the device
  * @erase: the erase info
  * Returns 0 if erase successful or -ERRNO if an error occurred
@@ -176,7 +180,7 @@ static int powernv_flash_erase(struct mtd_info *mtd, struct erase_info *erase)
 
 /**
  * powernv_flash_set_driver_info - Fill the mtd_info structure and docg3
- * structure @pdev: The platform device
+ * @dev: The device structure
  * @mtd: The structure to fill
  */
 static int powernv_flash_set_driver_info(struct device *dev,
-- 
2.25.1

