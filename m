Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F925501C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 03:58:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPzZf06V4z3cB7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 11:58:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VwIAfyMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VwIAfyMA;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPzYy12b5z3bdY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 11:57:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kk5pK
	Hd/2mIBIK8MdK5R9s8Uq/oarlTlmc5aNu1O+CA=; b=VwIAfyMA2jVL4JYqokrTX
	luiPKA19cIyiVJNT0wgny1XLq0tEAWpM+x0hV9kanQyE9m1fN3/wBRUWofI8+vVS
	omTpXwwt9ntk/vRtz7AZGQKAdXAsNYQ7aRCEd8wp5Wg15YZQ/RBYIEt+lg5H65tu
	pPzuGLwdWBBQidD4vn61Sc=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgB3jMHWMK1iA1L9Ew--.45551S2;
	Sat, 18 Jun 2022 09:56:39 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	npiggin@gmail.com,
	clg@kaod.org,
	haren@linux.ibm.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: powernv: opal-core: Fix refcount leak bug
Date: Sat, 18 Jun 2022 09:56:37 +0800
Message-Id: <20220618015637.4055531-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgB3jMHWMK1iA1L9Ew--.45551S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Gry3ZryrXryUWr4rZrb_yoW3urb_Kw
	1xJa47Jrs5Gr4vva4Duw4fWr1qv3s3Grs8Gr1Iq3ZrtFy3ta9xGw47JrWUW3WDurZFyrZ8
	GFZ3trsrCa4SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj2jgDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QUkF1pEAONKeAABsV
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

In create_opalcore(), of_find_node_by_name() will return a node
pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powernv/opal-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index adcb1a1a2bfe..bb7657115f1d 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -348,6 +348,8 @@ static int __init create_opalcore(void)
 	if (!dn || ret)
 		pr_warn("WARNING: Failed to read OPAL base & entry values\n");
 
+	of_node_put(dn);
+
 	/* Use count to keep track of the program headers */
 	count = 0;
 
-- 
2.25.1

