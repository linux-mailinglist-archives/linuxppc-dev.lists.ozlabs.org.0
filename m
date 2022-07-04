Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E465658E9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 16:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc7w62SF1z3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 00:48:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=RgYkusPx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=RgYkusPx;
	dkim-atps=neutral
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc7vN3K6vz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 00:47:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LoDgg
	WBPq1p0hm9kmOvqW003/tbfQuwyqZOi9JgwzWE=; b=RgYkusPxkXqOfakQ+V/yT
	xUYhpv4paqHDgEMLLb6ha+7xBemnZWfuvyb8Cpdle4OVjO9RQlM++F6SWkRwXB8h
	g/Q7/P1wq9DmWHScgMidM8Znmj9y2oZ5DT3DI8DHNt4xFuJ6D9NejFnkD/cu4GuV
	Ovvsa2E11jSLxnLwxnU7Ak=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowACH8v5L_cJiCIFrEQ--.21616S2;
	Mon, 04 Jul 2022 22:46:37 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc: fsl: gtm: Remove of_node_get() in fsl_gtm_init()
Date: Mon,  4 Jul 2022 22:46:35 +0800
Message-Id: <20220704144635.278394-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowACH8v5L_cJiCIFrEQ--.21616S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrykGw4Duw48JFyDAFW7twb_yoWfZrX_Ga
	97ZFyDZrs5Jr4Ikas3Can5Gw15Ww4xXrWxKr1kZw1xJa45t398trWkWr4UJr1UXr4vyrW5
	GrZ5ta9ak3yFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtqXHDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2g00F1uwMVxUMAAAsW
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

for_each_compatible_node() will automaitically increase and decrease
the refcount of the device_node object. There is no need to call
additional of_node_get(). It is better to keep the original meaning
of refcounting as there is no any new reference created.

Signed-off-by: Liang He <windhl@126.com>
---
 I do not understand the whole story of the gtm, so maybe we want to
keep the object always alive by using additional refcounting. Please
check it carefully.


 arch/powerpc/sysdev/fsl_gtm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 39186ad6b3c3..e13ebd2be416 100644
--- a/arch/powerpc/sysdev/fsl_gtm.c
+++ b/arch/powerpc/sysdev/fsl_gtm.c
@@ -423,7 +423,6 @@ static int __init fsl_gtm_init(void)
 
 		/* We don't want to lose the node and its ->data */
 		np->data = gtm;
-		of_node_get(np);
 
 		continue;
 err:
-- 
2.25.1

