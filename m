Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E86E125
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 08:47:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhPh6HzkzDqBL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 16:47:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhMb6yGGzDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 16:45:14 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BDADAC8F;
 Fri, 19 Jul 2019 06:45:11 +0000 (UTC)
Date: Fri, 19 Jul 2019 08:45:10 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 02/11] s390x/mm: Fail when an altmap is used for
 arch_add_memory()
Message-ID: <20190719064510.GL30461@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-3-david@redhat.com>
 <20190701074306.GC6376@dhcp22.suse.cz>
 <20190701124628.GT6376@dhcp22.suse.cz>
 <86f3ff3d-d035-a806-88b7-b8c7b77c206e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f3ff3d-d035-a806-88b7-b8c7b77c206e@redhat.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 15-07-19 12:51:27, David Hildenbrand wrote:
> On 01.07.19 14:46, Michal Hocko wrote:
> > On Mon 01-07-19 09:43:06, Michal Hocko wrote:
> >> On Mon 27-05-19 13:11:43, David Hildenbrand wrote:
> >>> ZONE_DEVICE is not yet supported, fail if an altmap is passed, so we
> >>> don't forget arch_add_memory()/arch_remove_memory() when unlocking
> >>> support.
> >>
> >> Why do we need this? Sure ZONE_DEVICE is not supported for s390 and so
> >> might be the case for other arches which support hotplug. I do not see
> >> much point in adding warning to each of them.
> > 
> > I would drop this one. If there is a strong reason to have something
> > like that it should come with a better explanation and it can be done on
> > top.
> > 
> 
> This was requested by Dan and I agree it is the right thing to do.

This is probably a matter of taste. I would argue that altmap doesn't
really equal ZONE_DEVICE. This is more a mechanism to use an alternative
memmap allocator. Sure ZONE_DEVICE is the only in tree user of the
feature but I really do not see why the arh specific code should care
about it. The lack of altmap allocator is handled in the sparse code so
this is just adding an early check which might confuse people in future.

> In
> the context of paravirtualized devices (e.g., virtio-pmem), it makes
> sense to block functionality an arch does not support.

Then block it on the config dependences.

-- 
Michal Hocko
SUSE Labs
