Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D82193CD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 11:18:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p1C96lkrzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 21:17:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p19f01VvzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 21:16:36 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id s1so7017860wrv.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vMy/PQ+ITtl8Oam8bs7Aqt9RXzUHCecRP8udelEpwUQ=;
 b=C86asBB412v49W3v2E6aD9rf/hktbJMvpWwmEzGt+Swciki1mVQzpHOWpQqZkU5NXI
 /QPmhRGvU6IFU2XNx6wCs7/6ouEVNHvAzSs5n6zoGrpZRhaLFEGFKjDQaKQM4AgT7pP7
 tIw35cwjNbKyTkYGgVgtwWYubc3l4tNEoVFAOnMAK/AMARB+CwJAN7TljgBjXQENElhe
 2alx616sE+Os4LLItfeK/zS2S5FlNt8xv8u1LygyxZJuC6pbUObSWjGjdHQpMF5j75JG
 qDfp2VLF2j9Y0MGxEaeviy2OtAsftgW30b6X5J+IzMYftSvDe9gN+s9Ya3NcnErWWLm+
 TOUA==
X-Gm-Message-State: ANhLgQ19nlKuVhSt6QCy0MTiTPPkLL7NI4CnDgtn7a2gA1y0XyqczIwb
 KpT9LAH+xSp/JlsJRUZG3h8=
X-Google-Smtp-Source: ADFU+vtKi1ZhDFDWo9LbSV3RPeDQcM9EQGKR5wMjVNPm5S16Gh5Vh4Dgz3gQRLSPaf9dfo6a+rFnBg==
X-Received: by 2002:adf:83c4:: with SMTP id 62mr9011356wre.105.1585217793341; 
 Thu, 26 Mar 2020 03:16:33 -0700 (PDT)
Received: from localhost (ip-37-188-135-150.eurotel.cz. [37.188.135.150])
 by smtp.gmail.com with ESMTPSA id y200sm2857062wmc.20.2020.03.26.03.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 03:16:32 -0700 (PDT)
Date: Thu, 26 Mar 2020 11:16:31 +0100
From: Michal Hocko <mhocko@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
Message-ID: <20200326101631.GJ27965@dhcp22.suse.cz>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
 <20200326094023.GG27965@dhcp22.suse.cz>
 <6ef554a6-313d-2b17-cee0-14078ed225f6@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ef554a6-313d-2b17-cee0-14078ed225f6@linux.ibm.com>
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

On Thu 26-03-20 15:26:22, Aneesh Kumar K.V wrote:
> On 3/26/20 3:10 PM, Michal Hocko wrote:
> > On Wed 25-03-20 08:49:14, Aneesh Kumar K.V wrote:
> > > Fixes the below crash
> > > 
> > > BUG: Kernel NULL pointer dereference on read at 0x00000000
> > > Faulting instruction address: 0xc000000000c3447c
> > > Oops: Kernel access of bad area, sig: 11 [#1]
> > > LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> > > CPU: 11 PID: 7519 Comm: lt-ndctl Not tainted 5.6.0-rc7-autotest #1
> > > ...
> > > NIP [c000000000c3447c] vmemmap_populated+0x98/0xc0
> > > LR [c000000000088354] vmemmap_free+0x144/0x320
> > > Call Trace:
> > >   section_deactivate+0x220/0x240
> > 
> > It would be great to match this to the specific source code.
> 
> The crash is due to NULL dereference at
> 
> test_bit(idx, ms->usage->subsection_map); due to ms->usage = NULL;

It would be nice to call that out here as well

[...]
> > Why do we have to free usage before deactivaing section memmap? Now that
> > we have a late section_mem_map reset shouldn't we tear down the usage in
> > the same branch?
> > 
> 
> We still need to make the section invalid before we call into
> depopulate_section_memmap(). Because architecture like powerpc can share
> vmemmap area across sections (16MB mapping of vmemmap area) and we use
> vmemmap_popluated() to make that decision.

This should be noted in a comment as well.

> > > Fixes: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
> > > Cc: Baoquan He <bhe@redhat.com>
> > > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > > ---
> > >   mm/sparse.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/mm/sparse.c b/mm/sparse.c
> > > index aadb7298dcef..3012d1f3771a 100644
> > > --- a/mm/sparse.c
> > > +++ b/mm/sparse.c
> > > @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
> > >   			ms->usage = NULL;
> > >   		}
> > >   		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
> > > +		/* Mark the section invalid */
> > > +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
> > 
> > Btw. this comment is not really helping at all.
> 
> That is marking the section invalid so that
> 
> static inline int valid_section(struct mem_section *section)
> {
> 	return (section && (section->section_mem_map & SECTION_HAS_MEM_MAP));
> }
> 
> 
> returns false.

Yes that is obvious once you are clear where to look. I was really
hoping for a comment that would simply point you to the right
direcection without chasing SECTION_HAS_MEM_MAP usage. This code is
subtle and useful comments, even when they state something that is
obvious to you _right_now_, can be really helpful.

Thanks!
-- 
Michal Hocko
SUSE Labs
