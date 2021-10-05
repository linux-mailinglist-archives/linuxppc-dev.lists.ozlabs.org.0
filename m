Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E98422AF2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 16:23:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP0F84Rczz2ypR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 01:23:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=G6WOlcyf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::c2c;
 helo=mail-oo1-xc2c.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=G6WOlcyf; 
 dkim-atps=neutral
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP0DQ72gdz2xY2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 01:23:01 +1100 (AEDT)
Received: by mail-oo1-xc2c.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso6451741ooq.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xF+jNwW5BFEV+lIRF79mZl5w3T2WmTQ1n+ANOqGSM58=;
 b=G6WOlcyfrBgIu0kBXl6Bx3ZoUEQr6/41sXdy6lq/sSgNafvyAemd+dwNdapXnV3vQ4
 UKifj/kxPStJlaVPMTA9ab+lLDZY4sQ2+f2wY++qX7vRBaVpW5zNTqa9fFNe98irLV3S
 GVWYWVhmPK8KnUJNQ+LADA8ROn56XNvBR+c+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xF+jNwW5BFEV+lIRF79mZl5w3T2WmTQ1n+ANOqGSM58=;
 b=wYM+RetsWqrJEkBqkvITg6Iz9DKPM4DeKnlTMGFdS2gG+/14c1IRL7szi79KY2lwI+
 xMiTzOMFaZDjEXkK/5pNXdXNOP09Ipyu1YTFLK65VUUFEBEPboUmASpTp5e3BDzeFHRV
 aNwFjjX2ZgGwUYFa9NzhmI/ggWn/4vH7jEnB8OyTWp/Imyuc2SH2JqhuqHJJPTQ6i6dG
 CS2LBDBzSndVnYZ2T48rzz2dKs0TtrMEwxspGQuEv58Bnt6GSvXmrrJBhChzscDQUHc4
 fl9GSoxA0jXzrdrraP/RXDZeDheTpfVxfcQUOYQsncJUV9aHSl7R9eOu6Rr2YcY0aQ/7
 sPoQ==
X-Gm-Message-State: AOAM533ha6Uo9Aw/x+wEps8ygukvT1by/07/tqDQ5ZWpTPoNyIjN+xMH
 pkgoc4M0SN51JwIr5VCxxQAPZg==
X-Google-Smtp-Source: ABdhPJyBcGscPewH1ZEk7sJd92chljhW3DetsHnRNw1RAHBxKccwA91AIJhkvrbu0pKqg5g+Lc7jUQ==
X-Received: by 2002:a05:6820:358:: with SMTP id
 m24mr13754323ooe.34.1633443777284; 
 Tue, 05 Oct 2021 07:22:57 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id v9sm1382374oth.62.2021.10.05.07.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 07:22:56 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] mm/memory_hotplug: remove
 CONFIG_MEMORY_HOTPLUG_SPARSE
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20210929143600.49379-1-david@redhat.com>
 <20210929143600.49379-3-david@redhat.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0489ea97-0a78-0299-335a-ca1166bb2735@linuxfoundation.org>
Date: Tue, 5 Oct 2021 08:22:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210929143600.49379-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/29/21 8:35 AM, David Hildenbrand wrote:
> CONFIG_MEMORY_HOTPLUG depends on CONFIG_SPARSEMEM, so there is no need for
> CONFIG_MEMORY_HOTPLUG_SPARSE anymore; adjust all instances to use
> CONFIG_MEMORY_HOTPLUG and remove CONFIG_MEMORY_HOTPLUG_SPARSE.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   arch/powerpc/include/asm/machdep.h            |  2 +-
>   arch/powerpc/kernel/setup_64.c                |  2 +-
>   arch/powerpc/platforms/powernv/setup.c        |  4 ++--
>   arch/powerpc/platforms/pseries/setup.c        |  2 +-
>   drivers/base/Makefile                         |  2 +-
>   drivers/base/node.c                           |  9 ++++-----
>   drivers/virtio/Kconfig                        |  2 +-
>   include/linux/memory.h                        | 18 +++++++-----------
>   include/linux/node.h                          |  4 ++--
>   lib/Kconfig.debug                             |  2 +-
>   mm/Kconfig                                    |  4 ----
>   mm/memory_hotplug.c                           |  2 --
>   tools/testing/selftests/memory-hotplug/config |  1 -
>   13 files changed, 21 insertions(+), 33 deletions(-)
> 

>   {
> diff --git a/tools/testing/selftests/memory-hotplug/config b/tools/testing/selftests/memory-hotplug/config
> index a7e8cd5bb265..1eef042a31e1 100644
> --- a/tools/testing/selftests/memory-hotplug/config
> +++ b/tools/testing/selftests/memory-hotplug/config
> @@ -1,5 +1,4 @@
>   CONFIG_MEMORY_HOTPLUG=y
> -CONFIG_MEMORY_HOTPLUG_SPARSE=y
>   CONFIG_NOTIFIER_ERROR_INJECTION=y
>   CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
>   CONFIG_MEMORY_HOTREMOVE=y
> 

For Kselftest change:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
