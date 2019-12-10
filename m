Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4600118535
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 11:36:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XGhD0y44zDqYK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 21:36:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XGfC1z6FzDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 21:34:56 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id c14so19401362wrn.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uizXfprRj8fjney4P3afQoTDUjaSaVYSy+09p97UTek=;
 b=YrX1RqGKgrVgJ4bQNIHJVPeFG9PLgpHkZQLePgLL+KmPIJvHq4otba8NL/n38zfyOf
 W1bCcjoPfZYnq2DOXFmOZXwZWlGpeMg7Ol4NvlzQsSasHAJXt1wPyokk/njZ3pNPIf48
 nMw27k+iSSMmpsquC5y2fYXYe1o7bJHxm7n57uP7ueg+x9BSBuIwMIFeAICx5hBJd118
 g3RGrMD1CUHiarT4L5Y8lmVdGLll9vOHXNznGeME/GfdgOi0Nk7TbxFH5ZYQKs9S98Xn
 4hzEe3+5gPKy3V3QA6OMghfIYdfnHBtz2rL0un64uhq0SDS4VDisO5qejOip6HOAUseB
 a9qg==
X-Gm-Message-State: APjAAAXA9ZlEQ3d7XSp0Ob4ZHjetUbNffUUOgZ3uz/LvJN1g/R+7MJNa
 Bnn410aj5KvTP4gRVPtmGe8=
X-Google-Smtp-Source: APXvYqz7NYibGMgFhBlmpiRw0nMRfb/8UeyOuRHFJOPIT/McfGwDtjqDvzf1agsTzUpbWsC0n1vSRQ==
X-Received: by 2002:adf:8297:: with SMTP id 23mr2231156wrc.379.1575974093765; 
 Tue, 10 Dec 2019 02:34:53 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id t1sm2693672wma.43.2019.12.10.02.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 02:34:52 -0800 (PST)
Date: Tue, 10 Dec 2019 11:34:52 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 5/6] mm, memory_hotplug: Provide argument for the
 pgprot_t in arch_add_memory()
Message-ID: <20191210103452.GF10404@dhcp22.suse.cz>
References: <20191209191346.5197-1-logang@deltatee.com>
 <20191209191346.5197-6-logang@deltatee.com>
 <ce50d9da-c60e-05a1-a86b-3bb3629de502@redhat.com>
 <f34a4c52-cc95-15ed-8a72-c05ab4fd6d33@deltatee.com>
 <CAPcyv4hpXCZxV5p7WaeGgE7ceujBBa5NOz9Z8fepDHOt6zHO2A@mail.gmail.com>
 <20191210100432.GC10404@dhcp22.suse.cz>
 <6da2b279-6a6d-d89c-a34c-962ed021d91d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6da2b279-6a6d-d89c-a34c-962ed021d91d@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Linux-sh <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 10-12-19 11:09:46, David Hildenbrand wrote:
> On 10.12.19 11:04, Michal Hocko wrote:
> > On Mon 09-12-19 12:43:40, Dan Williams wrote:
> >> On Mon, Dec 9, 2019 at 12:24 PM Logan Gunthorpe <logang@deltatee.com> wrote:
> >>>
> >>>
> >>>
> >>> On 2019-12-09 12:23 p.m., David Hildenbrand wrote:
> >>>> On 09.12.19 20:13, Logan Gunthorpe wrote:
> > [...]
> >>>>>  #ifdef CONFIG_MEMORY_HOTPLUG
> >>>>> -int arch_add_memory(int nid, u64 start, u64 size,
> >>>>> +int arch_add_memory(int nid, u64 start, u64 size, pgprot_t prot,
> >>>>>                      struct mhp_restrictions *restrictions)
> >>>>
> >>>> Can we fiddle that into "struct mhp_restrictions" instead?
> >>>
> >>> Yes, if that's what people want, it's pretty trivial to do. I chose not
> >>> to do it that way because it doesn't get passed down to add_pages() and
> >>> it's not really a "restriction". If I don't hear any objections, I will
> >>> do that for v2.
> >>
> >> +1 to storing this information alongside the altmap in that structure.
> >> However, I agree struct mhp_restrictions, with the MHP_MEMBLOCK_API
> >> flag now gone, has lost all of its "restrictions". How about dropping
> >> the 'flags' property and renaming the struct to 'struct
> >> mhp_modifiers'?
> > 
> > Hmm, this email somehow didn't end up in my inbox so I have missed it
> > before replying.
> > 
> > Well, mhp_modifiers makes some sense and it would reduce the API
> > proliferation but how do you expect the prot part to be handled?
> > I really do not want people to think about PAGE_KERNEL or which
> > protection to use because my experience tells that this will get copied
> > without much thinking or simply will break with some odd usecases.
> > So how exactly this would be used?
> 
> I was thinking about exactly the same "issue".
> 
> 1. default initialization via a function
> 
> memhp_modifier_default_init(&modified);
> 
> 2. a flag that unlocks the prot field (default:0). Without the flag, it
> is ignored. We can keep the current initialization then.
> 
> Other ideas?

3. a prot mask to apply on top of PAGE_KERNEL? Or would that be
insufficient/clumsy?
-- 
Michal Hocko
SUSE Labs
