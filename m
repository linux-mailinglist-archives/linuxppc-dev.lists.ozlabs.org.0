Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51585339B38
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 03:22:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dy60W12Ncz3d6H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 13:22:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1079 seconds by postgrey-1.36 at boromir;
 Fri, 12 Mar 2021 22:25:16 AEDT
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxk4r218fz30LC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 22:25:11 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dxjd43zWqzNlqW;
 Fri, 12 Mar 2021 19:04:40 +0800 (CST)
Received: from huawei.com (10.67.174.47) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Fri, 12 Mar 2021
 19:06:51 +0800
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <dja@axtens.net>, <akpm@linux-foundation.org>,
 <rppt@kernel.org>, <aneesh.kumar@linux.ibm.com>, <clg@kaod.org>
Subject: [PATCH] powerpc: define the variable 'uaccess_flush' as static
Date: Fri, 12 Mar 2021 06:06:38 -0500
Message-ID: <20210312110638.178974-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 13 Mar 2021 13:22:35 +1100
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The variable 'uaccess_fulsh' is not referenced outside the file. Perhaps we
should define it as static to avoid the warning as follows:

arch/powerpc/kernel/setup_64.c:953:6: warning: symbol 'uaccess_flush'
was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
 arch/powerpc/kernel/setup_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 560ed8b975e7..22aca271496b 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -950,7 +950,7 @@ static bool no_entry_flush;
 static bool no_uaccess_flush;
 bool rfi_flush;
 bool entry_flush;
-bool uaccess_flush;
+static bool uaccess_flush;
 DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
 EXPORT_SYMBOL(uaccess_flush_key);
 
-- 
2.17.1

