Return-Path: <linuxppc-dev+bounces-9577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8E3AE154F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 09:55:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqXD2nR3z30MY;
	Fri, 20 Jun 2025 17:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750387669;
	cv=none; b=TcNwbYOP5Ooh14ARO4bfaNYFCrzdYnsKATog5Gc3THSApjW3FdizAnbFWQNUrrUbzaOeyywtBtQ0JcIGNQmc2zBAiY+WMOzCqXAzZwXBX7NxOtYY/pt8In4jBgQQyazQ40KC102a8bWzp1/d65qgiOtRcuL0YmdATFEQgwpXSP4Tatp/dK8Jca+6IPv8QysjdwmjIvFNxU4TGyd2ZfVz6Q8rdIuwa6sg/1tSNEQYbdKjyPRo1/uJmFLSuuyuzyXBF7XZjUcEYZHPBUfOHDQuV6WdMd4ctJsDb+M17YYakkCKeFa17EpezgSZrQLRneRIMezJYzXIoxicj3eCSxFc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750387669; c=relaxed/relaxed;
	bh=4mJJTvXvtWN+ybMkRH/wKJbjOL7koZZuVsnuFialitc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INY/XsvT82zHrklCY55uM59uTXtr+zMdhNJiUVY3OmRII5krmO2KVhssriIeoZvIlJIluFhgu9LNw3KxkTShhR0nqaeoOb2Ge0hPFpxs5CzvED6qJDLZJEsp4yvfxqQO8O1IZeks+Sfcr65NC7l9TW0FAo2ea6mj8jsU/Fu0JKkhYaqftWredubp+JIeWB4ZmKle7WhnOY7XNU8c9FsZ75TV3rxP9RgPvmps0/idTko12zTLNQxhA/5qXx1ERJb1j7qlbISnRfD7/ElE+yO8t6SQ+J+XKZxxKhmZo7GXjbf/QejFqhvTDqzLHLQPEKw1qGW3zXROFSpvMYu7PMfgng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PvNdZTFa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=ankitchauhan2065@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PvNdZTFa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=ankitchauhan2065@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNhjJ0S3bz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 12:47:47 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-748e378ba4fso1718033b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 19:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750387664; x=1750992464; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mJJTvXvtWN+ybMkRH/wKJbjOL7koZZuVsnuFialitc=;
        b=PvNdZTFaLUvfqaJnw+10RovyvEm7jTVbW6ytoBZJEIasGCyhxh94He2o7XeiV5/Oqq
         7c5JMmX+hETb706X6YQYUOeGFZKXi53QDuB5POB6rBZjYbnT8Yg3zcjkGlErJ+A0bbbS
         jLK9mCHzsZVhgSgJt+kZsRxReOjC5pIY8i2U2aAILkMcYr0lpnlSoSQCK81bicMTJ8Oo
         syF/GYeqUYuL14DGnQX0oQv4WQtdJLOLyXqqWZUXgeiE6B0H/bRjLPRGUaR/fd1M8vez
         Xl847r0jDVGFK8n6GFx89CLSxV7J5wK2ZIvknU8OE/I18FY7JOFwNHkdfFBIQsKw1Hub
         JPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750387664; x=1750992464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mJJTvXvtWN+ybMkRH/wKJbjOL7koZZuVsnuFialitc=;
        b=WuTxkH3GpFmsVzm1dI6C+Ey5b+3Utl/sI1e28gRSPRu3MPfq/Qs3MlBte3TEp+d1RW
         QTTpkLRx4F4uqzNnBRhtuvVOOwlnrLSMC+RwiEyP/Stm45NaIESIHYESp2WesI7liFAR
         VfnddlBy+nyXp3batk7M/e2odyeORefs/pSbuES8sxkC85+iViBVixfhK2Y8qKlNrnlq
         LV507rZjdyViYF/c2++xi/UJFFGLAqESjGONIfZC1yBEVnqY0I9QfPivyBHwL2Qk2XcP
         tuURWDzV0XIYCEC6Wc6hRWIQGtAzkwYvZZ74pqnZVuyZEuJtOLE3P0ifRZhjhFNiC3Uc
         jpXw==
X-Gm-Message-State: AOJu0YwiOoDjhdmpky7a9X4irVbCWBEzN/OToPTAAUSCKR1m/VpObD7V
	2POyjIlNlP19ynwNs4fcIYGy7cylqpSWgwG+EPfJ18dmi1JW3U795rD8
X-Gm-Gg: ASbGncs+zGyG+FfBasUrEsdQYcss2xIBBtipFUYBDDUCTMf5SmaKPBeZNR0A3uHGgQf
	BHDR3lyToy4jUoZ4D6l/YeN01L9Njh8yUu/5gR+iosrBrz0X14wzxhckCteLLTOywd5BoRSJmR1
	szj3zCoFlReEzjbS7DrU5QR1NsXV9YISDEhiQkrpHdDBbrvwnozJ9W9P5Nwq9ffZ9ZgHaw2ZG/7
	i2LsZm0qOfoyYU0iZUg3orX+TFk5Ffr+az8+GrlorxinjSOe7B7NAtIf2ISJJmlgv4tuA6ehbl1
	KvXBBWy8t11j+Qx5pie8Hj3WuOEC5eMaKizL0ko1hkGrVeu/1CFXinTdT9WNbAhVn1oJ+aycbmP
	cl6Msrv+jzH/ASK22wVEmnBvgoAtSGDsMfg==
X-Google-Smtp-Source: AGHT+IEF1HVwk7rZIuKPFFF0u/ApToJ60nR1yo7ZaE0JKrdUL4IvNm5599ieCkZAjKRNZhvRMgO1Jw==
X-Received: by 2002:a05:6a00:2386:b0:748:e150:ac77 with SMTP id d2e1a72fcca58-7490d6c3b5fmr1387481b3a.22.1750387664321;
        Thu, 19 Jun 2025 19:47:44 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6.. ([2405:201:4042:d128:87bc:2aec:e545:acb3])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7490a621ceasm899148b3a.97.2025.06.19.19.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 19:47:43 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH] misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions
Date: Fri, 20 Jun 2025 08:17:05 +0530
Message-Id: <20250620024705.11321-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace scnprintf() with sysfs_emit() in sysfs show functions.
These helpers are preferred in sysfs callbacks because they automatically
handle buffer size and improve safety and readability.

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 drivers/misc/ocxl/sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index e849641687a0..f194c159a778 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -16,7 +16,7 @@ static ssize_t global_mmio_size_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			afu->config.global_mmio_size);
 }
 
@@ -26,7 +26,7 @@ static ssize_t pp_mmio_size_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			afu->config.pp_mmio_stride);
 }
 
@@ -36,7 +36,7 @@ static ssize_t afu_version_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%hhu:%hhu\n",
+	return sysfs_emit(buf, "%hhu:%hhu\n",
 			afu->config.version_major,
 			afu->config.version_minor);
 }
@@ -47,7 +47,7 @@ static ssize_t contexts_show(struct device *device,
 {
 	struct ocxl_afu *afu = to_afu(device);
 
-	return scnprintf(buf, PAGE_SIZE, "%d/%d\n",
+	return sysfs_emit(buf, "%d/%d\n",
 			afu->pasid_count, afu->pasid_max);
 }
 
@@ -61,9 +61,9 @@ static ssize_t reload_on_reset_show(struct device *device,
 	int val;
 
 	if (ocxl_config_get_reset_reload(pci_dev, &val))
-		return scnprintf(buf, PAGE_SIZE, "unavailable\n");
+		return sysfs_emit(buf, "unavailable\n");
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t reload_on_reset_store(struct device *device,
-- 
2.34.1


