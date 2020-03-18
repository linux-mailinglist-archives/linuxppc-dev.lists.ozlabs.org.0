Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA2189E33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 15:45:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jCWx0cm2zDqy9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 01:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=E0Uh9ub2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jCR46KTrzDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 01:41:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584542491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=khU3Sj2I9RAgs2dQ5QeJfq7H2iKfVkIU7W77n3vGRy8=;
 b=E0Uh9ub27kcobta2hjxiXX4sTgr30fnCD6cfKlxQ0xjLEVQbpx0tLUzBaymvyMNu8V9pWA
 TVFU/N4CD1Pd0YNEMa+7YdfpK8vfkADhnsMlnvxF07OwiuxZZGzQGIGQEa3v5k6CSghYLK
 ffwGtHlhC1eAQxtVHdttG+8PhpKbdDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-5eTwTRgRP_-MVamUn9MXTg-1; Wed, 18 Mar 2020 10:41:28 -0400
X-MC-Unique: 5eTwTRgRP_-MVamUn9MXTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D8F9800D50;
 Wed, 18 Mar 2020 14:41:25 +0000 (UTC)
Received: from localhost (ovpn-12-66.pek2.redhat.com [10.72.12.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF6115C219;
 Wed, 18 Mar 2020 14:41:21 +0000 (UTC)
Date: Wed, 18 Mar 2020 22:41:19 +0800
From: Baoquan He <bhe@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v2 0/8] mm/memory_hotplug: allow to specify a default
 online_type
Message-ID: <20200318144119.GD30899@MiWiFi-R3L-srv>
References: <20200317104942.11178-1-david@redhat.com>
 <20200318130517.GC30899@MiWiFi-R3L-srv>
 <87d0993gto.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0993gto.fsf@vitty.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Yumei Huang <yuhuang@redhat.com>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Yang <richard.weiyang@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Milan Zamazal <mzamazal@redhat.com>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/18/20 at 02:58pm, Vitaly Kuznetsov wrote:
> Baoquan He <bhe@redhat.com> writes:
> 
> > On 03/17/20 at 11:49am, David Hildenbrand wrote:
> >> Distributions nowadays use udev rules ([1] [2]) to specify if and
> >> how to online hotplugged memory. The rules seem to get more complex with
> >> many special cases. Due to the various special cases,
> >> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE cannot be used. All memory hotplug
> >> is handled via udev rules.
> >> 
> >> Everytime we hotplug memory, the udev rule will come to the same
> >> conclusion. Especially Hyper-V (but also soon virtio-mem) add a lot of
> >> memory in separate memory blocks and wait for memory to get onlined by user
> >> space before continuing to add more memory blocks (to not add memory faster
> >> than it is getting onlined). This of course slows down the whole memory
> >> hotplug process.
> >> 
> >> To make the job of distributions easier and to avoid udev rules that get
> >> more and more complicated, let's extend the mechanism provided by
> >> - /sys/devices/system/memory/auto_online_blocks
> >> - "memhp_default_state=" on the kernel cmdline
> >> to be able to specify also "online_movable" as well as "online_kernel"
> >
> > This patch series looks good, thanks. Since Andrew has merged it to -mm again,
> > I won't add my Reviewed-by to bother. 
> >
> > Hi David, Vitaly
> >
> > There are several things unclear to me.
> >
> > So, these improved interfaces are used to alleviate the burden of the 
> > existing udev rules, or try to replace it? As you know, we have been
> > using udev rules to interact between kernel and user space on bare metal,
> > and guests who want to hot add/remove.
> 
> With 'auto_online_blocks' interface you don't need the udev rule. David
> is trying to make it more versatile.
> 
> >
> > And also the OOM issue in hyperV when onlining pages after adding memory
> > block. I am not a virt devel expert, could this happen on bare metal
> > system?
> 
> Yes - in theory, very unlikely - in practice.
> 
> The root cause of the problem here is adding more memory to the system
> requires memory (page tables, memmaps,..) so if your system is low on
> memory and you're trying to hotplug A LOT you may run into OOM before
> you're able to online anything. With bare metal it's usualy not the
> case: servers, which are able to hotplug memory, are usually booted with
> enough memory and memory hotplug is a manual action (you need to insert
> DIMMs!). But, if you boot your server with e.g. 4G, almost exhaust it
> and then try to hotplug e.g. 256G ... well, OOM is almost guaranteed.

Thanks for this detailed explanation.

I finally know why this is a problem in hyperV. But with the current
mechanism, it will happen on any system if thing is done like this. 

Is there a reason hyperV need boot with small memory, then enlarge it
with huge memory? Since it's a real case in hyperV, I guess there must
be reason, I am just curious.

> With virtual machines it's very common (e.g. with Hyper-V VMs) to boot
> them with low memory and hotplug it (automatically, by some management
> software) when neededm thus the problem is way more common.

