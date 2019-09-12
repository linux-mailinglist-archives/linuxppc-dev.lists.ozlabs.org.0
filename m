Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF1B0CF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 12:32:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TZns69kwzF4FS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 20:32:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TZTq3ZtkzF48N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 20:18:07 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 53BAE8AF0C5369A42E84;
 Thu, 12 Sep 2019 18:18:02 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Sep 2019 18:17:57 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
 <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
 <mattst88@gmail.com>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <mpe@ellerman.id.au>, <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <davem@davemloft.net>, <ralf@linux-mips.org>, <paul.burton@mips.com>,
 <jhogan@kernel.org>, <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
Subject: [PATCH v3 5/8] s390: numa: make node_to_cpumask_map() NUMA_NO_NODE
 aware for s390
Date: Thu, 12 Sep 2019 18:15:31 +0800
Message-ID: <1568283334-178380-6-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
References: <1568283334-178380-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
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
Cc: linux-sh@vger.kernel.org, peterz@infradead.org, dave.hansen@linux.intel.com,
 linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 rppt@linux.ibm.com, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
 naveen.n.rao@linux.vnet.ibm.com, len.brown@intel.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, cai@lca.pw,
 luto@kernel.org, tglx@linutronix.de, mhocko@kernel.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, tbogendoerfer@suse.de,
 linux-alpha@vger.kernel.org, rafael@kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When passing the return value of dev_to_node() to cpumask_of_node()
without checking the node id if the node id is NUMA_NO_NODE, there is
global-out-of-bounds detected by KASAN.

From the discussion [1], NUMA_NO_NODE really means no node affinity,
which also means all cpus should be usable. So the cpumask_of_node()
should always return all cpus online when user passes the node id
as NUMA_NO_NODE, just like similar semantic that page allocator handles
NUMA_NO_NODE.

But we cannot really copy the page allocator logic. Simply because the
page allocator doesn't enforce the near node affinity. It just picks it
up as a preferred node but then it is free to fallback to any other numa
node. This is not the case here and node_to_cpumask_map will only restrict
to the particular node's cpus which would have really non deterministic
behavior depending on where the code is executed. So in fact we really
want to return cpu_online_mask for NUMA_NO_NODE.

[1] https://lore.kernel.org/patchwork/patch/1125789/
Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
Suggested-by: Michal Hocko <mhocko@kernel.org>
---
V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
    for NUMA_NO_NODE case, and change the commit log to better justify
    the change.
---
 arch/s390/include/asm/topology.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/topology.h
index cca406f..1bd2e73 100644
--- a/arch/s390/include/asm/topology.h
+++ b/arch/s390/include/asm/topology.h
@@ -78,6 +78,9 @@ static inline int cpu_to_node(int cpu)
 #define cpumask_of_node cpumask_of_node
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return &node_to_cpumask_map[node];
 }
 
-- 
2.8.1

