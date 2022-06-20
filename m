Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67086551FB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRY0J1gJjz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:07:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=hIFaMkjZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=hIFaMkjZ;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRXz62cHbz305g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 01:06:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=iA2Mn
	nlzAEpFDhxkWEJlYWNAO42/7pAOTSs6VKFn8h8=; b=hIFaMkjZA83gBHUgBxLFv
	bo4DYbHqt4wJHonpgwWo0t9P88z93KtSXj5aLLhUpOwO39KMUMczzpLlJKCMYtWA
	x59NdFXMPLh9gS5lqWRZtKSJGv8IUBNZitAfP57Yjr0LdwCE3zxwTij+K2r5RNt0
	jwq9nKXx/OT9avSJzplCeE=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowAD3_ByujLBiHekQFA--.9514S2;
	Mon, 20 Jun 2022 23:05:19 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	clg@kaod.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/powermac: Fix refcount leak bug
Date: Mon, 20 Jun 2022 23:05:18 +0800
Message-Id: <20220620150518.4074910-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAD3_ByujLBiHekQFA--.9514S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF4UCFy5AFy5KF4xZr17Awb_yoWxCFc_Jw
	4xWF47ur4kJr4qvr1DZFW3Wr15A3sxJr48Kr1v93W2vw15Xwn8Ww47JrW7Ka1UZrZ0yFW3
	Ja97KwsxAa4SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFksPUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RAmF1pEAPZ94wAAs6
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In smp_core99_setup(), we need to add of_node_put() to keep refcount
balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powermac/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index d9df45741ece..5b26a9012d2e 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -711,6 +711,7 @@ static void __init smp_core99_setup(int ncpus)
 			printk(KERN_INFO "Processor timebase sync using"
 			       " platform function\n");
 		}
+		of_node_put(cpus);
 	}
 
 #else /* CONFIG_PPC64 */
-- 
2.25.1

