Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C890B1CA276
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:57:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JJ3L6xJKzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:57:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dxqMyw0I; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHYH3kLgzDqxd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:43 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id z6so174875plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BavkCXXBPLsHz7DK2WchGGo+futkgbG2beHrx+B+SBY=;
 b=dxqMyw0ISwjTWucpQDIvKuOx0BkGHb20hr70yWLg7JJtCadJF20Le5oJTbqh39XHrb
 oh2eRlo6auvzVDKZYwlV+XcZUbmvcsJFPhPSonvQKBH//N1KyFtA3/988ud2X/w74jy3
 Y+AILv26q1OjT0T94Y/73d3bXEsejjWpAqLm2GxcSOgkvTdPq5ytmdKuNx9Vk9Rw9S+a
 d+GmTzgzjc/wthB8MdXXzvCW9PYxqXD+R5jcp9n64/ISH+m1bM+o7YEavj0PkK4DSbsB
 F2a3IDjfLcLoQodFlNs08ojixRrygsmsJHx+GQlSU0ya/KuBCH0/BTMCDVthesp2Jc+3
 MPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BavkCXXBPLsHz7DK2WchGGo+futkgbG2beHrx+B+SBY=;
 b=TqbDL636EktanLZFU29zT2mH1oXticINdJkuulpfF/ju3R7ztS6s22wYcHdVFzlMCu
 mkuKNntRCx3pEdsJfGGUARLTLC5P0oH3Dhly2NcIm2NYFboAmsOZGYmoVOBdlk0VVN1d
 62rEld4XQH8lr+19F7l1fFzqgKBo0lqZaZS0hax0JGVqMJfX5XHHAPpQbCHMH5mWIi8S
 fqmHxmGMX0feY0/PL5kqDoXwGvzXoHAp7ETwt9zEdYnKrWAaFGpM9k/zAhgpF1dOqIGn
 jlAuWdJqGdLfhRxjZd4n+4XtsGd1PIJwXCGog/XMciy4Z+okW3pV5zwdtU6M6V/RdumE
 GdwA==
X-Gm-Message-State: AGi0PuaqdVyxoxwFeOYyihDzMxFGFhP2xDFiB6kxWSwt4TPCJ8QVjqAi
 b/qMWU9qdwGe+j7TnzOcI1kcLIdZ
X-Google-Smtp-Source: APiQypIqF3bMlkktX4s/5D0WjLl1b4iL1Ep1TJjhWAzNmrr/8WaTEuvHJeX/QQffI/pWiKlA/p/vrQ==
X-Received: by 2002:a17:90a:7482:: with SMTP id
 p2mr3718582pjk.151.1588912480818; 
 Thu, 07 May 2020 21:34:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/16] powerpc/pseries: machine check use
 rtas_call_unlocked with args on stack
Date: Fri,  8 May 2020 14:34:02 +1000
Message-Id: <20200508043408.886394-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the previous patch, machine checks can use rtas_call_unlocked
which avoids the rtas spinlock which would deadlock if a machine
check hits while making an rtas call.

This also avoids the complex rtas error logging which has more rtas calls
and includes kmalloc (which can return memory beyond RMA, which would
also crash).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index b2adba59f0ff..ce1665e58d9b 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -468,7 +468,15 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
+	struct rtas_args rtas_args;
+	int ret;
+
+	/*
+	 * On pseries, the machine check stack is limited to under 4GB, so
+	 * args can be on-stack.
+	 */
+	rtas_call_unlocked(&rtas_args, ibm_nmi_interlock_token, 0, 1, NULL);
+	ret = be32_to_cpu(rtas_args.rets[0]);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
-- 
2.23.0

