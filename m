Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 422114D2E39
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 12:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD9DW0vBlz3bd8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 22:38:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jBqEWkQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jBqEWkQU; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD63L42Gqz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:14:53 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id 9so1422088pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Mar 2022 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=beOK8LcrpNIYxKGHWeVR9pv2W0RzrKRTl8AZ7GHaXos=;
 b=jBqEWkQU5UX4HEI5ow+RV02EDbId1BdW1x9Y/br/jcsO/GwOar1x2/mlXrIDYYc/9Q
 HhRLqkbuxhyPlBwYBO8rBYy5oD3lqG9YlC3+lVdhv8+D8XI98xA4G+7x2mSmpfDJenQl
 CxRlT+T7gPZHDCO0shUM689V+DexdKc62yZ6hlGoSA4xZHbcDq+1F29SDYGO8R8Km92v
 wIjVVVzjzu7ttBIBaWem6u77RcLC3596PDbqoCJZjHoA8PwJbbqf+EcTb9QcoF8xtF4o
 GTqz7Sy5L5yfWQ4HApsqXLMK3RMfvX5/XpRXucWoMFQoUbfERVU2fnE6Zyoa+KUQ+HZp
 vfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=beOK8LcrpNIYxKGHWeVR9pv2W0RzrKRTl8AZ7GHaXos=;
 b=bwppa7930lXn594+E+AaPdbmehx2z866PWZn8xcXPGJ50+WNTAR34ZXEgL5Ufa2L8B
 l5pgf1c5OYxJ+jGWFWZFF16QWXC/NANBAu0OxqkqVly+mIUAjwbi3HOQ8kwluZpi+JYZ
 MGXlXpguDi9FrYcP2LwyVULBI8S3hyAqV4XzElqNRYFtpddLpLXXacP7rN1CKhzvhn0M
 89Jg9TDgUiM9qYk3l0uVAMb8vyKoz91w9sQ6H29gafX0Zj/HMty3eT9fQPATfGyGnzkl
 5o6QVVseYBoyU5zudMYWx14iiv0zHvwlGCgp8llQdh7wO2VMSdEvnEOvIhMRtXW2gi4n
 1GpA==
X-Gm-Message-State: AOAM533goLHZLRgdLgB4URcqoWXqpoZQ3z5sRnnUoUYK1wJHBS1rT+Pi
 qr2tE2tK3M223ZTm1Ccrk5Y=
X-Google-Smtp-Source: ABdhPJxxLHSCqMw3qJsOgKLX0VzKOjKXq0movyQleTGzWe0eovbbdZ9wvpBmqv1zB4cE+bDlh4ZIWQ==
X-Received: by 2002:a17:90a:3e42:b0:1bf:53ce:f1ef with SMTP id
 t2-20020a17090a3e4200b001bf53cef1efmr9294168pjm.33.1646817291893; 
 Wed, 09 Mar 2022 01:14:51 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 v24-20020a634818000000b0036407db4728sm1619625pga.26.2022.03.09.01.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 01:14:51 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Li Yang <leoyang.li@nxp.com>, Biwen Li <biwen.li@nxp.com>,
 Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: rcpm: Fix refcount leak in copy_ippdexpcr1_setting
Date: Wed,  9 Mar 2022 09:14:46 +0000
Message-Id: <20220309091446.2420-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 09 Mar 2022 22:37:31 +1100
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of_find_compatible_node() function returns a node pointer with
refcount incremented, We should use of_node_put() on it when done
Add the missing of_node_put() to release the refcount.

Fixes: e95f287deed2 ("soc: fsl: handle RCPM errata A-008646 on SoC LS1021A")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/soc/fsl/rcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index 3d0cae30c769..06bd94b29fb3 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -36,6 +36,7 @@ static void copy_ippdexpcr1_setting(u32 val)
 		return;
 
 	regs = of_iomap(np, 0);
+	of_node_put(np);
 	if (!regs)
 		return;
 
-- 
2.17.1

