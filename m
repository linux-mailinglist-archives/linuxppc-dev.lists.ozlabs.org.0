Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E655107B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 08:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRKkq3lkmz3cdq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 16:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=KVUqPtEr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=KVUqPtEr;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRKk82DYdz3bkw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 16:39:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WJBzb
	HRlXaelhf6WYq5EqxXNcKDu4K0cCNo3xnmHQh4=; b=KVUqPtEr8dp+c0IxsGsdc
	5K7TSDb5ryI34yqnubunUkc8+qMl17zXgo4vOkIjlF5hnDL9TeH7cAhGklBx6HuB
	sQEQoQxVwTEX1/F22GlmbxL7NEpjQxVOConuosjdMuxW7uHhbkkmwSe16R+0HEc4
	KUga4eByiG15fxl4ibnbnM=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgBHlnLoFbBiabAcGA--.4866S2;
	Mon, 20 Jun 2022 14:38:33 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samb.org
Subject: [PATCH] powerpc/powernv: Fix refcount leak bug in idle.c
Date: Mon, 20 Jun 2022 14:38:30 +0800
Message-Id: <20220620063830.4071401-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgBHlnLoFbBiabAcGA--.4866S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kKw45Wr15JF4UKFy8Krg_yoW3GrcE93
	s7Jayqkrs3Xr4qv3yqvr1fWrnrCwnxWFWrKr1Iqa12ya45J3ZxG3y7trWfGa1DXrWSvrW3
	GFs5tr97A3WSyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRWE__7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAkmF2JVj8hasQAAsb
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

In pnv_parse_cpuidle_dt(), of_find_node_by_path() will return a node
pointer with refcount incremented. We should use of_node_put() in fail
path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powernv/idle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 6f94b808dd39..c1b369c7f507 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1419,6 +1419,7 @@ static int __init pnv_parse_cpuidle_dt(void)
 	kfree(temp_u32);
 	kfree(temp_u64);
 	kfree(temp_string);
+	of_node_put(np);
 	return rc;
 }
 
-- 
2.25.1

