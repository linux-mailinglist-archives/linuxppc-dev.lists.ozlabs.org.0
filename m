Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA518C18E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:40:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jzLr2C6dzDrQp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:40:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y4xc6fED; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jtHT5ZgDzDrPC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 03:52:18 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id a9so104596wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hB9EOmeEoQOPuImvB9jQhgdyqLRUd97IR5tYRMN/KRg=;
 b=Y4xc6fEDR9ZHOybEP5BSWaD2bCPXt0bWNVHUYEZEoiO95Tr1osrH5Jg+ukA+i2z9Ui
 8736XBhtjQpD23VoNl2wnLTxw7vrkSpl4aRfQH9IlWPeTp5zvZ+U8x4yrhdcaNZXo5e4
 9Gq9vqwItg4qNpX2rl4QntOkZcN/mPIoowB3YasVy5lknqPdaWhmmIKjvHsbTW8leN3u
 95GD69hDivtRX2YaRauGxLAAMBOiLXlYhZYAptC84AAB3U+edwC07k7IGUDAU32IoeEA
 rkttdRg5/vN0IIDtzGg9TNzJMsegxA7CBENS/LuzyaKZfMDg73to4nj9d6CtbP+kl/Tp
 Z8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hB9EOmeEoQOPuImvB9jQhgdyqLRUd97IR5tYRMN/KRg=;
 b=K5zJ4daD9E0OKmBRibSXVYsasANlkmLXfMWcephPSrocqHaoR5fUM2XeMBb6qaTXJ1
 Pm8zVw4whgfqwDVEGCO/PuQ6WqhZwOIvvLiVDLVnuy0gIBZmQP3LXlUYznnOs2xfhE80
 /ZGtZgVG3Pr4JZp9uFW+tsbN55Jz1VgzRccub8I69sbEiaUXiouWvp/R9Y21iL0gS7hL
 jU+FDwBTMCkiWIA71FWkqo39llW9A2bdH4N/DlaSxwbYP9wZXIOA0xBQ/4hlj3c6R9Zk
 RUp5QAqhkYJq6Sfzl/B0HuYU1LxfdURLdFUYDg57976DG+O6H2A3H3tL3nTSUEDzMNBT
 y8XQ==
X-Gm-Message-State: ANhLgQ1G4c0PqYf9wVO2OU09uFMUtEaJdy9WXEXJNxIgG7WiYosoINLw
 n/PTIC0qsRdw0VY+TdM/PtI0MYa6zoHv30pUtaU=
X-Google-Smtp-Source: ADFU+vv1zSb3f06esRnDQl+NjMCVPD282wJZ/FHh2w2P8kdQDmilSBiF4CcKHzLjYAQ03eTB5GFF5fFsJ6f1/h7dKu8=
X-Received: by 2002:a05:600c:2709:: with SMTP id
 9mr4778011wmm.30.1584636735093; 
 Thu, 19 Mar 2020 09:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200319131221.14044-1-david@redhat.com>
 <20200319131221.14044-7-david@redhat.com>
In-Reply-To: <20200319131221.14044-7-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Mar 2020 17:52:04 +0100
Message-ID: <CAM9Jb+jaia-AxpvxsTOVxYg_S=xZy2UY5srARA2J2_DkXPgZ7g@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] mm/memory_hotplug: unexport memhp_auto_online
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
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> All in-tree users except the mm-core are gone. Let's drop the export.
>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory_hotplug.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index da6aab272c9b..e21a7d53ade5 100644
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

Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>
>
