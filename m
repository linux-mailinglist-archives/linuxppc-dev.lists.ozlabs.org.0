Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A5838150
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 03:07:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJr8Q5mdjz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=xiaojiangfeng@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJr7y15ghz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 13:07:21 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TJr5m3ddyz1gxwK;
	Tue, 23 Jan 2024 10:05:32 +0800 (CST)
Received: from canpemm500010.china.huawei.com (unknown [7.192.105.118])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D06A140416;
	Tue, 23 Jan 2024 10:07:15 +0800 (CST)
Received: from huawei.com (10.67.189.167) by canpemm500010.china.huawei.com
 (7.192.105.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Jan
 2024 10:06:00 +0800
From: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
To: <npiggin@gmail.com>, <aneesh.kumar@kernel.org>,
	<naveen.n.rao@linux.ibm.com>, <christophe.leroy@csgroup.eu>,
	<mpe@ellerman.id.au>, <christophe.leroy@c-s.fr>, <xiaojiangfeng@huawei.com>
Subject: [PING PATCH] powerpc/kasan: Fix addr error caused by page alignment
Date: Tue, 23 Jan 2024 09:45:59 +0800
Message-ID: <1705974359-43790-1-git-send-email-xiaojiangfeng@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.189.167]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500010.china.huawei.com (7.192.105.118)
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
Cc: douzhaolei@huawei.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, wangbing6@huawei.com, wangfangpeng1@huawei.com, nixiaoming@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In kasan_init_region, when k_start is not page aligned,
at the begin of for loop, k_cur = k_start & PAGE_MASK
is less than k_start, and then va = block + k_cur - k_start
is less than block, the addr va is invalid, because the
memory address space from va to block is not alloced by
memblock_alloc, which will not be reserved
by memblock_reserve later, it will be used by other places.

As a result, memory overwriting occurs.

for example:
int __init __weak kasan_init_region(void *start, size_t size)
{
[...]
	/* if say block(dcd97000) k_start(feef7400) k_end(feeff3fe) */
	block = memblock_alloc(k_end - k_start, PAGE_SIZE);
	[...]
	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
		/* at the begin of for loop
		 * block(dcd97000) va(dcd96c00) k_cur(feef7000) k_start(feef7400)
		 * va(dcd96c00) is less than block(dcd97000), va is invalid
		 */
		void *va = block + k_cur - k_start;
		[...]
	}
[...]
}

Therefore, page alignment is performed on k_start before
memblock_alloc to ensure the validity of the VA address.

Fixes: 663c0c9496a6 ("powerpc/kasan: Fix shadow area set up for modules.")

Signed-off-by: Jiangfeng Xiao <xiaojiangfeng@huawei.com>
---
 arch/powerpc/mm/kasan/init_32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index a70828a..aa9aa11 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -64,6 +64,7 @@ int __init __weak kasan_init_region(void *start, size_t size)
 	if (ret)
 		return ret;
 
+	k_start = k_start & PAGE_MASK;
 	block = memblock_alloc(k_end - k_start, PAGE_SIZE);
 	if (!block)
 		return -ENOMEM;
-- 
1.8.5.6

