Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47B479819
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 03:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JG8F54tVyz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 13:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bpyyDNic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bpyyDNic; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JG8DR5LLKz2xWr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 12:59:33 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id m15so3758139pgu.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 17:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vVlk8piyOncRQf0Vy0aH37o8z8Dj5DxGoG5amdt9lsA=;
 b=bpyyDNicyNZYeQ+gK+FvcGv4/vRMQil0DH4TDuR4cKiKlyAFhGQRIa78YZAx4MuL2i
 Z4xrwgXbryvlBKG0np+AylvkDBL/V6Rs47TkAPylafPvGrJngqPtR+rYxKh9zWf7uC+5
 tmRuzeCVKGWiI+ZLbsUe3eyBpuyUD4SQMH8KOtrXLKb03tmflDEYpMw53ZLAtVa4fV3Q
 39WgCRUY1OuOfhRmw51pWaA4vWxKZpFgS8K2jfIh3whoyZ5OWwohwxgZPvyhUkSZX1t7
 W634r6Npj0gqE5liOcqRj30I3IZjK3+psNfAbNNqgkUja6/VsH34R4xJp1pQQSUiFr+B
 Sicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vVlk8piyOncRQf0Vy0aH37o8z8Dj5DxGoG5amdt9lsA=;
 b=aCFf9Z+PbW4ekLUQJ3KPFQkcRdQgKniKFBgVxjseSeuCqsY0TcdDq2DWvzrceFV1dw
 jJuGyInZKhqaqPlpwkSY0WTsXuvSUwmRC8+xSnyv/E3XpZsM9ql5j9uZQepmO3SXmI2p
 ByaoAQwMXF4MMYtTG+6bCYK/eloiguDpVL3dK9NK4rrqa4LWfLTXWQfwPDm2A+sxYfA9
 RfNuw0HyRUkFbKXa0u+K2alRHGfAHnN/t1FzSViXYBHgfEIklq846x/UyY8KyILlw9Mh
 A6gbuaXSOAQRCVrKBnPnxck5bjWzGviyZwWZQzCb6l+mJI1Ig1vx6z1+m5B1b1puCAiI
 vuvw==
X-Gm-Message-State: AOAM531AtedmrwwZijfndwDqEFbTbk2ZhMBi/zqcYyFojpwqSadVQ8Ql
 71HKw6ZoQsvGZQ9LzZN+Mm8liEFieAc=
X-Google-Smtp-Source: ABdhPJyBqCekNiUjEspqKM7jETsY9zDQI35fJmq1qyL1ZOX0v7lNOqbOqPrESNTQqHfSxBvS3OrFXg==
X-Received: by 2002:a05:6a00:22c3:b0:4b6:197:ae5a with SMTP id
 f3-20020a056a0022c300b004b60197ae5amr5729243pfj.42.1639792769011; 
 Fri, 17 Dec 2021 17:59:29 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id mm22sm9613733pjb.28.2021.12.17.17.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 17:59:28 -0800 (PST)
From: davidcomponentone@gmail.com
To: benh@kernel.crashing.org
Subject: [PATCH] powerpc: use swap() to make code cleaner
Date: Sat, 18 Dec 2021 09:59:17 +0800
Message-Id: <71a702c2189b16c152affd8a8cda1d84ce32741c.1639792543.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
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
Cc: Zeal Robot <zealci@zte.com.cn>, davidcomponentone@gmail.com,
 linux-kernel@vger.kernel.org, yang.guang5@zte.com.cn, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>
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

