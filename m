Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C38403D42A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 00:09:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWk4s5bQ2z3bcK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 08:09:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HGYGO1ag;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HGYGO1ag; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWk4M6h7Fz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 08:09:05 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id j2so3769786wrx.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ecBj1zwkwYbGZmPUHfpHo34O/qFU4IXeWk/Gj4el/tM=;
 b=HGYGO1agXI7WNvWwPw350KSfg0GLvzcju4Z5EiI8D+l4EP40ZQllCKXTfUAABvAYIc
 ukNpMOqWdsL0WhHVNhZlCOxZIb1fEyuSOvRKzMbACrfUV088n0fVEsNd0cgEWr+5iKhk
 fqb4oqe7cZyVJv/MzOmLwEYTm8Ra4CDWuBzy46ruPzfmfvlE2tSKwcNxNrQvTW9Hl8/X
 C5nghG/eCYy9yt6b0NXGN9bGSSfifgesFDnrObZiI9iI8nfx12eFzMMVHt/BPhtOjDIb
 1G7KkYePFXHBwrErsA+cRg+vYFnhS48+AVKe+ZC+micMrt9to0/OLV8Kj04u+4XKwUi2
 bTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ecBj1zwkwYbGZmPUHfpHo34O/qFU4IXeWk/Gj4el/tM=;
 b=s2wwOmIF+kb9D4kaUV49SAsYdVlW9YQ/jNt8YqHTTa8BZ8DFJAiyLAcsMBiLZe3VMQ
 elc6u9XB8Op5naSo8sRoPGH+PkV1zEQcmiS+TGN/GCeK1+o7d0490rCL9+WdVg1wEO48
 aqHzO4vl+3UA3SN30GHG6cQQ7kBa0nIW7NkzLhjRT33sy+1H3CErWs/DzhzQa9KVhJ+G
 92Itk/SqO0uCz/A4x2HkTya+tD7TSOuGID9VXyRPwLrY/YpJwJ/pbV5hI7F1x17+twUO
 LqvngoqZ8FzGBmFP1xjq8haFOFkmjh36+cS1KL1oSiLxkf37yod5wrIG1x0oiPTnBo7P
 YA9A==
X-Gm-Message-State: AOAM532afOprP3RCtDIIwLvvMziRiE0230u9Vhr8vh4PF8PyQT0g5ESU
 Vu9yTSmAqqdMouFJ/SY+qL4=
X-Google-Smtp-Source: ABdhPJw8Sxr/QfKAbUpyqwrWHu2bVlTySlMiiJtAJVMHDHH+c3u+yrc4eD88LEHyDBRAn/1TATR+hg==
X-Received: by 2002:a05:6000:1248:: with SMTP id
 j8mr7212507wrx.391.1627078138602; 
 Fri, 23 Jul 2021 15:08:58 -0700 (PDT)
Received: from debian64.daheim (p5b0d7bb8.dip0.t-ipconnect.de. [91.13.123.184])
 by smtp.gmail.com with ESMTPSA id v30sm36863335wrv.85.2021.07.23.15.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:08:58 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94.2)
 (envelope-from <chunkeey@gmail.com>)
 id 1m73LK-001hIT-Av; Sat, 24 Jul 2021 00:08:30 +0200
Subject: Re: [PATCH v3 0/5] powerpc: apm82181: adding customer devices
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <cover.1599343429.git.chunkeey@gmail.com>
 <YPsWMRLWQoxHFub6@smile.fi.intel.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <8a8f50d1-b89c-322f-1465-062ed287d491@gmail.com>
Date: Sat, 24 Jul 2021 00:08:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPsWMRLWQoxHFub6@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Chris Blake <chrisrblake93@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy!

On 23/07/2021 21:19, Andy Shevchenko wrote:
> On Sun, Sep 06, 2020 at 12:06:10AM +0200, Christian Lamparter wrote:
>> I've been holding on to these devices dts' for a while now.
>> But ever since the recent purge of the PPC405, I'm feeling
>> the urge to move forward.
>>
>> The devices in question have been running with OpenWrt since
>> around 2016/2017. Back then it was linux v4.4 and required
>> many out-of-tree patches (for WIFI, SATA, CRYPTO...), that
>> since have been integrated. So, there's nothing else in the
>> way I think.
>>
>> A patch that adds the Meraki vendor-prefix has been sent
>> separately, as there's also the Meraki MR32 that I'm working
>> on as well. Here's the link to the patch:
>> <https://lore.kernel.org/linuxppc-dev/20200822154045.16036-1-chunkeey@gmail.com/>
>>
>> Now, I've looked around in the arch/powerpc for recent .dts
>> and device submissions to get an understanding of what is
>> required.
>> >From the looks of it, it seems like every device gets a
>> skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
>> CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).
>>
>> Will this be the case? Or would it make sense to further
>> unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
>> and integrate the BLUESTONE device's defconfig into it as well?
>> (I've stumbled across the special machine compatible
>> handling of ppc in the Documentation/devicetree/usage-model.rst
>> already.)
> 
> I haven't found any traces of this to be applied. What is the status of this
> patch series? And what is the general state of affairs for the PPC44x?


My best guess is: It's complicated. While there was a recent big
UPSET EVENT regarding the My Book Live (MBL) that affected "hundreds"
and "thousands": "An unpleasant surprise for My Book Live owners"
(<https://lwn.net/Articles/861235/>). Sadly this wasn't getting any
traction.

I can tell that the mentioned Cisco Meraki MR32 (Broadcom ARM SoC)
got merged. So this is off the plate 😌.

But APM821xx sadly went nowhere 😕. One reason being that I haven't
yet posted a V4, V5 and so on...

In theory, for v4 I would have liked to know how to handle the
kConfig aspect of the series: Would it be "OK" to have a
single CONFIG_APM82181/CONFIG_APM821XX symbol or should there
be a CONFIG_MBL the CONFIG_MR24 (CONFIG_WNDR4700 and CONFIG_MX60W
in the future)?

As for the MBL: Well, If you (or any one else) is interested in
having a more up-to-date Debian. Then I have something:

A while back, I made a "build.sh". This will build a
"out-of-the-box" Debian unstable/SID powerpc system image.
This includes sensible NAS defaults + programs as well as
a Cockpit Web-GUI. But also makes it easily possible to do
the DTBs development on the latest vanilla (5.14-rc2 as of
the time of writing this) kernel for the
MyBook Live Single and Duo:

<https://github.com/chunkeey/mbl-debian>

I can't really make one for the MR24 though. Its 32MiB NAND
makes it difficult to install anything else than OpenWrt
(and get some use out of the device).

So, how to proceed?

Cheers,
Christian

PS.: As for PPC44x health regarding APM82181: It works!

This is with a My Book Live (MBL) and the 5.14.0-rc2(+) kernel.

[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Linux version 5.14.0-rc2+ (root@debian64) (powerpc-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 Fri Jul 23 22:59:56 CEST 2021
[    0.000000] Found initrd at 0xcf000000:0xcfe73b70
[    0.000000] Using PowerPC 44x Platform machine description
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x10000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x0000000000000100
[    0.000000]   possible        = 0x0000000040000100
[    0.000000]   always          = 0x0000000000000100
[    0.000000] cpu_user_features = 0x8c008000 0x00000000
[    0.000000] mmu_features      = 0x00000008
[    0.000000] -----------------------------------------------------
[    0.000000] Top of RAM: 0x10000000, Total RAM: 0x10000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16352
[    0.000000] Kernel command line: root=UUID=ef4e8942-768b-4d2e-ba57-486397c97081 console=ttyS0,115200
[    0.000000] Dentry cache hash table entries: 32768 (order: 3, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 2, 65536 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xffbdc000..0xffffc000  : fixmap
[    0.000000]   * 0xd1000000..0xffbdc000  : vmalloc & ioremap
[    0.000000] Memory: 237088K/262144K available (6096K kernel code, 832K rwdata, 1888K rodata, 256K init, 338K bss, 25056K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u32 called from cache_random_seq_create+0x68/0x148 with crng_init=0
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] UIC0 (32 IRQ sources) at DCR 0xc0
[    0.000000] UIC1 (32 IRQ sources) at DCR 0xd0
[    0.000000] UIC2 (32 IRQ sources) at DCR 0xe0
[    0.000000] UIC3 (32 IRQ sources) at DCR 0xf0
[    0.000000] time_init: decrementer frequency = 800.000008 MHz
[    0.000000] time_init: processor frequency   = 800.000008 MHz
[    0.000008] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0xb881274fa3, max_idle_ns: 440795210636 ns
[    0.008985] clocksource: timebase mult[1400000] shift[24] registered
[    0.014006] clockevent: decrementer mult[ccccccef] shift[32] cpu[0]
[    0.019181] Console: colour dummy device 80x25
[    0.022289] pid_max: default: 32768 minimum: 301
[    0.025979] Mount-cache hash table entries: 4096 (order: 0, 16384 bytes, linear)
[    0.032024] Mountpoint-cache hash table entries: 4096 (order: 0, 16384 bytes, linear)
[    0.041291] devtmpfs: initialized
...

The "+" Patch is:
<https://github.com/chunkeey/mbl-debian/blob/master/patches/kernel/9999-powerpc-apm82181-add-WD-MyBook-Live-NAS.patch>
(which adds the "wd,mybooklive" to the list of
supported devices to ppc44x_simple.c)
