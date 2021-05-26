Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1886D391370
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 11:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqlYQ19Rsz3bs7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 19:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=chenhuang5@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqlXh6hXPz2xv4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 19:10:28 +1000 (AEST)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FqlTG3KXMz1BQTF;
 Wed, 26 May 2021 17:07:30 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:22 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:21 +0800
From: Chen Huang <chenhuang5@huawei.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton
 <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Jens
 Axboe" <axboe@kernel.dk>, Yang Yingliang <yangyingliang@huawei.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>, Dan Carpenter
 <dan.carpenter@oracle.com>
Subject: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Date: Wed, 26 May 2021 09:20:19 +0000
Message-ID: <20210526092020.554341-2-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526092020.554341-1-chenhuang5@huawei.com>
References: <20210526092020.554341-1-chenhuang5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema756-chm.china.huawei.com (10.1.198.198)
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
Cc: xen-devel@lists.xenproject.org, Chen Huang <chenhuang5@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The simple_strtoull() function is deprecated in some situation, since
it does not check for the range overflow, use kstrtoull() instead.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 drivers/xen/xen-balloon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-balloon.c b/drivers/xen/xen-balloon.c
index a8d24433c8e9..1fba838963d2 100644
--- a/drivers/xen/xen-balloon.c
+++ b/drivers/xen/xen-balloon.c
@@ -163,13 +163,16 @@ static ssize_t store_target_kb(struct device *dev,
 			       const char *buf,
 			       size_t count)
 {
-	char *endchar;
+	ssize_t ret;
 	unsigned long long target_bytes;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	target_bytes = simple_strtoull(buf, &endchar, 0) * 1024;
+	ret = kstrtoull(buf, 0, &target_bytes);
+	if (ret)
+		return ret;
+	target_bytes *= 1024;
 
 	balloon_set_new_target(target_bytes >> PAGE_SHIFT);
 
-- 
2.25.1

