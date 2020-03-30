Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2628197833
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 12:00:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rSd75TqfzDqCV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 21:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rSbF0x1gzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 20:58:48 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id d5so20866137wrn.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 02:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RAW4dI5AqDOZg2OFBhTf/EVo0m3y8bG8p0ACgPsFWtE=;
 b=npKv6z/hROW+E6L8PKWq/tp5BltNL6dVgSEUn+k1L36OuzQci8oKp31x58HK+Tdw5g
 IyxtjyX+5IPzWr2Fbmw7ys7bqqtVHMVmxEx5ppIOoN4zZfzolVBBi/ID0+zhhwZjonuo
 lks/T50P+HwHxNHLyO2w2n4w+4Mponcxdo9xGbwA5ym0LSIQw6DnvVd/XjfshKg0dB6o
 yX0w3ga6zZ3/inSqjGHUIDMDUYXWWJbXdKVM1Fo5v6fB1P+ymWPS3u3h3B4AS0Re/Xcs
 t+vjbTbp7mvrZciiUX9TQKAcHCFSZzEa5W5D84uBWlylENvXye8Q2zHeY4/vw7NBpJ6y
 ZEiQ==
X-Gm-Message-State: ANhLgQ0y50hBOn0yHzAn7wHyckud9+hx98s0r3env1XDS3KyVevIGF0/
 5DMfCINNe8/lkLrDmj5jZq8=
X-Google-Smtp-Source: ADFU+vs2ADx9iXcEtG7i4t0y2sXGzETHyH4fleW4u+faHVS+T4YFrF+aBgCdG9nD2ekBmdttmSU8rw==
X-Received: by 2002:a5d:460f:: with SMTP id t15mr14129460wrq.413.1585562325855; 
 Mon, 30 Mar 2020 02:58:45 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id b199sm17339431wme.23.2020.03.30.02.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 02:58:44 -0700 (PDT)
Date: Mon, 30 Mar 2020 11:58:43 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20200330095843.GF14243@dhcp22.suse.cz>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330092127.GB30942@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330092127.GB30942@linux.ibm.com>
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
 linux-s390@vger.kernel.org, x86@kernel.org,
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

On Mon 30-03-20 12:21:27, Mike Rapoport wrote:
> On Mon, Mar 30, 2020 at 09:42:46AM +0200, Michal Hocko wrote:
> > On Sat 28-03-20 11:31:17, Hoan Tran wrote:
> > > In NUMA layout which nodes have memory ranges that span across other nodes,
> > > the mm driver can detect the memory node id incorrectly.
> > > 
> > > For example, with layout below
> > > Node 0 address: 0000 xxxx 0000 xxxx
> > > Node 1 address: xxxx 1111 xxxx 1111
> > > 
> > > Note:
> > >  - Memory from low to high
> > >  - 0/1: Node id
> > >  - x: Invalid memory of a node
> > > 
> > > When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> > > config, mm only checks the memory validity but not the node id.
> > > Because of that, Node 1 also detects the memory from node 0 as below
> > > when it scans from the start address to the end address of node 1.
> > > 
> > > Node 0 address: 0000 xxxx xxxx xxxx
> > > Node 1 address: xxxx 1111 1111 1111
> > > 
> > > This layout could occur on any architecture. Most of them enables
> > > this config by default with CONFIG_NUMA. This patch, by default, enables
> > > CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.
> > 
> > I am not opposed to this at all. It reduces the config space and that is
> > a good thing on its own. The history has shown that meory layout might
> > be really wild wrt NUMA. The config is only used for early_pfn_in_nid
> > which is clearly an overkill.
> > 
> > Your description doesn't really explain why this is safe though. The
> > history of this config is somehow messy, though. Mike has tried
> > to remove it a94b3ab7eab4 ("[PATCH] mm: remove arch independent
> > NODES_SPAN_OTHER_NODES") just to be reintroduced by 7516795739bd
> > ("[PATCH] Reintroduce NODES_SPAN_OTHER_NODES for powerpc") without any
> > reasoning what so ever. This doesn't make it really easy see whether
> > reasons for reintroduction are still there. Maybe there are some subtle
> > dependencies. I do not see any TBH but that might be burried deep in an
> > arch specific code.
> 
> Well, back then early_pfn_in_nid() was arch-dependant, today everyone
> except ia64 rely on HAVE_MEMBLOCK_NODE_MAP.

What would it take to make ia64 use HAVE_MEMBLOCK_NODE_MAP? I would
really love to see that thing go away. It is causing problems when
people try to use memblock api.

> So, if the memblock node map
> is correct, that using CONFIG_NUMA instead of CONFIG_NODES_SPAN_OTHER_NODES
> would only mean that early_pfn_in_nid() will cost several cycles more on
> architectures that didn't select CONFIG_NODES_SPAN_OTHER_NODES (i.e. arm64
> and sh).

Do we have any idea on how much of an overhead that is? Because this is
per each pfn so it can accumulate a lot! 

> Agian, ia64 is an exception here.

Thanks for the clarification!
-- 
Michal Hocko
SUSE Labs
