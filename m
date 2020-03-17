Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1818821E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 12:24:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hW5p53v3zDq9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:24:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVX174DHzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:58:25 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id t2so14956636wrx.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 03:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GMaxJmgHFs3UkzWKRUJIGAMAuAis9ucYU7WNuhbnrM0=;
 b=sbj5vQqVhjdIas4Dut7JVMpUPiuuq5Tlk4T2LGfMo8HhkFBwD5n0vsa6uUWknm7+2x
 o0xZVzUxhIwydH2yPIo78Jg7R0rbKOlvzq4IM74sR6rOXh/kE7Oxbk+bbGqcbYD1WOtd
 7Il89Mx+jLuHS43RHgCN4RaglhLOgOBj67gUC4E+D+RVl/SqrlVZz9f+c0oD1wUV9YjJ
 ACz7D5rkx4/jh79ywS76aHSWcKYE0nmcOJropIa/j3mUBbpDkiWuwiPB2vGQhMpSVvvy
 a3F0vIImMK9Yik+V4z+HYZX3dpkGX6l5cHBRQjxjU9SGaED71E0cG+yvJRhie8qNSzvY
 /CrQ==
X-Gm-Message-State: ANhLgQ0vSyty5ASiZStb0ilEagVmR5FOk0rzXkJJEdVrm21EqzN1MjNL
 U3/T2nRPXAoAE3bKBSFMwB8=
X-Google-Smtp-Source: ADFU+vuwMUcRYGkxYv04ItK19Y8hWebnnNI8rNDKcJ7IZEFzRgxAHrUzVDn0iHSETvqcL5o3Rxedng==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr5358405wrx.331.1584442700152; 
 Tue, 17 Mar 2020 03:58:20 -0700 (PDT)
Received: from localhost (ip-37-188-255-121.eurotel.cz. [37.188.255.121])
 by smtp.gmail.com with ESMTPSA id y189sm3615478wmb.26.2020.03.17.03.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 03:58:19 -0700 (PDT)
Date: Tue, 17 Mar 2020 11:58:18 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/8] powernv/memtrace: always online added memory blocks
Message-ID: <20200317105818.GK26018@dhcp22.suse.cz>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317104942.11178-5-david@redhat.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-03-20 11:49:38, David Hildenbrand wrote:
> Let's always try to online the re-added memory blocks. In case add_memory()
> already onlined the added memory blocks, the first device_online() call
> will fail and stop processing the remaining memory blocks.
> 
> This avoids manually having to check memhp_auto_online.
> 
> Note: PPC always onlines all hotplugged memory directly from the kernel
> as well - something that is handled by user space on other
> architectures.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  arch/powerpc/platforms/powernv/memtrace.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
> index d6d64f8718e6..13b369d2cc45 100644
> --- a/arch/powerpc/platforms/powernv/memtrace.c
> +++ b/arch/powerpc/platforms/powernv/memtrace.c
> @@ -231,16 +231,10 @@ static int memtrace_online(void)
>  			continue;
>  		}
>  
> -		/*
> -		 * If kernel isn't compiled with the auto online option
> -		 * we need to online the memory ourselves.
> -		 */
> -		if (!memhp_auto_online) {
> -			lock_device_hotplug();
> -			walk_memory_blocks(ent->start, ent->size, NULL,
> -					   online_mem_block);
> -			unlock_device_hotplug();
> -		}
> +		lock_device_hotplug();
> +		walk_memory_blocks(ent->start, ent->size, NULL,
> +				   online_mem_block);
> +		unlock_device_hotplug();
>  
>  		/*
>  		 * Memory was added successfully so clean up references to it
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
