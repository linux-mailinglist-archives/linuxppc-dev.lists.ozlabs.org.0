Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B236E157
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 00:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVszg1L1bz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 08:01:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HgpbCexY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=sanjanasrinidhi1810@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HgpbCexY; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVq771Z5qz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 05:53:04 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id 20so29510005pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=t2vjzLo5833TwHRjaoZDQocM21zdHYgMxRE4qSKWBXU=;
 b=HgpbCexYJ8QnHXUVW5h6oIZf6JX8cFOmlVUHI/I8orX+JfuFAmUpjdGyrDEK6GgEsW
 AMSbqcIcd4rTUcHO/roNkGDwhXOH3GOum3NmGSTN/vMHkWWm9peWStWyWxYWinNMvZzv
 keGSIjBl7h7wCkLP6WDknNHZ6Fz4RMPOUJAb918dwYoFwIXOb3PbyAfYFgXf0+1I5qGi
 7Xmm77ndPQGN9PHBkFwN3Qu6fOAFP44PCnbm9xxdJmloDz3s/4lBthSS96gg5klcOyEO
 43ngKjxqCKaooiJgev8eoO+VW7DCEqYomFw/Iwot6pleC6pGAvQnS1vt7sukUXPT1qYj
 ze3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=t2vjzLo5833TwHRjaoZDQocM21zdHYgMxRE4qSKWBXU=;
 b=FP7CyfOagFQiq8gIBeocvmMkEe9CktlLOa/r77bWgdcpM+6BAoCPrfb49ECeyCAfUm
 rCQDuaQAoCDJ5YdkLe6UvaJnicryd74LCE8t5c8xqEGz3Fl8sO2Jgwcxb95C93tzUixp
 tHiD4tu9peR4SL/i9TGl+YAOp6/fSJxCebB7bt1Kp7TT68jssi4pKqHhTdnkAo0Ra1GL
 p9vI5AZD4pdBRIlyaz1ySZ9x6l0wq5qWJQn/NRkbabVifL5Ch4oZTCdPT54YBbOovdwW
 D2WhtNVvSSkUGmlUPxXmokhZ4XmtgKgUqxb+XMXCuwndJT39AUSeD4REGPV/h4AVIrnF
 A4dQ==
X-Gm-Message-State: AOAM530UlnjQU3Px6a0IjZCCG83MC/bfOuOQu8SVCqyT3J6YLrbagRaL
 0i427KN8HeS8OnQCkva9r3g=
X-Google-Smtp-Source: ABdhPJwhug9mgcMupt82IsIk5So9b0QVyz3a+s9sFYwAwVC2QShayJbfGKyfdxrjMPmsxxIjso7Pjg==
X-Received: by 2002:a17:902:a614:b029:ed:3d5f:768 with SMTP id
 u20-20020a170902a614b02900ed3d5f0768mr15502807plq.18.1619639581088; 
 Wed, 28 Apr 2021 12:53:01 -0700 (PDT)
Received: from localhost ([115.99.168.181])
 by smtp.gmail.com with ESMTPSA id i14sm448603pgk.77.2021.04.28.12.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:53:00 -0700 (PDT)
Date: Thu, 29 Apr 2021 01:22:56 +0530
From: Sanjana Srinidhi <sanjanasrinidhi1810@gmail.com>
To: geoff@infradead.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Subject: [PATCH] Add blank line after declarations
Message-ID: <20210428195256.c3tqnrllnid3c3e7@sanjana-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 29 Apr 2021 08:01:28 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Blank line is added after declarations to maintain code uniformity.

Signed-off-by: Sanjana Srinidhi <sanjanasrinidhi1810@gmail.com>
---
 drivers/ps3/ps3av.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ps3/ps3av.c b/drivers/ps3/ps3av.c
index 9d66257e1da5..c4ea494ce464 100644
--- a/drivers/ps3/ps3av.c
+++ b/drivers/ps3/ps3av.c
@@ -175,6 +175,7 @@ static int ps3av_vuart_write(struct ps3_system_bus_device *dev,
 			     const void *buf, unsigned long size)
 {
 	int error;
+
 	dev_dbg(&dev->core, " -> %s:%d\n", __func__, __LINE__);
 	error = ps3_vuart_write(dev, buf, size);
 	dev_dbg(&dev->core, " <- %s:%d\n", __func__, __LINE__);
-- 
2.25.1

