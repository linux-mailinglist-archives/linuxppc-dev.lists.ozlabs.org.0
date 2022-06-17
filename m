Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83D54F27E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWnf52K2z3dx3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Z6soNT8y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Z6soNT8y;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWmz0CsCz3bpF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:05:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6hHSq
	JJtvj2gXC96rqDa7qDMN11c7zQ1mP+RJraEK9o=; b=Z6soNT8ycgZZEqp9j5xAu
	3qSelUpbBFUjwYHL8Lq50VOFX8zGklRg5jIQTVV7dlmMy6odEz9+nJcIWzbwheCa
	6gvoshjgX/XbLM2RdxBbjPNnDrcOLaZrq8UfoeUaGDgTRIzOEwLYb0cvSq8xgEWy
	8npL4v72GUVzGBMp3nrQJ0=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowACXMJKYNaxic+FcDg--.36620S2;
	Fri, 17 Jun 2022 16:04:41 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	nick.child@ibm.com,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: powernv: Fix refcount leak in opal
Date: Fri, 17 Jun 2022 16:04:39 +0800
Message-Id: <20220617080439.4010786-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowACXMJKYNaxic+FcDg--.36620S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw43XFW7Wry8ZF1ruw48WFg_yoW3Zrg_tw
	n7XayDur4rJr4vy3yDZw4fGFnrC3sxWF4DXr12q3W2kw13ta9xG39rtrW7G3WUurWjyrW3
	GFWDJrWDZaySvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRM3kuJUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BkjF1pEDvTRHwAAsb
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In opal_imc_init_dev(), of_find_compatible_node() will return a
node pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
--- 

 arch/powerpc/platforms/powernv/opal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 55a8fbfdb5b2..d86cc48a10aa 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -952,6 +952,7 @@ static void __init opal_imc_init_dev(void)
 	np = of_find_compatible_node(NULL, NULL, IMC_DTB_COMPAT);
 	if (np)
 		of_platform_device_create(np, NULL, NULL);
+	of_node_put(np);
 }
 
 static int kopald(void *unused)
-- 
2.25.1

