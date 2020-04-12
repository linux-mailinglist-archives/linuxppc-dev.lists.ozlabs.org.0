Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 902611A607F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 22:28:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490jy75Kf1zDqVq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 06:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=G2zxEyan; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490jBH1900zDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 05:54:15 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0707B214AF;
 Sun, 12 Apr 2020 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721253;
 bh=myYkWprg+WWiUHcdd6ZwCH3br4gnq7CtJsGPm4IVpVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2zxEyanO6auX9PlgDUIwafXaMtYsug93RcjOLLHmt/Mx4m5WfSWEfSMjB/3vOco8
 HD6WsW6NQOCBPpWxm7mQPG5SxNsta85Ooh54ZaibuDr4VLhx9Kf6+MK770FacD1L+U
 R99Kq+yNI2/XUURnheTplxnGlHscZKCl6IyGM+yo=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 20/21] mm: simplify find_min_pfn_with_active_regions()
Date: Sun, 12 Apr 2020 22:48:58 +0300
Message-Id: <20200412194859.12663-21-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The find_min_pfn_with_active_regions() calls find_min_pfn_for_node() with
nid parameter set to MAX_NUMNODES. This makes the find_min_pfn_for_node()
traverse all memblock memory regions although the first PFN in the system
can be easily found with memblock_start_of_DRAM().

Use memblock_start_of_DRAM() in find_min_pfn_with_active_regions() and drop
now unused find_min_pfn_for_node().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/page_alloc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9af27ee784c7..e83f28d6074a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7071,24 +7071,6 @@ unsigned long __init node_map_pfn_alignment(void)
 	return ~accl_mask + 1;
 }
 
-/* Find the lowest pfn for a node */
-static unsigned long __init find_min_pfn_for_node(int nid)
-{
-	unsigned long min_pfn = ULONG_MAX;
-	unsigned long start_pfn;
-	int i;
-
-	for_each_mem_pfn_range(i, nid, &start_pfn, NULL, NULL)
-		min_pfn = min(min_pfn, start_pfn);
-
-	if (min_pfn == ULONG_MAX) {
-		pr_warn("Could not find start_pfn for node %d\n", nid);
-		return 0;
-	}
-
-	return min_pfn;
-}
-
 /**
  * find_min_pfn_with_active_regions - Find the minimum PFN registered
  *
@@ -7097,7 +7079,7 @@ static unsigned long __init find_min_pfn_for_node(int nid)
  */
 unsigned long __init find_min_pfn_with_active_regions(void)
 {
-	return find_min_pfn_for_node(MAX_NUMNODES);
+	return PHYS_PFN(memblock_start_of_DRAM());
 }
 
 /*
-- 
2.25.1

