Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D6576C4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 09:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlK8M4Gfrz3bwL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 17:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YmlRZEaa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YmlRZEaa;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlK7m2Hrjz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 17:08:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=G4+E4
	sZ9N86jww+cwk3X8PcwDDray6y5sBGpO/F5BTY=; b=YmlRZEaa7gxSlT3/zre+N
	3R9NHRjklfMkwung82GmSKed2OAjv/CRxZ36ITDZx5t6OaruODbc7En5a5eb4MGy
	QQ5sfs2vM3SHZUmnnWu2tP81Uhygpy0UXeBQajLRsdUR4/4CCZYH9+wGf2kHPyov
	bQxD/sHJtV9AbDBDzej4FA=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgB3KsfPY9JiMZntGg--.65219S2;
	Sat, 16 Jul 2022 15:08:00 +0800 (CST)
From: Liang He <windhl@126.com>
To: benh@kernel.crashing.org,
	mpe@ellerman.id.au,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/powermac/low_i2c: Fix refcount leak bug in kw_i2c_probe()
Date: Sat, 16 Jul 2022 15:07:58 +0800
Message-Id: <20220716070758.539434-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgB3KsfPY9JiMZntGg--.65219S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyrGw45CF13CF13ZF45GFg_yoW3tFb_Jw
	n7GF9rCrs3ArsY9Fn0vFy5Wr1rJr98J3WUGF1jqay3Ja45XayDGw4UC347Way7urWYv39x
	GF95Kr9xAayFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU_WrtUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RBAF1pEAaLUpAAAsn
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

We should call of_node_put() for the reference 'parent' returned by
of_get_parent() which has increased the refcount.

Fixes: 730745a5c450 ("[PATCH] 1/5 powerpc: Rework PowerMac i2c part 1")
Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index c1c430c66dc9..40f3aa432fba 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -627,6 +627,7 @@ static void __init kw_i2c_probe(void)
 			if (parent == NULL)
 				continue;
 			chans = parent->name[0] == 'u' ? 2 : 1;
+			of_node_put(parent);
 			for (i = 0; i < chans; i++)
 				kw_i2c_add(host, np, np, i);
 		} else {
-- 
2.25.1

