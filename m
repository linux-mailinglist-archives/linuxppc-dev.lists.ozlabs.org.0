Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC52247F9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:38:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW2ph5dT7zDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 17:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW2mz6bVJzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 17:37:16 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50B33ABCC;
 Tue, 18 Aug 2020 07:37:38 +0000 (UTC)
Date: Tue, 18 Aug 2020 09:37:12 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200818073712.GK28270@dhcp22.suse.cz>
References: <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200703091001.GJ21462@kitsune.suse.cz>
 <20200703092414.GR18446@dhcp22.suse.cz>
 <20200703105944.GS18446@dhcp22.suse.cz>
 <20200703125823.GA26243@linux.vnet.ibm.com>
 <20200806213211.6a6a56037fe771836e5abbe9@linux-foundation.org>
 <20200812060101.GB10992@linux.vnet.ibm.com>
 <13a85e52-5caa-24a8-7169-3992b1ad262a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a85e52-5caa-24a8-7169-3992b1ad262a@redhat.com>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Such?nek <msuchanek@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 18-08-20 09:32:52, David Hildenbrand wrote:
> On 12.08.20 08:01, Srikar Dronamraju wrote:
> > Hi Andrew, Michal, David
> > 
> > * Andrew Morton <akpm@linux-foundation.org> [2020-08-06 21:32:11]:
> > 
> >> On Fri, 3 Jul 2020 18:28:23 +0530 Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:
> >>
> >>>> The memory hotplug changes that somehow because you can hotremove numa
> >>>> nodes and therefore make the nodemask sparse but that is not a common
> >>>> case. I am not sure what would happen if a completely new node was added
> >>>> and its corresponding node was already used by the renumbered one
> >>>> though. It would likely conflate the two I am afraid. But I am not sure
> >>>> this is really possible with x86 and a lack of a bug report would
> >>>> suggest that nobody is doing that at least.
> >>>>
> >>>
> >>> JFYI,
> >>> Satheesh copied in this mailchain had opened a bug a year on crash with vcpu
> >>> hotplug on memoryless node. 
> >>>
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=202187
> >>
> >> So...  do we merge this patch or not?  Seems that the overall view is
> >> "risky but nobody is likely to do anything better any time soon"?
> > 
> > Can we decide on this one way or the other?
> 
> Hmm, not sure who's the person to decide. I tend to prefer doing the
> node renaming, handling this in ppc code;

Agreed. That would be a safer option.
-- 
Michal Hocko
SUSE Labs
