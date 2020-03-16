Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01139186FA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 17:06:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1Pm1wyLzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 03:06:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h0V91pqvzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:25:05 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id 25so18134854wmk.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 08:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n/vSqbJLFSGGAzMuc9Ghgl2CCp2FLye+L7Ituywfqjo=;
 b=Ya4UCA+hLCLtdQZrJqVyNo+bpvk75jLZXFKhtxIqzLgzB7P9QyOEbASRpp+P0XHUIg
 sL6uyyKBtqzI7cqv1M9BGcAwyfkRYqoLSt+vYz2+0b86zZsa/OYCNF6F287CgT2Jna1t
 MGdnYadGrwvsT2dXxpQ8hf9mnFcFUFPtpM+5mwjhvoFArNbuN5aIFLoqc9PHUZ3WBNWf
 71sBD87u2BS/VKI8ndSxPZO2YZPPTfVAnawqi4+tcUap/cYmlm8nuygj5nFM9YL/TH8U
 QTdz1NflWU/Ivhn9DS+znDJdrv8B6i+r72ONCjYVxoi1d+dKCg+mTYX4ImjfIIcuaWIw
 p3ww==
X-Gm-Message-State: ANhLgQ2oF2vg8nQ9q3C3Qd/GhqTGG0daZrLsootqd2egRvS7HZjJy7fr
 QQCYjBwSw1WCggoIUFFaWgU=
X-Google-Smtp-Source: ADFU+vvsjT1C7lNgXq2aVZ5qSLcQDvUcsaTPiQ2+pP5WAHp0LquIvuG4Yo4sXMJ+KBJMSQrZOYGGvw==
X-Received: by 2002:a1c:a584:: with SMTP id o126mr28710245wme.49.1584372300910; 
 Mon, 16 Mar 2020 08:25:00 -0700 (PDT)
Received: from localhost ([37.188.132.163])
 by smtp.gmail.com with ESMTPSA id q72sm48569wme.31.2020.03.16.08.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:25:00 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:24:59 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/5] mm/memory_hotplug: convert memhp_auto_online to
 store an online_type
Message-ID: <20200316152459.GV11482@dhcp22.suse.cz>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-5-david@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Wei Liu <wei.liu@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 11-03-20 13:30:25, David Hildenbrand wrote:
[...]
> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
> index d6d64f8718e6..e15a600cfa4d 100644
> --- a/arch/powerpc/platforms/powernv/memtrace.c
> +++ b/arch/powerpc/platforms/powernv/memtrace.c
> @@ -235,7 +235,7 @@ static int memtrace_online(void)
>  		 * If kernel isn't compiled with the auto online option
>  		 * we need to online the memory ourselves.
>  		 */
> -		if (!memhp_auto_online) {
> +		if (memhp_default_online_type == MMOP_OFFLINE) {
>  			lock_device_hotplug();
>  			walk_memory_blocks(ent->start, ent->size, NULL,
>  					   online_mem_block);

Whut? This stinks, doesn't it. For your defense, the original code is
fishy already but this just makes it even more ugly.
-- 
Michal Hocko
SUSE Labs
