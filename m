Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579658628D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 04:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lx26k2pj1z3bXR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 12:26:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ftsjD0vs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ftsjD0vs;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lx2645wkmz2xGf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 12:25:30 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id x2-20020a17090ab00200b001f4da5cdc9cso3613288pjq.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jul 2022 19:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=EVBoyRWZigkccBsvB4uh5xlF3s1rJUHBaQVZeXyiy68=;
        b=ftsjD0vsSTdUSAtjICFc5VLtK0DuMYkrCipIK+3xEfRxuyD1Ft8rbDG6h7znNIGZEO
         WoJEJhUexPRnABkElPICbvzjXRskN321/XNAg23r+B39jp80ez3MokGqdQQtJck9iZ4K
         eDBDmVgYaewLCsen0tyj/lArm+ARV7m5VG2aIHI8EMdV0Uc3n+8AH0xeA/aGZgMCE5ZX
         akdSIHJybpWhvQpgpUqrdqIkWcx8eSvPO/F/ZZlmP3zJwlAdQ0MD19iZhLapgnMd6/1J
         jBibAJdg61wUlTdjjAhXqErmpEbjAkqwUYx7t/oPSCgh7YrB9JY3J2o5XKhWksFs0XNo
         reFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=EVBoyRWZigkccBsvB4uh5xlF3s1rJUHBaQVZeXyiy68=;
        b=Nh6e6OC8Eqf4bSivnk6THqLiIQ+gTVnpoX3RP/EboLz8nJ/l8yIyk90logQmUzRAsD
         ZYdDBrVBVFsDAWsdKW+b3HaN87l0/DkCNGGai3324UquslfhRGHM4/TZoJ/BwFIAw8vF
         xMPir8oGoqrRzJ1OmNdKaoqLQ4q/iyOL6w9oJxCSN53X09UdLkPKTSyrdnvveCu81NZ6
         FdxP4jDpQ1Q6o4p75FRJAEklnODsfVroug9Pmu8E6SVQnS2i/oYKDkyDSo3Du5HJkhEC
         EJPg/RLAu3kdbseSVd4UjURaqMHXhRRzUOt9YOLRxWIUP7wfBxBFwnWSWdSKvgtmGEeq
         Yi/A==
X-Gm-Message-State: ACgBeo3bDUEGqmrnYnXDNtn2Cjh2PziDfOHFWdpjNSSZL4oaDcqiMnFz
	cTVBgpB6zUW5IyFpHjA9AuQ=
X-Google-Smtp-Source: AA6agR7aNyMg2Wo2Fkh9Ql/YgG/B+msUN4m1xsfJUklb5q1MqEExamxbZAzRou9ZYayAxJPO6Dikrw==
X-Received: by 2002:a17:902:8502:b0:16c:c5c5:a198 with SMTP id bj2-20020a170902850200b0016cc5c5a198mr14528236plb.88.1659320725884;
        Sun, 31 Jul 2022 19:25:25 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a950300b001f21a8f7f14sm7431098pjo.9.2022.07.31.19.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 19:25:25 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] macintosh:adb:recordmcount:use !E in conditional statements
Date: Mon,  1 Aug 2022 02:25:21 +0000
Message-Id: <20220801022521.1594464-1-ye.xingchen@zte.com.cn>
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Use !E to replace the type of x == 0. This change is just to 
simplify the code, no actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/macintosh/adb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
index 1bbb9ca08d40..368ab25db234 100644
--- a/drivers/macintosh/adb.c
+++ b/drivers/macintosh/adb.c
@@ -673,7 +673,7 @@ static int adb_open(struct inode *inode, struct file *file)
 		goto out;
 	}
 	state = kmalloc(sizeof(struct adbdev_state), GFP_KERNEL);
-	if (state == 0) {
+	if (!state) {
 		ret = -ENOMEM;
 		goto out;
 	}
-- 
2.25.1
