Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C08189D85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 15:03:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jBZT6gwszDqwh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 01:02:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DqCwxOMM; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jBTn3d0JzDqwW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 00:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584539929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnUTOFtD/cSta3fxCQahLNV7ad9i2TrJ8jsNnx79ddw=;
 b=DqCwxOMMdZi84GFHgOJEfrAj00lRnOCFjcylWndgU0ANsLusJUJIyjjpxncTjpHjCodtHz
 JbDNS2RcTB8mPSgUGOw0CqrfB4ZcISu9IQLxKKONhxEdN4K7IOebDGpRHQlCCUsNVElR3y
 MiisVMCPObxnMh8eEr/2RBjQFKeU68k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-pCFHLopQOd-MglJmFRbFMw-1; Wed, 18 Mar 2020 09:58:48 -0400
X-MC-Unique: pCFHLopQOd-MglJmFRbFMw-1
Received: by mail-wm1-f70.google.com with SMTP id v184so758710wme.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 06:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=F31yuOR6DS7mAZV1PpzPl5tjjIYKtGbdeccjup64HTg=;
 b=Qae4PyQs6Po8PS5czrekzOLwWaY9LcaH76NSNlgm2PAKgwC7B6iZki1uSO2/AZsYww
 eqzF/oVlRO3Bt3670zLaPx7g/b2JSqiYEUXELv6Vone/XNMsFo4M2uH8WIW5cD/SDBFN
 Kc5skMXlTMrDJdt6k4BOOwiS6BDD30x0g1orvWNMtt4WvkUkY5e0nCUaaxFXAUS25jBU
 tbWHeSaAv4SPf9jEdc9IA4FLJDSTdN2gQYv0Deq0SK3+6L7Fs3JXEi1OZDgv4STZdXSK
 RK3JtAhWswlFLlVhBUlW3zZqF7ZDcl/6chWN1qZzAeA22AlhPauc327eI73fETZyL8ox
 a0JA==
X-Gm-Message-State: ANhLgQ1+2xRXgNlx5S1svsIu72dXvo5BhkNxVqskWMyqeOlNof72oZAX
 0WmgGuxesjwjkLGYlz/KIJbfxuyoQHtZlno/uwsfGXKLBhCMIfPoP+i0wu23ge1pDxrXvzEDrGc
 IeY6YdqmkujUpaJhck+FcAuPvKA==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr5559738wmh.174.1584539927050; 
 Wed, 18 Mar 2020 06:58:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuOzuNgvDkbFkbElCg5edIwU+8StaNxg5QEC0tTkAdX0Cu7G9Ynuwj6chgem6WJSymuM5v0dQ==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr5559631wmh.174.1584539925803; 
 Wed, 18 Mar 2020 06:58:45 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q10sm9136178wrx.12.2020.03.18.06.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:58:45 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/8] mm/memory_hotplug: allow to specify a default
 online_type
In-Reply-To: <20200318130517.GC30899@MiWiFi-R3L-srv>
References: <20200317104942.11178-1-david@redhat.com>
 <20200318130517.GC30899@MiWiFi-R3L-srv>
Date: Wed, 18 Mar 2020 14:58:43 +0100
Message-ID: <87d0993gto.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
 Michal Hocko <mhocko@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Milan Zamazal <mzamazal@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Baoquan He <bhe@redhat.com> writes:

> On 03/17/20 at 11:49am, David Hildenbrand wrote:
>> Distributions nowadays use udev rules ([1] [2]) to specify if and
>> how to online hotplugged memory. The rules seem to get more complex with
>> many special cases. Due to the various special cases,
>> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE cannot be used. All memory hotplug
>> is handled via udev rules.
>>=20
>> Everytime we hotplug memory, the udev rule will come to the same
>> conclusion. Especially Hyper-V (but also soon virtio-mem) add a lot of
>> memory in separate memory blocks and wait for memory to get onlined by u=
ser
>> space before continuing to add more memory blocks (to not add memory fas=
ter
>> than it is getting onlined). This of course slows down the whole memory
>> hotplug process.
>>=20
>> To make the job of distributions easier and to avoid udev rules that get
>> more and more complicated, let's extend the mechanism provided by
>> - /sys/devices/system/memory/auto_online_blocks
>> - "memhp_default_state=3D" on the kernel cmdline
>> to be able to specify also "online_movable" as well as "online_kernel"
>
> This patch series looks good, thanks. Since Andrew has merged it to -mm a=
gain,
> I won't add my Reviewed-by to bother.=20
>
> Hi David, Vitaly
>
> There are several things unclear to me.
>
> So, these improved interfaces are used to alleviate the burden of the=20
> existing udev rules, or try to replace it? As you know, we have been
> using udev rules to interact between kernel and user space on bare metal,
> and guests who want to hot add/remove.

With 'auto_online_blocks' interface you don't need the udev rule. David
is trying to make it more versatile.

>
> And also the OOM issue in hyperV when onlining pages after adding memory
> block. I am not a virt devel expert, could this happen on bare metal
> system?

Yes - in theory, very unlikely - in practice.

The root cause of the problem here is adding more memory to the system
requires memory (page tables, memmaps,..) so if your system is low on
memory and you're trying to hotplug A LOT you may run into OOM before
you're able to online anything. With bare metal it's usualy not the
case: servers, which are able to hotplug memory, are usually booted with
enough memory and memory hotplug is a manual action (you need to insert
DIMMs!). But, if you boot your server with e.g. 4G, almost exhaust it
and then try to hotplug e.g. 256G ... well, OOM is almost guaranteed.
With virtual machines it's very common (e.g. with Hyper-V VMs) to boot
them with low memory and hotplug it (automatically, by some management
software) when neededm thus the problem is way more common.

--=20
Vitaly

