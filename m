Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F223EB37
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:07:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNLd10jXjzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:07:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLZT32JczDqwY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:05:05 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 625ADAC19;
 Fri,  7 Aug 2020 10:05:17 +0000 (UTC)
Date: Fri, 7 Aug 2020 12:04:58 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200807100458.GI32107@kitsune.suse.cz>
References: <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200703091001.GJ21462@kitsune.suse.cz>
 <20200703092414.GR18446@dhcp22.suse.cz>
 <20200703105944.GS18446@dhcp22.suse.cz>
 <20200703125823.GA26243@linux.vnet.ibm.com>
 <20200806213211.6a6a56037fe771836e5abbe9@linux-foundation.org>
 <5688b358-36bc-ccf0-d24b-a65375a9f3c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5688b358-36bc-ccf0-d24b-a65375a9f3c3@redhat.com>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 07, 2020 at 08:58:09AM +0200, David Hildenbrand wrote:
> On 07.08.20 06:32, Andrew Morton wrote:
> > On Fri, 3 Jul 2020 18:28:23 +0530 Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:
> > 
> >>> The memory hotplug changes that somehow because you can hotremove numa
> >>> nodes and therefore make the nodemask sparse but that is not a common
> >>> case. I am not sure what would happen if a completely new node was added
> >>> and its corresponding node was already used by the renumbered one
> >>> though. It would likely conflate the two I am afraid. But I am not sure
> >>> this is really possible with x86 and a lack of a bug report would
> >>> suggest that nobody is doing that at least.
> >>>
> >>
> >> JFYI,
> >> Satheesh copied in this mailchain had opened a bug a year on crash with vcpu
> >> hotplug on memoryless node. 
> >>
> >> https://bugzilla.kernel.org/show_bug.cgi?id=202187
> > 
> > So...  do we merge this patch or not?  Seems that the overall view is
> > "risky but nobody is likely to do anything better any time soon"?
> 
> I recall the issue Michal saw was "fix powerpc" vs. "break other
> architectures". @Michal how should we proceed? At least x86-64 won't be
> affected IIUC.
There is a patch to introduce the node remapping on ppc as well which
should eliminate the empty node 0.

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200731111916.243569-1-aneesh.kumar@linux.ibm.com/

Thanks

Michal
