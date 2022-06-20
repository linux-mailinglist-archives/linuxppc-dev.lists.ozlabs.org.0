Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5755510D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 09:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRLBn6Ks8z3cdR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:00:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=CusHPqPl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=CusHPqPl;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRLB66Qp7z2yyS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 16:59:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=rrUy8
	XGu3e+/ILt03Hg9IlftHrlur0yWCNGeTEkRI6M=; b=CusHPqPl5JOMrEv7XEtTZ
	o00KAwh1QFGQCA+at6USDex9sPF0ChPYw42yOJ61rxVhXhJwSmapXIJuAWIY6JZ6
	dT9m9Xs+0JEb9PdbpfryFNOu/qMJ7VZK1HdXPGBdyYUOsfvHU8E02kDJXabcpNkJ
	FYtQYFnCbsNh96Nwhqdn4U=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowADHbJ24GrBip+MJDw--.50574S2;
	Mon, 20 Jun 2022 14:59:05 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc/embedded6xx/ls_uart: Add missing of_node_put()
Date: Mon, 20 Jun 2022 14:59:04 +0800
Message-Id: <20220620065904.4071787-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADHbJ24GrBip+MJDw--.50574S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF48Gr4fKFWxZry5XryxKrg_yoW3AFX_Aw
	n7Ca17CF4rXa1qvF1DAF1rGrn7JFZrWrWUCF1Iq3W2va4rWw15ArW3JFWUWa4UX3y2krW3
	Ga1qy3sFkayFyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREqg4PUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhomF18RPVR8IgAAsc
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

In ls_uarts_init(), we need to add a of_node_put() to keep refcount
balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/embedded6xx/ls_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/embedded6xx/ls_uart.c b/arch/powerpc/platforms/embedded6xx/ls_uart.c
index 0133e175a0fc..4ecbc55b37c0 100644
--- a/arch/powerpc/platforms/embedded6xx/ls_uart.c
+++ b/arch/powerpc/platforms/embedded6xx/ls_uart.c
@@ -124,6 +124,8 @@ static int __init ls_uarts_init(void)
 	avr_clock = *(u32*)of_get_property(avr, "clock-frequency", &len);
 	phys_addr = ((u32*)of_get_property(avr, "reg", &len))[0];
 
+	of_node_put(avr);
+
 	if (!avr_clock || !phys_addr)
 		return -EINVAL;
 
-- 
2.25.1

