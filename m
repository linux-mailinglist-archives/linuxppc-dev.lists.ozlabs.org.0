Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372DD39863A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 12:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw4k0196wz3bvS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 20:18:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HlDzsjy3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HlDzsjy3; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw4jK4t5jz306S
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 20:17:57 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id a20so1764334wrc.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtnD+zGZfyDjb47352gUiRgkQO/5qCyVYr5fUC47UEQ=;
 b=HlDzsjy3jGmMEPA1Cdi22KnzTcGlVq/CYnYWR/tA+FBDBUn8MQTrxkxf9fCrhb9EiY
 AP+DCRABV+UBwY2goSJqt0gomdcXSqhl/hLxokVr3BortHhumCHv7V2pt1VWxUzV/wQ2
 sIryHyzPAgDSW+3fLjBwyvu/jJaDrExZ7yTTw0jIy0kXCyS1R90d3nX9nVvmtw5tu9pH
 bE8xKyEEMbd9Y3Oi4fGtsy9Qfc7YSqRMGWSb0koyiriYFxqLAEwj/z0Y4LgrUfjj/u5R
 aiug7yL15FwpLx2lhNT3PkDP+jip8ZpZQWNQQKDuDaLQ7ccdu+fn3vt+7vt67JEPwev4
 sPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtnD+zGZfyDjb47352gUiRgkQO/5qCyVYr5fUC47UEQ=;
 b=KrkaMZ/8OeJFPgmyBqQzNN4MahtW0zag2W7m+MyNkGJFYrbV1WDDavdsBzf2ZHfgM0
 /yOlAvkoNIktBcEKPH57Z888tvqm/cOP+abGXQJZda2Vku7G1Fr1WpSDc3eUSpHG00fi
 274UNChyF5oNyfgRtKXHItduMnhnES1M6OV4xtd6vhkqE3/5d+zfIpl/k0qYabwojmdq
 QgA568wF3OsSwutVTzo/EScAz7KZvCjrj3U8pVmMyy/Zb92iQIUUKhOIWRXG23dzftc7
 1PjCePa7Wqis3fiKG4Wly2JM/etTY1XqgjRo7j3yUVQeCTSu6DMkjY80zm7sVJ+GqUaf
 eNNw==
X-Gm-Message-State: AOAM533CKcGsiv8dlfekDYymEsqpiuIP05J5tsUPo5BQM86EZCEfBiz8
 zXbNA1ngBwWP+Caf0CORlo8DAw==
X-Google-Smtp-Source: ABdhPJxx4Lux9HjDIJYRif25LB8bbY+qG3ZeqQpM1q+K1vvbQ3pirOgL8N54fTtJkQHarwFy77UX7w==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr33512577wrr.248.1622629073919; 
 Wed, 02 Jun 2021 03:17:53 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id q11sm1593265wmq.1.2021.06.02.03.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:17:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/21] ide: pmac: Staticise local function 'pmac_ide_probe'
Date: Wed,  2 Jun 2021 11:17:22 +0100
Message-Id: <20210602101722.2276638-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602101722.2276638-1-lee.jones@linaro.org>
References: <20210602101722.2276638-1-lee.jones@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/ide/pmac.c:1418:12: warning: no previous prototype for ‘pmac_ide_probe’ [-Wmissing-prototypes]

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-ide@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/ide/pmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
index ea0b064b5f56b..d51a2e252b6f2 100644
--- a/drivers/ide/pmac.c
+++ b/drivers/ide/pmac.c
@@ -1415,7 +1415,7 @@ static struct pci_driver pmac_ide_pci_driver = {
 };
 MODULE_DEVICE_TABLE(pci, pmac_ide_pci_match);
 
-int __init pmac_ide_probe(void)
+static int __init pmac_ide_probe(void)
 {
 	int error;
 
-- 
2.31.1

