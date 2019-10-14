Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E3D5F04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 11:35:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sD1Y2hV5zDqhK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 20:35:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sCyC0MFSzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 20:32:19 +1100 (AEDT)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13146A3CD7D;
 Mon, 14 Oct 2019 09:32:17 +0000 (UTC)
Received: from [10.36.116.28] (ovpn-116-28.ams2.redhat.com [10.36.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9106F600CD;
 Mon, 14 Oct 2019 09:32:14 +0000 (UTC)
Subject: Re: [PATCH v6 04/10] mm/memory_hotplug: Don't access uninitialized
 memmaps in shrink_zone_span()
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-5-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5a4573de-bd8a-6cd3-55d0-86d503a236fd@redhat.com>
Date: Mon, 14 Oct 2019 11:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191006085646.5768-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 14 Oct 2019 09:32:17 +0000 (UTC)
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
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-sh@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 x86@kernel.org, linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.10.19 10:56, David Hildenbrand wrote:
> Let's limit shrinking to !ZONE_DEVICE so we can fix the current code. We
> should never try to touch the memmap of offline sections where we could
> have uninitialized memmaps and could trigger BUGs when calling
> page_to_nid() on poisoned pages.
> 
> There is no reliable way to distinguish an uninitialized memmap from an
> initialized memmap that belongs to ZONE_DEVICE, as we don't have
> anything like SECTION_IS_ONLINE we can use similar to
> pfn_to_online_section() for !ZONE_DEVICE memory. E.g.,
> set_zone_contiguous() similarly relies on pfn_to_online_section() and
> will therefore never set a ZONE_DEVICE zone consecutive. Stopping to
> shrink the ZONE_DEVICE therefore results in no observable changes,
> besides /proc/zoneinfo indicating different boundaries - something we
> can totally live with.
> 
> Before commit d0dc12e86b31 ("mm/memory_hotplug: optimize memory
> hotplug"), the memmap was initialized with 0 and the node with the
> right value. So the zone might be wrong but not garbage. After that
> commit, both the zone and the node will be garbage when touching
> uninitialized memmaps.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")

@Andrew, can you convert that to

Fixes: f1dd2cd13c4b ("mm, memory_hotplug: do not associate hotadded 
memory to zones until online") # visible after d0dc12e86b319

and add

Cc: stable@vger.kernel.org # v4.13+


-- 

Thanks,

David / dhildenb
