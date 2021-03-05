Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C1E32ED5C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 15:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsVrp4tK2z3dLl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 01:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=i5OeG022;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.18; helo=m12-18.163.com; envelope-from=angkery@163.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=i5OeG022; dkim-atps=neutral
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsVr845Syz3cRW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 01:44:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KzhyB
 nsVYnUhSOfd6PhuhP5B+5Mmhp9jN22Vts2dIoY=; b=i5OeG022sIcyGrnl/RZuL
 H0nHNHJY95dX0DTwVUO07Ur1TePg45EFfzRmEhqIN8ZEW4wsomd7+yvWOOXtt/Ej
 IXrTlhFec9RANur2fWN+I9Sl0Y6w4o4BfAuhhklpLHKOu6Df5IwzkNfuMl3wjXKy
 x+ocKuvhmFVugFpJsEkBuY=
Received: from yangjunlin.ccdomain.com (unknown [119.137.55.151])
 by smtp14 (Coremail) with SMTP id EsCowADn8hnAP0JgTzXQXA--.15144S2;
 Fri, 05 Mar 2021 22:27:13 +0800 (CST)
From: angkery <angkery@163.com>
To: leoyang.li@nxp.com,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] ethernet: ucc_geth: Use kmemdup instead of kmalloc and memcpy
Date: Fri,  5 Mar 2021 22:27:11 +0800
Message-Id: <20210305142711.3022-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowADn8hnAP0JgTzXQXA--.15144S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1DGFyDKrW5GF4DGFyfJFb_yoWDAFcEkr
 WfZrWYgr4jgFn2vw4a9w47Z340k3WkXrn5X3WSgFW5Ar9rZr15Wrs7Zr1fJwnxWF4I9FyD
 Ar1xt34xA348tjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn3PEDUUUUU==
X-Originating-IP: [119.137.55.151]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbBFAFMI1aD+lu31AAAst
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Junlin Yang <yangjunlin@yulong.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Junlin Yang <yangjunlin@yulong.com>

Fixes coccicheck warnings:
./drivers/net/ethernet/freescale/ucc_geth.c:3594:11-18:
WARNING opportunity for kmemdup

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index ef4e2fe..2c079ad 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3591,10 +3591,9 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	if ((ucc_num < 0) || (ucc_num > 7))
 		return -ENODEV;
 
-	ug_info = kmalloc(sizeof(*ug_info), GFP_KERNEL);
+	ug_info = kmemdup(&ugeth_primary_info, sizeof(*ug_info), GFP_KERNEL);
 	if (ug_info == NULL)
 		return -ENOMEM;
-	memcpy(ug_info, &ugeth_primary_info, sizeof(*ug_info));
 
 	ug_info->uf_info.ucc_num = ucc_num;
 
-- 
1.9.1


