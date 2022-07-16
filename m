Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157C576C59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 09:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlKgT0F7nz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 17:32:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=aPAbq0EF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=aPAbq0EF;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlKfn6RpZz3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 17:31:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=69YC/
	JjhEmsgy/fH/6Jtn8dKaXpRVuS2ZUNEjzafsqM=; b=aPAbq0EFHpfVyMaivT5vY
	4FG5Oi6weZFhJj3LD7ojPwnNl2QN8DowTIGav6QN9tr85nYxX/rVf72mEPumvnqo
	yvL2pbYVD1lFZhcM4Est98/wFXc102gDdJGKlZMDA3jXsWdA2GkUccM9o4ZYdW7A
	O8mcPzqkznIeKDjlUje1gk=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgD3XYJAadJiMVSMGg--.22053S2;
	Sat, 16 Jul 2022 15:31:13 +0800 (CST)
From: Liang He <windhl@126.com>
To: benh@kernel.crashing.org,
	mpe@ellerman.id.au,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/powermac/pfunc_base: Fix refcount leak bug in macio_gpio_init_one()
Date: Sat, 16 Jul 2022 15:31:11 +0800
Message-Id: <20220716073111.539739-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgD3XYJAadJiMVSMGg--.22053S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4UZF4rAw15uryUCrWxJFb_yoWDXFc_Ja
	yxGa9rCr4kGr4qvFnFyFy5Grn2k3s3ArWUGF4jqan2y3W5X398GwsrArW3W3W7urWayFZ8
	GFsYkFZxAa4SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKFApDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QRAF1pEAaLrFQAAs9
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

We should call of_node_put() for the reference 'gparent' escaped
out of the for_each_child_of_node() as it has increased the refcount.

Fixes: 5b9ca526917b ("[PATCH] 3/5 powerpc: Add platform functions interpreter")
Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powermac/pfunc_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powermac/pfunc_base.c b/arch/powerpc/platforms/powermac/pfunc_base.c
index 9c2947a3edd5..085e0ad20eba 100644
--- a/arch/powerpc/platforms/powermac/pfunc_base.c
+++ b/arch/powerpc/platforms/powermac/pfunc_base.c
@@ -136,6 +136,8 @@ static void __init macio_gpio_init_one(struct macio_chip *macio)
 	for_each_child_of_node(gparent, gp)
 		pmf_do_functions(gp, NULL, 0, PMF_FLAGS_ON_INIT, NULL);
 
+	of_node_put(gparent);
+
 	/* Note: We do not at this point implement the "at sleep" or "at wake"
 	 * functions. I yet to find any for GPIOs anyway
 	 */
-- 
2.25.1

