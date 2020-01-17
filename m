Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFEF140E0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 16:43:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zlhs5clbzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 02:43:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zlPY3PQrzDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 02:29:52 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id d16so23130265wre.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6t3yfFexJC6Tl9V+RJRNT0Pk0BtQCTtgmeoaWvyr77Q=;
 b=jDqJdCMyAuSDl5xnrq5F754fFrPN/HTVUeAMNuG97rObdP3tFUK6kerNGElAGX4DzX
 qJeScNlq0lIydkdL9a4m4qqRe/XLB4eLdSiDGoDtTIXbqRlqjVgJydVOIkbSt77WneZd
 mzdFbI8dKPRb12zykQowW0lRxA3LQvcYCoO/tkH7KQzUsGbZvomorpG5YeYE8izVIULS
 fpW5/AUjsbH+5j1NjbnMZ5+TUJbhNfVx3hnfz3prWWRFIpfThjRcD2NY+18v5CsvS5C0
 puC/MBQaYtSApfLksQ6kepBS4H2M45iKoskAMzv+O+XB4RgYhs0aAh7xlCy9Dd1jHKxX
 GEhA==
X-Gm-Message-State: APjAAAV6egTyAm+6XscrAVRAtOl7NJ8eY3Ti4pXwYZCes2gWL3opqblq
 6VybN+xg6VQfFrYZQoIy9mE=
X-Google-Smtp-Source: APXvYqyx9Wp89eN6+iz3QNoVLr7ZRoTCY6IXaZ4nazRJW+ejjPTRYu84zeOl+BMdPqNUU7H/RJKwYA==
X-Received: by 2002:adf:f885:: with SMTP id u5mr3700551wrp.359.1579274988805; 
 Fri, 17 Jan 2020 07:29:48 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id s15sm32021764wrp.4.2020.01.17.07.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 07:29:48 -0800 (PST)
Date: Fri, 17 Jan 2020 16:29:47 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200117152947.GK19428@dhcp22.suse.cz>
References: <20200117105759.27905-1-david@redhat.com>
 <20200117113353.GT19428@dhcp22.suse.cz>
 <c82a0dd7-a99b-6def-83d4-a19fbdd405d9@redhat.com>
 <20200117145233.GB19428@dhcp22.suse.cz>
 <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 17-01-20 15:58:26, David Hildenbrand wrote:
> On 17.01.20 15:52, Michal Hocko wrote:
> > On Fri 17-01-20 14:08:06, David Hildenbrand wrote:
> >> On 17.01.20 12:33, Michal Hocko wrote:
> >>> On Fri 17-01-20 11:57:59, David Hildenbrand wrote:
> >>>> Let's refactor that code. We want to check if we can offline memory
> >>>> blocks. Add a new function is_mem_section_offlineable() for that and
> >>>> make it call is_mem_section_offlineable() for each contained section.
> >>>> Within is_mem_section_offlineable(), add some more sanity checks and
> >>>> directly bail out if the section contains holes or if it spans multiple
> >>>> zones.
> >>>
> >>> I didn't read the patch (yet) but I am wondering. If we want to touch
> >>> this code, can we simply always return true there? I mean whoever
> >>> depends on this check is racy and the failure can happen even after
> >>> the sysfs says good to go, right? The check is essentially as expensive
> >>> as calling the offlining code itself. So the only usecase I can think of
> >>> is a dumb driver to crawl over blocks and check which is removable and
> >>> try to hotremove it. But just trying to offline one block after another
> >>> is essentially going to achieve the same.
> >>
> >> Some thoughts:
> >>
> >> 1. It allows you to check if memory is likely to be offlineable without
> >> doing expensive locking and trying to isolate pages (meaning:
> >> zone->lock, mem_hotplug_lock. but also, calling drain_all_pages()
> >> when isolating)
> >>
> >> 2. There are use cases that want to identify a memory block/DIMM to
> >> unplug. One example is PPC DLPAR code (see this patch). Going over all
> >> memory block trying to offline them is an expensive operation.
> >>
> >> 3. powerpc-utils (https://github.com/ibm-power-utilities/powerpc-utils)
> >> makes use of /sys/.../removable to speed up the search AFAIK.
> > 
> > Well, while I do see those points I am not really sure they are worth
> > having a broken (by-definition) interface.
> 
> It's a pure speedup. And for that, the interface has been working
> perfectly fine for years?
> 
> >  
> >> 4. lsmem displays/groups by "removable".
> > 
> > Is anybody really using that?
> 
> Well at least I am using that when testing to identify which
> (ZONE_NORMAL!) block I can easily offline/re-online (e.g., to validate
> all the zone shrinking stuff I have been fixing)
> 
> So there is at least one user ;)

Fair enough. But I would argue that there are better ways to do the same
solely for testing purposes. Rather than having a subtly broken code to
maintain.
 
> > 
> >>> Or does anybody see any reasonable usecase that would break if we did
> >>> that unconditional behavior?
> >>
> >> If we would return always "true", then the whole reason the
> >> interface originally was introduced would be "broken" (meaning, less
> >> performant as you would try to offline any memory block).
> > 
> > I would argue that the whole interface is broken ;). Not the first time
> > in the kernel development history and not the last time either. What I
> > am trying to say here is that unless there are _real_ usecases depending
> > on knowing that something surely is _not_ offlineable then I would just
> > try to drop the functionality while preserving the interface and see
> > what happens.
> 
> I can see that, but I can perfectly well understand why - especially
> powerpc - wants a fast way to sense which blocks actually sense to try
> to online.
> 
> The original patch correctly states
>    "which sections of
>     memory are likely to be removable before attempting the potentially
>     expensive operation."
> 
> It works as designed I would say.

Then I would just keep it crippled the same way it has been for years
without anybody noticing.
-- 
Michal Hocko
SUSE Labs
