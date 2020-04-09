Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB41A313D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 10:51:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yZcs0N4BzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 18:51:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yZZH4lKjzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 18:49:11 +1000 (AEST)
Received: by mail-wm1-f65.google.com with SMTP id d202so3357661wmd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 01:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4R4O9Mkhw/Z10RizEohDCqkt7FovGhxpIg1sEVkIfyM=;
 b=b+U8+2qebvIWyWAEGo9zjGVZQHb/6GFKO4oBy2b3HVp57F2tAvoRJC2pEtf47pgmBl
 w04PSfA8eikh6aferLsVssxS+mYuD65ddTUeCjgkGCGJyud3NzRa7ZGOX9SYuwMHlfaU
 bZ0IbjbTiss7tuZ/ZS6S6Vq7OKqCbdurqwGg2XY1ZxnFyjg86ZVV2+4IhVpu96tee3+s
 qImbBd2YC8A8INOGC7LQG9SJ4GH8zaoWy/ldJBpJiILyC6w1PdBImbIRC1WZ8tRUPuVJ
 bMEis4Z9KcgxKoAmBluNa3LLiUwgTZLLgcUbzQPzFbMUAxhXuWIJEuViq6eAS9kWCuaY
 XdnA==
X-Gm-Message-State: AGi0PuYkwFdl4SM3MQXmJWTUyVo2u/LHqCUK2CFadGtapYHlb4keL4Cs
 I9DsNhVp0/hLOaYZV5Uic/E=
X-Google-Smtp-Source: APiQypK+OnoBoW3IE7Y1FFhgVv8w8+vOScKrnNyOUHK/KS/1bwzbuAjaycK7cVwiF8cZW0fV5ZDuaQ==
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr9351094wmt.131.1586422147743; 
 Thu, 09 Apr 2020 01:49:07 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id 145sm3063271wma.1.2020.04.09.01.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 01:49:07 -0700 (PDT)
Date: Thu, 9 Apr 2020 10:49:06 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
Message-ID: <20200409084906.GD18386@dhcp22.suse.cz>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com>
 <87sghdjf1y.fsf@mpe.ellerman.id.au>
 <20200409075927.GC18386@dhcp22.suse.cz>
 <0a0ed3ed-f792-f8f7-07f4-cacc2b565a95@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a0ed3ed-f792-f8f7-07f4-cacc2b565a95@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 09-04-20 10:12:20, David Hildenbrand wrote:
> On 09.04.20 09:59, Michal Hocko wrote:
> > On Thu 09-04-20 17:26:01, Michael Ellerman wrote:
> >> David Hildenbrand <david@redhat.com> writes:
> >>
> >>> In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
> >>> blocks as removable"), the user space interface to compute whether a memory
> >>> block can be offlined (exposed via
> >>> /sys/devices/system/memory/memoryX/removable) has effectively been
> >>> deprecated. We want to remove the leftovers of the kernel implementation.
> >>>
> >>> When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
> >>> we'll start by:
> >>> 1. Testing if it contains any holes, and reject if so
> >>> 2. Testing if pages belong to different zones, and reject if so
> >>> 3. Isolating the page range, checking if it contains any unmovable pages
> >>>
> >>> Using is_mem_section_removable() before trying to offline is not only racy,
> >>> it can easily result in false positives/negatives. Let's stop manually
> >>> checking is_mem_section_removable(), and let device_offline() handle it
> >>> completely instead. We can remove the racy is_mem_section_removable()
> >>> implementation next.
> >>>
> >>> We now take more locks (e.g., memory hotplug lock when offlining and the
> >>> zone lock when isolating), but maybe we should optimize that
> >>> implementation instead if this ever becomes a real problem (after all,
> >>> memory unplug is already an expensive operation). We started using
> >>> is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
> >>> Implement memory hotplug remove in the kernel"), with the initial
> >>> hotremove support of lmbs.
> >>
> >> It's also not very pretty in dmesg.
> >>
> >> Before:
> >>
> >>   pseries-hotplug-mem: Attempting to hot-add 10 LMB(s)
> >>   pseries-hotplug-mem: Memory hot-add failed, removing any added LMBs
> >>   dlpar: Could not handle DLPAR request "memory add count 10"
> > 
> > Yeah, there is more output but isn't that useful? Or put it differently
> > what is the actual problem from having those messages in the kernel log?
> > 
> > From the below you can clearly tell that there are kernel allocations
> > which prevent hot remove from happening.
> > 
> > If the overall size of the debugging output is a concern then we can
> > think of a way to reduce it. E.g. once you have a couple of pages
> > reported then all others from the same block are likely not interesting
> > much.
> > 
> 
> IIRC, we only report one page per block already. (and stop, as we
> detected something unmovable)

You are right.
-- 
Michal Hocko
SUSE Labs
