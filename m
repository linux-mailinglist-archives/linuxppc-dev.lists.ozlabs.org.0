Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA718C19C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:43:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jzQg2BgnzDrdk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QuAr0rCw; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jv3P4qXfzDrP6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:26:57 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id a25so4174578wrd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3F6p9VA0cVyFpp1otJBkETuyS8iU0ECrOYMDdRLVRxI=;
 b=QuAr0rCwgtiF82xHBWqQ4lSffZ977W564JnS7kFkj4jk+O1B4hwEtwYTvDMJd0KPzC
 W7UMfVthKh74N0igpoKyyZvB59aca9fYgTGHWI0wxqZpebWmfrzwomuaPhyu2VJEO56g
 p8dYe7vIpKa4hy2K1oGI5SvuFhZUuFjqaQ5nCVNmmA+eKRhwn1dzNTMdTUiPfQVqqylK
 /qunIobrNuRJE4LBBm/nxChANZ1J+lczwkjXC9am2snUc9QdDh9lM9vvgy4mt1gKjnpW
 XeCTdXi13mIw6cdMmEAXO9RJzB/RauIdkXZbliOpFv5hr2B7Il01mhJLYeyZ4YNCat++
 sZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3F6p9VA0cVyFpp1otJBkETuyS8iU0ECrOYMDdRLVRxI=;
 b=fmZBtYF8H1SCXgH3LMZEveyrOKw1o4rhL+oxhcTZ2fyZWlLe1lA0Usz62Q+BjrCsAY
 hpq49J2BpaoQmouFEKkSgHODxNZQwMH7ASVoFee+NYzbriE9RmT//9l/sKnNDDkw4GMj
 oP7hKG/t5FC1Yj6n2vo3k6PiV5UleCpvWsFPbDeewFLwxCvzNSgGDnUY4RbWdFAyY89x
 WGjiRzFg6LnOneA6BfKRTuOSy5W7byWatfnUqSQpkwOCLEKfC5z7ls5cGQD95TNIVaTo
 iGL0VnHWn+8sl3g5RmAC9vfZAQl7XmXeZOFJ0vx9lnLlLlJDwpBIUQ2D0vDoIZQfs9nz
 mLJQ==
X-Gm-Message-State: ANhLgQ1SKUO8g0j1VodfZNOTRhWRAD67ZZZsNhYWlKKkonEZz+NaVuIQ
 3Fuol/+pR6hayeJ0LpYAgx76e/l4DpIEf90o2kg=
X-Google-Smtp-Source: ADFU+vuGxJnVkZr1vtGIyeQ2LhE/Qgr1xykJ1BEWBBmT3lH5VpBqrgI47O6jQXgHrf2qVsBwT9UGn19a4U3S1q5tmWg=
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr5376031wrw.289.1584638812775; 
 Thu, 19 Mar 2020 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200319131221.14044-1-david@redhat.com>
 <20200319131221.14044-9-david@redhat.com>
In-Reply-To: <20200319131221.14044-9-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Mar 2020 18:26:41 +0100
Message-ID: <CAM9Jb+iUrSf_KixRwj9M9FP=zSzvxn_E17Bxb0ZUiKpncThSAg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] mm/memory_hotplug: allow to specify a default
 online_type
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> For now, distributions implement advanced udev rules to essentially
> - Don't online any hotplugged memory (s390x)
> - Online all memory to ZONE_NORMAL (e.g., most virt environments like
>   hyperv)
> - Online all memory to ZONE_MOVABLE in case the zone imbalance is taken
>   care of (e.g., bare metal, special virt environments)
>
> In summary: All memory is usually onlined the same way, however, the
> kernel always has to ask user space to come up with the same answer.
> E.g., Hyper-V always waits for a memory block to get onlined before
> continuing, otherwise it might end up adding memory faster than
> onlining it, which can result in strange OOM situations. This waiting
> slows down adding of a bigger amount of memory.
>
> Let's allow to specify a default online_type, not just "online" and
> "offline". This allows distributions to configure the default online_type
> when booting up and be done with it.
>
> We can now specify "offline", "online", "online_movable" and
> "online_kernel" via
> - "memhp_default_state=" on the kernel cmdline
> - /sys/devices/system/memory/auto_online_blocks
> just like we are able to specify for a single memory block via
> /sys/devices/system/memory/memoryX/state
>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/memory.c          | 11 +++++------
>  include/linux/memory_hotplug.h |  2 ++
>  mm/memory_hotplug.c            |  8 ++++----
>  3 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8d3e16dab69f..2b09b68b9f78 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -35,7 +35,7 @@ static const char *const online_type_to_str[] = {
>         [MMOP_ONLINE_MOVABLE] = "online_movable",
>  };
>
> -static int memhp_online_type_from_str(const char *str)
> +int memhp_online_type_from_str(const char *str)
>  {
>         int i;
>
> @@ -394,13 +394,12 @@ static ssize_t auto_online_blocks_store(struct device *dev,
>                                         struct device_attribute *attr,
>                                         const char *buf, size_t count)
>  {
> -       if (sysfs_streq(buf, "online"))
> -               memhp_default_online_type = MMOP_ONLINE;
> -       else if (sysfs_streq(buf, "offline"))
> -               memhp_default_online_type = MMOP_OFFLINE;
> -       else
> +       const int online_type = memhp_online_type_from_str(buf);
> +
> +       if (online_type < 0)
>                 return -EINVAL;
>
> +       memhp_default_online_type = online_type;
>         return count;
>  }
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 6d6f85bb66e9..93d9ada74ddd 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -118,6 +118,8 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
>                            struct mhp_params *params);
>  extern u64 max_mem_size;
>
> +extern int memhp_online_type_from_str(const char *str);
> +
>  /* Default online_type (MMOP_*) when new memory blocks are added. */
>  extern int memhp_default_online_type;
>  /* If movable_node boot option specified */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 4efcf8cb9ac5..89197163d138 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -74,10 +74,10 @@ int memhp_default_online_type = MMOP_ONLINE;
>
>  static int __init setup_memhp_default_state(char *str)
>  {
> -       if (!strcmp(str, "online"))
> -               memhp_default_online_type = MMOP_ONLINE;
> -       else if (!strcmp(str, "offline"))
> -               memhp_default_online_type = MMOP_OFFLINE;
> +       const int online_type = memhp_online_type_from_str(str);
> +
> +       if (online_type >= 0)
> +               memhp_default_online_type = online_type;
>
>         return 1;
>  }
> --
Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

> 2.24.1
>
>
