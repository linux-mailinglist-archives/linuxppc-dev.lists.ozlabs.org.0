Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196B576C6A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 09:44:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlKxp3Vsnz3cFD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 17:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Fn6J41LD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Fn6J41LD;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlKx81zWHz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 17:44:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=daD3z
	6F4O5bsQpLVeqd54p6FD2X/Nnvc9PlZA2au1/g=; b=Fn6J41LDX6W0lHOvZ2O90
	moOa/S2JvJ0rpRQFalfbnyqK+3LArhhzCRmtAR7mLf4PSIdVUd9KS/0gcklYjueH
	DtJy8veP25EpXEUjxiMR5xbb1SU+68vpYyuSF0RvA4PJFjpYrX7H26qxHmM+Le2n
	QTWXNOmuXinLGLBsGgsTE8=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowAAXs5QwbNJiPA50FA--.16504S2;
	Sat, 16 Jul 2022 15:43:45 +0800 (CST)
From: Liang He <windhl@126.com>
To: benh@kernel.crashing.org,
	mpe@ellerman.id.au,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/powermac/udbg_scc: Fix refcount leak bug in udbg_scc_init()
Date: Sat, 16 Jul 2022 15:43:44 +0800
Message-Id: <20220716074344.540049-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAAXs5QwbNJiPA50FA--.16504S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr18Xw4rGw15GFW5CF1kGrg_yoWkWwc_Xw
	s2gF9rCr48WF4qvFnrZF1rWr1kA3yDWr4UKF1jq3W2qa1Fqas8Gw47JFy3WayUuFW0yrsx
	JFsYyr98Ga409jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUyrW3UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhJAF18RPgQNVQAAsn
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

During the iteration of for_each_child_of_node(), we need to call
of_node_put() for the old references stored in to 'ch_def' and 'ch_a'
as their refcounters have been increased in last iteration.

Fixes: 51d3082fe6e5 ("[PATCH] powerpc: Unify udbg (#2)")
Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/powermac/udbg_scc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/udbg_scc.c b/arch/powerpc/platforms/powermac/udbg_scc.c
index 734df5a32f99..1b7c39e841ee 100644
--- a/arch/powerpc/platforms/powermac/udbg_scc.c
+++ b/arch/powerpc/platforms/powermac/udbg_scc.c
@@ -81,10 +81,14 @@ void __init udbg_scc_init(int force_scc)
 	if (path != NULL)
 		stdout = of_find_node_by_path(path);
 	for_each_child_of_node(escc, ch) {
-		if (ch == stdout)
+		if (ch == stdout) {
+			of_node_put(ch_def);
 			ch_def = of_node_get(ch);
-		if (of_node_name_eq(ch, "ch-a"))
+		}
+		if (of_node_name_eq(ch, "ch-a")) {
+			of_node_put(ch_a);
 			ch_a = of_node_get(ch);
+		}
 	}
 	if (ch_def == NULL && !force_scc)
 		goto bail;
-- 
2.25.1

