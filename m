Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4281A3747
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:35:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ylZx2y4bzDrHF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 01:35:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ylXn4BbMzDr2y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 01:33:26 +1000 (AEST)
Received: by mail-wr1-f68.google.com with SMTP id g3so12457432wrx.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 08:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eU8HVKPcEFasCzGb3YcmSlRzYlNKnx8U/U7SeGkKTM4=;
 b=LuzlrEE+nDMBHaUHlfVGa3+KFsKouRFxob0cZnuqtgeUNPYJ2d3bs/ywRuc0oY4kOc
 wM72EWO3j34o6jObEoweoY2JubjsEdt2nSqgqx4OZRuC2GjcNKZocKN7cHPTPPAnc/mB
 Jz5tYR2Bh8xeD/XY7a2C4yuoAEqBTsSOK7ea5KXnsxXuTGgQGvbwMl2SQPe5uVEla/NS
 zUn8IXiTX2J35faWZ9UT67bv3GKBhI4WnwTa1EV2uV9G7uSiidD07CXE7RBUea44e0vA
 n+kR2IyVzA2QBKU/Ks/bnjTWBE56dPUpntNRfmhhhF+yu52CSAX2n+H6YbyNmYOH//I1
 VLNw==
X-Gm-Message-State: AGi0PuYObGMULMuMk5DOxIKFEhcOFeuKvLF1MUQ7I8sXHS9oJp3BU2Ex
 El0aQ1pL18qXqxNeGEU/blc=
X-Google-Smtp-Source: APiQypLhnJ0ArE660dAIRKPg+UfX8htjcJDtxqzlxSXIrBucMDxX/FoA+uq76nGwKcjVTj7PGoGnsA==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr15000370wrt.306.1586446403503; 
 Thu, 09 Apr 2020 08:33:23 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id o67sm4335914wmo.5.2020.04.09.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 08:33:22 -0700 (PDT)
Date: Thu, 9 Apr 2020 17:33:21 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH RFC] mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP (was: Re:
 [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA)
Message-ID: <20200409153321.GQ18386@dhcp22.suse.cz>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330092127.GB30942@linux.ibm.com>
 <20200330095843.GF14243@dhcp22.suse.cz>
 <20200331215618.GG30942@linux.ibm.com>
 <20200401054227.GC2129@MiWiFi-R3L-srv>
 <20200401075155.GH30942@linux.ibm.com>
 <20200402080144.GK22681@dhcp22.suse.cz>
 <20200409144119.GE2129@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409144119.GE2129@MiWiFi-R3L-srv>
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
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
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

On Thu 09-04-20 22:41:19, Baoquan He wrote:
> On 04/02/20 at 10:01am, Michal Hocko wrote:
> > On Wed 01-04-20 10:51:55, Mike Rapoport wrote:
> > > Hi,
> > > 
> > > On Wed, Apr 01, 2020 at 01:42:27PM +0800, Baoquan He wrote:
> > [...]
> > > > From above information, we can remove HAVE_MEMBLOCK_NODE_MAP, and
> > > > replace it with CONFIG_NUMA. That sounds more sensible to store nid into
> > > > memblock when NUMA support is enabled.
> > >  
> > > Replacing CONFIG_HAVE_MEMBLOCK_NODE_MAP with CONFIG_NUMA will work, but
> > > this will not help cleaning up the whole node/zone initialization mess and
> > > we'll be stuck with two implementations.
> > 
> > Yeah, this is far from optimal.
> > 
> > > The overhead of enabling HAVE_MEMBLOCK_NODE_MAP is only for init time as
> > > most architectures will anyway discard the entire memblock, so having it in
> > > a UMA arch won't be a problem. The only exception is arm that uses
> > > memblock for pfn_valid(), here we may also think about a solution to
> > > compensate the addition of nid to the memblock structures. 
> > 
> > Well, we can make memblock_region->nid defined only for CONFIG_NUMA.
> > memblock_get_region_node would then unconditionally return 0 on UMA.
> > Essentially the same way we do NUMA for other MM code. I only see few
> > direct usage of region->nid.
> 
> Checked code again, seems HAVE_MEMBLOCK_NODE_MAP is selected directly in
> all ARCHes which support it. Means HAVE_MEMBLOCK_NODE_MAP is enabled by
> default on those ARCHes, and has no dependency on CONFIG_NUMA at all.
> E.g on x86, it just calls free_area_init_nodes() in generic code path,
> while free_area_init_nodes() is defined in CONFIG_HAVE_MEMBLOCK_NODE_MAP
> ifdeffery scope. So I tend to agree with Mike to remove
> HAVE_MEMBLOCK_NODE_MAP firstly on all ARCHes. We can check if it's worth
> only defining memblock_region->nid for CONFIG_NUMA case after
> HAVE_MEMBLOCK_NODE_MAP is removed.

This can surely go in separate patches. What I meant to say is the
region->nid is by definition 0 on !CONFIG_NUMA.

-- 
Michal Hocko
SUSE Labs
