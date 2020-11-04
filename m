Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 281512A6434
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 13:25:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR5T54VDfzDqNW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 23:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=osalvador@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR59232z2zDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 23:11:18 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC5DFAAF1;
 Wed,  4 Nov 2020 12:11:12 +0000 (UTC)
Date: Wed, 4 Nov 2020 13:11:09 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v1 3/4] powerpc/mm: remove linear mapping if
 __add_pages() fails in arch_add_memory()
Message-ID: <20201104121109.GA5126@localhost.localdomain>
References: <20201029162718.29910-1-david@redhat.com>
 <20201029162718.29910-4-david@redhat.com>
 <20201104095007.GB4981@localhost.localdomain>
 <20201104120651.GQ4879@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104120651.GQ4879@kernel.org>
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 04, 2020 at 02:06:51PM +0200, Mike Rapoport wrote:
> On Wed, Nov 04, 2020 at 10:50:07AM +0100, osalvador wrote:
> > On Thu, Oct 29, 2020 at 05:27:17PM +0100, David Hildenbrand wrote:
> > > Let's revert what we did in case seomthing goes wrong and we return an
> > > error.
> > 
> > Dumb question, but should not we do this for other arches as well?
> 
> It seems arm64 and s390 already do that. 
> x86 could have its arch_add_memory() improved though :)

Right, I only stared at x86 and see it did not have it.
I guess we want to have all arches aligned with this.

Thanks

-- 
Oscar Salvador
SUSE L3
