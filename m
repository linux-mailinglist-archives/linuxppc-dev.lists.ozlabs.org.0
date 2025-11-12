Return-Path: <linuxppc-dev+bounces-14124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AEEC52555
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 13:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d63Hy1q2Dz2yvJ;
	Wed, 12 Nov 2025 23:54:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762952046;
	cv=none; b=aaNEIALiVX9FAUdqqFigOIAOH/pDqGklPYRiU7Py8CudHzN3FPYdcbktdvu4fLzit+GW4UykoJWnmAplLpNUp3Bdq1H5WophT1PlIoAnAPh5GoBup+TezVyUR8JeQ+dhoYUHzSzyUthnjf7OhF9k4uZD97BKyBO54gDJ/RayNERjV9FvFIcD80LIO5B1rdW1++EFL2x1HdyE/2ocvHwhss+iOfP3aSZzctPLLj4w66/bUbOaqHGAAWPG9uEpXkRopgpr6+NdF86/5/SVyx++5Ra4uCxGCT77OLqdSKyzy7wbAtP1BdMC4E+i/PHCAe+PAzS++VuGSfqfjDiDrA0JBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762952046; c=relaxed/relaxed;
	bh=m7QU3Nro3+J8938RktDaaa2WfecjloM5MbKrrkuSdG8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=A3nDbrgyzwIQeBpiSZKmEtjjrcnoj909oNdCnx+RhypvAPErJmFzTRxeHNoZCT9QZngH460ULfHnMmYklXHuXC3TR2p+8NelSO2l/XpL8OvUEasSs4P0NpvTSMa4mz00ow/sx6iNwGNanaFd6aeVDipAU9W1+sYzvY1HUrRkd2Ujm4VBprg6EnKLiCkxnf5lKnfQ0rG78wrIsG0ZwbKAmOBkgisno6SKsPxXVY6jaEtlx1ONCLy8hWGD6+FxSu42p3D/58ghcAq1u69thC9fsQjLZqE4fn8uKqtgnneBLmwztz3K5qiqTyMsk4j5K2w/tm7ZN9SYwdTvYjT8gS474w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CaLVIbfU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CaLVIbfU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d63Hw1zfXz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 23:54:03 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso763904b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 04:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762952039; x=1763556839; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7QU3Nro3+J8938RktDaaa2WfecjloM5MbKrrkuSdG8=;
        b=CaLVIbfUPz+BYgyTaBo4111rydyHv1OUD8WKY8YYncJLQUCm1rOB1+neXrJN1KE3ba
         YxG05TV+lsOV91yJb/rClfRi2+rgSeimQhi4bisYFmk+qD8sueuQNnsli9RJljk6X43F
         U0qSyl5GEsEzx1SqkuKDAFMEsW/Qj5Duuz9VcDzwdlMAyFcJXer05TYF5KpGaL6uM2jt
         iLdW4uUAGkGyyREBvXO1znf5kkl4Oh5JxZD1q1Se0yq+ma6qJadWBenI+WvDmB+mT589
         SSOXVKsUjr5Q27haZl3JCGYa5UvMKOBski1QDXCUwA4gZNpsSj7b48keBdCjLb4ZklGU
         Recw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762952039; x=1763556839;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m7QU3Nro3+J8938RktDaaa2WfecjloM5MbKrrkuSdG8=;
        b=G+8AufAML3XYZDfmz0StIbpEmkPo5JSIVHDs474831QhR6y92ktxJnP2fkE59ZW+GZ
         VJ4ohoNjzPPzqQVCGhzR4lR8deyYfVw7Txv2Ff7dvRyc0EKv/WhDudOMJyWPPyctjqvb
         nYmpOLwUZN4huGuvReGywwSp2QLIMj/JI/ZYiut4TWgoXzyHvPo9yRufbhgQStInu0Ol
         KPV4eXTMqYO4QirkA8jyOPjMDcNmJlmxrwQucMGBSCkS6bHTnxHJd21/ect1D29mxSNW
         pA+VMyPZ9A9qJCZSB+tK/xVSF+Ztgz9X5UpXipM5keAytH5CxTvGFgH3kJXMjPgp7O7i
         fmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYHjcxi6Ohc/pr64ITY1zycFIgNTR2KkaBl+H41Q+7qJZxaanXUeKbaBXtJGoeWoXZRr3kFbSLPOXs5ig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOJrG8CeMK/Fh9mLyo0b778RlqvIT28p+VP/PDr5kzeD6RUHL2
	ffmkzAnejq+qkwqAzjYVFZAqc0ZHdAfpBzHVf3BxBWGLOFnwregVcHNf
X-Gm-Gg: ASbGncvEJNYeQICveBElHG+5HoZGDICpUjk1iIAkK+w92+CehEwfGsiw3SJuM3f9l2X
	Sy+cH5jt4LKhro1+gwUT7hXb3MJ2Xo2yrnwOhvae6qEYpw9Zq1/ktpqrH+zKovlnS3v3lhIfA3W
	wJQnQItgvgNRf4Ead/N5L7VO6lLn0RFSsoZS4iiPVi61ullVCnwopAfZ4JUXxlY1qwRrm1oaECK
	5rdJq3M6h4tAfFh1KRiNocGlXmw7MIO5GzTcFqs+igKaJfBkyfEaCpWkKcQmqdT4bC03KYlimEC
	8INi2nRbNveTVS662Cgc9KbF6337KfIgZdCIALPqQxOEgnyxD3tar2Szln4gloHeKwPJdvRZs6I
	7WcxICh0TDCxz1xJJOoRF7TH+7DtnOOfwcWgh5LC6z5/nO5g+PJEHZ12IuM6R0i5Xprp2QkQ=
X-Google-Smtp-Source: AGHT+IGCciHDPJxyBnrFQhMGfLPzaKU10p5tf5+ZXP6+R3DaA1R9jzgi4EfK2vJMOK8Dq1+oSNUsEg==
X-Received: by 2002:a17:903:41c3:b0:295:5132:1a99 with SMTP id d9443c01a7336-2984edca38amr33144395ad.44.1762952039142;
        Wed, 12 Nov 2025 04:53:59 -0800 (PST)
Received: from dw-tp ([49.207.219.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0916sm30055925ad.93.2025.11.12.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 04:53:58 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "David Hildenbrand (Red Hat)" <david@kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
In-Reply-To: <1463bcd5-c47b-4c7f-bb13-2664e2e8226e@csgroup.eu>
Date: Wed, 12 Nov 2025 16:11:57 +0530
Message-ID: <87h5uz8rd6.ritesh.list@gmail.com>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com> <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com> <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu> <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org> <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu> <cdd23dd6-5444-4000-ac68-a72b22bf6a57@kernel.org> <1463bcd5-c47b-4c7f-bb13-2664e2e8226e@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 10/11/2025 à 12:27, David Hildenbrand (Red Hat) a écrit :
>> Thanks for the review!
>> 
>>>
>>> So I think what you want instead is:
>>>
>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype
>>> b/arch/powerpc/platforms/Kconfig.cputype
>>> index 7b527d18aa5ee..1f5a1e587740c 100644
>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>> @@ -276,6 +276,7 @@ config PPC_E500
>>>           select FSL_EMB_PERFMON
>>>           bool
>>>           select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>>           select PPC_SMP_MUXED_IPI
>>>           select PPC_DOORBELL
>>>           select PPC_KUEP
>>>
>>>
>>>
>>>>        select ARCH_HAS_KCOV
>>>>        select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>>>        select ARCH_HAS_MEMBARRIER_CALLBACKS
>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/
>>>> platforms/Kconfig.cputype
>>>> index 7b527d18aa5ee..4c321a8ea8965 100644
>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>>>>    config PPC_RADIX_MMU
>>>>        bool "Radix MMU Support"
>>>>        depends on PPC_BOOK3S_64
>>>> -    select ARCH_HAS_GIGANTIC_PAGE
>>>
>>> Should remain I think.
>>>
>>>>        default y
>>>>        help
>>>>          Enable support for the Power ISA 3.0 Radix style MMU. Currently
>> 
>> 
>> We also have PPC_8xx do a
>> 
>>      select ARCH_SUPPORTS_HUGETLBFS
>> 
>> And of course !PPC_RADIX_MMU (e.g., PPC_64S_HASH_MMU) through 
>> PPC_BOOK3S_64.
>> 
>> Are we sure they cannot end up with gigantic folios through hugetlb?
>> 
>
> Yes indeed. My PPC_8xx is OK because I set CONFIG_ARCH_FORCE_MAX_ORDER=9 
> (largest hugepage is 8M) but I do get the warning with the default value 
> which is 8 (with 16k pages).
>
> For PPC_64S_HASH_MMU, max page size is 16M, we get no warning with 
> CONFIG_ARCH_FORCE_MAX_ORDER=8 which is the default value but get the 
> warning with CONFIG_ARCH_FORCE_MAX_ORDER=7
>

This made me thinking.. Currently we can also get warning even on
book3s64 when CONFIG_PPC_RADIX_MMU=n is selected because max page size
in case of HASH can be 16G. I guess this was not getting tested in
regular CI because it requires us to disable RADIX config during build.

We will end up in this path on Hash where MAX_PAGE_ORDER is
CONFIG_ARCH_FORCE_MAX_ORDER which is 8, this is because we HAVE
ARCH_HAS_GIGANTIC_PAGE=n in case of only HASH.

From below, MAX_FOLIO_ORDER on !PPC_RADIX_MMU (HASH) becomes 8 i.e... 

    #if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
    /*
    * We don't expect any folios that exceed buddy sizes (and consequently
    * memory sections).
    */
    #define MAX_FOLIO_ORDER		MAX_PAGE_ORDER

...And thus 
we get similar warning because (order=18 for 16G) > MAX_FOLIO_ORDER(8) in hugetlb_add_hstate().

[    0.000000] Kernel command line: console=hvc0 console=hvc1 systemd.unit=emergency.target root=/dev/vda1 noreboot disable_radix=1 hugepagesz=16M hugepages=1 hugepagesz=16G hugepages=1 default_hugepagesz=16G
<...>
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at mm/hugetlb.c:4753 hugetlb_add_hstate+0xf4/0x228
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.0-rc3-00138-g1e87cdb8702c #26 NONE
[    0.000000] Hardware name: IBM PowerNV (emulated by qemu) POWER10 0x801200 opal:v7.1-106-g785a5e307 PowerNV
[    0.000000] NIP:  c00000000204ef4c LR: c00000000204f1b0 CTR: c00000000204ee68
[    0.000000] REGS: c000000002857ad0 TRAP: 0700   Not tainted  (6.18.0-rc3-00138-g1e87cdb8702c)
[    0.000000] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28000448  XER: 00000000
[    0.000000] CFAR: c00000000204eed8 IRQMASK: 3
<...>
[    0.000000] NIP [c00000000204ef4c] hugetlb_add_hstate+0xf4/0x228
[    0.000000] LR [c00000000204f1b0] hugepagesz_setup+0x130/0x16c
[    0.000000] Call Trace:
[    0.000000] [c000000002857d70] [c0000000020ee564] hstate_cmdline_buf+0x4/0x800 (unreliable)
[    0.000000] [c000000002857e10] [c00000000204f1b0] hugepagesz_setup+0x130/0x16c
[    0.000000] [c000000002857e80] [c0000000020505a8] hugetlb_bootmem_alloc+0xd8/0x1d0
[    0.000000] [c000000002857ec0] [c000000002046828] mm_core_init+0x2c/0x254
[    0.000000] [c000000002857f30] [c0000000020012ac] start_kernel+0x404/0xae0
[    0.000000] [c000000002857fe0] [c00000000000e934] start_here_common+0x1c/0x20
<...>
[    2.557050] HugeTLB: allocation took 7ms with hugepage_allocation_threads=1
[    2.562263] ------------[ cut here ]------------
[    2.564482] WARNING: CPU: 0 PID: 1 at mm/internal.h:758 gather_bootmem_prealloc_parallel+0x454/0x4d8
[    2.568266] Modules linked in:
[    2.570204] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.18.0-rc3-00138-g1e87cdb8702c #26 NONE
[    2.574570] Tainted: [W]=WARN
[    2.576009] Hardware name: IBM PowerNV (emulated by qemu) POWER10 0x801200 opal:v7.1-106-g785a5e307 PowerNV
[    2.579979] NIP:  c00000000204f9b0 LR: c00000000204f870 CTR: c00000000204f55c
[    2.582763] REGS: c000000004a0f5a0 TRAP: 0700   Tainted: G        W            (6.18.0-rc3-00138-g1e87cdb8702c)
[    2.586670] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002288  XER: 20040000
[    2.590234] CFAR: c00000000204f880 IRQMASK: 0
<...>
[    2.616926] NIP [c00000000204f9b0] gather_bootmem_prealloc_parallel+0x454/0x4d8
[    2.619928] LR [c00000000204f870] gather_bootmem_prealloc_parallel+0x314/0x4d8
[    2.622799] Call Trace:
[    2.624068] [c000000004a0f840] [c00000000204f85c] gather_bootmem_prealloc_parallel+0x300/0x4d8 (unreliable)
[    2.627847] [c000000004a0f930] [c000000002041018] padata_do_multithreaded+0x470/0x518
[    2.631141] [c000000004a0fad0] [c00000000204fce8] hugetlb_init+0x2b4/0x904
[    2.633914] [c000000004a0fc10] [c000000000010d74] do_one_initcall+0xac/0x438
[    2.636761] [c000000004a0fcf0] [c000000002001dfc] kernel_init_freeable+0x3cc/0x720
[    2.639764] [c000000004a0fde0] [c000000000011344] kernel_init+0x34/0x260
[    2.642688] [c000000004a0fe50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[    2.646020] ---- interrupt: 0 at 0x0
[    2.647943] Code: eba100d8 ebc100e0 ebe100e8 e9410058 e92d0c70 7d4a4a79 39200000 40820044 382100f0 eaa1ffa8 4e800020 60420000 <0fe00000> 4bfffed0 3ba00000 7ee4bb78
[    2.654240] irq event stamp: 50400
[    2.655991] hardirqs last  enabled at (50399): [<c00000000002ed84>] interrupt_exit_kernel_prepare+0xd8/0x224
[    2.659759] hardirqs last disabled at (50400): [<c00000000002bdb8>] program_check_exception+0x60/0x78
[    2.663293] softirqs last  enabled at (50320): [<c00000000017aa0c>] handle_softirqs+0x5a8/0x5c0
[    2.666819] softirqs last disabled at (50315): [<c0000000000165e4>] do_softirq_own_stack+0x40/0x54
[    2.670569] ---[ end trace 0000000000000000 ]---
[    2.697258] HugeTLB: registered 16.0 MiB page size, pre-allocated 1 pages
[    2.700831] HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
[    2.703917] HugeTLB: registered 16.0 GiB page size, pre-allocated 1 pages
[    2.707073] HugeTLB: 0 KiB vmemmap can be freed for a 16.0 GiB page


So I guess making PPC select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS is true,
should help us resolve this warning w.r.t order. 
And I guess the runtime allocation of gigantic pages is anyway being controlled
via, __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED

Feel free to correct me here if I missed anything. There seems to be a
lot of history related to hugetlb / gigantic pages.

-ritesh

