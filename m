Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636D397041
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 11:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvRYM5dXsz3bwx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 19:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=libaokun1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvR014ZGdz2yhm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 18:58:22 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FvQZ74j7TzYrxh;
 Tue,  1 Jun 2021 16:39:27 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 16:42:11 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 1 Jun 2021
 16:42:10 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <jk@ozlabs.org>, <arnd@arndb.de>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] powerpc/spufs: disp: Remove set but not used variable
 'dummy'
Date: Tue, 1 Jun 2021 16:51:27 +0800
Message-ID: <20210601085127.139598-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Jun 2021 19:23:17 +1000
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
Cc: yuehaibing@huawei.com, libaokun1@huawei.com, weiyongjun1@huawei.com,
 yukuai3@huawei.com, yangjihong1@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes gcc '-Wunused-but-set-variable' warning:

arch/powerpc/platforms/cell/spufs/switch.c: In function 'check_ppu_mb_stat':
arch/powerpc/platforms/cell/spufs/switch.c:1660:6: warning:
variable ‘dummy’ set but not used [-Wunused-but-set-variable]

arch/powerpc/platforms/cell/spufs/switch.c: In function 'check_ppuint_mb_stat':
arch/powerpc/platforms/cell/spufs/switch.c:1675:6: warning:
variable ‘dummy’ set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 arch/powerpc/platforms/cell/spufs/switch.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/switch.c b/arch/powerpc/platforms/cell/spufs/switch.c
index d56b4e3241cd..b41e81b22fdc 100644
--- a/arch/powerpc/platforms/cell/spufs/switch.c
+++ b/arch/powerpc/platforms/cell/spufs/switch.c
@@ -1657,14 +1657,13 @@ static inline void restore_spu_mb(struct spu_state *csa, struct spu *spu)
 static inline void check_ppu_mb_stat(struct spu_state *csa, struct spu *spu)
 {
 	struct spu_problem __iomem *prob = spu->problem;
-	u32 dummy = 0;
 
 	/* Restore, Step 66:
 	 *     If CSA.MB_Stat[P]=0 (mailbox empty) then
 	 *     read from the PPU_MB register.
 	 */
 	if ((csa->prob.mb_stat_R & 0xFF) == 0) {
-		dummy = in_be32(&prob->pu_mb_R);
+		in_be32(&prob->pu_mb_R);
 		eieio();
 	}
 }
@@ -1672,14 +1671,13 @@ static inline void check_ppu_mb_stat(struct spu_state *csa, struct spu *spu)
 static inline void check_ppuint_mb_stat(struct spu_state *csa, struct spu *spu)
 {
 	struct spu_priv2 __iomem *priv2 = spu->priv2;
-	u64 dummy = 0UL;
 
 	/* Restore, Step 66:
 	 *     If CSA.MB_Stat[I]=0 (mailbox empty) then
 	 *     read from the PPUINT_MB register.
 	 */
 	if ((csa->prob.mb_stat_R & 0xFF0000) == 0) {
-		dummy = in_be64(&priv2->puint_mb_R);
+		in_be64(&priv2->puint_mb_R);
 		eieio();
 		spu_int_stat_clear(spu, 2, CLASS2_ENABLE_MAILBOX_INTR);
 		eieio();
-- 
2.31.1

