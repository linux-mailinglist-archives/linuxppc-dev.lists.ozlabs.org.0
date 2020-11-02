Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC02A2CB3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 15:25:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPwDG5lVnzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 01:25:02 +1100 (AEDT)
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
 header.s=google header.b=oiIaP9Ba; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPw6k45YtzDqJH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 01:20:09 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so9670328wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WMZ5E1t1qQDSNwAwpQ30Zb2v4pyVaA5GpDGSolOQX1Q=;
 b=oiIaP9Badbgwu6QFpYJ9CsxpG5czjN2vku9ZNvB9kwytZowUyfn5yg5e7GsH5eW8i+
 HvHd1MPW6YkXOEFu21i7+zAtirx2opS8FAGdXxByo+GH8iovk7bW76+knFUVPlZvn80z
 bbXbT+LKuopP0Rqx0gUdeIxSmjn/ON5sFVUdhIVdUMrPYo7Exafg3O/eWZZdTtoW5LBX
 qVVKY1FKlnRvE2JEAA/jCFm+Hqvs32Bnr2BIDc5wjpvqIJUnhivVymzYlTiR4ERXqV/9
 q6JpXpILw8YhI1gNELoSTHceJjOa5EMn5KGh4hbQm2/C0PDcV3cqv8v3Q9TMcfNn4NiI
 +wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WMZ5E1t1qQDSNwAwpQ30Zb2v4pyVaA5GpDGSolOQX1Q=;
 b=smR6PBnHu6xEKlNe5MZ3YxXMQ13GKOVtNPmWTsQDoZWaTILjxpd8hm8U5ZTTaUprBS
 9MbiLG39cM5ngyjgj/Mtl18lnEIxUZU/8WNxLkUni44/hn7fBl+5MEHaxnlFfM5RwI61
 sFPKRqv3zGFG+ZnfFDvfNIGFNUgvF7Lqy2BBp1MGTTpnhw8kau/5mBtypMlDcb+hy8N3
 7DE1ItQkp9yl9Vo6VebIE1UivopMpNWdKLDEVIKnzE/yhNu0CEXnha/AYgvm+YZUNojT
 nJjFMqddwzY45Pv7Tne9vY/D3y4Pl2qBtZQ2mcc5drIB26AexI6h/x4TuP6xeUuHl1Ou
 sVIQ==
X-Gm-Message-State: AOAM531or5Ui/lghozT6Et84+AFh3AevGy5kDJEOYojBayeiDBlUHTWi
 9LoEKUNK2wCliMFiOW1n2rT63A==
X-Google-Smtp-Source: ABdhPJytjMicCjCL83paCEpnhL0UDEWTAFZl6rkXpfqixkC7yRArs0HNsBUVxg5/5SbL4TgRS5uu3A==
X-Received: by 2002:a7b:c418:: with SMTP id k24mr18745179wmi.118.1604326805546; 
 Mon, 02 Nov 2020 06:20:05 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id 30sm22331472wrs.84.2020.11.02.06.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:20:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH v2 2/2] misc: ocxl: config: Rename function attribute
 description
Date: Mon,  2 Nov 2020 14:20:01 +0000
Message-Id: <20201102142001.560490-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102142001.560490-1-lee.jones@linaro.org>
References: <20201102142001.560490-1-lee.jones@linaro.org>
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

Fixes the following W=1 kernel build warning(s):

 drivers/misc/ocxl/config.c:81: warning: Function parameter or member 'dev' not described in 'get_function_0'
 drivers/misc/ocxl/config.c:81: warning: Excess function parameter 'device' description in 'get_function_0'

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/misc/ocxl/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index 4d490b92d951f..a68738f382521 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -73,7 +73,7 @@ static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
 
 /**
  * get_function_0() - Find a related PCI device (function 0)
- * @device: PCI device to match
+ * @dev: PCI device to match
  *
  * Returns a pointer to the related device, or null if not found
  */
-- 
2.25.1

