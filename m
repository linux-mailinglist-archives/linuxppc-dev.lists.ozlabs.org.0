Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4C19982B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 16:09:16 +0200 (CEST)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sB5h5X9kzDr4N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 01:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Tbe4haT2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sB0P75WJzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 01:04:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585663473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KCZob0/LBRxC1X3ExJ7YgbkD9QNtWVeW3MS6pGS5Hm0=;
 b=Tbe4haT2uNeVSYm5cIj191ydfjEGWKQnCdLg6G013xj2jKU0imXQzCD9plJy5KnG5725Qp
 4UAvSmfs/cpJveo3irvqLwYyZ4atBGw6HXmGmSzmPlavVVcLtEMzHhZuqObyMNfWn6ZA4B
 /QqL6MY+1C/U8Bv5XaWLKCN1J6BsQSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-La1ubasMNmmujyoYcqk85g-1; Tue, 31 Mar 2020 10:04:29 -0400
X-MC-Unique: La1ubasMNmmujyoYcqk85g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18D9E108E9E2;
 Tue, 31 Mar 2020 14:03:39 +0000 (UTC)
Received: from localhost (ovpn-13-64.pek2.redhat.com [10.72.13.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0102960BFE;
 Tue, 31 Mar 2020 14:03:34 +0000 (UTC)
Date: Tue, 31 Mar 2020 22:03:32 +0800
From: Baoquan He <bhe@redhat.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20200331140332.GA2129@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330175100.GD30942@linux.ibm.com>
 <20200330182301.GM14243@dhcp22.suse.cz>
 <20200331081423.GE30942@linux.ibm.com>
 <20200331085513.GE30449@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331085513.GE30449@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: mmorana@amperecomputing.com, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Hoan Tran <Hoan@os.amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, lho@amperecomputing.com,
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will.deacon@arm.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On 03/31/20 at 10:55am, Michal Hocko wrote:
> On Tue 31-03-20 11:14:23, Mike Rapoport wrote:
> > Maybe I mis-read the code, but I don't see how this could happen. In the
> > HAVE_MEMBLOCK_NODE_MAP=y case, free_area_init_node() calls
> > calculate_node_totalpages() that ensures that node->node_zones are entirely
> > within the node because this is checked in zone_spanned_pages_in_node().
> 
> zone_spanned_pages_in_node does chech the zone boundaries are within the
> node boundaries. But that doesn't really tell anything about other
> potential zones interleaving with the physical memory range.
> zone->spanned_pages simply gives the physical range for the zone
> including holes. Interleaving nodes are essentially a hole
> (__absent_pages_in_range is going to skip those).
> 
> That means that when free_area_init_core simply goes over the whole
> physical zone range including holes and that is why we need to check
> both for physical and logical holes (aka other nodes).
> 
> The life would be so much easier if the whole thing would simply iterate
> over memblocks...

The memblock iterating sounds a great idea. I tried with putting the
memblock iterating in the upper layer, memmap_init(), which is used for
boot mem only anyway. Do you think it's doable and OK? It yes, I can
work out a formal patch to make this simpler as you said. The draft code
is as below. Like this it uses the existing code and involves little change.

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 138a56c0f48f..558d421f294b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6007,14 +6007,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
 		 * function.  They do not exist on hotplugged memory.
 		 */
 		if (context == MEMMAP_EARLY) {
-			if (!early_pfn_valid(pfn)) {
-				pfn = next_pfn(pfn);
-				continue;
-			}
-			if (!early_pfn_in_nid(pfn, nid)) {
-				pfn++;
-				continue;
-			}
 			if (overlap_memmap_init(zone, &pfn))
 				continue;
 			if (defer_init(nid, pfn, end_pfn))
@@ -6130,9 +6122,17 @@ static void __meminit zone_init_free_lists(struct zone *zone)
 }
 
 void __meminit __weak memmap_init(unsigned long size, int nid,
-				  unsigned long zone, unsigned long start_pfn)
+				  unsigned long zone, unsigned long range_start_pfn)
 {
-	memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
+	unsigned long start_pfn, end_pfn;
+	unsigned long range_end_pfn = range_start_pfn + size;
+	int i;
+	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
+		start_pfn = clamp(start_pfn, range_start_pfn, range_end_pfn);
+		end_pfn = clamp(end_pfn, range_start_pfn, range_end_pfn);
+		if (end_pfn > start_pfn)
+			memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
+	}
 }
 
 static int zone_batchsize(struct zone *zone)

