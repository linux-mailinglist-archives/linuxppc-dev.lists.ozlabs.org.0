Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F141018C192
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:42:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jzNq1j38zDqJB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BM0AGY3u; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jtvC42W8zDrJs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:19:49 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id z15so4125261wrl.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 10:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REUrjEbM9E8U0Xs3ZYSD9f/6CBam6/RPzkS7LqotySY=;
 b=BM0AGY3urbibzhW1gohveGfBaMwlf1jLS7cxM3Vfon/hOn4zTW073R3eyT9eOcUhKY
 1EUT6cd63hcggxA627cjejHKeGXbdUjQtC8xqJv6f4jLr2haccGtNev9syzT4f5LWANF
 tA0pUu2GRDS7/jWWJEwWZzOcmSuyMlIthrCT2arIGb4KWhX+IGBdcxSubifbUCr27E8b
 DAU2G3/VxwINBRs8n3NDbrwxG2TToq0uyZQ5TznKJd1cnXz/pKfBgoM3v4zdDj5wLW3+
 vHg+hTD8s1ZY94S23UEy4yWxht3QcGogmEwIVrO9DqCmf3jVslGl/YH6YwOQlrceSbiJ
 sVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REUrjEbM9E8U0Xs3ZYSD9f/6CBam6/RPzkS7LqotySY=;
 b=AQidK81piQdXjWTMXt311VE3WJoFCGt/at1sRKr/tqbOLD3oC8u982tJa5r2jOmcny
 n4Bg46nxvX9rqqfLE/Bkb3Fyml/1QIRnRrrmxkU9a+ZX8qKVyApxkPz+vl8jg5j6BWFS
 iwQ1McLNCc7q6RAEYcFNEScmnADd7cH/wNRCz7+mXnwZARXb+KX10djhogWdxzZxkODq
 QFvRblzhMhBMjkslksBK+KEosu7gWBT8RVnBPuToF6UGThqNbrgDRyN/6Jq8qa278ozp
 tfrs9IxqfXYDTzwRLvULRCSZZ3CRzf7SeKGFVIiBFqRQFJCElGKWtlcwGbV/dLYspRs8
 RqDQ==
X-Gm-Message-State: ANhLgQ2X94b57TCPxLHs5PiRMaERpNTVDqRYWhV7bHcex6BcF0TntVfI
 BhrosIXEdBGYAjJ5/VhXk1Raff7C2xifbCRhF+8=
X-Google-Smtp-Source: ADFU+vtt4K7LLALZ400ntXCMXvpvEPIEVS4JD+piZAo5Bk7qwIuVxT+6bOMnViCSjX8yovQFCVEAetBlkIy5tk1qVrQ=
X-Received: by 2002:a5d:6146:: with SMTP id y6mr5562155wrt.107.1584638384613; 
 Thu, 19 Mar 2020 10:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200319131221.14044-1-david@redhat.com>
 <20200319131221.14044-8-david@redhat.com>
In-Reply-To: <20200319131221.14044-8-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Mar 2020 18:19:33 +0100
Message-ID: <CAM9Jb+hBVihQ=TSPoL_WL1tPRnfXTUw=dUw0oGGQkPWWs6gSxw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] mm/memory_hotplug: convert memhp_auto_online to
 store an online_type
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

> ... and rename it to memhp_default_online_type. This is a preparation
> for more detailed default online behavior.
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
>  drivers/base/memory.c          | 10 ++++------
>  include/linux/memory_hotplug.h |  3 ++-
>  mm/memory_hotplug.c            | 11 ++++++-----
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8a7f29c0bf97..8d3e16dab69f 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -386,10 +386,8 @@ static DEVICE_ATTR_RO(block_size_bytes);
>  static ssize_t auto_online_blocks_show(struct device *dev,
>                                        struct device_attribute *attr, char *buf)
>  {
> -       if (memhp_auto_online)
> -               return sprintf(buf, "online\n");
> -       else
> -               return sprintf(buf, "offline\n");
> +       return sprintf(buf, "%s\n",
> +                      online_type_to_str[memhp_default_online_type]);
>  }
>
>  static ssize_t auto_online_blocks_store(struct device *dev,
> @@ -397,9 +395,9 @@ static ssize_t auto_online_blocks_store(struct device *dev,
>                                         const char *buf, size_t count)
>  {
>         if (sysfs_streq(buf, "online"))
> -               memhp_auto_online = true;
> +               memhp_default_online_type = MMOP_ONLINE;
>         else if (sysfs_streq(buf, "offline"))
> -               memhp_auto_online = false;
> +               memhp_default_online_type = MMOP_OFFLINE;
>         else
>                 return -EINVAL;
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 76f3c617a8ab..6d6f85bb66e9 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -118,7 +118,8 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
>                            struct mhp_params *params);
>  extern u64 max_mem_size;
>
> -extern bool memhp_auto_online;
> +/* Default online_type (MMOP_*) when new memory blocks are added. */
> +extern int memhp_default_online_type;
>  /* If movable_node boot option specified */
>  extern bool movable_node_enabled;
>  static inline bool movable_node_is_enabled(void)
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index e21a7d53ade5..4efcf8cb9ac5 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -67,17 +67,17 @@ void put_online_mems(void)
>  bool movable_node_enabled = false;
>
>  #ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
> -bool memhp_auto_online;
> +int memhp_default_online_type = MMOP_OFFLINE;
>  #else
> -bool memhp_auto_online = true;
> +int memhp_default_online_type = MMOP_ONLINE;
>  #endif
>
>  static int __init setup_memhp_default_state(char *str)
>  {
>         if (!strcmp(str, "online"))
> -               memhp_auto_online = true;
> +               memhp_default_online_type = MMOP_ONLINE;
>         else if (!strcmp(str, "offline"))
> -               memhp_auto_online = false;
> +               memhp_default_online_type = MMOP_OFFLINE;
>
>         return 1;
>  }
> @@ -993,6 +993,7 @@ static int check_hotplug_memory_range(u64 start, u64 size)
>
>  static int online_memory_block(struct memory_block *mem, void *arg)
>  {
> +       mem->online_type = memhp_default_online_type;
>         return device_online(&mem->dev);
>  }
>
> @@ -1065,7 +1066,7 @@ int __ref add_memory_resource(int nid, struct resource *res)
>         mem_hotplug_done();
>
>         /* online pages if requested */
> -       if (memhp_auto_online)
> +       if (memhp_default_online_type != MMOP_OFFLINE)
>                 walk_memory_blocks(start, size, NULL, online_memory_block);
>
>         return ret;
> --

Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

> 2.24.1
>
>
