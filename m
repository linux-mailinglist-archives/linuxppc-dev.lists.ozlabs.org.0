Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB318C182
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:35:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jzFN6QZKzDrRF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:35:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LFqUgnck; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jslw1XM7zDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 03:28:22 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id s1so3872933wrv.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 09:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SPgbvNOx93ZbKq64/B6/Z1gW0+quFKremjRSKVCy664=;
 b=LFqUgnckFAOA9p+wCjOZ+EhTau2SI0k45PYdANda466lpPHrNJ665SzPzR+aNSKJxB
 Rwm3nn/XF7a0al/6zmG4QENhSXWyEmxDnpnirHW4YW2XKi/1n/5jYuUl+/xCRq5n4oPC
 O4XQzz8H4fKscVlPYfA2098A+MPZKS6Xhyf/chTQglAkwcbL4wa4mXMSoWDWgaQ5ZqtA
 xuFpKp2fRITG0nc1x4ZJniRpm88xs0+d62KmZg2ZGrzTY3bzKNvjXFwmmFWNn8EQsksT
 91cj7xrLFx3tLg+RklBpueUhbArZ/yDFXB2H44fIiYwTqkkYQ1JP3xjPeG1RGJm1Hurv
 EXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPgbvNOx93ZbKq64/B6/Z1gW0+quFKremjRSKVCy664=;
 b=evWR07YhvEYVfs+8G44nZu6QL4gH0jAmiht+5FF2f9bzPYfGTKGufuJaQUrLA13Aee
 LNma5nAhAyJ+8R8FWiQ7I6zctjuUibmQuzFDQuXu6T9UIEQw6MtxqlebI4iS/RNVfZ3V
 u6fCOuogWYVZJaJcqOJ+Ea05LUzMuc5qgTdDkTBTaBPQLIeCiMATFchi2uOyM6L9tz4P
 A0aAdLPUHzp62Eh/B7XLd1YXx0Mj3xk0CN2vbscTFFRxqk8+Fxgz3jup2R+E41V35FoR
 +57530D9NeFCnrhRwNXpMAoyhfvTikh2Z/G6P0epIf3zcTiX797CzQauCR8nvJbwS+bF
 LZrw==
X-Gm-Message-State: ANhLgQ3ImItzCjulKdfV0Tz8ljU8dIokZitgruAr0Nah98suvIbGYavk
 YREY5BH5e8tYt8APbsoRizlFyGmVNzZJ3MMdzkA=
X-Google-Smtp-Source: ADFU+vuaZB2YqdQTSwwXNJGT/DzeIMoI6zgsU2pirhzQONlQGEuJaSY7zIUne4g6UI8NM14HSloKXFs1XHhWX101AEo=
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr5082680wrw.289.1584635297101; 
 Thu, 19 Mar 2020 09:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200319131221.14044-1-david@redhat.com>
 <20200319131221.14044-2-david@redhat.com>
In-Reply-To: <20200319131221.14044-2-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Mar 2020 17:28:05 +0100
Message-ID: <CAM9Jb+gD9YWgio5Nod577iH9=HHf8jZFspVHstQ7cyCWzE2PKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drivers/base/memory: rename MMOP_ONLINE_KEEP to
 MMOP_ONLINE
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Mar 2020 07:34:17 +1100
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
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> The name is misleading and it's not really clear what is "kept". Let's just
> name it like the online_type name we expose to user space ("online").
>
> Add some documentation to the types.
>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/memory.c          | 9 +++++----
>  include/linux/memory_hotplug.h | 6 +++++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 6448c9ece2cb..8c5ce42c0fc3 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -216,7 +216,7 @@ static int memory_subsys_online(struct device *dev)
>          * attribute and need to set the online_type.
>          */
>         if (mem->online_type < 0)
> -               mem->online_type = MMOP_ONLINE_KEEP;
> +               mem->online_type = MMOP_ONLINE;
>
>         ret = memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
>
> @@ -251,7 +251,7 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>         else if (sysfs_streq(buf, "online_movable"))
>                 online_type = MMOP_ONLINE_MOVABLE;
>         else if (sysfs_streq(buf, "online"))
> -               online_type = MMOP_ONLINE_KEEP;
> +               online_type = MMOP_ONLINE;
>         else if (sysfs_streq(buf, "offline"))
>                 online_type = MMOP_OFFLINE;
>         else {
> @@ -262,7 +262,7 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>         switch (online_type) {
>         case MMOP_ONLINE_KERNEL:
>         case MMOP_ONLINE_MOVABLE:
> -       case MMOP_ONLINE_KEEP:
> +       case MMOP_ONLINE:
>                 /* mem->online_type is protected by device_hotplug_lock */
>                 mem->online_type = online_type;
>                 ret = device_online(&mem->dev);
> @@ -342,7 +342,8 @@ static ssize_t valid_zones_show(struct device *dev,
>         }
>
>         nid = mem->nid;
> -       default_zone = zone_for_pfn_range(MMOP_ONLINE_KEEP, nid, start_pfn, nr_pages);
> +       default_zone = zone_for_pfn_range(MMOP_ONLINE, nid, start_pfn,
> +                                         nr_pages);
>         strcat(buf, default_zone->name);
>
>         print_allowed_zone(buf, nid, start_pfn, nr_pages, MMOP_ONLINE_KERNEL,
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 3195d11876ea..3aaf00db224c 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -47,9 +47,13 @@ enum {
>
>  /* Types for control the zone type of onlined and offlined memory */
>  enum {
> +       /* Offline the memory. */
>         MMOP_OFFLINE = -1,
> -       MMOP_ONLINE_KEEP,
> +       /* Online the memory. Zone depends, see default_zone_for_pfn(). */
> +       MMOP_ONLINE,
> +       /* Online the memory to ZONE_NORMAL. */
>         MMOP_ONLINE_KERNEL,
> +       /* Online the memory to ZONE_MOVABLE. */
>         MMOP_ONLINE_MOVABLE,
>  };
>
> --
Looks good to me.

Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

> 2.24.1
>
>
