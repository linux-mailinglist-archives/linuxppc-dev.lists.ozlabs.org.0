Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7525BC2D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 14:56:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cnS335HMzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 22:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cnLH4frwzDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 22:51:19 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9455AF2C;
 Mon,  1 Jul 2019 12:51:14 +0000 (UTC)
Date: Mon, 1 Jul 2019 14:51:12 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 06/11] mm/memory_hotplug: Allow arch_remove_pages()
 without CONFIG_MEMORY_HOTREMOVE
Message-ID: <20190701125112.GW6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-7-david@redhat.com>
 <20190701080141.GF6376@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701080141.GF6376@dhcp22.suse.cz>
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
Cc: Oscar Salvador <osalvador@suse.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Baoquan He <bhe@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Banman <andrew.banman@hpe.com>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 01-07-19 10:01:41, Michal Hocko wrote:
> On Mon 27-05-19 13:11:47, David Hildenbrand wrote:
> > We want to improve error handling while adding memory by allowing
> > to use arch_remove_memory() and __remove_pages() even if
> > CONFIG_MEMORY_HOTREMOVE is not set to e.g., implement something like:
> > 
> > 	arch_add_memory()
> > 	rc = do_something();
> > 	if (rc) {
> > 		arch_remove_memory();
> > 	}
> > 
> > We won't get rid of CONFIG_MEMORY_HOTREMOVE for now, as it will require
> > quite some dependencies for memory offlining.
> 
> If we cannot really remove CONFIG_MEMORY_HOTREMOVE altogether then why
> not simply add an empty placeholder for arch_remove_memory when the
> config is disabled?

In other words, can we replace this by something as simple as:

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index ae892eef8b82..0329027fe740 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -128,6 +128,20 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
 			       struct vmem_altmap *altmap);
 extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
 			   unsigned long nr_pages, struct vmem_altmap *altmap);
+#else
+/*
+ * Allow code using
+ * arch_add_memory();
+ * rc = do_something();
+ * if (rc)
+ * 	arch_remove_memory();
+ *
+ * without ifdefery.
+ */
+static inline void arch_remove_memory(int nid, u64 start, u64 size,
+			       struct vmem_altmap *altmap)
+{
+}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 /*
-- 
Michal Hocko
SUSE Labs
