Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423934DE1F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 20:45:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKvcj0c40z3bZM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 06:45:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LCG+pqfy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LCG+pqfy; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKvc06ywHz30Fw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 06:44:47 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id t24so2832463wra.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 12:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:cc:in-reply-to:content-transfer-encoding;
 bh=qXhYkigGj58/kff3HsWg1q2EAJtN0NrPwvHJP2N2yHs=;
 b=LCG+pqfyA51m/hQyZojANHy+BNe3EWJo1YAokXmurzvxmLacOfUkaY/6pMDWDTlK0Y
 BPJ0rnVo+BHnDiKqcP/PRk68U33Ftsrj7DoGV2SChBWeEKqpOWNm5weBNXd2QLsymktT
 UpQRq6jZ0U9uiiW005AqBADkgMEUTmwJJw8N4dMKDq4V8F814XBkt6zpnAeWk1KQpMC3
 2XIlI5e6ltDBzoiRT8WowX9HWmnfTlv+6EuPP3TMa/5K8sonnV7Km997L7eTepQFayyR
 QL/s4Xtkl0KJwA6f+BFPCFJxI8j/3H2zCIgrppUzdXchGpSRfMKPSWYr89u2BxXu9iln
 Pr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:cc:in-reply-to
 :content-transfer-encoding;
 bh=qXhYkigGj58/kff3HsWg1q2EAJtN0NrPwvHJP2N2yHs=;
 b=xX6PZeL2zYSq4FY0YvSDymKY8hxqUoHQcfprCcfrkHhOE0bgf3LLIto68hQ1noVQw9
 14DCC7PWD5CDypBPaSAn6uXup82uCAJM8dRlFs5730GP7cvjVhCn80XHYALvIbRlrMrJ
 1wwwzybUTbrjRq75yWiuVi10a/ixgvXSoxdknsImmW6ONMrUNlX3yWUv/OL0N/8L3twS
 iISioj8EDfGo8nVuN38bjpCh4pNw03RyTWtbpQyMqIFYPOvxGJ1fQ556Lkw6uA69/XDD
 i0JlNNgOQVuRmS7nSs/5/SIevnGoHrZ5Q8J/Au6+cjSSI+7liPURmE/5ipCaB7d9Pqn3
 QFCA==
X-Gm-Message-State: AOAM532+W0OX2Evm+rWu0WhhJReivaESGVfwXwSsiHeXUuhciXoKpTo1
 eAQwaMG7pzeKmeS2mnz0Qag=
X-Google-Smtp-Source: ABdhPJz4d0DU/jd1bZak7G6edgrQW/g3NgZ42WbuYK61+AmFosseRfB0yCqCv26vE8P3n7ZLEo5dxw==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr9533625wrz.690.1647632680165; 
 Fri, 18 Mar 2022 12:44:40 -0700 (PDT)
Received: from ?IPV6:2a00:a040:197:458f:39cc:ea22:7ce4:89b9?
 ([2a00:a040:197:458f:39cc:ea22:7ce4:89b9])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm1767744wrv.49.2022.03.18.12.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 12:44:39 -0700 (PDT)
Message-ID: <5d7caa39-9156-0db1-688c-eafe4007a492@gmail.com>
Date: Fri, 18 Mar 2022 21:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: False positive kmemleak report for dtb properties names on powerpc
Content-Language: en-US
From: Ariel Marcovitch <arielmarcovitch@gmail.com>
To: catalin.marinas@arm.com, akpm@linux-foundation.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1e976df3-2925-f6c6-6723-67f127b9e544@gmail.com>
In-Reply-To: <1e976df3-2925-f6c6-6723-67f127b9e544@gmail.com>
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

Pinging again :)

On 25/02/2022 0:27, Ariel Marcovitch wrote:
> Ping :)
>
> On 18/02/2022 21:45, Ariel Marcovitch wrote:
>> Hello!
>>
>> I was running a powerpc 32bit kernel (built using 
>> qemu_ppc_mpc8544ds_defconfig
>> buildroot config, with enabling DEBUGFS+KMEMLEAK+HIGHMEM in the 
>> kernel config)
>> on qemu and invoked the kmemleak scan (twice. for some reason the 
>> first time wasn't enough).
>>
>> (Actually the problem will probably reproduce on every ppc kernel with
>> HIGHMEM enabled, but I only checked this config)
>>
>> I got 97 leak reports, all similar to the following:
>>
>> ```
>>
>> unreferenced object 0xc1803840 (size 16):
>>   comm "swapper", pid 1, jiffies 4294892303 (age 39.320s)
>>   hex dump (first 16 bytes):
>>     64 65 76 69 63 65 5f 74 79 70 65 00 00 00 00 00 device_type.....
>>   backtrace:
>>     [<(ptrval)>] kstrdup+0x40/0x98
>>     [<(ptrval)>] __of_add_property_sysfs+0xa4/0x10c
>>     [<(ptrval)>] __of_attach_node_sysfs+0xc0/0x110
>>     [<(ptrval)>] of_core_init+0xa8/0x15c
>>     [<(ptrval)>] driver_init+0x24/0x3c
>>     [<(ptrval)>] kernel_init_freeable+0xb8/0x23c
>>     [<(ptrval)>] kernel_init+0x24/0x14c
>>     [<(ptrval)>] ret_from_kernel_thread+0x5c/0x64
>> ```
>>
>> The objects in the reports are the names of the sysfs files created 
>> for the dtb
>> nodes and properties.
>>
>> These are definitely not leaked, as they are even visible to the user 
>> as the sysfs file names.
>>
>> These strings (for dtb properties, in the case of the shown report, 
>> but the case with dtb nodes is very similar) are created in 
>> __of_add_property_sysfs() and the pointer to them is stored in 
>> pp->attr.attr.name (so, actually stored in the memory pointed by pp)
>>
>> pp is one of the dtb property objects which are allocated in 
>> early_init_dt_alloc_memory_arch() in of/fdt.c using memblock_alloc. 
>> This happens very early, in setup_arch()->unflatten_device_tree().
>>
>> memblock_alloc lets kmemleak know about the allocated memory using 
>> kmemleak_alloc_phys (in mm/memblock.c:memblock_alloc_range_nid()).
>>
>> The problem is with the following code (mm/kmemleak.c):
>>
>> ```c
>>
>> void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int 
>> min_count,
>>                                gfp_t gfp)
>> {
>>         if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
>>                 kmemleak_alloc(__va(phys), size, min_count, gfp);
>> }
>>
>> ```
>>
>> When CONFIG_HIGHMEM is enabled, the pfn of the allocated memory is 
>> checked against max_low_pfn, to make sure it is not in the HIGHMEM zone.
>>
>> However, when called through unflatten_device_tree(), max_low_pfn is 
>> not yet initialized in powerpc.
>>
>> max_low_pfn is initialized (when NUMA is disabled) in 
>> arch/powerpc/mm/mem.c:mem_topology_setup() which is called only after 
>> unflatten_device_tree() is called in the same function (setup_arch()).
>>
>> Because max_low_pfn is global it is 0 before initialization, so as 
>> far as kmemleak_alloc_phys() is concerned, every memory is HIGHMEM (: 
>> and the allocated memory is not tracked by kmemleak, causing 
>> references to objects allocated later with kmalloc() to be ignored 
>> and these objects are marked as leaked.
>>
>> I actually tried to find out whether this happen on other arches as 
>> well, and it seems like arm64 also have this problem when dtb is used 
>> instead of acpi, although I haven't had the chance to confirm this.
>>
>> I don't suppose I can just shuffle the calls in setup_arch() around, 
>> so I wanted to hear your opinions first
>>
>> Thanks!
>>
