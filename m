Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4508FD8E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:27:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j3so1+cU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvgXz2Y1jz3cZt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j3so1+cU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=jain.abhinav177@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgSq402Bz3cT1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 07:24:10 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6c57fa82fdbso198295a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717622641; x=1718227441; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEnxTETK0rFGl7veDAfyPrBbDGYeHk9u0SUVvr1yaQk=;
        b=j3so1+cUqtYRJH5zRhNU9qmBeiXjG24Jn2VrM2YbqRskZOuksvcEVqkkq/4idstaCd
         TE2BKn4xbf7uiHlW6KNk6dJlI8OcDErKfRlJ67P880hsEfGftXyn2+aeDTi9A2oXruIl
         DnRwgGnJFSRFw3VQg+LZbvVZPSVuXO4+Cjri7Cj954rU7D3+tWUkXdUeCB+vsxJ7CsUt
         K0oveyfX5Kg5DpjufVgEloHGAjVpX72biatdcuYbqWj8zi/1qnws/Hpzg5zab440zwK2
         2Qb85nYFMmYoqCnsOXRXYfxCfMA1oUrkSEWhKEQmwXB8UgDY8+qbE0m7WGRT4AKkTgJY
         Q+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717622641; x=1718227441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEnxTETK0rFGl7veDAfyPrBbDGYeHk9u0SUVvr1yaQk=;
        b=WuyGZ9wez7VGIUzJWcqLWcf/4iteMe6ayuBPweQj2QgSmJXiWeGixj9kPsrJ4QPamV
         6Fso7lE0crDZHnUUwd129IMrmWX0BMVv7LSaSpLOG1/BLxkFgn2ZzovObVXa0vv1LuMU
         BX3hBPRqjiCAlVuMJlhbVXh/OW6IqO3ahRm+1Fp7R+JGy9g1WVzjDTBIpEKtAgpJSgXP
         R35JWN2cG/cSJDW9asRFSbB/NV1zFPI39kImTxhXeIVk09qpBDAAEbU4aOrHjs5RZSbA
         BQDiAQ+b2JMQT4HrOEZDF7Rj7wlNHOr+MHWA4+urPbruILMYVLLhCu6r68bcQS2gay7V
         flLA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8rDPiF/uA5kf6nmNZxgyCIqUCM9khZ+iPwxsOo7UvmdSsWEcqBV4rXCB3TsjxYCQaPzKLAl9hbkeyRgTYOcyWPNrDXrPvWh/hiZW/Q==
X-Gm-Message-State: AOJu0Yx/zk7qjJ5LF4eCGbmQnkRnuuHsaguVKqMEzvFAlqWm46tRZ2Tl
	RpF1ZI5HyvgwmwEepg5SInd5xZbbz7NwJRK3g6zJ0XfXaPEq2QGf
X-Google-Smtp-Source: AGHT+IGrDuL4Tcy+8N1pC0DV9Wv9hU8i5ICvU98GSp0M8sQB57y48/AYA2i9L35BYMcG2jlrVaDxqQ==
X-Received: by 2002:a17:90b:391:b0:2c1:9e9d:b9b5 with SMTP id 98e67ed59e1d1-2c27db15708mr3898081a91.15.1717622639960;
        Wed, 05 Jun 2024 14:23:59 -0700 (PDT)
Received: from dev0.. ([49.43.162.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c3884f8sm29370a91.37.2024.06.05.14.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 14:23:59 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: jain.abhinav177@gmail.com
Subject: [PATCH v2] PCI/AER: Print error message as per the TODO
Date: Wed,  5 Jun 2024 21:23:44 +0000
Message-Id: <20240605212344.21808-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415161055.8316-1-jain.abhinav177@gmail.com>
References: <20240415161055.8316-1-jain.abhinav177@gmail.com>
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
Cc: javier.carrasco.cruz@gmail.com, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, skhan@linuxfoundation.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Print the add device error in find_device_iter()

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>

PATCH v1 link : https://lore.kernel.org/all/20240415161055.8316-1-jain.abhinav177@gmail.com/

Changes since v1:
 - Replaced pr_err() with pr_notice()
 - Removed unncessary whitespaces
---
 drivers/pci/pcie/aer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 0e1ad2998116..8b820a74dd6b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -885,8 +885,8 @@ static int find_device_iter(struct pci_dev *dev, void *data)
 		/* List this device */
 		if (add_error_device(e_info, dev)) {
 			/* We cannot handle more... Stop iteration */
-			pr_err("find_device_iter: Cannot handle more devices.
-					Stopping iteration");
+			pr_notice("%s: Cannot handle more devices - iteration stopped\n",
+					__func__);
 			return 1;
 		}
 
-- 
2.34.1

