Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FD492099
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 08:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdLck1Ck8z3bZw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 18:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y+QDTdJW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Y+QDTdJW; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdLc04LFbz2ypK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 18:53:02 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id t7so20672366qvj.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 23:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBlOWvyY2SmpZB2Tqnzs1ZgQLC9p2YmtpYpG/cWvBw4=;
 b=Y+QDTdJW+XOFpy+w4shaBvWJSumKU6nS7ZMm6ReG5uupqHvDtl1AQAOXO0bg6PT/s7
 8gAhxlL4njWthXWa8/UvIMxfVoARJLPbbAFzrELf1Pd9wGcz7uVT+sd6MeJtF9FHQxHI
 Jl1QcF/SwyoaJwJfRieK1IknT8G7iUhv8jjjZvvxYxfOx3SdxYHp3cf14TYW0l0IGGCt
 Rpm4UYSdog2ONxDwxFd4kl2fJcn2gvSgks2xf6/ROiQnx6NpaZrdUgAYWmgaRFC89Uqp
 XT+ZG+fAPu0vBxzYYqfuL9f8ziH8vtP+n6JLla9MU8ajdXWbj6it/j0yXPRF56kAD+hV
 rQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBlOWvyY2SmpZB2Tqnzs1ZgQLC9p2YmtpYpG/cWvBw4=;
 b=ctsudTRiLBYcoptCvj7Ui8s3qFHF54fNN4N+sUa0veJ3Kyu8ztokxg7nrWgy9+OrR+
 iLAQQfVhJ3DFRlbn0t92cuNTLZX95fQdQRAB9gLPc3+ZOo/y+G7T8iFHE70cYbRfxM8x
 of18gYY2CFIP75k3Moz5KOUVXBXKDI3INTUVcg0cvWRNrf9gzFX0Xdud2/v2sLTqivXV
 oed7JndYXry8HlfRVVyCU0LdBa5pPeIrvCrvdXIelcgnaPlXVIzvstkPqswBShr9NmWp
 eC61Mzror4FTyUfVdeBCjwZodpHhEKyiKXvmLZ1kYssoQhKLnSaidA+tvUkip9HaFfls
 K6pQ==
X-Gm-Message-State: AOAM531Cm607/IRnUetCo4duox86hon+CsluMk89gniJ4dXB+OZDU04D
 c8FutK8TaS5cvT1kCwsCWOQ=
X-Google-Smtp-Source: ABdhPJzf9SYlLCupfoYWn6qvRNV7M6JE5qKHdoaCT2448kfZJsuLn51JrTLymofObBG949m4H1eU/Q==
X-Received: by 2002:a05:6214:21ea:: with SMTP id
 p10mr21593510qvj.65.1642492378797; 
 Mon, 17 Jan 2022 23:52:58 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id w17sm9347975qtj.58.2022.01.17.23.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 23:52:58 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: benh@kernel.crashing.org
Subject: [PATCH] drivers/macintosh/ams: remove unneeded result variable
Date: Tue, 18 Jan 2022 07:52:52 +0000
Message-Id: <20220118075252.925616-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: CGEL ZTE <cgel.zte@gmail.com>, Zeal Robot <zealci@zte.com.cn>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from i2c_add_driver() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/macintosh/ams/ams-i2c.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/macintosh/ams/ams-i2c.c b/drivers/macintosh/ams/ams-i2c.c
index 21271b2e9259..d2f0cde6f9c7 100644
--- a/drivers/macintosh/ams/ams-i2c.c
+++ b/drivers/macintosh/ams/ams-i2c.c
@@ -256,8 +256,6 @@ static void ams_i2c_exit(void)
 
 int __init ams_i2c_init(struct device_node *np)
 {
-	int result;
-
 	/* Set implementation stuff */
 	ams_info.of_node = np;
 	ams_info.exit = ams_i2c_exit;
@@ -266,7 +264,5 @@ int __init ams_i2c_init(struct device_node *np)
 	ams_info.clear_irq = ams_i2c_clear_irq;
 	ams_info.bustype = BUS_I2C;
 
-	result = i2c_add_driver(&ams_i2c_driver);
-
-	return result;
+	return i2c_add_driver(&ams_i2c_driver);
 }
-- 
2.25.1

