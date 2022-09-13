Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8885B6903
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:52:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRbKz0tgnz3fCR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:52:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRbHv2lSKz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:51:07 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRbBh5ZhrzkWqF;
	Tue, 13 Sep 2022 15:46:36 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 15:50:32 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<geoff@infradead.org>, <jk@ozlabs.org>, <arnd@arndb.de>, <clg@kaod.org>,
	<aik@ozlabs.ru>, <maciej.szmigiero@oracle.com>, <seanjc@google.com>,
	<jgg@ziepe.ca>, <willy@infradead.org>, <nick.child@ibm.com>,
	<bsingharora@gmail.com>, <michael@ellerman.id.au>,
	<arnd.bergmann@de.ibm.com>, <paulus@samba.org>, <benh@kernel.crashing.org>,
	<alistair@popple.id.au>, <miltonm@bga.com>, <Geert.Uytterhoeven@sonycom.com>,
	<geoffrey.levand@am.sony.com>, <yu.liu@freescale.com>,
	<scottwood@freescale.com>, <hollisb@us.ibm.com>, <avi@redhat.com>,
	<agraf@suse.de>, <cuigaosheng1@huawei.com>
Subject: [PATCH 2/9] powerpc/spufs: remove orphan declarations from spufs.h
Date: Tue, 13 Sep 2022 15:50:22 +0800
Message-ID: <20220913075029.682327-3-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913075029.682327-1-cuigaosheng1@huawei.com>
References: <20220913075029.682327-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the following orphan declarations from spufs.h:
1. spufs_coredump_calls has been removed since
commit 48cad41f7ee7 ("[POWERPC] spufs: Combine
spufs_coredump_calls with spufs_calls").

2. spufs_coredump_num_notes has been removed since
commit 936d5bf1d7dc ("[POWERPC] spufs: Get rid of spufs_coredump_num_notes,
it's not needed if we NULL terminate").

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/platforms/cell/spufs/spufs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/spufs.h b/arch/powerpc/platforms/cell/spufs/spufs.h
index af048b6dd30a..84958487f696 100644
--- a/arch/powerpc/platforms/cell/spufs/spufs.h
+++ b/arch/powerpc/platforms/cell/spufs/spufs.h
@@ -333,7 +333,6 @@ void spufs_stop_callback(struct spu *spu, int irq);
 void spufs_mfc_callback(struct spu *spu);
 void spufs_dma_callback(struct spu *spu, int type);
 
-extern struct spu_coredump_calls spufs_coredump_calls;
 struct spufs_coredump_reader {
 	char *name;
 	ssize_t (*dump)(struct spu_context *ctx, struct coredump_params *cprm);
@@ -341,7 +340,6 @@ struct spufs_coredump_reader {
 	size_t size;
 };
 extern const struct spufs_coredump_reader spufs_coredump_read[];
-extern int spufs_coredump_num_notes;
 
 extern int spu_init_csa(struct spu_state *csa);
 extern void spu_fini_csa(struct spu_state *csa);
-- 
2.25.1

