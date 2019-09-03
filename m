Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD3A632D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 09:56:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mzm81H1LzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 17:56:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Gx11pokC"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mzk72fVZzDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 17:54:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G28iE/deGPG0P4VQTMIwzwCBVO7DdIpw/n7sMkoDPlI=; b=Gx11pokC7ZUSl6Ij7jfDO7foa
 BzXtIUvI7BsKuZKZpzM+5G7ZKYV2bgimYA3TvtJtVnJmrEnfKf4/DZYEwLbWECE1CXBm38zkHi+33
 uAl73vaUfsiml7p5HmwBrZr7owO5zm1VQYk0wiXRzfwITffEOTqlRY2wp1pjlRiwzPUUqryDTiTVk
 SaUovfNgliw3iF28YkNVvFDQ7BMk89W+Cy4V6ekrFWKmxau3LTU03Zy3bshbvteHJqKf62dyihpPN
 8pJwTi952NtGpBG4HsfMuKd9nAW69xR2W9ZRvjh33aDIekkJwH93lq1b+vDAJoxE1OTiWvP+L+OnS
 cx2bk6/1Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i53dU-0008BU-Bc; Tue, 03 Sep 2019 07:53:56 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6470330116F;
 Tue,  3 Sep 2019 09:53:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6EFC529C073C2; Tue,  3 Sep 2019 09:53:52 +0200 (CEST)
Date: Tue, 3 Sep 2019 09:53:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Subject: [PATCH] x86/mm: Fix cpumask_of_node() error condition
Message-ID: <20190903075352.GY2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <20190902181731.GB35858@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902181731.GB35858@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com, linuxarm@huawei.com,
 jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 x86@kernel.org, paul.burton@mips.com, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, nfont@linux.vnet.ibm.com,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, ink@jurassic.park.msu.ru, cai@lca.pw,
 luto@kernel.org, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 robin.murphy@arm.com, linux-mips@vger.kernel.org, ralf@linux-mips.org,
 tbogendoerfer@suse.de, Yunsheng Lin <linyunsheng@huawei.com>,
 linux-alpha@vger.kernel.org, bp@alien8.de, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 08:17:31PM +0200, Ingo Molnar wrote:

> Nitpicking: please also fix the kernel message to say ">=".

Full patch below.

---
Subject: x86/mm: Fix cpumask_of_node() error condition

When CONFIG_DEBUG_PER_CPU_MAPS we validate that the @node argument of
cpumask_of_node() is a valid node_id. It however forgets to check for
negative numbers. Fix this by explicitly casting to unsigned.

  (unsigned)node >= nr_node_ids

verifies: 0 <= node < nr_node_ids

Also ammend the error message to match the condition.

Acked-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/mm/numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index e6dad600614c..4123100e0eaf 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -861,9 +861,9 @@ void numa_remove_cpu(int cpu)
  */
 const struct cpumask *cpumask_of_node(int node)
 {
-	if (node >= nr_node_ids) {
+	if ((unsigned)node >= nr_node_ids) {
 		printk(KERN_WARNING
-			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
+			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
 			node, nr_node_ids);
 		dump_stack();
 		return cpu_none_mask;
