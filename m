Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD7211F13
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:43:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yBSl1XTyzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 18:43:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.68; helo=mail-ed1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yBQg3VXGzDqDM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 18:41:29 +1000 (AEST)
Received: by mail-ed1-f68.google.com with SMTP id d15so22766013edm.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 01:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vdQTX1b30r2E+b4wWTLdokaa3kzfoASml+gbdox2kjk=;
 b=snM3tiTHc0SdzB5EDzHsMT9rlceqMEBeLqrSkAitKkFmqx9fZce0VZ5WJsyjKFHKm7
 LYc9IBEjRYHuUQ1j5scn5tZDfc7bqid79Fd01HzcfrlwxourfZsF+ddVFg3NjhoNFYgP
 x+TG1LHX8IvTCfMmltZKQN5rgsz2J4lENWq2T1cH7DD9c7kDpRq9xdgMUrz/14PFamt3
 0VCUUbpI/9Mly9DZxU/xAjgpgRfJhcu9nAK0l2iEUQQcFhDunVNz/4sKlU6r43+iU7hk
 oMJVNDVo0y1vlzWzAU+Ur+DsLjiL7uT7kAp+SRfh9LdJJ1e4xkRxrmwVrGk0iS/R/p5J
 oQmw==
X-Gm-Message-State: AOAM5338bA4uUkQh1oqe/3EROlTPdh82Qa0R05Q+quClioLyPs2Z5fzg
 i7I3bJBl+siAUGHzPGlv54U=
X-Google-Smtp-Source: ABdhPJx82pvZRUddpNf0SPn9KfR7GaUxvmymKbtIogkNF4m5l4Wwf1H8niTtAXXHyeDwlVqAXnpEAw==
X-Received: by 2002:a05:6402:3113:: with SMTP id
 dc19mr32377784edb.20.1593679285570; 
 Thu, 02 Jul 2020 01:41:25 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id a13sm8755656edk.58.2020.07.02.01.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 01:41:24 -0700 (PDT)
Date: Thu, 2 Jul 2020 10:41:23 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200702084123.GC18446@dhcp22.suse.cz>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200702064408.GD17918@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702064408.GD17918@linux.vnet.ibm.com>
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
 David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 02-07-20 12:14:08, Srikar Dronamraju wrote:
> * Michal Hocko <mhocko@kernel.org> [2020-07-01 14:21:10]:
> 
> > > >>>>>>
> > > >>>>>> 2. Also existence of dummy node also leads to inconsistent information. The
> > > >>>>>> number of online nodes is inconsistent with the information in the
> > > >>>>>> device-tree and resource-dump
> > > >>>>>>
> > > >>>>>> 3. When the dummy node is present, single node non-Numa systems end up showing
> > > >>>>>> up as NUMA systems and numa_balancing gets enabled. This will mean we take
> > > >>>>>> the hit from the unnecessary numa hinting faults.
> > > >>>>>
> > > >>>>> I have to say that I dislike the node online/offline state and directly
> > > >>>>> exporting that to the userspace. Users should only care whether the node
> > > >>>>> has memory/cpus. Numa nodes can be online without any memory. Just
> > > >>>>> offline all the present memory blocks but do not physically hot remove
> > > >>>>> them and you are in the same situation. If users are confused by an
> > > >>>>> output of tools like numactl -H then those could be updated and hide
> > > >>>>> nodes without any memory&cpus.
> > > >>>>>
> > > >>>>> The autonuma problem sounds interesting but again this patch doesn't
> > > >>>>> really solve the underlying problem because I strongly suspect that the
> > > >>>>> problem is still there when a numa node gets all its memory offline as
> > > >>>>> mentioned above.
> > 
> > I would really appreciate a feedback to these two as well.
> 
> 1. Its not just numactl that's to be fixed but all tools/utilities that
> depend on /sys/devices/system/node/online. Are we saying to not rely/believe
> in the output given by the kernel but do further verification?  

No, what we are saying is that even an online node might have zero
number of online pages/cpus. So the online status is not really
something that matters. If people are confused by that output then user
space tools can make their confusion go away. I really do not understand
why the kernel should do any logic there.

> Also how would the user space differentiate between the case where the
> Kernel missed marking a node as offline to the case where the memory was
> offlined on a cpuless node but node wasn't offline?.

What I am arguing is that those two shouldn't be any different. Really!

> 2. Regarding the autonuma, the case of offline memory is user/admin driven,
> so if there is a performance hit, its something that's driven by his
> user/admin actions. Also how often do we see users offline complete memory
> of cpuless node on a 2 node system?

How often do we see crippled HW configurations like that? Really if
autonuma should be made more clever for one case it should recognize the
other as well.

> > > [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
> > > [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
> > > [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
> > > [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
> > > [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
> > > [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
> > > [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]
> > 
> > This begs a question whether ppc can do the same thing?
> 
> Certainly ppc can be made to adapt to this situation but that would be a
> workaround. Do we have a reason why we think node 0 is unique and special?

It is not. As replied in other email in this thread. I would hope for
having less hacks in the numa initialization. Cleaning up the mess is
would be a lot of work and testing on all NUMA capable architectures.
This is a heritage from the past I am afraid. All that I am arguing here
is that your touch to the generic code with a very simple looking patch
might have side effects which are pretty much impossible to review.
Moreover it seems that nothing but ppc really needs this treatment.
So fixing it in ppc specific code sounds much more safe.

Normally I would really push for a generic solution but after getting
burned several times in this area I do not dare anymore. The problem is
not in the code complexity but in how spread it is in places where you
do not expect side effects.

-- 
Michal Hocko
SUSE Labs
