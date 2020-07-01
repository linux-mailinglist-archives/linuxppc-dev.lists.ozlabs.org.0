Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17589210AFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 14:24:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xgQB40nXzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 22:24:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.67; helo=mail-ej1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xgLj0nLnzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 22:21:16 +1000 (AEST)
Received: by mail-ej1-f67.google.com with SMTP id p20so24324884ejd.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 05:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/b+RUGrUg/ntsSCxKL5s82gEiDaQbG8Ituvi60lGYAk=;
 b=bFAwn89CBFoPTqxO4FWLhW5zPZqSGELVXo1sA6EWCwvnLxsAcqSjaWdPSHJXMnVKKb
 uDF7SSBqPwRqzu7rCf0pjnny1LmtGCKE8LT8/3xGQslhTnQGnLinbq6C4X9L5Tf5QuA7
 efnTNFoOjFvP1itDGb/8H+8GxGXMbg3N3gZYvii7F4LKiCqDhh8kxo58d7gdE0n0P+ol
 nyX/RcfJ9Iro8dZXGK2aH6sUmAZ5tS2oF5y3WabDJ17lI17piQZiAgJp/+OfNwkBXyzD
 Hn4x3vJH0xOU2sdik6OKCO6Z17ejbvzuPXqLA185hLvZw/TsRWheXTMWh509vCcsyv02
 Hj5g==
X-Gm-Message-State: AOAM531vFX6+rqKxt63KPM00QvWjTKBm6BfiYP4KCcAU599tPlbDxeq2
 pTrf+0svrVin2jnsayHK6Wg=
X-Google-Smtp-Source: ABdhPJwM754Glk3zEURKp6Dq0/LYW01GCSOKp40qjwm++RUI94oVQJQMVXVZpTlIQFzY4qbxuk1WUA==
X-Received: by 2002:a17:906:1a54:: with SMTP id
 j20mr22242582ejf.455.1593606072668; 
 Wed, 01 Jul 2020 05:21:12 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id di20sm6311781edb.26.2020.07.01.05.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 05:21:11 -0700 (PDT)
Date: Wed, 1 Jul 2020 14:21:10 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200701122110.GT2369@dhcp22.suse.cz>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 01-07-20 13:30:57, David Hildenbrand wrote:
> On 01.07.20 13:06, David Hildenbrand wrote:
> > On 01.07.20 13:01, Srikar Dronamraju wrote:
> >> * David Hildenbrand <david@redhat.com> [2020-07-01 12:15:54]:
> >>
> >>> On 01.07.20 12:04, Srikar Dronamraju wrote:
> >>>> * Michal Hocko <mhocko@kernel.org> [2020-07-01 10:42:00]:
> >>>>
> >>>>>
> >>>>>>
> >>>>>> 2. Also existence of dummy node also leads to inconsistent information. The
> >>>>>> number of online nodes is inconsistent with the information in the
> >>>>>> device-tree and resource-dump
> >>>>>>
> >>>>>> 3. When the dummy node is present, single node non-Numa systems end up showing
> >>>>>> up as NUMA systems and numa_balancing gets enabled. This will mean we take
> >>>>>> the hit from the unnecessary numa hinting faults.
> >>>>>
> >>>>> I have to say that I dislike the node online/offline state and directly
> >>>>> exporting that to the userspace. Users should only care whether the node
> >>>>> has memory/cpus. Numa nodes can be online without any memory. Just
> >>>>> offline all the present memory blocks but do not physically hot remove
> >>>>> them and you are in the same situation. If users are confused by an
> >>>>> output of tools like numactl -H then those could be updated and hide
> >>>>> nodes without any memory&cpus.
> >>>>>
> >>>>> The autonuma problem sounds interesting but again this patch doesn't
> >>>>> really solve the underlying problem because I strongly suspect that the
> >>>>> problem is still there when a numa node gets all its memory offline as
> >>>>> mentioned above.

I would really appreciate a feedback to these two as well.

> >>>>> While I completely agree that making node 0 special is wrong, I have
> >>>>> still hard time to review this very simply looking patch because all the
> >>>>> numa initialization is so spread around that this might just blow up
> >>>>> at unexpected places. IIRC we have discussed testing in the previous
> >>>>> version and David has provided a way to emulate these configurations
> >>>>> on x86. Did you manage to use those instruction for additional testing
> >>>>> on other than ppc architectures?
> >>>>>
> >>>>
> >>>> I have tried all the steps that David mentioned and reported back at
> >>>> https://lore.kernel.org/lkml/20200511174731.GD1961@linux.vnet.ibm.com/t/#u
> >>>>
> >>>> As a summary, David's steps are still not creating a memoryless/cpuless on
> >>>> x86 VM.
> >>>
> >>> Now, that is wrong. You get a memoryless/cpuless node, which is *not
> >>> online*. Once you hotplug some memory, it will switch online. Once you
> >>> remove memory, it will switch back offline.
> >>>
> >>
> >> Let me clarify, we are looking for a node 0 which is cpuless/memoryless at
> >> boot.  The code in question tries to handle a cpuless/memoryless node 0 at
> >> boot.
> > 
> > I was just correcting your statement, because it was wrong.
> > 
> > Could be that x86 code maps PXM 1 to node 0 because PXM 1 does neither
> > have CPUs nor memory. That would imply that we can, in fact, never have
> > node 0 offline during boot.
> > 
> 
> Yep, looks like it.
> 
> [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
> [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
> [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
> [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
> [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
> [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
> [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]

This begs a question whether ppc can do the same thing?

I would swear that we've had x86 system with node 0 but I cannot really
find it and it is possible that it was not x86 after all...
-- 
Michal Hocko
SUSE Labs
