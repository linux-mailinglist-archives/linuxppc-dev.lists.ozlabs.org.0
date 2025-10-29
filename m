Return-Path: <linuxppc-dev+bounces-13491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945FC19028
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 09:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxL0k6NvWz3bfN;
	Wed, 29 Oct 2025 19:25:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761726342;
	cv=none; b=gwQ5S+ADrB78UwsvN7DajfilU1jSR35fHspof6JvLYHqBsBiqNvYxtslzU2l+34JlSUXMul1yrqwoAbPB4qtPlr4z0SVju2fPJ3pyZocrYwOUyRKtHEBDGee5iK30kik8cQHo/ciDPG+AJtURH+61x2OaICAt7McoJS1LcpxZoTaoTB4U0cQ51rmG2XPRK7qyMlFH/sTZ85f8q/sRXoOhbclHbsT6onC+x5nI4obKClQx93FXoJT8Gf2cJn/1HeS1dSZ1u40rTP7Pi4T0dpHU4f5WKS5Iob+55AKNjPw7WMdqqqJQ8PmVFsiZo6Gdvq8iMyj99xSdtSKnKU/dB0mlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761726342; c=relaxed/relaxed;
	bh=nsQaLIqYm0d//IzDIuhCbsu1Ne1bUcv5/aeXYOF0k0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/uNVGUNCtOMyFFJMCwoCgK3qQ6lIHBEe26su04k3DHfbYFtJd6V2WZ8dwwmZEF7dIdC1fyvWoco5FiGrlgQ1J60+oCzycRKx+gGInGyceTehwtKBjNzBF5+2rMKqDKufxR0/c5mQoUFVs8niLEZNKKDL4hBLSRR7LHiILrvzbMt1jO6rAZPAhPAz9sI16Gb0SYC8vV266QCo6m9i59Jlcrin3dL1VUcbOSMQUGeBVkRVIyxuhSj7XAbVF1/zRMRZElkBcxna41bnevWk5CWTRRUU7H/txK5EAXlxhxLfYSU4+m246Pk1DW/B86Tbcj5gWqIJReI0cMGnkRHrkStMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fNfjUf9X; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fNfjUf9X; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fNfjUf9X;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fNfjUf9X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxL0j0lJGz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 19:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761726331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nsQaLIqYm0d//IzDIuhCbsu1Ne1bUcv5/aeXYOF0k0A=;
	b=fNfjUf9XG1S633QMcCQW5eGB23Bik+K9qGjTMRQZp1lo2t0GrzLSUk80bw0bCmynjvXTVQ
	dwW1hk+ZuUyh3i+BE0e3AqaW7BQ9ZJ3gHR2yFoq+2O2s6grolfptI0djP7Tuv1OsgXOEQo
	8gyvPFlnR3H45SLuspN0NCWSlMJ2Zhg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761726331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nsQaLIqYm0d//IzDIuhCbsu1Ne1bUcv5/aeXYOF0k0A=;
	b=fNfjUf9XG1S633QMcCQW5eGB23Bik+K9qGjTMRQZp1lo2t0GrzLSUk80bw0bCmynjvXTVQ
	dwW1hk+ZuUyh3i+BE0e3AqaW7BQ9ZJ3gHR2yFoq+2O2s6grolfptI0djP7Tuv1OsgXOEQo
	8gyvPFlnR3H45SLuspN0NCWSlMJ2Zhg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-HxMacY7fMkeouwKXSep8Zw-1; Wed, 29 Oct 2025 04:25:28 -0400
X-MC-Unique: HxMacY7fMkeouwKXSep8Zw-1
X-Mimecast-MFC-AGG-ID: HxMacY7fMkeouwKXSep8Zw_1761726327
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3f384f10762so4213872f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726327; x=1762331127;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsQaLIqYm0d//IzDIuhCbsu1Ne1bUcv5/aeXYOF0k0A=;
        b=P2JiAdIzZH0WJi+M6NOCzNROl7EwrVyoUv0xjd46AQ5Z4cZnSZIRLobWLzwhsgmg0s
         oKUbH1my4e0VWrLQPM2FM204N0OiEddyzqP9+UG4zVwopBOis+5AvEl0bCaoOc7XPOhI
         MQoy+0IDJW2EiN53JreNOw8+5Di76XnixRbTkqJfYnYlGyxhJcUIzGX+phile/KVyJKr
         2ASgJ0liJt7BW5pygZxij16Iy2EY9De2XzdMLvUG/lYZlLRATKrSTvPELWS12riES6Xg
         1K5Ffpueh5Zx83Zw32ch9xBD88wOFvagmuzxMpx9emi156QG3+s//qRlS/eC9VM99WOA
         RbQw==
X-Forwarded-Encrypted: i=1; AJvYcCXoWUUu4F5gtsV3fp19iuAbnlyeOqpkOv7LJAPDj8qpCipkL3hr94e/4GjGvdiZqtJYM7jyRfWSIB/0xvw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJ6lhO0O9ZlXkcq4d2vfJLLAWkvhMRNamA/kIFAkSitDshrGHv
	7bfRptdsDVXQO3YAXw6XDA9SACENOBG5iEaUgLeZo6Ki0hHnAZwjVO3hd0Nstl4PQ5vZnyfd8W2
	yvpwRwYdz3mO17L9VDnF+uM84QVTQCQTi74diz4ST9RLmgDaTSLbhSCUC5yGU8+eLRto=
X-Gm-Gg: ASbGncsxaGmbJ5s2gKPUghzr1vUT48cVc5LVowiAZGYcSDjoAZjr1jjmWHxBZ9yvK/o
	JjntOgM4+QaKZrDdcWmPH3FugH+eNeLy8nNxmKDU8HNbYCMad6pWu03i74Aln2uTi2aqVmUCiaC
	+WGT7FYL7VmgGvFO1XbDHlTJCilv0eB6M6Dv34BrwMvjmh/6/ZP3sfDco0sz7Ym/f4bnzik39aL
	ijcaQIWZHpoArl/BH8uzfykUMEvMG4MY2FHXT3/AaPvk28zHez0EVVd+3fp6qKJNHBY0pN/wkqm
	fGRvfvN+hX339A7Uhr9UxTkL3ZYEIpOyekWYD+XsbY98RLl/odG2ZvdfPqWo9RZNgpO4ITBKp0b
	FV1uAcE8bWbhVrM2XBcj7pA==
X-Received: by 2002:a5d:64c4:0:b0:428:3fbb:83ff with SMTP id ffacd0b85a97d-429aef78578mr1219006f8f.7.1761726327116;
        Wed, 29 Oct 2025 01:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs8X6v9AdbLiEHGByEnotgrsU9oWlicAMxOrrMM5Lc91LMYhE+cLjo+XntB1ZXqLb0ZQOCeg==
X-Received: by 2002:a5d:64c4:0:b0:428:3fbb:83ff with SMTP id ffacd0b85a97d-429aef78578mr1218986f8f.7.1761726326654;
        Wed, 29 Oct 2025 01:25:26 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm24944885f8f.4.2025.10.29.01.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 01:25:26 -0700 (PDT)
Message-ID: <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
Date: Wed, 29 Oct 2025 09:25:25 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Donet Tom <donettom@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PAG3fA9LtQ1M4rR8uaRTfbbAKuu3HVKABHEehNYEYHg_1761726327
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 06:49, Sourabh Jain wrote:
> Kernel is printing below warning while booting:
> 
> 
> WARNING: CPU: 0 PID: 1 at mm/hugetlb.c:4753 hugetlb_add_hstate+0xc0/0x180
> Modules linked in:
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.18.0-rc1-01400-ga297f72c4951 #6 NONE
> Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
> NIP:  c000000001370800 LR: c000000001357740 CTR: 0000000000000005
> REGS: c000000080183890 TRAP: 0700   Not tainted
> (6.18.0-rc1-01400-ga297f72c4951)
> MSR:  0000000080029002 <CE,EE,ME>  CR: 48000242  XER: 20000000
> IRQMASK: 0
> GPR00: c000000001357740 c000000080183b30 c000000001352000 000000000000000e
> GPR04: c0000000011d1c4f 0000000000000002 000000000000001a 0000000000000000
> GPR08: 0000000000000000 0000000000000002 0000000000000001 0000000000000005
> GPR12: c0000000013576a4 c0000000015ad000 c00000000000210c 0000000000000000
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR24: 0000000000000000 c0000000015876e8 0000000000000002 c000000001587500
> GPR28: c000000001587578 000000000000000e 0000000004000000 0000000000000170
> NIP [c000000001370800] hugetlb_add_hstate+0xc0/0x180
> LR [c000000001357740] hugetlbpage_init+0x9c/0xf0
> Call Trace:
> hugetlb_add_hstate+0x148/0x180 (unreliable)
> hugetlbpage_init+0x9c/0xf0
> do_one_initcall+0x84/0x308
> kernel_init_freeable+0x2e4/0x380
> kernel_init+0x30/0x15c
> ret_from_kernel_user_thread+0x14/0x1c
> 
> Kernel commit causing these warning:
> commit 7b4f21f5e0386dfe02c68c009294d8f26e3c1bad (HEAD)
> Author: David Hildenbrand <david@redhat.com>
> Date:   Mon Sep 1 17:03:29 2025 +0200
> 
>       mm/hugetlb: check for unreasonable folio sizes when registering hstate
> 
>       Let's check that no hstate that corresponds to an unreasonable
> folio size
>       is registered by an architecture.  If we were to succeed
> registering, we
>       could later try allocating an unsupported gigantic folio size.
> 
> ...
> 
>           BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
> +       WARN_ON(order > MAX_FOLIO_ORDER);
>           h = &hstates[hugetlb_max_hstate++];
> 
> snip...
> 
> 
> Command to create kernel config:
> make ARCH=powerpc corenet64_smp_defconfig
> 
> Qemu command:
> qemu-system-ppc64 -nographic -vga none -M ppce500 -smp 2 -m 4G -accel
> tcg -kernel ./vmlinux -nic user -initrd ./ppc64-novsx-rootfs.cpio.gz
> -cpu e5500 -append "noreboot"
> 
> 
> Root cause:
> The MAX_FOLIO_ORDER  for e500 platform is MAX_PAGE_ORDER which is
> nothing but CONFIG_ARCH_FORCE_MAX_ORDER which dependent of page-size
> which was 4k. So value of MAX_FOLIO_ODER is 12 for this case.
> 
> As per arch/powerpc/mm/nohash/tlb.c the following page size are supported on
> e500 platform:
> 
> struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
>       [MMU_PAGE_4K] = {
>           .shift    = 12,
>       },
>       [MMU_PAGE_2M] = {
>           .shift    = 21,
>       },
>       [MMU_PAGE_4M] = {
>           .shift    = 22,
>       },
>       [MMU_PAGE_16M] = {
>           .shift    = 24,
>       },
>       [MMU_PAGE_64M] = {
>           .shift    = 26,
>       },
>       [MMU_PAGE_256M] = {
>           .shift    = 28,
>       },
>       [MMU_PAGE_1G] = {
>           .shift    = 30,
>       },
> };
> 
> With the above MAX_FOLIO_ORDER and page sizes, hugetlbpage_init() in
> arch/powerpc/mm/hugetlbpage.c tries to call hugetlb_add_hstate() with
> an order higher than 12, causing the kernel to print the above warning.
> 
> Things I tried:
> I enabled CONFIG_ARCH_HAS_GIGANTIC_PAGE for the e500 platform. With that,
> MAX_FOLIO_ORDER was set to 16, but that was not sufficient for MMU_PAGE_1G.
> 
> This is because with CONFIG_ARCH_HAS_GIGANTIC_PAGE enabled,
> MAX_FOLIO_ORDER was set to 16 = PUD_ORDER = (PMD_INDEX_SIZE (7) +
> PTE_INDEX_SIZE (9)),
> while the order for MMU_PAGE_1G was 18.

Yes, we discussed that in [1].

We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase 
MAX_FOLIO_ORDER, because apparently, there might be ppc configs that 
have even larger hugetlb sizes than PUDs.

@Cristophe, I was under the impression that you would send a fix. Do you 
want me to prepare something and send it out?

[1] 
https://lkml.kernel.org/r/4632e721-0ac8-4d72-a8ed-e6c928eee94d@csgroup.eu

-- 
Cheers

David / dhildenb


