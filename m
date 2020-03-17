Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A60189185
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:34:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnz74pXPzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 09:34:27 +1100 (AEDT)
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
 header.s=20161025 header.b=IT859BKv; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnlL5vVfzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 09:24:14 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id s1so6081209wrv.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 15:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AX+RV3FQdaQCktHrarZsh0Sc9mln1v0WFAS6/e+iIl4=;
 b=IT859BKvTYsEhZFBH4MCcu+1EzWJKxGDCp4UF0/Pd+CTDCQCLqxGClzj4JlyFd+4LH
 Ys0kdoodElRrZC0JA5gmXQH5/Enga8utUXxLWr/tDEaNN0n9PBcNIcLda8VwIVneVhuV
 oHgC2SUi3ijq9doiATuSyswY2nqyyyuRoopSvbo1HIjJ3GPNlmOZtVheSIM+OyffJwto
 YgOdpUCIovDEF0qVLkHvas8uHY03LXf4QxKm/EW5YA5VW2khMJziEFoC3LllzOtRKJ3D
 I6+WZxCWPG3WLQ1DFwpZbw9SJQrNvj7ynV1sAX5FMjR8iWutGUfR8tskrvj93mT116Io
 4uDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=AX+RV3FQdaQCktHrarZsh0Sc9mln1v0WFAS6/e+iIl4=;
 b=ovWrCRTS9RyYb+W1rsRQPQ9/QgZCENUzDb5JOYjOrEyEdTJm196IfvwYGMje6KxS3Q
 t5tOyYrAmbMwssz+Q4sx8TyNXltb2FSiy1v40iaxZI4bgoy9+qCnwssVpoev7bPKIN57
 mv6DPWe1UMA5cnqWixeW3cHVWFkzSuDNyS4m1/wWPRFDb0Stu9aE2XD/HwkVCxA61JwV
 cjmQEwYWAk7vkchMFzOD4Wcr/BRDxFn0s9KFgb/Nlg3TEx8QyM+ADFF6W1YgP3d6oAei
 AkvMo1s301ylpL0M3cUt1twVFlktZ6ZZR0PwFTqvLd1k3UreFMkqKSuPPU5E/8vrLaIV
 YaKw==
X-Gm-Message-State: ANhLgQ1LmvPcYU6JF8I/QMbgJgJ8h8kwfTA3Ro2JYG51IHhkd+nE8HTP
 ddvqCQbIJiIxz2ngTjVldFA=
X-Google-Smtp-Source: ADFU+vt8f4AAZPIyrQa8ZOQhtBN+IMVOluhC7o/agtBjdWF696Gd3ZLLKacockNGMxdBtWXoieIFag==
X-Received: by 2002:adf:b197:: with SMTP id q23mr1198513wra.412.1584483851329; 
 Tue, 17 Mar 2020 15:24:11 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id f203sm1088742wmf.18.2020.03.17.15.24.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 15:24:09 -0700 (PDT)
Date: Tue, 17 Mar 2020 22:24:09 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 6/8] mm/memory_hotplug: unexport memhp_auto_online
Message-ID: <20200317222409.jufwrcrqtyu263cc@master>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317104942.11178-7-david@redhat.com>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 17, 2020 at 11:49:40AM +0100, David Hildenbrand wrote:
>All in-tree users except the mm-core are gone. Let's drop the export.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@kernel.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> mm/memory_hotplug.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 1a00b5a37ef6..2d2aae830b92 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -71,7 +71,6 @@ bool memhp_auto_online;
> #else
> bool memhp_auto_online = true;
> #endif
>-EXPORT_SYMBOL_GPL(memhp_auto_online);
> 
> static int __init setup_memhp_default_state(char *str)
> {
>-- 
>2.24.1

-- 
Wei Yang
Help you, Help me
