Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A15633E8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 15:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZFkL1sFWz3dvr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 23:03:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=hCjUj30Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=hCjUj30Y;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZFjj1qrdz30BP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 23:02:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WDrhj
	NSQOg6ZHKq7XKEtHdsCXH0+sOV/HAPM3ldG448=; b=hCjUj30YL294NbG+1f/ld
	8B4HPMtvw5j4LnPxmfWNqIDSAudboxQOiZeYYKHs1oEnMb6yK9eqObvI04Bhfu0x
	kqrdRszGzzyappT1Hkz+p+vikoWr+4v6eZ8yCf/9jDg8V3G6nwYc2H2Eevuoq1TQ
	y/mQjLi8Ao2Oj4rtXQOSG4=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgCX5XFM8L5igQJQFw--.47428S2;
	Fri, 01 Jul 2022 21:02:05 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc: kernel: Fix missing of_node_put() in add_legacy_soc_port()
Date: Fri,  1 Jul 2022 21:02:03 +0800
Message-Id: <20220701130203.240023-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgCX5XFM8L5igQJQFw--.47428S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1rKF1DXFWrZr18tr17trb_yoW8Xw4rpF
	s0grWYkrWDKrZ7Way09asxXrWqgwn5CrWFqw17GasYkrn8XrZFqF1Duw1jgry5ZFWkWFyF
	9r45tr12kwn7GFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEtxhxUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgUxF1-HZayg+wAAsz
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
 Inserting of_node_put() in the 'if' condition is learned from Orsan:
 https://lore.kernel.org/all/CA+H2tpH1hN1AJ=6vVGQXw6bZ7xQDbzXdaEV_OqWMnw+UxQKCkg@mail.gmail.com/

 I move the of_get_parent() just before its first usage, otherwise, we
 need lots of of_node_put() before the 'return'.

 arch/powerpc/kernel/legacy_serial.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index f048c424c525..c7e9d7b5df8c 100644
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
@@ -194,7 +194,8 @@ static int __init add_legacy_soc_port(struct device_node *np,
 	/* Add port, irq will be dealt with later. We passed a translated
 	 * IO port value. It will be fixed up later along with the irq
 	 */
-	if (of_node_is_type(tsi, "tsi-bridge"))
+	tsi = of_get_parent(np);
+	if (of_node_is_type(tsi, "tsi-bridge") || (of_node_put(tsi), 0))
 		return add_legacy_port(np, -1, UPIO_TSI, addr, addr,
 				       0, legacy_port_flags, 0);
 	else
-- 
2.25.1

