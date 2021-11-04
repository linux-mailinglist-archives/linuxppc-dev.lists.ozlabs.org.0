Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD0444CF9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 02:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl5Vr47DGz2yZd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 12:23:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FggLV6Nx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FggLV6Nx; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl5Cg22CPz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 12:10:05 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id n8so4525978plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7K+tHdK20GBd/ySrom3i+DrmDsH2xwdErxdX8kh7s0=;
 b=FggLV6NxJc7LVtJbw2NTovwtBYcOxBQTt9rpDHTyYAphphRtXHFrVnZfBy4lA9yCgy
 Paj18XO5V42GDSOICVBzZtRTAig6zXzcFbwz6YAWwermstOTg6PZkSl6sSBsqHOWH8zu
 ZxBqNTzppX8ZYPYm1KMJF12SKDctLHFWkiaClnU88mGIPwkzEIPWR7pIpVTyFzyid6+8
 aDQGOh74q4ioCPbxeRmnhN8Z/SHsEk+yJa38AjwBYz2qWZ4VF5Z7BmXpXKaieq/Pngrt
 Lp53zXzQ7g/psaKmvR/9JUHzKw+FYxw8S736pJsvRN/U3PTj/4vv7mFV1+axKSuY0k9q
 2yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7K+tHdK20GBd/ySrom3i+DrmDsH2xwdErxdX8kh7s0=;
 b=Nwoo1acdlpO/1+Fu3chGJGgEB4ABxrj8b1EUoG9w+u2evnkH5zkB94ldUEcVIjIJGZ
 avF44cbyrX4gesRYsD8d5Qnl6oiXXsjEUEI0wWV+sAcYvB4oHM03qC7eRzK9fr9jJIk+
 hYdjecGDXY3appz0NT0WSf4SEOb35iZhvW2R1NJx9pZ3DWA6J5W2fJnimbusml9kkWFQ
 r1tc15qOLgIdVWsow0jJvJQMzdpsEmVsrU1MUKJpkzCB8W3CO+96Fg1bO7zfg4EjhwGD
 6dkk6MSUoFhCSZSBd3HaY7dOiUZ3GLHdLlqEDATmT7GGq2AZa8YLUd6g/Xol9aeZ9yyC
 66wA==
X-Gm-Message-State: AOAM532ukPckngNNQOwPG5EBVcCnIA9UZGhZfapvRuTwzzeGXSW33HSg
 8lgE+Ro+B9d9zFbh0H/CE0I=
X-Google-Smtp-Source: ABdhPJyP8hi2lnQ0Srk4nYqIiLVvbmDQk8OWCtw4kOJ0Ha0/AYJLPHTRRGLnUqqorh5zM+d0sZ+Uvw==
X-Received: by 2002:a17:902:a70e:b0:141:a01d:9d6c with SMTP id
 w14-20020a170902a70e00b00141a01d9d6cmr38669636plq.84.1635988203020; 
 Wed, 03 Nov 2021 18:10:03 -0700 (PDT)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id x17sm3422500pfa.209.2021.11.03.18.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 18:10:02 -0700 (PDT)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: benh@kernel.crashing.org
Subject: [PATCH] powerpc: use swap() to make code cleaner
Date: Thu,  4 Nov 2021 09:09:51 +0800
Message-Id: <20211104010951.1027348-1-yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Nov 2021 12:22:42 +1100
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
Cc: zealci@zte.com.cn, davidcomponentone@gmail.com,
 linux-kernel@vger.kernel.org, yang.guang5@zte.com.cn, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 arch/powerpc/platforms/powermac/pic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 4921bccf0376..75d8d7ec53db 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -311,11 +311,8 @@ static void __init pmac_pic_probe_oldstyle(void)
 
 		/* Check ordering of master & slave */
 		if (of_device_is_compatible(master, "gatwick")) {
-			struct device_node *tmp;
 			BUG_ON(slave == NULL);
-			tmp = master;
-			master = slave;
-			slave = tmp;
+			swap(master, slave);
 		}
 
 		/* We found a slave */
-- 
2.30.2

