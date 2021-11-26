Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B5445E728
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 06:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0jmV0jT8z3cJS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 16:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qj4vRc4M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qj4vRc4M; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0jls0rV2z2xWj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 16:21:44 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso7257896pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 21:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Pug1pGYsi38hxanpCJr5EcsdO8jWU6cX0mu5Pc2ZvM=;
 b=qj4vRc4MxPGq/G1UlFfIKBCSXQpB90rexyEGYp5FGaci8Sk9Cqyljhe45BeLnM0UUx
 y9C3a4WJVtrO0QuBbnsigF1sJ1dY0xKH96R5BGfTj4psn56pS8dLARIDkoJvLwt4m213
 q1RVgzrEJiYxyvWxAHninjp0VtJVzz+G44YzN/x/+9xVoCrfP6OYvxolUnP00YcvK2fZ
 lmTZdT3035846xBRGHWuJvbcc3JMRGrKPyzVhaaY96DUWzUp3X8c6AT1v6tm1jMfJ4Ct
 I/0g6Jcb1ZXkuVM9nV4snjeFqhEmBVKGEksjsuFxLKd5Gelva1YSNGw6Xgfi0eIEHeLs
 n7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Pug1pGYsi38hxanpCJr5EcsdO8jWU6cX0mu5Pc2ZvM=;
 b=rwztizMonGHQ85zYyRV3BxocmYHG26MagCZZKwh78nEWZGQhna0BdycPDBdn2ZmkJd
 uj/Xqw+ANN/PiNPs8Xufn0L5HfCXnlPrQXUzAovhpDIYGZ2ZOghrDqvLYwF7n0W6QQsZ
 6mmji2P+Ruo7Cqb60EDq26b2fg2HpCKuY7jI0dfqIls3LXi90P+MV72oPgiD69vdjSaL
 RXUwld/BqOT9Cu1/X4he0gQrEvBC7crrB+k6pgAo5in/NLFR59BjP0xLDH7zWX73k66h
 CTC72JmQMjHFuYIhkOyUbOoVbDFT3O/x9q63jEmNj51e4fAZyQIwKzN3HSUpa7ORfIjv
 0NTg==
X-Gm-Message-State: AOAM5333EiDhaBZwXUPv/xXa82hk4zAeLAkouBopdQo61YikLPVWi7aW
 6fA2liSVM93ShLCY+pR8PtA4+VCUT8g=
X-Google-Smtp-Source: ABdhPJwj/0YFzjON8nOsf91/WDhfyhpO7XMeBtEnP7Px183RghkjVhZsQxIl0TTiQRYa+iQ01r+c3Q==
X-Received: by 2002:a17:90b:3b45:: with SMTP id
 ot5mr13104412pjb.235.1637904099890; 
 Thu, 25 Nov 2021 21:21:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id j15sm5292336pfh.35.2021.11.25.21.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 21:21:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
Date: Fri, 26 Nov 2021 15:21:33 +1000
Message-Id: <20211126052133.1664375-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM does not support VAS so guests always print a useless error on boot

    vas: HCALL(398) error -2, query_type 0, result buffer 0x57f2000

Change this to only print the message if the error is not H_FUNCTION.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/vas.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index b043e3936d21..734523e2272f 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -151,8 +151,15 @@ int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64 result)
 	if (rc == H_SUCCESS)
 		return 0;
 
-	pr_err("HCALL(%llx) error %ld, query_type %u, result buffer 0x%llx\n",
-			hcall, rc, query_type, result);
+	/* H_FUNCTION means HV does not support VAS so don't print an error */
+	if (rc != H_FUNCTION) {
+		pr_err("%s error %ld, query_type %u, result buffer 0x%llx\n",
+			(hcall == H_QUERY_VAS_CAPABILITIES) ?
+				"H_QUERY_VAS_CAPABILITIES" :
+				"H_QUERY_NX_CAPABILITIES",
+			rc, query_type, result);
+	}
+
 	return -EIO;
 }
 EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
-- 
2.23.0

