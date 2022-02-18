Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8154BC070
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 20:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0hz6039pz3ccc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 06:46:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dKSzoS/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dKSzoS/3; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0hyL62GPz3cN3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 06:46:00 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id p15so17296891ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=TnkmE51UkNMsCcfFfMpS33esSVozAPP7mpptFWEYpDM=;
 b=dKSzoS/3aMC9ZRTMRyoosCDwk0ZSwBgTYl7XOfoKh4dfyzYc0fm4Gex4e8pwyOivcP
 SYAJlV3s0lYSSGU7TjYA717k0mEzY4L+r0w2xUh0A1LafHFru6PLi9IXvCbEDEaJRMQ1
 5iKvU1QviQ6hvuziixKIgraX1Pj7S7s/2x7dMeeWDNMaCoOmeIE/NjNnBkB/c93f1ZCq
 wfY7XSIqb6EGClIXRzo95STJU1+3WiAyTHMdyyebIvKGEIhAo9eohREh9rW5BIvM+8vJ
 tCX59RL/RbirgTbFao0An00pgMqcG2xL2b+OXt/tKz2LHvzgECYKFJmZd16VU1r69UJw
 VMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=TnkmE51UkNMsCcfFfMpS33esSVozAPP7mpptFWEYpDM=;
 b=21C5U9KEKy/Yo0QkcYmL8PpvRDiHBO/wnjKjVEQGlK4JPz/Pwdr51HhW3pUL7IN5jx
 Bd6VUHSY9SwZcJjryM2Saj4IaXhiVMzRccMhASRiFFtUdApjfTrCZT7nmL2H7cSUno9e
 wp96KjXG+EQaGw7cTa/lV8TlSYL1Jdp0z/CIW9CLQClw1cz7m1cLudHF+kcq1JbA3sQT
 W0o+OJBvttZfXy3I+7VUhQPCZ9ZoQg+Qx9Ozkwf9kNArhs/FmPr698XiaCy2vpyCbExs
 FMu3bQXG6/Tgdagl8nFEaWpP73EsJ6k/PNfz7nGeMJyIdIWHG3AIpfVxHL8Qd88N8uOU
 tgfw==
X-Gm-Message-State: AOAM530GcOE3ipJJ8WeUk9wE/3Q10h/KAG8aq4z+CcDGiExyw7ak7ZjJ
 8hHI8HaockrUM71Prtnm3nY=
X-Google-Smtp-Source: ABdhPJxHrwyJCxDhLFrjCzW69ZvfsjmR+IMuhgAuKO0gzs2uTEtYDNQO2rPGEtUNikscE07/abTwUw==
X-Received: by 2002:a17:906:9b88:b0:6d0:f843:4068 with SMTP id
 dd8-20020a1709069b8800b006d0f8434068mr195022ejc.678.1645213554058; 
 Fri, 18 Feb 2022 11:45:54 -0800 (PST)
Received: from ?IPV6:2a00:a040:197:458f:c93a:90a3:1c34:c6d2?
 ([2a00:a040:197:458f:c93a:90a3:1c34:c6d2])
 by smtp.gmail.com with ESMTPSA id o12sm412793ejg.105.2022.02.18.11.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 11:45:53 -0800 (PST)
Message-ID: <9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com>
Date: Fri, 18 Feb 2022 21:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: catalin.marinas@arm.com, akpm@linux-foundation.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
From: Ariel Marcovitch <arielmarcovitch@gmail.com>
Subject: False positive kmemleak report for dtb properties names on powerpc
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

Hello!

I was running a powerpc 32bit kernel (built using 
qemu_ppc_mpc8544ds_defconfig
buildroot config, with enabling DEBUGFS+KMEMLEAK+HIGHMEM in the kernel 
config)
on qemu and invoked the kmemleak scan (twice. for some reason the first 
time wasn't enough).

(Actually the problem will probably reproduce on every ppc kernel with
HIGHMEM enabled, but I only checked this config)

I got 97 leak reports, all similar to the following:

```

unreferenced object 0xc1803840 (size 16):
   comm "swapper", pid 1, jiffies 4294892303 (age 39.320s)
   hex dump (first 16 bytes):
     64 65 76 69 63 65 5f 74 79 70 65 00 00 00 00 00 device_type.....
   backtrace:
     [<(ptrval)>] kstrdup+0x40/0x98
     [<(ptrval)>] __of_add_property_sysfs+0xa4/0x10c
     [<(ptrval)>] __of_attach_node_sysfs+0xc0/0x110
     [<(ptrval)>] of_core_init+0xa8/0x15c
     [<(ptrval)>] driver_init+0x24/0x3c
     [<(ptrval)>] kernel_init_freeable+0xb8/0x23c
     [<(ptrval)>] kernel_init+0x24/0x14c
     [<(ptrval)>] ret_from_kernel_thread+0x5c/0x64
```

The objects in the reports are the names of the sysfs files created for 
the dtb
nodes and properties.

These are definitely not leaked, as they are even visible to the user as 
the sysfs file names.

These strings (for dtb properties, in the case of the shown report, but 
the case with dtb nodes is very similar) are created in 
__of_add_property_sysfs() and the pointer to them is stored in 
pp->attr.attr.name (so, actually stored in the memory pointed by pp)

pp is one of the dtb property objects which are allocated in 
early_init_dt_alloc_memory_arch() in of/fdt.c using memblock_alloc. This 
happens very early, in setup_arch()->unflatten_device_tree().

memblock_alloc lets kmemleak know about the allocated memory using 
kmemleak_alloc_phys (in mm/memblock.c:memblock_alloc_range_nid()).

The problem is with the following code (mm/kmemleak.c):

```c

void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
                                gfp_t gfp)
{
         if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
                 kmemleak_alloc(__va(phys), size, min_count, gfp);
}

```

When CONFIG_HIGHMEM is enabled, the pfn of the allocated memory is 
checked against max_low_pfn, to make sure it is not in the HIGHMEM zone.

However, when called through unflatten_device_tree(), max_low_pfn is not 
yet initialized in powerpc.

max_low_pfn is initialized (when NUMA is disabled) in 
arch/powerpc/mm/mem.c:mem_topology_setup() which is called only after 
unflatten_device_tree() is called in the same function (setup_arch()).

Because max_low_pfn is global it is 0 before initialization, so as far 
as kmemleak_alloc_phys() is concerned, every memory is HIGHMEM (: and 
the allocated memory is not tracked by kmemleak, causing references to 
objects allocated later with kmalloc() to be ignored and these objects 
are marked as leaked.

I actually tried to find out whether this happen on other arches as 
well, and it seems like arm64 also have this problem when dtb is used 
instead of acpi, although I haven't had the chance to confirm this.

I don't suppose I can just shuffle the calls in setup_arch() around, so 
I wanted to hear your opinions first

Thanks!

