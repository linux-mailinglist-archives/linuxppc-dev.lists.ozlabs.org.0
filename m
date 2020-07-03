Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E6213905
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 13:01:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ysTt1LjHzDql9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 21:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.66; helo=mail-ej1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ysRp53KwzDr10
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 20:59:50 +1000 (AEST)
Received: by mail-ej1-f66.google.com with SMTP id y10so33717497eje.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 03:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9tKvM8/Cn/mYaxCxuR2xX8QmwiS4Do3drIeD4weqF7o=;
 b=qApJe5pndC5d1IgqZgvosAIZHVGxxSFPDyqE49v4x2sdbx5SppuCRBtTknNH6Fjbo4
 mmv1wOHcXwOp5YTVlwLyUMk1srOnVkACH9SH7Oj8/+/b7s1paHIyZRvyXpgOxtpnkNda
 q1p4qUogPSOTMZS9D2aNjGrjPw8hru3Q3WSQZl1Eiw4Pba4dgE6YiO1fwvywJD76HUVV
 FEF4yUDk0ae1iLrS8pUCGzU2LKQIOQFXhMBVD5MgbsYmA49WOYe8UqSH85jd7B+iDuye
 wnb6d4RHhuaYF9qgCmpnuAgy4AIPbm1ldiaeH1kyW9c+zeGwAcGMjDav9O8GK2miMUSu
 VXdQ==
X-Gm-Message-State: AOAM531j+bNK+GW1mSL4BMTJSUu41ikRSxFxc/lWtNd1/gytFhgHlLDN
 aLLXQAJNTPsyGZl7BhnBZL4=
X-Google-Smtp-Source: ABdhPJypIBHztAW8b+oDXuc7i+rhK7i5IE4n3HBr9g6Z6wErcGVZfAUXJOhB8s0xROyaS+ZgyulOcA==
X-Received: by 2002:a17:906:f911:: with SMTP id
 lc17mr32750815ejb.330.1593773987079; 
 Fri, 03 Jul 2020 03:59:47 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id m13sm9140663ejc.1.2020.07.03.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 03:59:46 -0700 (PDT)
Date: Fri, 3 Jul 2020 12:59:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200703105944.GS18446@dhcp22.suse.cz>
References: <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200703091001.GJ21462@kitsune.suse.cz>
 <20200703092414.GR18446@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703092414.GR18446@dhcp22.suse.cz>
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
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 03-07-20 11:24:17, Michal Hocko wrote:
> [Cc Andi]
> 
> On Fri 03-07-20 11:10:01, Michal Suchanek wrote:
> > On Wed, Jul 01, 2020 at 02:21:10PM +0200, Michal Hocko wrote:
> > > On Wed 01-07-20 13:30:57, David Hildenbrand wrote:
> [...]
> > > > Yep, looks like it.
> > > > 
> > > > [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
> > > > [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
> > > > [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
> > > > [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
> > > > [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
> > > > [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
> > > > [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]
> > > 
> > > This begs a question whether ppc can do the same thing?
> > Or x86 stop doing it so that you can see on what node you are running?
> > 
> > What's the point of this indirection other than another way of avoiding
> > empty node 0?
> 
> Honestly, I do not have any idea. I've traced it down to
> Author: Andi Kleen <ak@suse.de>
> Date:   Tue Jan 11 15:35:48 2005 -0800
> 
>     [PATCH] x86_64: Fix ACPI SRAT NUMA parsing
> 
>     Fix fallout from the recent nodemask_t changes. The node ids assigned
>     in the SRAT parser were off by one.
> 
>     I added a new first_unset_node() function to nodemask.h to allocate
>     IDs sanely.
> 
>     Signed-off-by: Andi Kleen <ak@suse.de>
>     Signed-off-by: Linus Torvalds <torvalds@osdl.org>
> 
> which doesn't really tell all that much. The historical baggage and a
> long term behavior which is not really trivial to fix I suspect.

Thinking about this some more, this logic makes some sense afterall.
Especially in the world without memory hotplug which was very likely the
case back then. It is much better to have compact node mask rather than
sparse one. After all node numbers shouldn't really matter as long as
you have a clear mapping to the HW. I am not sure we export that
information (except for the kernel ring buffer) though.

The memory hotplug changes that somehow because you can hotremove numa
nodes and therefore make the nodemask sparse but that is not a common
case. I am not sure what would happen if a completely new node was added
and its corresponding node was already used by the renumbered one
though. It would likely conflate the two I am afraid. But I am not sure
this is really possible with x86 and a lack of a bug report would
suggest that nobody is doing that at least.

-- 
Michal Hocko
SUSE Labs
