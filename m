Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AE39136C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 11:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqlY25XQtz30BG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 19:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=chenhuang5@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqlXh5cWjz2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 19:10:28 +1000 (AEST)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FqlTG6lRjzCx9y;
 Wed, 26 May 2021 17:07:30 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:18 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:17 +0800
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
Subject: [PATCH -next 1/3] powerpc/rtas: Replaced simple_strtoull() with
 kstrtoull()
Date: Wed, 26 May 2021 09:20:18 +0000
Message-ID: <20210526092020.554341-1-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
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
 arch/powerpc/kernel/rtas-proc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index 6857a5b0a1c3..117886782ebd 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -259,7 +259,6 @@ __initcall(proc_rtas_init);
 static int parse_number(const char __user *p, size_t count, u64 *val)
 {
 	char buf[40];
-	char *end;
 
 	if (count > 39)
 		return -EINVAL;
@@ -269,11 +268,7 @@ static int parse_number(const char __user *p, size_t count, u64 *val)
 
 	buf[count] = 0;
 
-	*val = simple_strtoull(buf, &end, 10);
-	if (*end && *end != '\n')
-		return -EINVAL;
-
-	return 0;
+	return kstrtoull(buf, 10, val);
 }
 
 /* ****************************************************************** */
-- 
2.25.1

