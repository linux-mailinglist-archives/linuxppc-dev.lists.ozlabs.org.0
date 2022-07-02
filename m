Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26EA563D90
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 03:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZZTL6FRxz3dvW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 11:38:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=lpnn/Jze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=lpnn/Jze;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZZSl05wTz3bmg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 11:37:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0FWxp
	TmK6PXVG9JTpDy5pHa33XHYcgjGizZxycrlUYg=; b=lpnn/JzeVGVS68CTWjnpX
	/eLf2LbeFnGwtWXBrZX1/18j0O8knfc3nz6fG9/lMjlmVx7VH7v6ii6xi/H4Ba4p
	cb7DqF1kP9pVxXUJ109AZTqKciMK8DJli4XYuLukWDbOSFOKaApAJX13xHHrcEWb
	thOXLMpxcI+iQ7Dix6l6RU=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgAXAmdLob9ijsUTHA--.62583S2;
	Sat, 02 Jul 2022 09:37:15 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH v2] powerpc: kernel: legacy_serial: Fix missing of_node_put() in add_legacy_soc_port()
Date: Sat,  2 Jul 2022 09:37:14 +0800
Message-Id: <20220702013714.263614-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgAXAmdLob9ijsUTHA--.62583S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1rKF4UAF4rtrWxWF4rZrb_yoW8WFWUpa
	n0grZ0yayDGrZ7WFy09r15XrWDKw1vk3y5Xw13Ka9Ykwn8Xr47AF1qvw1Yvry5ZFZ7WFyF
	9r45tF12kw1kGa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRYhF3UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgMyF1-HZa7hAgAAsM
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

We should call of_node_put() for the reference 'tsi' returned by
of_get_parent() which will increase the refcount.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: use more conservative way to call of_node_put()
 v1: mov 'of_node_put()' into the 'if' condition

 v1 Link: https://lore.kernel.org/all/20220701130203.240023-1-windhl@126.com/

 arch/powerpc/kernel/legacy_serial.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index f048c424c525..cca72081b864 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -166,7 +166,7 @@ static int __init add_legacy_soc_port(struct device_node *np,
 {
 	u64 addr;
 	const __be32 *addrp;
-	struct device_node *tsi = of_get_parent(np);
+	struct device_node *tsi;
 
 	/* We only support ports that have a clock frequency properly
 	 * encoded in the device-tree.
@@ -194,12 +194,17 @@ static int __init add_legacy_soc_port(struct device_node *np,
 	/* Add port, irq will be dealt with later. We passed a translated
 	 * IO port value. It will be fixed up later along with the irq
 	 */
-	if (of_node_is_type(tsi, "tsi-bridge"))
+	tsi = of_get_parent(np);
+	if (of_node_is_type(tsi, "tsi-bridge")) {
+		of_node_put(tsi);
 		return add_legacy_port(np, -1, UPIO_TSI, addr, addr,
 				       0, legacy_port_flags, 0);
-	else
+	}
+	else {
+		of_node_put(tsi);
 		return add_legacy_port(np, -1, UPIO_MEM, addr, addr,
 				       0, legacy_port_flags, 0);
+	}
 }
 
 static int __init add_legacy_isa_port(struct device_node *np,
-- 
2.25.1

