Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 765B51BDD52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:16:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BzXr5nN0zDr9N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 23:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.65; helo=mail-wr1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByLz18g8zDr72
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:22:18 +1000 (AEST)
Received: by mail-wr1-f65.google.com with SMTP id i10so2244097wrv.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F1Vyi5oIpMniiJ1X1bwh1/7tqzVkkRj08pWhRZE7c+M=;
 b=glrpvZp7RftOKZXFMuASDt6twJF/p2K78XaX5UrTVthSkbgsL1JYlwG843r/BSYDMq
 I9N/bIU9ItEZ5TYM7Tkm2LPlNFFv7pQwi2mMUVAoIhliFEHwwrkRZZ9nwspxqKILeRwg
 A6+PofA95ZP4KahP6Ww9sUURxKbmDiRRUzbwHhpNjUhBXVAe7jPIAcV0n7QB6uXGN4jK
 a4rxxI+Ppe/9ml3XU9sy3GC44RlBRMmBRJDRIag3B8Jp1oCFMVux3/0U0DAEPyL+JhF3
 KCL5rLodkcx0x5UN3Y+6XHNvNoyn4yhrV+lCITeIlmDvrRFZ9npNGRpFXc9T7CVOb1Do
 AlKA==
X-Gm-Message-State: AGi0Pubx8lwRqDmfW9VV5+pFImpAnu7TZwcH9kfFZQGXdUMOWb3uAFsP
 uB/p4kctayrwMhk64iSqxtw=
X-Google-Smtp-Source: APiQypKnWBYUo6BP7xM7bZ+TgaJBDEnHFZi4EuKVmDYQRCUHS4sHLGy0+C//6II7OWTEW5xn6unxsw==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr38386766wru.258.1588162933425; 
 Wed, 29 Apr 2020 05:22:13 -0700 (PDT)
Received: from localhost (ip-37-188-130-62.eurotel.cz. [37.188.130.62])
 by smtp.gmail.com with ESMTPSA id n25sm7497026wmk.9.2020.04.29.05.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:22:12 -0700 (PDT)
Date: Wed, 29 Apr 2020 14:22:11 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200429122211.GD28637@dhcp22.suse.cz>
References: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
 <20200428093836.27190-4-srikar@linux.vnet.ibm.com>
 <20200428165912.ca1eadefbac56d740e6e8fd1@linux-foundation.org>
 <20200429014145.GD19958@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429014145.GD19958@linux.vnet.ibm.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 29-04-20 07:11:45, Srikar Dronamraju wrote:
> > > 
> > > By marking, N_ONLINE as NODE_MASK_NONE, lets stop assuming that Node 0 is
> > > always online.
> > > 
> > > ...
> > >
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -116,8 +116,10 @@ EXPORT_SYMBOL(latent_entropy);
> > >   */
> > >  nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
> > >  	[N_POSSIBLE] = NODE_MASK_ALL,
> > > +#ifdef CONFIG_NUMA
> > > +	[N_ONLINE] = NODE_MASK_NONE,
> > > +#else
> > >  	[N_ONLINE] = { { [0] = 1UL } },
> > > -#ifndef CONFIG_NUMA
> > >  	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
> > >  #ifdef CONFIG_HIGHMEM
> > >  	[N_HIGH_MEMORY] = { { [0] = 1UL } },
> > 
> > So on all other NUMA machines, when does node 0 get marked online?
> > 
> > This change means that for some time during boot, such machines will
> > now be running with node 0 marked as offline.  What are the
> > implications of this?  Will something break?
> 
> Till the nodes are detected, marking Node 0 as online tends to be redundant.
> Because the system doesn't know if its a NUMA or a non-NUMA system.
> Once we detect the nodes, we online them immediately. Hence I don't see any
> side-effects or negative implications of this change.
> 
> However if I am missing anything, please do let me know.
> 
> >From my part, I have tested this on
> 1. Non-NUMA Single node but CPUs and memory coming from zero node.
> 2. Non-NUMA Single node but CPUs and memory coming from non-zero node.
> 3. NUMA Multi node but with CPUs and memory from node 0.
> 4. NUMA Multi node but with no CPUs and memory from node 0.

Have you tested on something else than ppc? Each arch does the NUMA
setup separately and this is a big mess. E.g. x86 marks even memory less
nodes (see init_memory_less_node) as online.

Honestly I have hard time to evaluate the effect of this patch. It makes
some sense to assume all nodes offline before they get online but this
is a land mine territory.

I am also not sure what kind of problem this is going to address. You
have mentioned numa balancing without many details.
-- 
Michal Hocko
SUSE Labs
