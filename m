Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F293181B09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 15:20:40 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cvHW3fXLzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 01:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hUll7QwQ; dkim-atps=neutral
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cvDm5c9QzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:17:37 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id n8so2276394wmc.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I7eOL65ZNqa3gn2e8dEFcQnY6e+zHyU8AljZLv8aig4=;
 b=hUll7QwQmc6uf0wAxMRzpz3+R33/ySwyEcA+TUucM0e+k6m9Qs2ueb9yVCVKNfV7q8
 nF3DVSDcoRj6jyg+7DJNrHX6+FCb5rbHJdfaw9bL5dGRiyb5pPs2JJ0+qI6am2VFzAKW
 fe5npINVmuOm4zTOgLC1yB2Dnbl9JQnJfVpPNJPHsdRtk9ietsHms1A4vey4NGn90Gdi
 SpJSZSiPgpxBcdY4EN/F0Uo+OIzyIfDcbcDFVCHFtj1WoNSS+E9ftStE/UUZsj1zuXTF
 9BD7tnKxSvBKTGy7oZW/jhwsg1dfAKq9OwPFuLzH4xM2bFMNmOpFccwFZGKUX/HXe2FY
 6/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=I7eOL65ZNqa3gn2e8dEFcQnY6e+zHyU8AljZLv8aig4=;
 b=BXegqll47BKxT1UbRt7LnjJxVRPFQ3jL78uoz5mttfQivfxB8Kv+31LqgtHhwOs6sc
 0HojeneSba1zanwy8dI/t4vvNkxJhaVuQkXvQZTbVMQ/X6wzXZP62C4jotEY1F7A1tZE
 ME2ONFLmyR4k/pQul0ZKbfLl88EKy5UWHqpDCOqWTwQzmFvHBZCMcL+11LCnd8Imuecr
 bM59Q57UQPnzy9vMQLfeZbqOCdG1UTroDyOMVOehrncnYJ68iOCLJNuptAcdNT7JqzCn
 6V5y8pjTao20xjiuECt/KP0u270ELkeLaGorEEBz5zU4cZlVYwTZ6X6vPoLSo7dPvBhl
 yAPw==
X-Gm-Message-State: ANhLgQ2XRvOWvX3Z1J89t0fHetxHnSxO6Dj6C4nX6tfcw8wSbrnkxNi/
 +ifHJW2xv+x+gUyX8q+K21w=
X-Google-Smtp-Source: ADFU+vvADab4WONrsG1oXOYJkoa9IYPSmxIlRwRgxbMg8mJMQAJDabPwTraFtGj2QJOO+gvV2uzE4Q==
X-Received: by 2002:a05:600c:22d8:: with SMTP id
 24mr1608196wmg.108.1583936250009; 
 Wed, 11 Mar 2020 07:17:30 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id w1sm7987977wmc.11.2020.03.11.07.17.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:17:29 -0700 (PDT)
Date: Wed, 11 Mar 2020 14:17:28 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/5] drivers/base/memory: rename MMOP_ONLINE_KEEP to
 MMOP_ONLINE
Message-ID: <20200311141728.iav3lh3hcki5p7zc@master>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-2-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 11, 2020 at 01:30:22PM +0100, David Hildenbrand wrote:
>The name is misleading. Let's just name it like the online_type name we
>expose to user space ("online").
>
>Add some documentation to the types.
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@kernel.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> drivers/base/memory.c          | 9 +++++----
> include/linux/memory_hotplug.h | 6 +++++-
> 2 files changed, 10 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index 6448c9ece2cb..8c5ce42c0fc3 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -216,7 +216,7 @@ static int memory_subsys_online(struct device *dev)
> 	 * attribute and need to set the online_type.
> 	 */
> 	if (mem->online_type < 0)
>-		mem->online_type = MMOP_ONLINE_KEEP;
>+		mem->online_type = MMOP_ONLINE;
> 
> 	ret = memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
> 
>@@ -251,7 +251,7 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
> 	else if (sysfs_streq(buf, "online_movable"))
> 		online_type = MMOP_ONLINE_MOVABLE;
> 	else if (sysfs_streq(buf, "online"))
>-		online_type = MMOP_ONLINE_KEEP;
>+		online_type = MMOP_ONLINE;
> 	else if (sysfs_streq(buf, "offline"))
> 		online_type = MMOP_OFFLINE;
> 	else {
>@@ -262,7 +262,7 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
> 	switch (online_type) {
> 	case MMOP_ONLINE_KERNEL:
> 	case MMOP_ONLINE_MOVABLE:
>-	case MMOP_ONLINE_KEEP:
>+	case MMOP_ONLINE:
> 		/* mem->online_type is protected by device_hotplug_lock */
> 		mem->online_type = online_type;
> 		ret = device_online(&mem->dev);
>@@ -342,7 +342,8 @@ static ssize_t valid_zones_show(struct device *dev,
> 	}
> 
> 	nid = mem->nid;
>-	default_zone = zone_for_pfn_range(MMOP_ONLINE_KEEP, nid, start_pfn, nr_pages);
>+	default_zone = zone_for_pfn_range(MMOP_ONLINE, nid, start_pfn,
>+					  nr_pages);
> 	strcat(buf, default_zone->name);
> 
> 	print_allowed_zone(buf, nid, start_pfn, nr_pages, MMOP_ONLINE_KERNEL,
>diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>index f4d59155f3d4..261dbf010d5d 100644
>--- a/include/linux/memory_hotplug.h
>+++ b/include/linux/memory_hotplug.h
>@@ -47,9 +47,13 @@ enum {
> 
> /* Types for control the zone type of onlined and offlined memory */
> enum {
>+	/* Offline the memory. */
> 	MMOP_OFFLINE = -1,
>-	MMOP_ONLINE_KEEP,
>+	/* Online the memory. Zone depends, see default_zone_for_pfn(). */
>+	MMOP_ONLINE,
>+	/* Online the memory to ZONE_NORMAL. */
> 	MMOP_ONLINE_KERNEL,
>+	/* Online the memory to ZONE_MOVABLE. */
> 	MMOP_ONLINE_MOVABLE,
> };
> 
>-- 
>2.24.1

-- 
Wei Yang
Help you, Help me
