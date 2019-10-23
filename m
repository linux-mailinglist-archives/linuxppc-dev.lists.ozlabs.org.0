Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D84E1D41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 15:49:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ysDJ0pWBzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 00:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ys9J72x5zDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 00:46:26 +1100 (AEDT)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E84C9E136EF73CF8A241;
 Wed, 23 Oct 2019 21:46:16 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 21:46:07 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jk@ozlabs.org>, <arnd@arndb.de>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <mpe@ellerman.id.au>
Subject: [PATCH -next] powerpc/spufs: remove set but not used variable 'ctx'
Date: Wed, 23 Oct 2019 21:44:23 +0800
Message-ID: <20191023134423.15052-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/platforms/cell/spufs/inode.c:201:22:
 warning: variable ctx set but not used [-Wunused-but-set-variable]

It is not used since commit 67cba9fd6456 ("move
spu_forget() into spufs_rmdir()")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 2dd452a..9b1586b 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -198,14 +198,12 @@ static int spufs_fill_dir(struct dentry *dir,
 
 static int spufs_dir_close(struct inode *inode, struct file *file)
 {
-	struct spu_context *ctx;
 	struct inode *parent;
 	struct dentry *dir;
 	int ret;
 
 	dir = file->f_path.dentry;
 	parent = d_inode(dir->d_parent);
-	ctx = SPUFS_I(d_inode(dir))->i_ctx;
 
 	inode_lock_nested(parent, I_MUTEX_PARENT);
 	ret = spufs_rmdir(parent, dir);
-- 
2.7.4


