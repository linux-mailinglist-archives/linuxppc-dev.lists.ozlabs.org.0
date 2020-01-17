Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DA140F82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 18:00:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47znNw2vMVzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 04:00:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YRuMaL7f; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47znLq1vHdzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 03:58:06 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id m2so18265214otq.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 08:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SVdmKszNnhoaHDNeCmKwKg+oKUWstdwrLDQTNGyOrtg=;
 b=YRuMaL7fGyr27X1i82sHIbXhAORF5u2Ym2ug9SABWZbWxeWrsckjPfMR7nQSgBasws
 wonoYfYIfFS1mntoWdBSNrrkhYxkdQaruSKny15ufforyO0fUntf8yJhURCop8gYv0RK
 RItVhTIaa8EJ9a0bFB57G0/17NoTea9XXE9yjT2DRg+XvUaNGeCYr4csHKZUTmX2h0Dv
 u+vm201ZbxReZC2ebgQFg4B3vZ0t29B6IkMhDtOyGtxMmYsT/T5UBFO1VGqYp4kjbWGA
 29f0cmYunZuedtDvxKjeXShJuVELAvafbVdbHdA4kNpupDWzpMFMNFVtXJON18R9heCj
 dIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVdmKszNnhoaHDNeCmKwKg+oKUWstdwrLDQTNGyOrtg=;
 b=rJ7n135uIuPVryO4id832biMyN0TFRG02qGZat9nAsaA1tETIz1N0uX42iMOOtJVwk
 P3WimK3xe3j2go/ed84tUEWgxeJ6CrqlHMIB3Rs1WPCZQ/sc3E9exvnDsyc6WLTyNxk8
 penW5pO3tNwb2iSbfgThvjfcgTmm2MP3pvKb51MNu7gVLv54W691zcfRr6fiixc7okJV
 64bVEFCWL8WXVXBsNrqYr9g846HmQsc1q5fwP6M6K3sun3dc9mrusY9JjTG6kdcM3xmo
 sp3h7r2gz+LTUe7vveVLtyedFN3liej9NLGXptS8TpzjwscFjRa37s7A9FA3s2tHMNBM
 J+8g==
X-Gm-Message-State: APjAAAX3wGqjlvE2R6ag8cF+eUms/aj1fJ30NBga/P/31wWRp/vonUO8
 dT9rkM6km8dtbi+p0Frjxo+bft1RZQJxpswQjLeyZw==
X-Google-Smtp-Source: APXvYqxgOgqv3ymmNMR4Qi8eZqfarlt0GXyxGWemoSfAqaNgr6Z1q23zsOW9tFkDz0e186QlkX0vwUXqICR3gNOvyhQ=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr6744052oto.207.1579280282992; 
 Fri, 17 Jan 2020 08:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20200117105759.27905-1-david@redhat.com>
 <20200117113353.GT19428@dhcp22.suse.cz>
 <c82a0dd7-a99b-6def-83d4-a19fbdd405d9@redhat.com>
 <20200117145233.GB19428@dhcp22.suse.cz>
 <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
 <20200117152947.GK19428@dhcp22.suse.cz>
 <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
 <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
In-Reply-To: <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 17 Jan 2020 08:57:51 -0800
Message-ID: <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 17, 2020 at 8:11 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 17.01.20 16:54, Dan Williams wrote:
> > On Fri, Jan 17, 2020 at 7:30 AM Michal Hocko <mhocko@kernel.org> wrote:
> >>
> >> On Fri 17-01-20 15:58:26, David Hildenbrand wrote:
> >>> On 17.01.20 15:52, Michal Hocko wrote:
> >>>> On Fri 17-01-20 14:08:06, David Hildenbrand wrote:
> >>>>> On 17.01.20 12:33, Michal Hocko wrote:
> >>>>>> On Fri 17-01-20 11:57:59, David Hildenbrand wrote:
> >>>>>>> Let's refactor that code. We want to check if we can offline memory
> >>>>>>> blocks. Add a new function is_mem_section_offlineable() for that and
> >>>>>>> make it call is_mem_section_offlineable() for each contained section.
> >>>>>>> Within is_mem_section_offlineable(), add some more sanity checks and
> >>>>>>> directly bail out if the section contains holes or if it spans multiple
> >>>>>>> zones.
> >>>>>>
> >>>>>> I didn't read the patch (yet) but I am wondering. If we want to touch
> >>>>>> this code, can we simply always return true there? I mean whoever
> >>>>>> depends on this check is racy and the failure can happen even after
> >>>>>> the sysfs says good to go, right? The check is essentially as expensive
> >>>>>> as calling the offlining code itself. So the only usecase I can think of
> >>>>>> is a dumb driver to crawl over blocks and check which is removable and
> >>>>>> try to hotremove it. But just trying to offline one block after another
> >>>>>> is essentially going to achieve the same.
> >>>>>
> >>>>> Some thoughts:
> >>>>>
> >>>>> 1. It allows you to check if memory is likely to be offlineable without
> >>>>> doing expensive locking and trying to isolate pages (meaning:
> >>>>> zone->lock, mem_hotplug_lock. but also, calling drain_all_pages()
> >>>>> when isolating)
> >>>>>
> >>>>> 2. There are use cases that want to identify a memory block/DIMM to
> >>>>> unplug. One example is PPC DLPAR code (see this patch). Going over all
> >>>>> memory block trying to offline them is an expensive operation.
> >>>>>
> >>>>> 3. powerpc-utils (https://github.com/ibm-power-utilities/powerpc-utils)
> >>>>> makes use of /sys/.../removable to speed up the search AFAIK.
> >>>>
> >>>> Well, while I do see those points I am not really sure they are worth
> >>>> having a broken (by-definition) interface.
> >>>
> >>> It's a pure speedup. And for that, the interface has been working
> >>> perfectly fine for years?
> >>>
> >>>>
> >>>>> 4. lsmem displays/groups by "removable".
> >>>>
> >>>> Is anybody really using that?
> >>>
> >>> Well at least I am using that when testing to identify which
> >>> (ZONE_NORMAL!) block I can easily offline/re-online (e.g., to validate
> >>> all the zone shrinking stuff I have been fixing)
> >>>
> >>> So there is at least one user ;)
> >>
> >> Fair enough. But I would argue that there are better ways to do the same
> >> solely for testing purposes. Rather than having a subtly broken code to
> >> maintain.
> >>
> >>>>
> >>>>>> Or does anybody see any reasonable usecase that would break if we did
> >>>>>> that unconditional behavior?
> >>>>>
> >>>>> If we would return always "true", then the whole reason the
> >>>>> interface originally was introduced would be "broken" (meaning, less
> >>>>> performant as you would try to offline any memory block).
> >>>>
> >>>> I would argue that the whole interface is broken ;). Not the first time
> >>>> in the kernel development history and not the last time either. What I
> >>>> am trying to say here is that unless there are _real_ usecases depending
> >>>> on knowing that something surely is _not_ offlineable then I would just
> >>>> try to drop the functionality while preserving the interface and see
> >>>> what happens.
> >>>
> >>> I can see that, but I can perfectly well understand why - especially
> >>> powerpc - wants a fast way to sense which blocks actually sense to try
> >>> to online.
> >>>
> >>> The original patch correctly states
> >>>    "which sections of
> >>>     memory are likely to be removable before attempting the potentially
> >>>     expensive operation."
> >>>
> >>> It works as designed I would say.
> >>
> >> Then I would just keep it crippled the same way it has been for years
> >> without anybody noticing.
> >
> > I tend to agree. At least the kmem driver that wants to unplug memory
> > could not use an interface that does not give stable answers. It just
> > relies on remove_memory() to return a definitive error.
> >
>
> Just because kmem cannot reuse such an interface doesn't mean we should
> not touch it (or I am not getting your point). Especially, this
> interface is about "can it be likely be offlined and then eventually be
> removed (if there is a HW interface for that)" (as documented), not
> about "will remove_memory()" work.

Unless the user is willing to hold the device_hotplug_lock over the
evaluation then the result is unreliable. For example the changes to
removable_show() are no better than they were previously because the
result is invalidated as soon as the lock is dropped.

> We do have users and if we agree to keep it (what I think we should as I
> expressed) then I think we should un-cripple and fix it. After all we
> have to maintain it. The current interface provides what was documented
> - "likely to be offlineable". (the chosen name was just horribly bad -
> as I expressed a while ago already :) )

Are there users that misbehave because they try to offline a section
with holes? I brought up kmem because it's an unplug user that does
not care whether the failure was due to pinned pages or holes in
sections. Do others care about that precision in a meaningful way?
