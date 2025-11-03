Return-Path: <linuxppc-dev+bounces-13686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167DC2A061
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 05:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0JMq6wx2z30RT;
	Mon,  3 Nov 2025 15:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762143751;
	cv=none; b=IXG23lk2rleAAc+zJRlPOvnEIkQxEaVchrc5s/rc25Vxefm+7VBJMKQRylxHk82t+dwnyqQ7b1iFXGaNJ82/CAVZwtyCmULur2Yys/ybrKQpeP5Q/QqX2wUDZG7ulY9J3JeIigDG90DMPzdapdmjNGnkaOgzlX0g11ijP3XFZhYfGXaXmMmOfEayeuA7ki+2D9TlgvYms0gb4nBO8bDu9boR/jCCGGOlQeM49Cmr9ukMJvQ7ev75UNf+GdK1H68jwGnCqOH02UynPj4spLFyN6iaf+QZl1uyL8qZ1z/9zp3Oy6EAIfgisURp65sHcIGWpzcOrTYE6nFb7oZNxAhvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762143751; c=relaxed/relaxed;
	bh=GtX4Zx8eYkEUaLjJAs2y91CkJ8ZJkcph2iUxsNSff9w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=G50DO7PUGF4cTnbwB5uWNsGDPWzgWhcr7vPaEnzQrHTP8kkNkZ6RpslaHo/WQdXbYggioOE6vVfGogZzGOmuEqph0Qq9AwLeCl9b25pOGDisHJE/67DosIdWhXoosMMCNihg4qUcyjGAY2FU55i7MKW3qCOmG2L3X6umtnQh5XVRTyK7DTglrs6YBni4ll4vOXyXMnxhi1gKT9hxQ0G6n1VvPLy13RF6rTTfIp0qMb+qQnBp6HIi+xNZ8MKAlNiQGWIYjVknPDUsBRV/Zon0kvpS8Rv6h4V1dvJaYcQnkBAN0I6WswJhaFaE7c/pAaKFyn4eHcysXDosBHZkjMQ2xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R3HV/F/Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R3HV/F/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0JMp1wBNz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 15:22:29 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-781997d195aso2910249b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Nov 2025 20:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762143746; x=1762748546; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GtX4Zx8eYkEUaLjJAs2y91CkJ8ZJkcph2iUxsNSff9w=;
        b=R3HV/F/YExgYkjUC6RIDv2TPxaexr7jodf2WaABh9Lflli76PCQVSjZF6svWU7FTOX
         A1OuvSpAyzDuP32rryWrw43QheJ/V9D5Vs9/7wO8/0n9+uSZD9/nZ2RGN+qR/0oJmM6e
         g21Rt842iHF7SmNgV1byB1R9KE/sw6YkElNow9hqjt2Cl9s9Oy+5avlCy5CgK3e1Cug6
         HZ5t1ajtccrZj3xtEGXH8dCopxlRKOp+f9e0OTH6oaNxYGpHdOPKXsVd65urYdcHQLUs
         +lzRBkTy/cObD/KlIH5+GdfpiuHBy8eG+/5UFplPqFsl2QVisSIvwUjgjmqDzQqcuiTd
         jk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762143746; x=1762748546;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtX4Zx8eYkEUaLjJAs2y91CkJ8ZJkcph2iUxsNSff9w=;
        b=i4Qoiqlex6reHWg5CLG0Lnm7DuyD0B92ZuQ5QUVUiHrEBjx65qH/oj4Ra5XGSGkTjZ
         PeDB18RiebzUUPhe+lTJmZVnHV9VL4xR+bvH3WyCGtd/ti4tqjVH0sdAJFj8E7kXUj6n
         EqnGkKYify6WCy/Zoxwm0JjqSGbqxyhVos7ZRGhJC8fyO4mwtZUFLyLp4mBm8pLrNeu6
         6YZzTt1d0B9gxPj03Tt6ZCGAHl/6dKC2C+HCHDmcG7i9xY8gnHM6ey7Z3cXMGhFl4Yz/
         78TdLdcASpS1F5ovgAY29Co5yx6fIsq5lsDqyl8vpD3ug2o3gJrQd5c5GTvk79ns7ybw
         4snQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbHT2wD5qozI7m99EUbFkS8TvGKAHxsioz7+mBYChqgdctfIwHZvJmUwhqp3idXFXzNW4WkNqOa5cl2Y4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMwklyB2dQUbFSbbePsKd8AmZhaQ5/AwyVQkyZaoSbDAqpYjJW
	LlehqGi1kYVdFKnXzbWd4xznt+iP/x+92dVOH+eBXPs0H6T/hLhpSzWzdkl3nq76
X-Gm-Gg: ASbGncsE9mVeuj0vvaQHWlfzgYNtEyadJnIt/iHB/qMsF68qUJr/qDWec4CKFDsmWRH
	CAnturesq6UUygx4cu/E1keh8S8IPY4s83IMae2zR0AeXkWAiuT7xBmv4M3Uw9HitYYHjdTlZnz
	qpr04zuhSmXVXZ1o0EguIFvI0T8I1dNwwQGkUCRMobF2ZvWsq1nbTXaZ1IZMZ+F5D4NP5S7McRM
	gQUXKNb30y8mrcHFkKT5KSPs8wtpNC5ZYKvINkBpbN+/zRvFp1KVHBqwxmFJIlOhWUVe6HByaLN
	bZPmNeof5Kcs0B0l1Mnu/vICfX/vSkzpgIrQ7Ek0VzHat6z7JTI/x4gyBRv5XFZrTGn3M6eQHHC
	ginmstlwTHf6PT7dtxbUBlHllKW9Fim3HI2MkIZj4l+ZCSDf0b0e3s4fiILON5BTFcY0GKpzaMd
	iPxYms
X-Google-Smtp-Source: AGHT+IHW+th9vAZAQ8TsYm1Rlv2J9GsVInIpUlNn9Og+2NadtO3eVDznXrvxM3q5o+d1XL7VWWCEvQ==
X-Received: by 2002:a05:6300:210c:b0:334:8f45:8e99 with SMTP id adf61e73a8af0-348cc8e36a5mr14520233637.35.1762143746195;
        Sun, 02 Nov 2025 20:22:26 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3409288c7ebsm9357224a91.6.2025.11.02.20.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 20:22:25 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/02] scripts/gdb/mm: Add support for powerpc book3s64
In-Reply-To: <6f931a16-6d62-4002-938b-bd366715f602@siemens.com>
Date: Mon, 03 Nov 2025 09:49:16 +0530
Message-ID: <871pmf694r.ritesh.list@gmail.com>
References: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com> <9da03d8e78cd895666deb1aec7ec8318833f1b6a.1756521755.git.ritesh.list@gmail.com> <6f931a16-6d62-4002-938b-bd366715f602@siemens.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Jan Kiszka <jan.kiszka@siemens.com> writes:

> On 30.08.25 05:45, Ritesh Harjani (IBM) wrote:
>> This adds page ops support to powerpc book3s64. Following operations are
>> now supported:
>> 
>> lx-pfn_to_kaddr -- PFN to kernel address
>> lx-pfn_to_page -- PFN to struct page
>> lx-page_address -- struct page to linear mapping address
>> lx-page_to_pfn -- struct page to PFN
>> lx-page_to_phys -- struct page to physical address
>> lx-virt_to_page -- virtual address to struct page
>> lx-virt_to_phys -- virtual address to physical address
>> 
>> lx-vmallocinfo -- Show vmallocinfo
>> lx-slabinfo -- Show slabinfo
>> 
>> e.g. Below showing lx-mmu_info command i.e.
>> On Radix:
>> (gdb) lx-mmu_info
>> MMU: Radix
>> 
>> On Hash:
>> (gdb) lx-mmu_info
>> MMU: Hash
>> 
>> e.g. Below shows that struct page pointers coming from vmemmap area i.e.
>> (gdb) p vmemmap
>> $5 = (struct page *) 0xc00c000000000000
>> 
>> (gdb) lx-pfn_to_page 0
>> pfn_to_page(0x0) = 0xc00c000000000000
>> 
>> (gdb) lx-pfn_to_page 1
>> pfn_to_page(0x0) = 0xc00c000000000040
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>  scripts/gdb/linux/constants.py.in |   4 ++
>>  scripts/gdb/linux/mm.py           | 114 +++++++++++++++++++++++++++++-
>>  2 files changed, 116 insertions(+), 2 deletions(-)
>> 
>> diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
>> index 154db10fe94a..97a731db6e89 100644
>> --- a/scripts/gdb/linux/constants.py.in
>> +++ b/scripts/gdb/linux/constants.py.in
>> @@ -153,6 +153,10 @@ if IS_BUILTIN(CONFIG_ARM64):
>>      LX_VALUE(CONFIG_PAGE_SHIFT)
>>      LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
>>  LX_CONFIG(CONFIG_PPC_BOOK3S_64)
>> +if IS_BUILTIN(CONFIG_PPC_BOOK3S_64):
>> +    LX_VALUE(CONFIG_PAGE_OFFSET)
>> +    LX_VALUE(CONFIG_PAGE_SHIFT)
>> +    LX_VALUE(CONFIG_KERNEL_START)
>>  LX_CONFIG(CONFIG_SPARSEMEM)
>>  LX_CONFIG(CONFIG_SPARSEMEM_EXTREME)
>>  LX_CONFIG(CONFIG_SPARSEMEM_VMEMMAP)
>> diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
>> index 7571aebbe650..9e5b1632f910 100644
>> --- a/scripts/gdb/linux/mm.py
>> +++ b/scripts/gdb/linux/mm.py
>> @@ -24,10 +24,17 @@ class page_ops():
>>      def __init__(self):
>>          if not constants.LX_CONFIG_SPARSEMEM_VMEMMAP:
>>              raise gdb.GdbError('Only support CONFIG_SPARSEMEM_VMEMMAP now')
>> -        if constants.LX_CONFIG_ARM64 and utils.is_target_arch('aarch64'):
>> +
>> +        if utils.is_target_arch('aarch64'):
>> +            if not constants.LX_CONFIG_ARM64:
>
> This reorders the check, pulling the dynamic part before the static one
> - why? Not that this is run on every command, but at least
> initialization could slow down by some cycles (or more...).
>

Sure that make sense Jan, 
Let me fix that up for both aarch64 and powerpc in v2.
Since it's been sometime that I have looked at these patches,
let me go over them once again before I re-spin a v2.

-ritesh

>> +                raise gdb.GdbError('ARM64 page ops require CONFIG_ARM64')
>>              self.ops = aarch64_page_ops()
>> +        elif utils.is_target_arch('powerpc'):
>> +            if not constants.LX_CONFIG_PPC_BOOK3S_64:
>> +                raise gdb.GdbError('Only supported for Book3s_64')
>> +            self.ops = powerpc64_page_ops()
>>          else:
>> -            raise gdb.GdbError('Only support aarch64 now')
>> +            raise gdb.GdbError('Unsupported arch for page ops')
>> 
>>  class aarch64_page_ops():
>>      def __init__(self):
>> @@ -287,6 +294,109 @@ class aarch64_page_ops():
>>      def folio_address(self, folio):
>>          return self.page_address(folio['page'].address)
>> 
>> +
>> +class powerpc64_page_ops():
>> +    """powerpc64 minimal Virtual Memory operations
>> +    """
>> +
>> +    def __init__(self):
>> +        vmemmap_sym = gdb.parse_and_eval('vmemmap')
>> +        self.vmemmap = vmemmap_sym.cast(utils.get_page_type().pointer())
>> +
>> +        self.PAGE_SHIFT = constants.LX_CONFIG_PAGE_SHIFT
>> +        self.PAGE_OFFSET = constants.LX_CONFIG_PAGE_OFFSET
>> +        self.KERNEL_START = constants.LX_CONFIG_KERNEL_START
>> +
>> +        # These variables are common for both Hash and Radix so no
>> +        # need to explicitely check for MMU mode.
>> +        self.KERNEL_VIRT_START = gdb.parse_and_eval("__kernel_virt_start")
>> +        self.VMALLOC_START = gdb.parse_and_eval("__vmalloc_start")
>> +        self.VMALLOC_END = gdb.parse_and_eval("__vmalloc_end")
>> +        self.KERNEL_IO_START = gdb.parse_and_eval("__kernel_io_start")
>> +        self.KERNEL_IO_END = gdb.parse_and_eval("__kernel_io_end")
>> +        # KERN_MAP_SIZE can be calculated from below trick to avoid
>> +        # checking Hash 4k/64k pagesize
>> +        self.KERN_MAP_SIZE = self.KERNEL_IO_END - self.KERNEL_IO_START
>> +        self.VMEMMAP_START = gdb.parse_and_eval("vmemmap")
>> +        self.VMEMMAP_SIZE = self.KERN_MAP_SIZE
>> +        self.VMEMMAP_END = self.VMEMMAP_START + self.VMEMMAP_SIZE
>> +
>> +        if constants.LX_CONFIG_NUMA and constants.LX_CONFIG_NODES_SHIFT:
>> +            self.NODE_SHIFT = constants.LX_CONFIG_NODES_SHIFT
>> +        else:
>> +            self.NODE_SHIFT = 0
>> +        self.MAX_NUMNODES = 1 << self.NODE_SHIFT
>> +
>> +    def PFN_PHYS(self, pfn):
>> +        return pfn << self.PAGE_SHIFT
>> +
>> +    def PHYS_PFN(self, pfn):
>> +        return pfn >> self.PAGE_SHIFT
>> +
>> +    def __va(self, pa):
>> +        return pa | self.PAGE_OFFSET
>> +
>> +    def __pa(self, va):
>> +        return va & 0x0fffffffffffffff;
>> +
>> +    def pfn_to_page(self, pfn):
>> +        return (self.vmemmap + int(pfn)).cast(utils.get_page_type().pointer())
>> +
>> +    def page_to_pfn(self, page):
>> +        pagep = page.cast(utils.get_page_type().pointer())
>> +        return int(pagep - self.vmemmap)
>> +
>> +    def page_address(self, page):
>> +        pfn = self.page_to_pfn(page)
>> +        va = self.PAGE_OFFSET + (pfn << self.PAGE_SHIFT)
>> +        return va
>> +
>> +    def page_to_phys(self, page):
>> +        pfn = self.page_to_pfn(page)
>> +        return self.PFN_PHYS(pfn)
>> +
>> +    def phys_to_page(self, pa):
>> +        pfn = self.PHYS_PFN(pa)
>> +        return self.pfn_to_page(pfn)
>> +
>> +    def phys_to_virt(self, pa):
>> +        return self.__va(pa)
>> +
>> +    def virt_to_phys(self, va):
>> +        return self.__pa(va)
>> +
>> +    def virt_to_pfn(self, va):
>> +        return self.__pa(va) >> self.PAGE_SHIFT
>> +
>> +    def virt_to_page(self, va):
>> +        return self.pfn_to_page(self.virt_to_pfn(va))
>> +
>> +    def pfn_to_kaddr(self, pfn):
>> +        return self.__va(pfn << self.PAGE_SHIFT)
>> +
>> +    # powerpc does not use tags for KASAN. So simply return addr
>> +    def kasan_reset_tag(self, addr):
>> +        return addr
>> +
>> +class LxMmuInfo(gdb.Command):
>> +    """MMU Type for PowerPC Book3s64"""
>> +
>> +    def __init__(self):
>> +        super(LxMmuInfo, self).__init__("lx-mmu_info", gdb.COMMAND_USER)
>> +
>> +    def invoke(self, arg, from_tty):
>> +        if not constants.LX_CONFIG_PPC_BOOK3S_64:
>> +            raise gdb.GdbError("Only supported for Book3s_64")
>> +
>> +        lpcr = gdb.parse_and_eval("(unsigned long)$lpcr")
>> +        # Host Radix bit should be 1 in LPCR for Radix MMU
>> +        if (lpcr & 0x0000000000100000):
>> +            gdb.write("MMU: Radix\n")
>> +        else:
>> +            gdb.write("MMU: Hash\n")
>> +
>> +LxMmuInfo()
>> +
>>  class LxPFN2Page(gdb.Command):
>>      """PFN to struct page"""
>> 
>> --
>> 2.50.1
>> 
>
> Rest (including patch 1) looks good to me, though not looking deep into
> the architectural bits.
>
> Jan
>
> PS: Sorry for the late feedback.
>
> -- 
> Siemens AG, Foundational Technologies
> Linux Expert Center

