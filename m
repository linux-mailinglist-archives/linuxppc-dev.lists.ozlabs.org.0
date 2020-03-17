Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8F188874
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 16:00:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hbtz3RdfzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 02:00:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hZbG1dsvzDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 01:01:29 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id h6so5486004wrs.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 07:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ItWRufudZgPZEpQ32ItzaAQQhZEgI2/DOHgrwuATrtI=;
 b=p/QlA3leem37sHP5931PI7pSKeUV5/uKY2snEmw1/8UBpyoYsrEWsV3333Y82noxIz
 P/MYtiwIRq8m1aLBz3WHUJkODQA00d+h/X1pggG+F9/wgg2q9iBJXh4OhJvXqMrF6la6
 9jjti1dXSTzUlhP4ZFlqowgRvm15QB1Jgq5Dfnu8Xf6RH+z3mWWppxrJ8aUcUvolgkkF
 /QkJHMwItBBSEDNgQEiWoS4An/PN035sEoiQAEd/ikyFP/eBNFq4VCJa3ktlxG2NJ7eR
 EKPZnN/HR2fyiY3RkaOa/HQeiWEG9YyGMsjuYbqVAdGeXD25eD+ohHSYAKGu/F6qK9+R
 slkQ==
X-Gm-Message-State: ANhLgQ3lQwHB+2PWFVPzO6I/hM6FIGMAcLm42vMu5TnahslGscvlLhEZ
 GuPLxJJGvf7+l1qwA6KAa+o=
X-Google-Smtp-Source: ADFU+vsk+GnF+GCqWZCG5DiJVF86NmS3oKrA4V8mLX0Ld4u7mVLgCXVsm/cY7ocNSYufa/6j734rhQ==
X-Received: by 2002:adf:e883:: with SMTP id d3mr6169893wrm.75.1584453685337;
 Tue, 17 Mar 2020 07:01:25 -0700 (PDT)
Received: from localhost (ip-37-188-255-121.eurotel.cz. [37.188.255.121])
 by smtp.gmail.com with ESMTPSA id q8sm81107wrc.8.2020.03.17.07.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 07:01:24 -0700 (PDT)
Date: Tue, 17 Mar 2020 15:01:22 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
Message-ID: <20200317140122.GQ26018@dhcp22.suse.cz>
References: <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
 <20200312131438.GB3277@linux.vnet.ibm.com>
 <61437352-8b54-38fa-4471-044a65c9d05a@suse.cz>
 <20200312161310.GC3277@linux.vnet.ibm.com>
 <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
 <20200316090652.GC11482@dhcp22.suse.cz>
 <65b99db6-3bdf-6caa-74e5-6d6b681f16b5@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65b99db6-3bdf-6caa-74e5-6d6b681f16b5@suse.cz>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-03-20 14:44:45, Vlastimil Babka wrote:
> On 3/16/20 10:06 AM, Michal Hocko wrote:
> > On Thu 12-03-20 17:41:58, Vlastimil Babka wrote:
> > [...]
> >> with nid present in:
> >> N_POSSIBLE - pgdat might not exist, node_to_mem_node() must return some online
> > 
> > I would rather have a dummy pgdat for those. Have a look at 
> > $ git grep "NODE_DATA.*->" | wc -l
> > 63
> > 
> > Who knows how many else we have there. I haven't looked more closely.
> > Besides that what is a real reason to not have pgdat ther and force all
> > users of a $random node from those that the platform considers possible
> > for special casing? Is that a memory overhead? Is that really a thing?
> 
> I guess we can ignore memory overhead. I guess there only might be some concern
> that for nodes that are initially offline, we will allocate the pgdat on a
> different node, and after they are online, it will stay on a different node with
> more access latency from local cpus. If we only allocate for online nodes, it
> can always be local? But I guess it doesn't matter that much.

This is not the case even now because of chicke&egg. You need a memory
to allocate from and that memory has to be managed somewhere per node
(pgdat). Keep in mind we do not have the bootmem allocator for the
hotplug. Have a look at hotadd_new_pgdat and when it is called. There
are some attempts to allocate memmap from the hotpluged memory but I am
not sure we can do the whole thing without pgdat in place. If we can
then can come up with some replace the pgdat magic. But still I am not
even sure this is something we really have to optimize for.
-- 
Michal Hocko
SUSE Labs
