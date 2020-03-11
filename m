Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A5181E81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 17:57:47 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cyn4159rzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 03:57:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FQT4Wc+J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cylR67npzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 03:55:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583945754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9E1mdmP6Hr606pPo5qeYGkzmwHPOmC4Eba6XbgosPs=;
 b=FQT4Wc+JXDPVF9K6/0gMqxKs0WK10W67ttJ3xFRogyh6R1j0FtAhK0hZPmVpLuWVRjg/jc
 DbFZNXkfLrN4RyOQJ/OcL1fTCdyyaZAm5VfIehfdlKnsO72XgsfB3UQvs5hnl7Tcgg9kWs
 HuvxHQPa21tw0edmnXbMk6z4/5itLwc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-0DKB_iwAPIiHNstKMBcF9g-1; Wed, 11 Mar 2020 12:55:52 -0400
X-MC-Unique: 0DKB_iwAPIiHNstKMBcF9g-1
Received: by mail-wm1-f71.google.com with SMTP id a23so1109332wmm.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 09:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HSgjM26zIX3PavBkrCBluq3yJAmMXPt5zdmFUceEPUk=;
 b=ebqNCl64IzMzJBSMfS13OZacbAonm5GUgICoZ0ylpJ17muXXdR7Rj+af5Wkp5tBO3p
 PvnRU9PRiTlGVYBKjG4aqX3iA/NcVc76DMXq7RslToY2EcO2yqsHU6NslSTTegnPvo1O
 u56uAROpndfGmr36stuAXe1MlvbRwBUjM4G1XpSUDEbVH3WHEPHfVRZ3iwkajRLwrDeA
 BwvS4Y+sAe7jWpXp91pJR/IHY599ZJbOG3XeRCjzZAe/QSTvwmb/94RILtF0a+RUr9EO
 PWgSnD8kzrkUHDe0HqDI2RzvCldhzxtLkF0kPsnjOszYnXuI0M7vAcb1cWvshTr8g4Iw
 Nkzg==
X-Gm-Message-State: ANhLgQ14oFwcYURO2OaYuF6rFrvHIxrvxxZtm+PB/McLhdaktH3Hd6I3
 eDLeg6PBJpFQ+kyBg1wHILzWGQS5E3NmJsDr/7e7j/+JlXk9Ro4ptqxhmXqc/jPDek462FEv4O3
 noZnLWqB0XH/fPAJiduVmBwteTg==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr5326990wrw.384.1583945751468; 
 Wed, 11 Mar 2020 09:55:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsW35ore7Qm3vjEYXtbIoqC8m+BW/xNy5Vy9kjOPP+WoiYbSKW84175pQgJX/okAmoW7A9FTg==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr5326967wrw.384.1583945751193; 
 Wed, 11 Mar 2020 09:55:51 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id p10sm7252926wru.4.2020.03.11.09.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 09:55:49 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] mm/memory_hotplug: allow to specify a default
 online_type
In-Reply-To: <20200311123026.16071-6-david@redhat.com>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-6-david@redhat.com>
Date: Wed, 11 Mar 2020 17:55:48 +0100
Message-ID: <877dzqsuej.fsf@vitty.brq.redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> For now, distributions implement advanced udev rules to essentially
> - Don't online any hotplugged memory (s390x)
> - Online all memory to ZONE_NORMAL (e.g., most virt environments like
>   hyperv)
> - Online all memory to ZONE_MOVABLE in case the zone imbalance is taken
>   care of (e.g., bare metal, special virt environments)
>
> In summary: All memory is usually onlined the same way, however, the
> kernel always has to ask userspace to come up with the same answer.
> E.g., HyperV always waits for a memory block to get onlined before
> continuing, otherwise it might end up adding memory faster than
> hotplugging it, which can result in strange OOM situations.
>
> Let's allow to specify a default online_type, not just "online" and
> "offline". This allows distributions to configure the default online_type
> when booting up and be done with it.
>
> We can now specify "offline", "online", "online_movable" and
> "online_kernel" via
> - "memhp_default_state=3D" on the kernel cmdline
> - /sys/devices/systemn/memory/auto_online_blocks
> just like we are able to specify for a single memory block via
> /sys/devices/systemn/memory/memoryX/state
>

Thank you for picking this up!=20

It's been awhile since I've added CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
but I vaguely recall one problem: memory hotplug may happen *very* early
(just because some memory is presented to a VM as hotplug memory, it is
not in e820). It happens way before we launch userspace (including
udev). The question is -- which ZONE will this memory be assigned too?

'memhp_default_state=3D' resolves the issue but nobody likes additional
kernel parameters for anything but
debug. CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE was supposed to help, but it
is binary and distro-wide (so *all* deployments will get the same
default and as you validly stated we want it differently).

We could've added something like your example onlining script to the
kernel itself but this is likely going to be hard to sell: "policies
belong to userspace!" will likely be the answer.=20

So if we don't want to start the endless discussions (again), your
proposal is 'good enough'.


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
> @@ -35,7 +35,7 @@ static const char *const online_type_to_str[] =3D {
>  =09[MMOP_ONLINE_MOVABLE] =3D "online_movable",
>  };
> =20
> -static int memhp_online_type_from_str(const char *str)
> +int memhp_online_type_from_str(const char *str)
>  {
>  =09int i;
> =20
> @@ -394,13 +394,12 @@ static ssize_t auto_online_blocks_store(struct devi=
ce *dev,
>  =09=09=09=09=09struct device_attribute *attr,
>  =09=09=09=09=09const char *buf, size_t count)
>  {
> -=09if (sysfs_streq(buf, "online"))
> -=09=09memhp_default_online_type =3D MMOP_ONLINE;
> -=09else if (sysfs_streq(buf, "offline"))
> -=09=09memhp_default_online_type =3D MMOP_OFFLINE;
> -=09else
> +=09const int online_type =3D memhp_online_type_from_str(buf);
> +
> +=09if (online_type < 0)
>  =09=09return -EINVAL;
> =20
> +=09memhp_default_online_type =3D online_type;
>  =09return count;
>  }
> =20
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
> index c6e090b34c4b..ef55115320fb 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -117,6 +117,8 @@ extern int arch_add_memory(int nid, u64 start, u64 si=
ze,
>  =09=09=09struct mhp_restrictions *restrictions);
>  extern u64 max_mem_size;
> =20
> +extern int memhp_online_type_from_str(const char *str);
> +
>  /* Default online_type (MMOP_*) when new memory blocks are added. */
>  extern int memhp_default_online_type;
>  /* If movable_node boot option specified */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 01443c70aa27..4a96273eafa7 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -75,10 +75,10 @@ EXPORT_SYMBOL_GPL(memhp_default_online_type);
> =20
>  static int __init setup_memhp_default_state(char *str)
>  {
> -=09if (!strcmp(str, "online"))
> -=09=09memhp_default_online_type =3D MMOP_ONLINE;
> -=09else if (!strcmp(str, "offline"))
> -=09=09memhp_default_online_type =3D MMOP_OFFLINE;
> +=09const int online_type =3D memhp_online_type_from_str(str);
> +
> +=09if (online_type >=3D 0)
> +=09=09memhp_default_online_type =3D online_type;
> =20
>  =09return 1;
>  }

--=20
Vitaly

