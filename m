Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5117271E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 19:29:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T1R25jmWzDr7K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T1NN3s3szDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 05:26:57 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id a141so480570wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nuYWGvXIJxnKaPJUN7O6fqH652rzQXPhnsvypnDtqKs=;
 b=t+nu3ANeWFUNVg864Y1qnQ1jN+fJqswglNvUOcEvagzzUKbu2rivuFilEvqI65fztH
 /Igj+bw6YwiRN4lXo0/bCuUo6tUuNKNQvEpd8blbTuRhDxb/JwE03y3LRzIegaKiqqp4
 a5oulxDmWlmAZBUCiAMOB2/xoaIwdEgd1GhHjmqbQZrpsvAkix/J+Y2jz69VmTA99rZa
 1ObeaTAgdofK6Q1CQYE6zdFs9g2aBSs0L+PwyZwyVAsWehWE3xk9YuWfUQxWNfstJ17v
 7PWPyF4wUTOBtzGw2gSplE0XcNp0hy831CFXXMLavUNASTS1KPqz6WKnqp5lI+tLM8ve
 Uj8g==
X-Gm-Message-State: APjAAAVyHuHEPrASk1UC/OKz5ZmG1U32TKDw7hYovp+GcIvH8lXWM3bM
 cViwvkqhnP6Uo8JFT4/ndiU=
X-Google-Smtp-Source: APXvYqx82ijERbvyDfB3ZxoT7lm5HutF/9NedvT6IjWQepUKymCSU7QWzkD1heIcOCKUVN7tFyWCjg==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr108626wmc.36.1582828014406; 
 Thu, 27 Feb 2020 10:26:54 -0800 (PST)
Received: from localhost (ip-37-188-246-93.eurotel.cz. [37.188.246.93])
 by smtp.gmail.com with ESMTPSA id g7sm1739081wrm.72.2020.02.27.10.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:26:53 -0800 (PST)
Date: Thu, 27 Feb 2020 19:26:50 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200227182650.GG3771@dhcp22.suse.cz>
References: <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Cc ppc maintainers]
On Thu 27-02-20 17:16:41, Vlastimil Babka wrote:
> On 2/27/20 5:00 PM, Sachin Sant wrote:
> > 
> > 
> >> On 27-Feb-2020, at 5:42 PM, Michal Hocko <mhocko@kernel.org> wrote:
> >> 
> >> A very good hint indeed. I would do this
> >> diff --git a/include/linux/topology.h b/include/linux/topology.h
> >> index eb2fe6edd73c..d9f1b6737e4d 100644
> >> --- a/include/linux/topology.h
> >> +++ b/include/linux/topology.h
> >> @@ -137,6 +137,8 @@ static inline void set_numa_mem(int node)
> >> {
> >> 	this_cpu_write(_numa_mem_, node);
> >> 	_node_numa_mem_[numa_node_id()] = node;
> >> +	pr_info("%s %d -> %d\n", __FUNCTION__, numa_node_id(), node);
> >> +	dump_stack();
> >> }
> >> #endif
> >> 
> >> Btw. it would be also helpful to get
> >> `faddr2line ___slab_alloc+0x334' from your kernel Sachin.
> > 
> > [linux-next]# ./scripts/faddr2line ./vmlinux ___slab_alloc+0x334 
> > ___slab_alloc+0x334/0x760:
> > new_slab_objects at mm/slub.c:2478
> > (inlined by) ___slab_alloc at mm/slub.c:2628
> > [linux-next]# 
> 
> Hmm that doesn't look relevant, but that address was marked as unreliable, no?
> Don't we actually need this one?
> 
> [    8.768727] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
> 
> > I have also attached boot log with a kernel that include about change.
> > I see the following o/p during boot:
> > 
> > [    0.005269] set_numa_mem 1 -> 1
> 
> So there's no "set_numa_mem 0 -> X", specifically not
> "set_numa_mem 0 -> 1" which I would have expected. That seems to confirm my
> suspicion that the arch code doesn't set up the memoryless node 0 properly.

Please have a look at http://lkml.kernel.org/r/52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com
for the boot log with the debugging patch which tracks set_numa_mem.
This seems to lead to a crash in the slab allocator bebcause
node_to_mem_node(0) for memory less node resolves to the memory less
node http://lkml.kernel.org/r/dd450314-d428-6776-af07-f92c04c7b967@suse.cz.
The original report is http://lkml.kernel.org/r/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com

> 
> > [    0.005270] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
> > [    0.005271] Call Trace:
> > [    0.005272] [c0000008b37dfe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
> > [    0.005274] [c0000008b37dfec0] [c000000000059320] start_secondary+0x600/0x6e0
> > [    0.005277] [c0000008b37dff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
> > 
> > Thanks
> > -Sachin
> > 

-- 
Michal Hocko
SUSE Labs
