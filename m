Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29C193D4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 11:52:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p1z25w0czDqrq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 21:52:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p1wx4D8szDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 21:50:40 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id w10so7170890wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fIDalzpcD8dABfU2gkMMLisEURz4uVPkV63E+3HwQn4=;
 b=I0iRcbbXxCH0Uc9lhFFsdpkcX441j+v2qhOwoh6DKIYDe+vqtjeRUSbZ7/tfuLasON
 /avGHSCQJluR8T6QL9rmZPmE6yk0WX/RYKj8GrJ0T5iEReKvMm/ktx6xdF6NAX66buCU
 n8/tQTcQwHJutebUGuX9g8s9cT1H8cfkoIGWYyl9BmbPbn5B6f3SLtHpKav7Wb1ro6mr
 Sckb/pBexAZhY9j9tb5MGHGgQ7DVxtk7j4SVYUHr0T6Gd9yFuIuDN+flTcy2k5x3Xt3J
 fljWZoCYO7oh/w5MmAJKSuC1y42srdIPeuaBvUlf4AyWa7ur3U8Y/a4HM98wFMBCO7QN
 x1UA==
X-Gm-Message-State: ANhLgQ2CAmDi8FAvAinNx65hocEi7hDZaqtMrIeop44VKXqUWoKMTm9w
 ooscg9yTyPtEsx2gy7osLrs=
X-Google-Smtp-Source: ADFU+vvFG1k0XSUywnU+P8ccTbMl2E5UoReBqVpzEQk9W51MyjLqABotwk1CEQ7o7p/Jcjs0kvrz4w==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr9129088wru.390.1585219838144; 
 Thu, 26 Mar 2020 03:50:38 -0700 (PDT)
Received: from localhost (ip-37-188-135-150.eurotel.cz. [37.188.135.150])
 by smtp.gmail.com with ESMTPSA id t12sm3432621wrm.0.2020.03.26.03.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 03:50:37 -0700 (PDT)
Date: Thu, 26 Mar 2020 11:50:36 +0100
From: Michal Hocko <mhocko@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
Message-ID: <20200326105036.GK27965@dhcp22.suse.cz>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
 <20200326094023.GG27965@dhcp22.suse.cz>
 <6ef554a6-313d-2b17-cee0-14078ed225f6@linux.ibm.com>
 <20200326101631.GJ27965@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326101631.GJ27965@dhcp22.suse.cz>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 26-03-20 11:16:33, Michal Hocko wrote:
> On Thu 26-03-20 15:26:22, Aneesh Kumar K.V wrote:
> > On 3/26/20 3:10 PM, Michal Hocko wrote:
> > > On Wed 25-03-20 08:49:14, Aneesh Kumar K.V wrote:
> > > > Fixes the below crash
> > > > 
> > > > BUG: Kernel NULL pointer dereference on read at 0x00000000
> > > > Faulting instruction address: 0xc000000000c3447c
> > > > Oops: Kernel access of bad area, sig: 11 [#1]
> > > > LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> > > > CPU: 11 PID: 7519 Comm: lt-ndctl Not tainted 5.6.0-rc7-autotest #1
> > > > ...
> > > > NIP [c000000000c3447c] vmemmap_populated+0x98/0xc0
> > > > LR [c000000000088354] vmemmap_free+0x144/0x320
> > > > Call Trace:
> > > >   section_deactivate+0x220/0x240
> > > 
> > > It would be great to match this to the specific source code.
> > 
> > The crash is due to NULL dereference at
> > 
> > test_bit(idx, ms->usage->subsection_map); due to ms->usage = NULL;
> 
> It would be nice to call that out here as well
> 
> [...]
> > > Why do we have to free usage before deactivaing section memmap? Now that
> > > we have a late section_mem_map reset shouldn't we tear down the usage in
> > > the same branch?
> > > 
> > 
> > We still need to make the section invalid before we call into
> > depopulate_section_memmap(). Because architecture like powerpc can share
> > vmemmap area across sections (16MB mapping of vmemmap area) and we use
> > vmemmap_popluated() to make that decision.
> 
> This should be noted in a comment as well.
> 
> > > > Fixes: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
> > > > Cc: Baoquan He <bhe@redhat.com>
> > > > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > > > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > > > ---
> > > >   mm/sparse.c | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/mm/sparse.c b/mm/sparse.c
> > > > index aadb7298dcef..3012d1f3771a 100644
> > > > --- a/mm/sparse.c
> > > > +++ b/mm/sparse.c
> > > > @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
> > > >   			ms->usage = NULL;
> > > >   		}
> > > >   		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
> > > > +		/* Mark the section invalid */
> > > > +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
> > > 
> > > Btw. this comment is not really helping at all.
> > 
> > That is marking the section invalid so that
> > 
> > static inline int valid_section(struct mem_section *section)
> > {
> > 	return (section && (section->section_mem_map & SECTION_HAS_MEM_MAP));
> > }
> > 
> > 
> > returns false.
> 
> Yes that is obvious once you are clear where to look. I was really
> hoping for a comment that would simply point you to the right
> direcection without chasing SECTION_HAS_MEM_MAP usage. This code is
> subtle and useful comments, even when they state something that is
> obvious to you _right_now_, can be really helpful.

Btw. forgot to add. With the improved comment feel free to add
Acked-by: Michal Hocko <mhocko@suse.com>

-- 
Michal Hocko
SUSE Labs
