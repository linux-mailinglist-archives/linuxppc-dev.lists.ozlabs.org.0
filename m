Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8AC189108
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:06:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnMK48wwzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 09:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=richard.weiyang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s+26uggo; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnKB1MWkzDqq5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 09:05:02 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id b2so21538731wrj.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 15:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qiz8SPGjq8UjHt5B7MxSwjAG4ELELv3CtLSiX/rkTdo=;
 b=s+26uggoLggNmytLFNkdi5ReaP1mQqXWgjWy8h5Gs+gJsYAbnX71plLhfx3iTGckQJ
 3mf1zQUAz7jDZ3g6nApgpqoGosK8gPPrhlFBHDcDoL9v2pE/eeoF4r27DSIx7JfTM6dW
 cT7v5UZFhkEwJMZWl3oh3WfUmJyG6O6uDQsG2jFaNB45EGA5y6eZYi6qOyotGpQ/P2rs
 MDaqKFpT2V/jik4ZT0LcexOjipeNHS2V86cxJJVDbdppigFG8Fbga86Mi/2PSd/wU7W3
 35TKgLQF83iGAQp3rLZ1losEJcw8tKxBUQho2gmDuh0jeWLS80cLVtMh4PCzeXxBTvrZ
 v66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qiz8SPGjq8UjHt5B7MxSwjAG4ELELv3CtLSiX/rkTdo=;
 b=IyOzQwjTP7IphfOlaInunKk2SJdHBhfGWM9Lv8nBVIgZ9uh1wPUY3oGk80rtFjS5s5
 Y2DpgTasXDMBAfmHUr18xq5AWOfZ34c/igGq1DIRKaNjWOiZwfuHKZOgF+6uQXJ516e+
 g58+DSG82Z/2J1/2utk5MAd7ggDCN7fgCGhjrmdHkaGZzOOGYqgFzKAYKCBLMPhcA1zH
 Ls9zhNYTIKBbNYPjLHJx4BcLEfUY5c3VYVRo4hoQTgABanqxxNsO+Xm+eibwAF3nG7c1
 QezcmRcpl+gVg6jt6Yi34hA6t43TFkw1MWj21n2ah8gY+drZyN4SQ5BrZmPUR2kS9MfY
 1Jkw==
X-Gm-Message-State: ANhLgQ3GRKE1UZUTqDStT9MX7LWf6gS0f0Y6y7bGGd2rFFUAVS//qgSG
 +jCfmMirnJsUZ0jAQjVHtC4=
X-Google-Smtp-Source: ADFU+vvUbJs7CjVtSah/hWS9CT/exY7FEYlJgzu0BJZSQqsLIr7AAJOzF8YKAtYskOQ1IKl756J0tA==
X-Received: by 2002:adf:ef12:: with SMTP id e18mr1155345wro.108.1584482697768; 
 Tue, 17 Mar 2020 15:04:57 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id y200sm1059104wmc.20.2020.03.17.15.04.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 15:04:57 -0700 (PDT)
Date: Tue, 17 Mar 2020 22:04:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/8] powernv/memtrace: always online added memory blocks
Message-ID: <20200317220456.wczzkgtqwgxjw5c6@master>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317104942.11178-5-david@redhat.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 17, 2020 at 11:49:38AM +0100, David Hildenbrand wrote:
>Let's always try to online the re-added memory blocks. In case add_memory()
>already onlined the added memory blocks, the first device_online() call
>will fail and stop processing the remaining memory blocks.
>
>This avoids manually having to check memhp_auto_online.
>
>Note: PPC always onlines all hotplugged memory directly from the kernel
>as well - something that is handled by user space on other
>architectures.
>
>Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>Cc: Paul Mackerras <paulus@samba.org>
>Cc: Michael Ellerman <mpe@ellerman.id.au>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Michal Hocko <mhocko@kernel.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Cc: linuxppc-dev@lists.ozlabs.org
>Signed-off-by: David Hildenbrand <david@redhat.com>

Looks good.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> arch/powerpc/platforms/powernv/memtrace.c | 14 ++++----------
> 1 file changed, 4 insertions(+), 10 deletions(-)
>
>diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
>index d6d64f8718e6..13b369d2cc45 100644
>--- a/arch/powerpc/platforms/powernv/memtrace.c
>+++ b/arch/powerpc/platforms/powernv/memtrace.c
>@@ -231,16 +231,10 @@ static int memtrace_online(void)
> 			continue;
> 		}
> 
>-		/*
>-		 * If kernel isn't compiled with the auto online option
>-		 * we need to online the memory ourselves.
>-		 */
>-		if (!memhp_auto_online) {
>-			lock_device_hotplug();
>-			walk_memory_blocks(ent->start, ent->size, NULL,
>-					   online_mem_block);
>-			unlock_device_hotplug();
>-		}
>+		lock_device_hotplug();
>+		walk_memory_blocks(ent->start, ent->size, NULL,
>+				   online_mem_block);
>+		unlock_device_hotplug();
> 
> 		/*
> 		 * Memory was added successfully so clean up references to it
>-- 
>2.24.1

-- 
Wei Yang
Help you, Help me
