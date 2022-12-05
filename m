Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914C6425C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 10:26:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQdV76zqXz3bc6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 20:26:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=RGWo3LCt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.241; helo=m126.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=RGWo3LCt;
	dkim-atps=neutral
X-Greylist: delayed 1818 seconds by postgrey-1.36 at boromir; Mon, 05 Dec 2022 20:26:05 AEDT
Received: from m126.mail.126.com (m126.mail.126.com [123.126.96.241])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQdT90j1vz3bT0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 20:26:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VVr6c
	z/DsVQPKxpTQOoEtqMxD6WoHYVqghaTl7GghVk=; b=RGWo3LCt+ofwdQMw/3+Vm
	kCrSEjjLpanb2MP65Ca46ujFMebZSffnL9LuiyxAnpyen/u+i32Fx8XLtUOw1N2f
	bknlQRt5JIFLS480YWJplfyRi+F0NQmuyJSF5PAXWXyfDtFebzKA0BaxiH+8wGCa
	ufY5UfdKUjAbxbMXyQ8rmQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp14 (Coremail) with SMTP id fuRpCgDn7vrOsY1jITp0AQ--.16962S2;
	Mon, 05 Dec 2022 16:54:40 +0800 (CST)
From: Liang He <windhl@126.com>
To: timur@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-serial@vger.kernel.org,
	windhl@126.com
Subject: [PATCH] serial: ucc_uart: Add of_node_put() in ucc_uart_remove()
Date: Mon,  5 Dec 2022 16:54:37 +0800
Message-Id: <20221205085437.1163682-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: fuRpCgDn7vrOsY1jITp0AQ--.16962S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF43Kw1kAFWUCFy8Cr1UGFg_yoWxtFc_C3
	s7Ww1xAr18CF4jgFsrJr43CrWYy3ykZF4rZ3W0qr95Wryjvr4xAFyqgr9FqrnF9rWjvFW7
	Gr4Du34jkF4UZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM8n57UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BDOF1pEEqo8DAAAsD
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

In ucc_uart_probe(), we have added proper of_node_put() in the failure
paths. However, we miss it before we free *qe_port* in the remove() function.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/tty/serial/ucc_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 82cf14dd3d43..461d54de6351 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1469,6 +1469,8 @@ static int ucc_uart_remove(struct platform_device *ofdev)
 
 	uart_remove_one_port(&ucc_uart_driver, &qe_port->port);
 
+	of_node_put(qe_port->np);
+
 	kfree(qe_port);
 
 	return 0;
-- 
2.25.1

