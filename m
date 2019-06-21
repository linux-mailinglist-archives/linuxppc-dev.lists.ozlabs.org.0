Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815C4F141
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 01:45:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VwKZ00sXzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 09:45:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux-foundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="RDDEklul"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VwGh4MvBzDq7w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 09:42:50 +1000 (AEST)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC20B2084E;
 Fri, 21 Jun 2019 23:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561160568;
 bh=9jNNQ6ZuBBOjZIW3HIow9t4gY+OUpSdjtQl5zrDEMdQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RDDEklul7g0TwzW9+rYABCiLxD3N9O7GjpeOksdPT5+/ufp4LUGpriR31HgIwLS4N
 su+rzFDliqa/VpGbuq7WC+iq0nUGUObMkXCICTQFtPxehIJZ4EugjMAlfNTPpNEqd2
 UO3XDcH6k2EANV4YmvD/OKPZrb5GXc3G08Mo32mA=
Date: Fri, 21 Jun 2019 16:42:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 0/6] mm: Further memory block device cleanups
Message-Id: <20190621164246.9a2354a571da41950bb74562@linux-foundation.org>
In-Reply-To: <1c2edc22-afd7-2211-c4c7-40e54e5007e8@redhat.com>
References: <20190620183139.4352-1-david@redhat.com>
 <1561130120.5154.47.camel@lca.pw>
 <1c2edc22-afd7-2211-c4c7-40e54e5007e8@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 Keith Busch <keith.busch@intel.com>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Neuling <mikey@neuling.org>, Baoquan He <bhe@redhat.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Andrew Banman <andrew.banman@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Paul Mackerras <paulus@samba.org>,
 Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jun 2019 20:24:59 +0200 David Hildenbrand <david@redhat.com> wrote:

> @Qian Cai, unfortunately I can't reproduce.
> 
> If you get the chance, it would be great if you could retry with
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 972c5336bebf..742f99ddd148 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -868,6 +868,9 @@ int walk_memory_blocks(unsigned long start, unsigned
> long size,
>         unsigned long block_id;
>         int ret = 0;
> 
> +       if (!size)
> +               return;
> +
>         for (block_id = start_block_id; block_id <= end_block_id;
> block_id++) {
>                 mem = find_memory_block_by_id(block_id);
>                 if (!mem)
> 
> 
> 
> If both, start and size are 0, we would get a veeeery long loop. This
> would mean that we have an online node that does not span any pages at
> all (pgdat->node_start_pfn = 0, start_pfn + pgdat->node_spanned_pages = 0).

I think I'll make that a `return 0' and I won't drop patches 4-6 for
now, as we appear to have this fixed.



From: David Hildenbrand <david@redhat.com>
Subject: drivers-base-memoryc-get-rid-of-find_memory_block_hinted-v3-fix

handle zero-length walks

Link: http://lkml.kernel.org/r/1c2edc22-afd7-2211-c4c7-40e54e5007e8@redhat.com
Reported-by: Qian Cai <cai@lca.pw>
Tested-by: Qian Cai <cai@lca.pw>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/base/memory.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/base/memory.c~drivers-base-memoryc-get-rid-of-find_memory_block_hinted-v3-fix
+++ a/drivers/base/memory.c
@@ -866,6 +866,9 @@ int walk_memory_blocks(unsigned long sta
 	unsigned long block_id;
 	int ret = 0;
 
+	if (!size)
+		return 0;
+
 	for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
 		mem = find_memory_block_by_id(block_id);
 		if (!mem)


