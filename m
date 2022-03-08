Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD54D1481
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 11:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCWQd2tQKz3bgC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 21:14:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCWQ94wT2z2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 21:14:06 +1100 (AEDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KCWHw1gGmzbcCT;
 Tue,  8 Mar 2022 18:08:44 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 8 Mar
 2022 18:13:31 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jk@ozlabs.org>, <arnd@arndb.de>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <yuehaibing@huawei.com>,
 <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Date: Tue, 8 Mar 2022 18:09:28 +0800
Message-ID: <20220308100928.23540-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/platforms/cell/spufs/sched.c:1055:12: warning: ‘show_spu_loadavg’ defined but not used [-Wunused-function]
 static int show_spu_loadavg(struct seq_file *s, void *private)
            ^~~~~~~~~~~~~~~~

Move it into #ifdef block to fix this, also remove unneeded semicolon.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: use #ifdef instead of __maybe_unused
---
 arch/powerpc/platforms/cell/spufs/sched.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index d058f6233e66..99bd027a7f7c 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -1052,6 +1052,7 @@ void spuctx_switch_state(struct spu_context *ctx,
 	}
 }
 
+#ifdef CONFIG_PROC_FS
 static int show_spu_loadavg(struct seq_file *s, void *private)
 {
 	int a, b, c;
@@ -1073,7 +1074,8 @@ static int show_spu_loadavg(struct seq_file *s, void *private)
 		atomic_read(&nr_spu_contexts),
 		idr_get_cursor(&task_active_pid_ns(current)->idr) - 1);
 	return 0;
-};
+}
+#endif
 
 int __init spu_sched_init(void)
 {
-- 
2.17.1

