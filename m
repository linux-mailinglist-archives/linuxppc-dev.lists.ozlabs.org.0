Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC46181B12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 15:22:38 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cvLD0ZgMzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 01:22:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PdYhcmI7; dkim-atps=neutral
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cvFc5YtqzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:18:28 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id v9so2825903wrf.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UlqHsGcMH2wgZ4HNYQSAfQVihbtUyreW0G2xFxwpzcs=;
 b=PdYhcmI7s3rv/HMRFF/5hUVPIoLN4hdtpSANHt1mmnYHd7bvwLK/oGC56J9RethYth
 +H9fjEMKeBDyP/sBCAjJGnkXzzwhlfGin+8iMaNGcxpbvbV96pZBQ/UBopbr7B8cFg8S
 SxYq5gUPBKhAJN4jVfyflW8sGzRweWAD/9keqVDhqxMMFgL9Y7gblvTCpa+iZ6JrITEk
 H+HlG2w8NvqamdHQMk0ZRPotGvpBILQmL3bJzWVVCH3OErZjB9v7FgdeReAzV5OhB5w1
 1tFvQ+9MhnRGDXTkpuiIoE7rS6bxZrBxBw5RLfp9G3hvhDa8QMIhm2Reb52dR9/wC1BX
 LpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=UlqHsGcMH2wgZ4HNYQSAfQVihbtUyreW0G2xFxwpzcs=;
 b=a6u9JZdN/0FFBIsLNQZt1Jxf1xman9EXWq8aK65kNTA749yA3iKr42+64sq0nFPMCc
 OP6hL2DSSFjNJ1vwJRC+frU468bUQzNVhXyM+lhmLXMnHDYB2o2GbXTS7qQyRDSFTBa7
 RfGqgatJ0MFNfEvM2HZV3YHtIKjbSlLnhbIM4exiHHVjXCWHnv6hQrEX+FFDmZcqix0N
 wE2SRhk3Yrd+rwdZelZeJSom70FfU5g4ZA92HcmKhhfoZns8w5lPk1h2KqU2MFIs2XfZ
 JxJDIfpVDHhve7XF9Qvy1/LyX8yJP6eC4TITUx3dI9txbBLNsyOAb+cqJP1UxlyR6bL+
 QS/Q==
X-Gm-Message-State: ANhLgQ0BXpD5KyZyLIFiUiJKN8vLfIQ5JKvxGHY6eBfR8Pwc7UnXt2zM
 4m09GukoHN61tKfgiFOmkxE=
X-Google-Smtp-Source: ADFU+vsw6V6UgCNg8FHXcehLCdyjM4B1DerfYBOPeu8xfu5rzRUy1y7z6jr/QaB3Qyd9/Wiihx1TAA==
X-Received: by 2002:a05:6000:100d:: with SMTP id
 a13mr4580847wrx.234.1583936301649; 
 Wed, 11 Mar 2020 07:18:21 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id q4sm26328172wro.56.2020.03.11.07.18.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:18:21 -0700 (PDT)
Date: Wed, 11 Mar 2020 14:18:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/5] drivers/base/memory: map MMOP_OFFLINE to 0
Message-ID: <20200311141820.zgmwiz3rdj5co6kf@master>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-3-david@redhat.com>
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

On Wed, Mar 11, 2020 at 01:30:23PM +0100, David Hildenbrand wrote:
>I have no idea why we have to start at -1. Just treat 0 as the special
>case. Clarify a comment (which was wrong, when we come via
>device_online() the first time, the online_type would have been 0 /
>MEM_ONLINE). The default is now always MMOP_OFFLINE.
>
>This is a preparation to use the online_type as an array index.
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
> drivers/base/memory.c          | 11 ++++-------
> include/linux/memory_hotplug.h |  2 +-
> 2 files changed, 5 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index 8c5ce42c0fc3..e7e77cafef80 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -211,17 +211,14 @@ static int memory_subsys_online(struct device *dev)
> 		return 0;
> 
> 	/*
>-	 * If we are called from state_store(), online_type will be
>-	 * set >= 0 Otherwise we were called from the device online
>-	 * attribute and need to set the online_type.
>+	 * When called via device_online() without configuring the online_type,
>+	 * we want to default to MMOP_ONLINE.
> 	 */
>-	if (mem->online_type < 0)
>+	if (mem->online_type == MMOP_OFFLINE)
> 		mem->online_type = MMOP_ONLINE;
> 
> 	ret = memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
>-
>-	/* clear online_type */
>-	mem->online_type = -1;
>+	mem->online_type = MMOP_OFFLINE;
> 
> 	return ret;
> }
>diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>index 261dbf010d5d..c2e06ed5e0e9 100644
>--- a/include/linux/memory_hotplug.h
>+++ b/include/linux/memory_hotplug.h
>@@ -48,7 +48,7 @@ enum {
> /* Types for control the zone type of onlined and offlined memory */
> enum {
> 	/* Offline the memory. */
>-	MMOP_OFFLINE = -1,
>+	MMOP_OFFLINE = 0,
> 	/* Online the memory. Zone depends, see default_zone_for_pfn(). */
> 	MMOP_ONLINE,
> 	/* Online the memory to ZONE_NORMAL. */
>-- 
>2.24.1

-- 
Wei Yang
Help you, Help me
