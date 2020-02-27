Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079A17179F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:39:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SsgL5X5LzDqrm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrsW5NLlzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 23:03:10 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id w6so2681817otk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 04:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s88dqWQXtnCCf1IG7r+WjQFYzYolCKpQ30PYLMnD1DA=;
 b=mcsCv5j8z2k3e+Cbm03JCUWV9e0IGiLAo6WvkqByRnB4IjYnaSHNgnE1+cxTLEnZPO
 oi2caRsf4WeocNZIHOP5qK++GAObkUuOkYogoC5OTy9w4/DtyOg1kfDKeW8Hbnl+da9k
 aB5Nqqd4urNvuV0UHTC1ljinWhg3nmYhHJVZJr96Aii+gHhstjAgGvZGxKsg2xcbPRFt
 EjLJXKaOLy3i2mX+D9Fd93J59eA9zA6T4JgX7th79o56UUd6sYXra0CWX8rVvT3GMnR4
 4US6azVqsdsH+2542FyE36y8QFB+ygfzZUj4+aE4PY4Lcs4DkqH1DR5IRLw3xfpwZ+MG
 n5Iw==
X-Gm-Message-State: APjAAAUzCF7o1NtroDJidy34doRqOuMsgGTn3Ho+nzhjkcLgNV0WYPkb
 8Uin5ONxo95taws06FyvI0o=
X-Google-Smtp-Source: APXvYqza0IEBOPp0BJkDZURKgcDaawSsuC+UWqxqZATJ7ZDU6JrAx7XQPzGdqfAhkKlLFN9tvV1W2Q==
X-Received: by 2002:a9d:798e:: with SMTP id h14mr2912908otm.257.1582804982704; 
 Thu, 27 Feb 2020 04:03:02 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id c7sm1867370otm.63.2020.02.27.04.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:01 -0800 (PST)
Date: Thu, 27 Feb 2020 13:02:59 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200227120259.GD3771@dhcp22.suse.cz>
References: <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
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
 Kirill Tkhai <ktkhai@virtuozzo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 26-02-20 22:45:52, Vlastimil Babka wrote:
> On 2/26/20 7:41 PM, Michal Hocko wrote:
> > On Wed 26-02-20 18:25:28, Cristopher Lameter wrote:
> >> On Mon, 24 Feb 2020, Michal Hocko wrote:
> >>
> >>> Hmm, nasty. Is there any reason why kmalloc_node behaves differently
> >>> from the page allocator?
> >>
> >> The page allocator will do the same thing if you pass GFP_THISNODE and
> >> insist on allocating memory from a node that does not exist.
> > 
> > I do not think that the page allocator would blow up even with
> > GFP_THISNODE. The allocation would just fail on memory less node.
> > 
> > Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> > semantic right? At least I do not see anything like that documented
> > anywhere.
> 
> Seems like SLAB at least behaves like the page allocator. See
> ____cache_alloc_node() where it basically does:
> 
> page = cache_grow_begin(cachep, gfp_exact_node(flags), nodeid);
> ...
> if (!page)
> 	fallback_alloc(cachep, flags)
> 
> gfp_exact_node() adds __GFP_THISNODE among other things, so the initial
> attempt does try to stick only to the given node. But fallback_alloc()
> doesn't. In fact, even if kmalloc_node() was called with __GFP_THISNODE
> then it wouldn't work as intended, as fallback_alloc() doesn't get the
> nodeid, but instead will use numa_mem_id(). That part could probably be
> improved.
> 
> SLUB's ___slab_alloc() has for example this:
> if (node != NUMA_NO_NODE && !node_present_pages(node))

Hmm, just a quick note. Shouldn't this be node_managed_pages? In most
cases the difference is negligible but I can imagine crazy setups where
all present pages are simply consumed.

>     searchnode = node_to_mem_node(node);
> 
> That's from Joonsoo's 2014 commit a561ce00b09e ("slub: fall back to
> node_to_mem_node() node if allocating on memoryless node"), suggesting
> that the scenario in this bug report should work. Perhaps it just got
> broken unintentionally later.

A very good reference. Thanks!

> And AFAICS the whole path leading to alloc_slab_page() also doesn't add
> __GFP_THISNODE, but will keep it if caller passed it, and ultimately it
> does:
> 
> 
> if (node == NUMA_NO_NODE)
>     page = alloc_pages(flags, order);
> else
>     page = __alloc_pages_node(node, flags, order);
> 
> So yeah looks like SLUB's kmalloc_node() is supposed to behave like the
> page allocator's __alloc_pages_node() and respect __GFP_THISNODE but not
> enforce it by itself. There's probably just some missing data structure
> initialization somewhere right now for memoryless nodes.

Thanks for the confirmation!
-- 
Michal Hocko
SUSE Labs
