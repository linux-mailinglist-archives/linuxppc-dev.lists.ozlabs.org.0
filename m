Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F655091E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 09:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQkn70PDwz3cYd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 17:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=FcLMt2dE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=FcLMt2dE;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQkmR4SjGz3bYk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 17:24:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NF568
	0tDdMiZ6LPuk7ol+HY0gthMgl2QF1lEjUWZXaY=; b=FcLMt2dEtXKwvITan3REv
	SslneB6F17NBGWNf3hBLpln6Hoyqy50x5Y8YkzSNdRvOmCQZiZqlDBzXkOjG8iVJ
	xgRINTW/+d77WNJdkfRK+p+mfmacyT2frFZ5tb8V14h/LIMcXy2ZSRGkZDfKiP1n
	MeAuKGARkdK2SA49/Wxsa0=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgB3xnL4zq5ikhTbFw--.650S2;
	Sun, 19 Jun 2022 15:23:37 +0800 (CST)
From: Liang He <windhl@126.com>
To: jk@ozlabs.org,
	arnd@arndb.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc/cell: Fix refcount leak bugs
Date: Sun, 19 Jun 2022 15:23:35 +0800
Message-Id: <20220619072335.4067728-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgB3xnL4zq5ikhTbFw--.650S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWfJrW3ZF17CFykuF1Utrb_yoW8AFWrpF
	1qkFZ7Cr10gr4vya4Iv3WDur4ayFnYqrW8Jw47A3srAwn3Xr97Xr4rAF1xCrs7Jr48Gayr
	Zr43Ka1SvFs3ua7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UI385UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BklF1pEDwJK0wAAs9
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

We should use of_node_put() for of_find_node_by_path() and
of_find_node_by_phandle() to keep refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/cell/setup.c       | 2 ++
 arch/powerpc/platforms/cell/spu_manage.c  | 2 ++
 arch/powerpc/platforms/cell/spufs/inode.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index 52de014983c9..47eaf75349f2 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -167,6 +167,8 @@ static int __init cell_publish_devices(void)
 		of_platform_device_create(np, NULL, NULL);
 	}
 
+	of_node_put(root);
+
 	/* There is no device for the MIC memory controller, thus we create
 	 * a platform device for it to attach the EDAC driver to.
 	 */
diff --git a/arch/powerpc/platforms/cell/spu_manage.c b/arch/powerpc/platforms/cell/spu_manage.c
index ae09c5a91b40..f1ac4c742069 100644
--- a/arch/powerpc/platforms/cell/spu_manage.c
+++ b/arch/powerpc/platforms/cell/spu_manage.c
@@ -488,6 +488,8 @@ static void __init init_affinity_node(int cbe)
 				avoid_ph = vic_dn->phandle;
 			}
 
+			of_node_put(vic_dn);
+
 			list_add_tail(&spu->aff_list, &last_spu->aff_list);
 			last_spu = spu;
 			break;
diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 34334c32b7f5..320008528edd 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -660,6 +660,7 @@ spufs_init_isolated_loader(void)
 		return;
 
 	loader = of_get_property(dn, "loader", &size);
+	of_node_put(dn);
 	if (!loader)
 		return;
 
-- 
2.25.1

