Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E14B8736
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 12:56:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzGdh6zbxz3cXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 22:56:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzGdC6cKPz3cXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 22:56:15 +1100 (AEDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JzGWQ3CbjzZfh2;
 Wed, 16 Feb 2022 19:51:14 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Feb 2022 19:55:36 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Feb 2022 19:55:35 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.or>, <paulus@samba.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: [PATCH v4 2/2] powerpc: Fix virt_addr_valid() check
Date: Wed, 16 Feb 2022 20:11:08 +0800
Message-ID: <20220216121109.157605-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
References: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: akpm@linux-foundation.org, songyuanzheng@huawei.com, npiggin@gmail.com,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When run ethtool eth0 on PowerPC64, the BUG occurred,

  usercopy: Kernel memory exposure attempt detected from SLUB object not in SLUB page?! (offset 0, size 1048)!
  kernel BUG at mm/usercopy.c:99
  ...
  usercopy_abort+0x64/0xa0 (unreliable)
  __check_heap_object+0x168/0x190
  __check_object_size+0x1a0/0x200
  dev_ethtool+0x2494/0x2b20
  dev_ioctl+0x5d0/0x770
  sock_do_ioctl+0xf0/0x1d0
  sock_ioctl+0x3ec/0x5a0
  __se_sys_ioctl+0xf0/0x160
  system_call_exception+0xfc/0x1f0
  system_call_common+0xf8/0x200

The code shows below,

  data = vzalloc(array_size(gstrings.len, ETH_GSTRING_LEN));
  copy_to_user(useraddr, data, gstrings.len * ETH_GSTRING_LEN))

The data is alloced by vmalloc(), virt_addr_valid(ptr) will return true
on PowerPC64, which leads to the panic.

As commit 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va
and __pa addresses") does, make sure the virt addr above PAGE_OFFSET in
the virt_addr_valid() for PowerPC64, also add upper limit check to make
sure the virt is below high_memory.

Meanwhile, for PowerPC32 PAGE_OFFSET is the virtual address of the start
of lowmem, high_memory is the upper low virtual address, the check is
suitable for PowerPC32, this will fix the issue mentioned in commit
602946ec2f90 ("powerpc: Set max_mapnr correctly") too.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v4:
- add upper limit check
v3:
- update changelog and remove a redundant cast
 arch/powerpc/include/asm/page.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 254687258f42..7a1ba27a7285 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -132,7 +132,11 @@ static inline bool pfn_valid(unsigned long pfn)
 #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
 
-#define virt_addr_valid(kaddr)	pfn_valid(virt_to_pfn(kaddr))
+#define virt_addr_valid(vaddr)	({					\
+	unsigned long _addr = (unsigned long)vaddr;			\
+	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
+	pfn_valid(virt_to_pfn(_addr));					\
+})
 
 /*
  * On Book-E parts we need __va to parse the device tree and we can't
-- 
2.26.2

