Return-Path: <linuxppc-dev+bounces-4489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE39FD0F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 08:19:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKH1R3hMXz2xgp;
	Fri, 27 Dec 2024 18:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735283963;
	cv=none; b=PO30JqxPIkemFYvN8adZh6nNtuzGuuh2vui/l84CqhNInKqvT6CTrhAmnxRxgl8NyB+A2uLSCCUBzYG7+pjMQD7z8nHmVy2hA5IPoOgGDsVll6kxP0u2AmygeifxfXF4n+QRPoFFA7nW57YriEci/DnwnX10xkWTEiB0ypYaO3QhK/v8Krpf9O0xTZ7da2PoCjN4ZeEmKVEkp96ieeZwc7ETOw/3Ocua6iw1fvNaVTMENPadOgoloJe9/MtDNuLoebze9f5eqjxx6RjS0aEWFWKxgKV4slrko1ex0PJondvUePJTl/JN3EO4uhu52wXvxvtRWYp6Gq2mSmuIuap4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735283963; c=relaxed/relaxed;
	bh=UnuLkUZSsf9O56DvJZoknEy7hBumP3/+WgCLz39mvuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WapilqeUyxy/lCD7pAJ0JyGnSL8VxMCuXA74he83zrKreVLGSNwpCPjZBE0TNqUMkXC0BfS+s8olABsXC0jqcDaImY8opn82vSIDiKa+Vu1aCKM+RSitiK2O93cRVdsOCxpYa319aiuXHRaxck2e3OwOM5KAbid7j1YsR32qtvuaNrd5JMIqnPrusxjMRDpYlExzEyzZqST/9rZpkTv31+q6Lwd/xEXcAXkt0MDZfubzIFH3RQW+KP4wn5kqwiaLHR8p6f82Gh4xXy56SHadr8GRRwZPYvyh3GdkCtT811W4y6200YcNPZq7+9+e0PicF16oWTEsXgvQS7vtg04Zwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DuLgMumK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DuLgMumK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKH1Q1gHtz2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 18:19:21 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so8512210a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 23:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735283959; x=1735888759; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UnuLkUZSsf9O56DvJZoknEy7hBumP3/+WgCLz39mvuk=;
        b=DuLgMumKX/+6OTKDK5SWp2Ic1u7E9XoB2rcr81zpS53YKLTSgBy3ZoAuqCJD4AdQ9y
         xGYt1rF7edISawS6kBL6IbR194EsGvzzQLZVzeKc0zoBIQesu/n7x/eBTwT/e8TXJExl
         vGNCGnL2az+bGc+QKS7gS14igECgQBSi11vDRN19zaye9S0AupOhm64xbFVmeRUzNRtQ
         XPLBAtWH3Y2S8OxhiQIhWjjd01t/CG+IhsATrH4KB25vK2uUEBc7Tri1/qhVIEtqalrP
         q7QfWTiS04PRObKhpVMatzQ6Nw+XhPwHBcF+mSDJQtNvKT867wSKjx2u3FmiUKsfjrG5
         V76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735283959; x=1735888759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnuLkUZSsf9O56DvJZoknEy7hBumP3/+WgCLz39mvuk=;
        b=btPLjl7ihWVfokPmbl6YgGrb3CzRlDKHlKtlWN16ZWJBpflqQ+lGmXAIf18LS2nTYR
         NNJOx4/aJter2yRLVeIv/UHAQ4D9rAa3XdUmtRflmZryVVtr/qDigzBqRRxXb3GAlhQA
         pnRatjfNw2tAHUWYucoMo9+VrZ6chf6FmXt/oRArkbfSQZKgms7Rd09gqD+AyHrb1oDl
         dd19Ockhx5yR+6LdTI5ulErhR8NR/58vcunRyQyQKFESZXxUinLy8/qBvyzvnsHx09Mz
         US2Bo/zFga16VhW0FDr0zvH/Ob8LKR+riRTIFYEdwPJGRPWvOISsGHV6G/1SjWL4nLUh
         i+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkJSWmDdqfvkqyUIeEBw297ieTrwwm97LOPzThYo1P61oxEoa33W95X1IRxN7OaAaDAmWghI2OlZk0RU8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzp1JP0sJAnsJai6MyNRA3Z1z5P/XSSbLVyG8O+W4cfYKo8zrOs
	vgvXCc8yZ6FU/5iUpgzrbiDKcj1Leut+TJNzTix45+CPCSq1e1tj
X-Gm-Gg: ASbGncvWRtd+QbXo0PR0iCSYIewHnQTWNPBaXrVmFE2SPNjwAPHMsxH4HvSrd73OlcW
	BzigqaOl6BTRzxgMDWX6E7HetnsuqH44tirBKgBliYyJXLN/S7AAiOdcSuVQ1y5OoXUOUryVfN9
	4raES7Y4IP13AHxBhxKWRqbbu0HrFt/okF9M9Q0clGm9255lusjW6csrcuZzzlWCAZ1RBB2kF0L
	CvnLKBMiilE7p7gxE2F6UM15GKUvXdsI02nVWaRPLavFcfT70Ke2oN68tg12yt2iQgrVxiNZd0=
X-Google-Smtp-Source: AGHT+IE4gAS771EocxnX0fNLgBOnvBM1JMpmjqOEkQXBE1ofvVqYAzSgusfEUdwpY5nhbywfqhyo0w==
X-Received: by 2002:a17:90b:2e4a:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2f452e38d0emr40078681a91.20.1735283959098;
        Thu, 26 Dec 2024 23:19:19 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:45c8:7d73:b364:3050:fc3a:14f7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c84d0sm15195994a91.14.2024.12.26.23.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 23:19:18 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/AER:Add error message when unable to handle additional devices
Date: Fri, 27 Dec 2024 12:49:10 +0530
Message-Id: <20241227071910.1719-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Log an error message in `find_device_iter'
when the system cannot handle more error devices.

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/pci/pcie/aer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 34ce9f834d0c..04743617202e 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -886,7 +886,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
 		/* List this device */
 		if (add_error_device(e_info, dev)) {
 			/* We cannot handle more... Stop iteration */
-			/* TODO: Should print error message here? */
+			pr_err("PCI: Unable to handle additional error devices\n");
 			return 1;
 		}
 
-- 
2.39.5


