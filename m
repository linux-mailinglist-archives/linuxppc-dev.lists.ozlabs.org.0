Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2D188230
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 12:28:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hWBm53bhzDqL5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVY52j5CzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:59:20 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id z12so12200545wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 03:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8HFvJMFCJYNvz0dXv6Ch2UJSZolJY7vrNfNN5EOFEwc=;
 b=atsLbEqlOAZwIP6j1J/bkA1ZswUlDPH4vONh17KtvpBmODchnrARiDWBaekWfsBJSe
 Ep9AgsHUAzRxiNLz8U2t4oYT0/D8bcC3NQ3GnArUGNq8Gl9aAQODhf5WdvHkyWBAGuni
 YckbyyU2T+9qEl8wQZMSxSNStapg+daCNUwVmJtNTw6+M3w1skv8L32DBCov5IXwEHx9
 gnsSp4zz+2duLdEetfPbMe6Gw/o5HWCieMCYW39GkVN2lytragZmN/+rPgYPVPdqrgX+
 MsOl3ZjEAR+VNochD/kMZTALFQGpuW3lEmQXq2VyF3+mB4iqrkBaWzYYgtZ3rtakN55i
 kiVw==
X-Gm-Message-State: ANhLgQ3vzRXyxJ80rGVBOkPaAeUs7sPa/TdZQl2cZq4iYm/U0xVKzE7F
 Deq57WGtD+9ZilbfYREzxsE=
X-Google-Smtp-Source: ADFU+vuKcSeScQJxJfHf3Bzh98ayLivgd2aUQq71FVoJVb8q4dHZuM8Z1Syn9jMTiCpNxqkeFdgWRw==
X-Received: by 2002:a1c:6285:: with SMTP id w127mr4938571wmb.133.1584442756028; 
 Tue, 17 Mar 2020 03:59:16 -0700 (PDT)
Received: from localhost (ip-37-188-255-121.eurotel.cz. [37.188.255.121])
 by smtp.gmail.com with ESMTPSA id m17sm4293118wrw.3.2020.03.17.03.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 03:59:15 -0700 (PDT)
Date: Tue, 17 Mar 2020 11:59:14 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 6/8] mm/memory_hotplug: unexport memhp_auto_online
Message-ID: <20200317105914.GL26018@dhcp22.suse.cz>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317104942.11178-7-david@redhat.com>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-03-20 11:49:40, David Hildenbrand wrote:
> All in-tree users except the mm-core are gone. Let's drop the export.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/memory_hotplug.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 1a00b5a37ef6..2d2aae830b92 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -71,7 +71,6 @@ bool memhp_auto_online;
>  #else
>  bool memhp_auto_online = true;
>  #endif
> -EXPORT_SYMBOL_GPL(memhp_auto_online);
>  
>  static int __init setup_memhp_default_state(char *str)
>  {
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
