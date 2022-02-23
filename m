Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B894C1134
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3YZn0g0cz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 22:24:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K1JUDrM5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K1JUDrM5; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3RnB0lZXz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:02:37 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id c1so4345113pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPDmTe+hCTvs80jt4/49UAsxs25Y+NKSQwRiuv6cnUk=;
 b=K1JUDrM55xOwRD2LV3t4ZsSEYEZIFuZkVhoIYOp5IBUh8VTeMb33DgDyN8v3mcZl75
 SkGpfNqDl/p548LdibYrbvsvSXw6XOuspxhoDnNlG4eeD37y6ZRsf6FHg30ybPyNE9CJ
 lN3qsn/ZOryh9a87Fm40odUiCwY0oGsAk6a1Qw/Kgs8nNLkNeKfSgTvjrivRBe/0RjPc
 AeQVdAOgJG4p46J+uaOL9YpCOFvuz5iMGvRFINL17OwlNFFMENQSZgF2zUkFlD9Jg5f+
 vFUykyn2f+86MSg//095SQB85p38o2UTL7kFNP9ZYnjTh6xCFGquyM2DFdMP8SgFBZIT
 F9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPDmTe+hCTvs80jt4/49UAsxs25Y+NKSQwRiuv6cnUk=;
 b=iAujgprTJMu0Muf2MXtqD3UKllS8QssNj/gkbJnWpR6N/K2/DXXzrPP5aUH9y44LNN
 2mhaCGfMV9HZ67bnFAX+q6TA9RwzkFMSLXTdbaTp1hGNE39Lt1QM1xG4vE06NZM9XXEI
 WuGv3xgc8ypEw34cq93msqiptFOnQIK9tJlt3gNaoYm00TJ0fxqAkM04EdCuOslPQaKe
 nuFv+S/zAg2Ix1UI/G/Gi6eoqINvJsIJmjlu9p84VV+XMhZGy6ai0rhKN5EWO2P9yVNS
 GSkn3s+n4bPZ86KUyZOq0Lt1oHmN9hYPc7y5+rCEHrX7/u2zcprD8dnfm+Y+4a0r6/AC
 6u7A==
X-Gm-Message-State: AOAM531HYIQJfq5tLrjB8DgVjaZL/XXLiF4gvHA/gHIdkYIxRJLJA+s4
 jf41z+xrg4RfhVDn0NwhHDQ=
X-Google-Smtp-Source: ABdhPJySLkvZrZ7DCwipOS93XXYsHjLEryc1FsRRn4QNjccIV8lxj6oFoh1K87CNJTejrZSPzFa1IQ==
X-Received: by 2002:a62:1d42:0:b0:4c7:f78d:6f62 with SMTP id
 d63-20020a621d42000000b004c7f78d6f62mr28125329pfd.33.1645599755708; 
 Tue, 22 Feb 2022 23:02:35 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.54])
 by smtp.gmail.com with ESMTPSA id m21sm22748406pgh.69.2022.02.22.23.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:02:35 -0800 (PST)
From: Hangyu Hua <hbh25y@gmail.com>
To: christophe.leroy@csgroup.eu, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, peng.hao2@zte.com.cn, wen.yang99@zte.com.cn
Subject: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Date: Wed, 23 Feb 2022 15:02:23 +0800
Message-Id: <20220223070223.26845-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 22:23:29 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mpc8xx_pic_init() should return -ENOMEM instead of 0 when
irq_domain_add_linear() return NULL. This cause mpc8xx_pics_init to continue
executing even if mpc8xx_pic_host is NULL.

Fixes: cc76404feaed ("powerpc/8xx: Fix possible device node reference leak")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 arch/powerpc/platforms/8xx/pic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
index f2ba837249d6..04a6abf14c29 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -153,6 +153,7 @@ int __init mpc8xx_pic_init(void)
 	if (mpc8xx_pic_host == NULL) {
 		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
 		ret = -ENOMEM;
+		goto out;
 	}
 
 	ret = 0;
-- 
2.25.1

