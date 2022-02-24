Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEE4C38BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 23:28:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4SGX4Dl8z3bbk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 09:28:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qyw2vcM4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qyw2vcM4; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4SFv5yL8z30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 09:27:31 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id c192so656394wma.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 14:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:content-transfer-encoding;
 bh=2Po0su4OQcLwD05ycOpYEUEszvD751jwueFeSIX1Bho=;
 b=Qyw2vcM4btgWfaluW8pKS/moQhpNh/TZ3cE53BIXTMb8mk9+SYXnRBax4x9Syyt/QD
 d9TkB1PDTkGrYzOzUQc4fHSOLZHM2O98a4kcp7cZG9sAzfxm7ZppiS4IFDeHo1/RdqCx
 4lJrI6BAV4bvUNNTh32xWpGwCsDcv217oiPIDVyMETHxmTUN/3JsagXMYdNWt2qjxXWy
 bAu/0TM4vZalGHNMF/a1lzi7RJGBnwIv7bQtTgdNZkYiYM3KEYGHXagtY45+W8ucF+l4
 pF5HULAt5uQC55NxUMFei/HVMfyrcrRkJV706QJT2OboiPhJpGkY+opjeNnZfjGtJ8M5
 sMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:content-transfer-encoding;
 bh=2Po0su4OQcLwD05ycOpYEUEszvD751jwueFeSIX1Bho=;
 b=f/HniR4VsgJfxe9PyqLpTtyfsNya2aYRFjJsv/q9ToE2uTxFl9KshMmgtR0GL73VWj
 fu1UmMp+f8WgmGt+XMVHlTLArJ33wZd0vMMAJbhCUYsOJ54uT3XN6g9us6WKbia1dojY
 G42JgmiRtWaFPPT7yBjyhXuB0DsMWO/WoEK1CcZmiXMhb5HVqSOBxKlnbZdFzm522+Zb
 pVTqsCthDvwg4R6yJRJ1mwL03p25xn1Oe4LWEyzHwqdIz+rGmNLgK3mcFcY2JemVqcmJ
 2u+8UcJJ/9zCVCuSjyfXZVk/N6aUISsIrKuYiI28KTc0cq+5WJjmJGDLXSBy24k3/tJn
 +wvQ==
X-Gm-Message-State: AOAM5311oQuOmred7tZRfbrOdHxNbbiIXGIgZlPzfh7jSq6J12SeU7uT
 XkSRSVCPWMlEjqxxvA/Kyfo=
X-Google-Smtp-Source: ABdhPJzOirp7GVopNHMhr7m/DqyvKKDcPOT5QKM44AbjfpcZHJBBYhn+3WKEhp5Ijabtkn/KpREwZQ==
X-Received: by 2002:a1c:a483:0:b0:380:c27c:225b with SMTP id
 n125-20020a1ca483000000b00380c27c225bmr157750wme.121.1645741643402; 
 Thu, 24 Feb 2022 14:27:23 -0800 (PST)
Received: from ?IPV6:2a02:6680:1100:883:dfa4:b9d3:d1f9:d299?
 ([2a02:6680:1100:883:dfa4:b9d3:d1f9:d299])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d6608000000b001e73a0f21ffsm582697wru.6.2022.02.24.14.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 14:27:23 -0800 (PST)
Message-ID: <1e976df3-2925-f6c6-6723-67f127b9e544@gmail.com>
Date: Fri, 25 Feb 2022 00:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: False positive kmemleak report for dtb properties names on powerpc
Content-Language: en-US
From: Ariel Marcovitch <arielmarcovitch@gmail.com>
To: catalin.marinas@arm.com, akpm@linux-foundation.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping :)

On 18/02/2022 21:45, Ariel Marcovitch wrote:
> Hello!
>
> I was running a powerpc 32bit kernel (built using 
> qemu_ppc_mpc8544ds_defconfig
> buildroot config, with enabling DEBUGFS+KMEMLEAK+HIGHMEM in the kernel 
> config)
> on qemu and invoked the kmemleak scan (twice. for some reason the 
> first time wasn't enough).
>
> (Actually the problem will probably reproduce on every ppc kernel with
> HIGHMEM enabled, but I only checked this config)
>
> I got 97 leak reports, all similar to the following:
>
> ```
>
> unreferenced object 0xc1803840 (size 16):
>   comm "swapper", pid 1, jiffies 4294892303 (age 39.320s)
>   hex dump (first 16 bytes):
>     64 65 76 69 63 65 5f 74 79 70 65 00 00 00 00 00 device_type.....
>   backtrace:
>     [<(ptrval)>] kstrdup+0x40/0x98
>     [<(ptrval)>] __of_add_property_sysfs+0xa4/0x10c
>     [<(ptrval)>] __of_attach_node_sysfs+0xc0/0x110
>     [<(ptrval)>] of_core_init+0xa8/0x15c
>     [<(ptrval)>] driver_init+0x24/0x3c
>     [<(ptrval)>] kernel_init_freeable+0xb8/0x23c
>     [<(ptrval)>] kernel_init+0x24/0x14c
>     [<(ptrval)>] ret_from_kernel_thread+0x5c/0x64
> ```
>
> The objects in the reports are the names of the sysfs files created 
> for the dtb
> nodes and properties.
>
> These are definitely not leaked, as they are even visible to the user 
> as the sysfs file names.
>
> These strings (for dtb properties, in the case of the shown report, 
> but the case with dtb nodes is very similar) are created in 
> __of_add_property_sysfs() and the pointer to them is stored in 
> pp->attr.attr.name (so, actually stored in the memory pointed by pp)
>
> pp is one of the dtb property objects which are allocated in 
> early_init_dt_alloc_memory_arch() in of/fdt.c using memblock_alloc. 
> This happens very early, in setup_arch()->unflatten_device_tree().
>
> memblock_alloc lets kmemleak know about the allocated memory using 
> kmemleak_alloc_phys (in mm/memblock.c:memblock_alloc_range_nid()).
>
> The problem is with the following code (mm/kmemleak.c):
>
> ```c
>
> void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int 
> min_count,
>                                gfp_t gfp)
> {
>         if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
>                 kmemleak_alloc(__va(phys), size, min_count, gfp);
> }
>
> ```
>
> When CONFIG_HIGHMEM is enabled, the pfn of the allocated memory is 
> checked against max_low_pfn, to make sure it is not in the HIGHMEM zone.
>
> However, when called through unflatten_device_tree(), max_low_pfn is 
> not yet initialized in powerpc.
>
> max_low_pfn is initialized (when NUMA is disabled) in 
> arch/powerpc/mm/mem.c:mem_topology_setup() which is called only after 
> unflatten_device_tree() is called in the same function (setup_arch()).
>
> Because max_low_pfn is global it is 0 before initialization, so as far 
> as kmemleak_alloc_phys() is concerned, every memory is HIGHMEM (: and 
> the allocated memory is not tracked by kmemleak, causing references to 
> objects allocated later with kmalloc() to be ignored and these objects 
> are marked as leaked.
>
> I actually tried to find out whether this happen on other arches as 
> well, and it seems like arm64 also have this problem when dtb is used 
> instead of acpi, although I haven't had the chance to confirm this.
>
> I don't suppose I can just shuffle the calls in setup_arch() around, 
> so I wanted to hear your opinions first
>
> Thanks!
>
