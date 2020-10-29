Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1629E5D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 09:09:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMJ4C42pLzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 19:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=coiby.xu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vQuYh02Y; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMHZT5PqszDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 18:46:40 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id p17so883521pli.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfuBmTvMg9MUKxvXP6ERdTgdyYc2LTvWkNxHfpwVAwc=;
 b=vQuYh02YfBH3Q+Cu83OMh2Zw+ddNnqCqUof8ZKGw2KlqXfKzFZgQ3CKG7n4D04vneY
 VIveM2fn6WoY+IaxjawuSGrxQac5F9E4ANI6VTeELqU82avE9JRXNCnS6LUEtmrH6thS
 4OJMnyNpzOZU5Sd6GpLLXjgcS/OaTHx+D1IxWBTCTFNV6ZuPp5AUAZq+s4Se4VrpbL6i
 bJYrAPOy87/ZvYuzKR8N+zeFKT/b+nN02CPJqOMQkGz4XcOdkdss3dqVhGllpWfL8wm6
 it6HxpZ336KvN6kbphzOfgTxQ/D14TG9gEOA68EaBOGJeHX9+Y4PKt13gw3gykmzb/+I
 yCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfuBmTvMg9MUKxvXP6ERdTgdyYc2LTvWkNxHfpwVAwc=;
 b=JZGJtswPk2ZLNB5jTI58q4XULJhxrSNN+CLgINpd5XqeoQ1F+FSyqST1+ULIl7TF0X
 k5t1PX2qntpsrIXScpdw1vBhx7+sqBdU6wenTTLIkPneDOYzU4J9Bk/dWiE1+LOypwny
 miRWw+8gi8Z5b1bXHBY4/bnfRPCZcCEX15G3D2TJXPmjDnkD2DGlXY5KkFs1mdhACWIX
 gF19foXZBZpqHKcZT5EpvTCHrJjGiBOq5jMc1ZRfxuOVEdAm+cabOuw47fyCvgqncT6T
 fgEE9HrUfcxuxV2PWOcFnarA71V48d3pSGVU/m7qy9bbJtLHCSuRDtdAJ1QM++1LGxAv
 rqbA==
X-Gm-Message-State: AOAM533RWZ73alwyaYbyzL7BdIpu9xz+eud8TrfV64PUfD3+n0vqBufa
 SrUJDfGHbJTqjUZ0NLzVPbQ=
X-Google-Smtp-Source: ABdhPJxf8E/8cKa23EfUte88B96UerFuRSXyvagG8YXcECd1HyINeZl2Eec9Usnqoet1h037d3io5A==
X-Received: by 2002:a17:902:23:b029:d5:b88a:c782 with SMTP id
 32-20020a1709020023b02900d5b88ac782mr2750215pla.5.1603957595930; 
 Thu, 29 Oct 2020 00:46:35 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id s4sm1737502pjp.17.2020.10.29.00.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:46:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 25/25] ALSA: aoa: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:43:01 +0800
Message-Id: <20201029074301.226644-25-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 19:01:06 +1100
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
Cc: Johannes Berg <johannes@sipsolutions.net>,
 "open list:AOA Apple Onboard Audio ALSA DRIVER"
 <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:AOA Apple Onboard Audio ALSA DRIVER"
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/aoa/fabrics/layout.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index d2e85b83f7ed..197d13f23141 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -1126,7 +1126,6 @@ static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int aoa_fabric_layout_suspend(struct device *dev)
 {
 	struct layout_dev *ldev = dev_get_drvdata(dev);
@@ -1150,7 +1149,6 @@ static int aoa_fabric_layout_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(aoa_fabric_layout_pm_ops,
 	aoa_fabric_layout_suspend, aoa_fabric_layout_resume);
 
-#endif
 
 static struct soundbus_driver aoa_soundbus_driver = {
 	.name = "snd_aoa_soundbus_drv",
@@ -1159,9 +1157,7 @@ static struct soundbus_driver aoa_soundbus_driver = {
 	.remove = aoa_fabric_layout_remove,
 	.driver = {
 		.owner = THIS_MODULE,
-#ifdef CONFIG_PM_SLEEP
 		.pm = &aoa_fabric_layout_pm_ops,
-#endif
 	}
 };
 
-- 
2.28.0

