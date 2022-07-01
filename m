Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B846563624
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 16:51:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZJ6g0mk8z3drQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 00:51:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VLWpY6xC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VLWpY6xC;
	dkim-atps=neutral
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZJ5y38kpz3cFl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 00:50:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6TN1U
	PCgJd+xlHHL/PGVoZrKScLGkf15v/fISdAuQq0=; b=VLWpY6xCHYvTfIjQ3LcCt
	1V1feP2/JxmxBogYNCObfSMHjOWvyl3kjqU3LSM90zROovE3u/FskfUaemEMwv5o
	V2+WrfQ7wnFPnkpfdiGn9VB1znEalxTNU/ovFCCZqvlB7EfG9+lkOeZhcuy/Kxsd
	jcDiieBC4faQVjyUF6lJu0=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowABHs_+NCb9ix2bbEA--.53667S2;
	Fri, 01 Jul 2022 22:49:50 +0800 (CST)
From: Liang He <windhl@126.com>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH v2 1/2] powerpc: cell: cbe_regs: Fix refcount bugs
Date: Fri,  1 Jul 2022 22:49:48 +0800
Message-Id: <20220701144949.252364-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHs_+NCb9ix2bbEA--.53667S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kXr48Gw4rZry7ZFyDGFg_yoW5Cw4Dpr
	yUKrWayr4UGrZru3yFqa4UZrnxtrn5JFW3uwn7Gas3AFn3XFyrXr1kW34jyr98CFW8Zay5
	Grs3tayaqa95Ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi5rcxUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGg8xF1-HZaz22AAAsM
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

There are several bugs as following:

(1) In cbe_get_be_node(), we should hold the reference returned by
    of_find_xxx and of_get_xxx OF APIs and use it to call of_node_put
(2) In cbe_fill_regs_map(), we should same as above
(3) In cbe_regs_init(), during the iteration of for_each_node_by_type(),
    the refcount of 'cpu' will be automatically increased and decreased.
    However, there is a reference escaped out into 'map->cpu_node' and
    we should properly handle it.

Signed-off-by: Liang He <windhl@126.com>
---
 chagelog:

 v2: (1) split v1's two files in to two commits
     (2) merge all bugs for cbe_regs.c
     (3) using 'check-then-put' coding style
 v1: only detect bug (1)

 v1-link: https://lore.kernel.org/all/20220621075333.4081413-1-windhl@126.com/


 arch/powerpc/platforms/cell/cbe_regs.c | 40 +++++++++++++++++++-------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index 316e533afc00..3fd3634aa515 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -182,9 +182,19 @@ static struct device_node *__init cbe_get_be_node(int cpu_id)
 		if (WARN_ON_ONCE(!cpu_handle))
 			return np;
 
-		for (i=0; i<len; i++)
-			if (of_find_node_by_phandle(cpu_handle[i]) == of_get_cpu_node(cpu_id, NULL))
+		for (i=0; i<len; i++) {
+			struct device_node *ch_np = of_find_node_by_phandle(cpu_handle[i]);
+			struct device_node *ci_np = of_get_cpu_node(cpu_id, NULL);
+
+			if (ch_np == ci_np) {
+				of_node_put(ch_np);
+				of_node_put(ci_np);
 				return np;
+			}
+
+			of_node_put(ch_np);
+			of_node_put(ci_np);
+		}
 	}
 
 	return NULL;
@@ -193,21 +203,30 @@ static struct device_node *__init cbe_get_be_node(int cpu_id)
 static void __init cbe_fill_regs_map(struct cbe_regs_map *map)
 {
 	if(map->be_node) {
-		struct device_node *be, *np;
+		struct device_node *be, *np, *parent_np;
 
 		be = map->be_node;
 
-		for_each_node_by_type(np, "pervasive")
-			if (of_get_parent(np) == be)
+		for_each_node_by_type(np, "pervasive") {
+			parent_np = of_get_parent(np);
+			if (parent_np == be)
 				map->pmd_regs = of_iomap(np, 0);
+			of_node_put(parent_np);
+		}
 
-		for_each_node_by_type(np, "CBEA-Internal-Interrupt-Controller")
-			if (of_get_parent(np) == be)
+		for_each_node_by_type(np, "CBEA-Internal-Interrupt-Controller") {
+			parent_np = of_get_parent(np);
+			if (parent_np == be)
 				map->iic_regs = of_iomap(np, 2);
+			of_node_put(parent_np);
+		}
 
-		for_each_node_by_type(np, "mic-tm")
-			if (of_get_parent(np) == be)
+		for_each_node_by_type(np, "mic-tm") {
+			parent_np = of_get_parent(np);
+			if (parent_np == be)
 				map->mic_tm_regs = of_iomap(np, 0);
+			of_node_put(parent_np);
+		}
 	} else {
 		struct device_node *cpu;
 		/* That hack must die die die ! */
@@ -261,7 +280,8 @@ void __init cbe_regs_init(void)
 			of_node_put(cpu);
 			return;
 		}
-		map->cpu_node = cpu;
+		of_node_put(map->cpu_node);
+		map->cpu_node = of_node_get(cpu);
 
 		for_each_possible_cpu(i) {
 			struct cbe_thread_map *thread = &cbe_thread_map[i];
-- 
2.25.1

