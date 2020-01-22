Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C39145A34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 17:48:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482rvf0vrbzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 03:48:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482rrw64dLzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 03:46:24 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id p17so7926278wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 08:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0SuDAJ7sMXWaJqUYgQXoq4Dj1CRTTQuLtA+Icf+077s=;
 b=CHI6REgDRxjRmNAX6ltyyOgIbkHMxeQHCVUfdd2kZZ3vZYSR5ByxRMTOgy1YjkRqKB
 KKqWrduanfR9drFykWZtmv1xvUL120mWfPnLccEzwKzbxcEobTbgEAd1y7YydXU3UvpX
 Eqa1wJl9Ku+hVKkhRGjKvlC+/9afBOeS6PaKQW3O8QaxhvJgBZnAGAV1KqSZZtH+6DiZ
 Kpv9Mo/TtBMIfm2HcvBdmHz/LB4Zv8UZjzYHgDSW1TYBCItpUZkIzEF/ZQySwqWzPIkg
 KXmIvAxMXyGR1giwAUPsnmQU2WVITXYOZ0hTjMKNYewEFun1n5Qa2kEdgYb5X3wU3xsk
 qyZg==
X-Gm-Message-State: APjAAAU9uu4laP8PjjBheF8AICAEJ95F9zg7B/v4/RV4KEEIH3J7EyH1
 Y3PoqNB6p1At1HZyqg9MxHk=
X-Google-Smtp-Source: APXvYqwqyZqfBJeXG6FqO0yWFZepKQMabGkNIIhVitsf3Ywq4fg3+sGpKA2WeU1Q+571Z2TyhyqRWA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr3825500wmi.101.1579711581018; 
 Wed, 22 Jan 2020 08:46:21 -0800 (PST)
Received: from localhost (ip-37-188-245-167.eurotel.cz. [37.188.245.167])
 by smtp.gmail.com with ESMTPSA id b17sm57400161wrp.49.2020.01.22.08.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 08:46:19 -0800 (PST)
Date: Wed, 22 Jan 2020 17:46:18 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200122164618.GY29276@dhcp22.suse.cz>
References: <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
 <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
 <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
 <20200120074816.GG18451@dhcp22.suse.cz>
 <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
 <20200121120714.GJ29276@dhcp22.suse.cz>
 <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
 <20200122104230.GU29276@dhcp22.suse.cz>
 <98b6c208-b4dd-9052-43f6-543068c649cc@redhat.com>
 <816ddd66-c90b-76f1-f4a0-72fe41263edd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <816ddd66-c90b-76f1-f4a0-72fe41263edd@redhat.com>
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
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 22-01-20 12:58:16, David Hildenbrand wrote:
> On 22.01.20 11:54, David Hildenbrand wrote:
> > On 22.01.20 11:42, Michal Hocko wrote:
> >> On Wed 22-01-20 11:39:08, David Hildenbrand wrote:
> >>>>>> Really, the interface is flawed and should have never been merged in the
> >>>>>> first place. We cannot simply remove it altogether I am afraid so let's
> >>>>>> at least remove the bogus code and pretend that the world is a better
> >>>>>> place where everything is removable except the reality sucks...
> >>>>>
> >>>>> As I expressed already, the interface works as designed/documented and
> >>>>> has been used like that for years.
> >>>>
> >>>> It seems we do differ in the usefulness though. Using a crappy interface
> >>>> for years doesn't make it less crappy. I do realize we cannot remove the
> >>>> interface but we can remove issues with the implementation and I dare to
> >>>> say that most existing users wouldn't really notice.
> >>>
> >>> Well, at least powerpc-utils (why this interface was introduced) will
> >>> notice a) performance wise and b) because more logging output will be
> >>> generated (obviously non-offlineable blocks will be tried to offline).
> >>
> >> I would really appreciate some specific example for a real usecase. I am
> >> not familiar with powerpc-utils worklflows myself.
> >>
> > 
> > Not an expert myself:
> > 
> > https://github.com/ibm-power-utilities/powerpc-utils
> > 
> > -> src/drmgr/drslot_chrp_mem.c
> > 
> > On request to remove some memory it will
> > 
> > a) Read "->removable" of all memory blocks ("lmb")
> > b) Check if the request can be fulfilled using the removable blocks
> > c) Try to offline the memory blocks by trying to offline it. If that
> > succeeded, trigger removeal of it using some hypervisor hooks.
> > 
> > Interestingly, with "AMS ballooning", it will already consider the
> > "removable" information useless (most probably, because of
> > non-migratable balloon pages that can be offlined - I assume the powerpc
> > code that I converted to proper balloon compaction just recently). a)
> > and b) is skipped.
> > 
> > Returning "yes" on all blocks will make them handle it just like if "AMS
> > ballooning" is active. So any memory block will be tried. Should work
> > but will be slower if no ballooning is active.
> > 
> 
> On lsmem:
> 
> https://www.ibm.com/support/knowledgecenter/linuxonibm/com.ibm.linux.z.lgdd/lgdd_r_lsmem_cmd.html
> 
> "
> Removable
>     yes if the memory range can be set offline, no if it cannot be set
> offline. A dash (-) means that the range is already offline. The kernel
> method that identifies removable memory ranges is heuristic and not
> exact. Occasionally, memory ranges are falsely reported as removable or
> falsely reported as not removable.
> "
> 
> Usage of lsmem paird with chmem:
> 
> https://access.redhat.com/solutions/3937181
> 
> 
> Especially interesting for IBM z Systems, whereby memory
> onlining/offlining will trigger the actual population of memory in the
> hypervisor. So if an admin wants to offline some memory (to give it back
> to the hypervisor), it would use lsmem to identify such blocks first,
> instead of trying random blocks until one offlining request succeeds.

I am sorry for being dense here but I still do not understand why s390
and the way how it does the hotremove matters here. Afterall there are
no arch specific operations done until the memory is offlined. Also
randomly checking memory blocks and then hoping that the offline will
succeed is not way much different from just trying the offline the
block. Both have to crawl through the pfn range and bail out on the
unmovable memory.
-- 
Michal Hocko
SUSE Labs
