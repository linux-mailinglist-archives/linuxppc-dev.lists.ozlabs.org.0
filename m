Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF12A28E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 12:17:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPr481DpczDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 22:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LBkxMl1l; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPqy55LwfzDqS8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 22:12:21 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id w14so14070661wrs.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 03:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WMZ5E1t1qQDSNwAwpQ30Zb2v4pyVaA5GpDGSolOQX1Q=;
 b=LBkxMl1lb0htq6UhKF5X3dV4UZ8HXQB0VsMvKeHXq8qGpaBdu4hG+1ovwTdvcX+uim
 umSR5iuJd+5K3Wgxb2Y1xfz0hovT6n8krHEnaS3T3AuNiMMYImSPc18CkH7aTskfG2Lz
 BFX4y2RgMJKr45IyqhKd8IBV2dssKps0fHrylhQ/ENnP6HycTkXPXKIwC9hPHlrpiCj5
 fhAeyhtv0vETqq4WctThTpwmuKEib0kF3VwllEepNvMmXYnw1iKpQjnsZV4C+jd1zLFy
 +dM7yhP6NJIaLYn26lLHnJ354evxWgtNLiqHJuA+48nyxwwuk0vVfF0BvXNOqvHCi6oG
 Lz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WMZ5E1t1qQDSNwAwpQ30Zb2v4pyVaA5GpDGSolOQX1Q=;
 b=dG5fcc7CbbVhr8fKB81kJIu1Kxrr0XE6jlvODzOuRzivK91RFL7FOZxVTO+qBoB3Za
 UFEgzUcUpRJ5fH7cUpneANFp+TvtGnWf/OrrNbB9tCjVffYAu8CQofhQIdVbAjik6w/v
 8mJDdg6JPeQgS5HYBJ4fFmKxL0/wYqXpDG1kPfSeukMuRSKWEWa1D6yYhuuYCLJkdpGe
 aIIG7P0P9Pp0fBBisHtIZOro4ntagqkZXKT3saD0iuPyQvd5+Ipubz5hpdVKCf3Z/yNC
 Zo1vv4/tYrsvVjCY5mzsyt+LGkEXFE8vc7Hl+DsxN7tsxV03f76d6ES4XLSE1uzLPwDG
 TXDA==
X-Gm-Message-State: AOAM531QfM0xWQPGE1sUbF5by/iXy5wOE5SbSpTstMWX0Bd/v82bvB0Y
 Vu4yVALd8uvvk1ZoOPNfkMlSTQ==
X-Google-Smtp-Source: ABdhPJxFM1/0yWDQjZqgHdoWsIZK0844ZEFz2gcDyTA+tLjIU9hOJSlbeWI6QEjZuMSGxOVtNSJb9w==
X-Received: by 2002:adf:df91:: with SMTP id z17mr18938665wrl.379.1604315536326; 
 Mon, 02 Nov 2020 03:12:16 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id v24sm22431972wrv.80.2020.11.02.03.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:12:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH 2/2] misc: ocxl: config: Rename function attribute description
Date: Mon,  2 Nov 2020 11:12:11 +0000
Message-Id: <20201102111211.1047972-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102111211.1047972-1-lee.jones@linaro.org>
References: <20201102111211.1047972-1-lee.jones@linaro.org>
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

