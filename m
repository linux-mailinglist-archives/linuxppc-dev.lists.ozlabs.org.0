Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4055FF5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 14:15:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY0lc1wnMz3dy7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:15:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0kt1k7Qz3bmM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 22:14:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LY0km363Dz4xZ8;
	Wed, 29 Jun 2022 22:14:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220629050925.31447-1-aneesh.kumar@linux.ibm.com>
References: <20220629050925.31447-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/memhotplug: Add add_pages override for PPC
Message-Id: <165650485099.3003821.15747455933782484777.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 22:14:10 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jun 2022 10:39:25 +0530, Aneesh Kumar K.V wrote:
> With commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> the kernel now validate the addr against high_memory value. This results
> in the below BUG_ON with dax pfns.
> 
> [  635.798741][T26531] kernel BUG at mm/page_alloc.c:5521!
> 1:mon> e
> cpu 0x1: Vector: 700 (Program Check) at [c000000007287630]
>     pc: c00000000055ed48: free_pages.part.0+0x48/0x110
>     lr: c00000000053ca70: tlb_finish_mmu+0x80/0xd0
>     sp: c0000000072878d0
>    msr: 800000000282b033
>   current = 0xc00000000afabe00
>   paca    = 0xc00000037ffff300   irqmask: 0x03   irq_happened: 0x05
>     pid   = 26531, comm = 50-landscape-sy
> kernel BUG at :5521!
> Linux version 5.19.0-rc3-14659-g4ec05be7c2e1 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #625 SMP Thu Jun 23 00:35:43 CDT 2022
> 1:mon> t
> [link register   ] c00000000053ca70 tlb_finish_mmu+0x80/0xd0
> [c0000000072878d0] c00000000053ca54 tlb_finish_mmu+0x64/0xd0 (unreliable)
> [c000000007287900] c000000000539424 exit_mmap+0xe4/0x2a0
> [c0000000072879e0] c00000000019fc1c mmput+0xcc/0x210
> [c000000007287a20] c000000000629230 begin_new_exec+0x5e0/0xf40
> [c000000007287ae0] c00000000070b3cc load_elf_binary+0x3ac/0x1e00
> [c000000007287c10] c000000000627af0 bprm_execve+0x3b0/0xaf0
> [c000000007287cd0] c000000000628414 do_execveat_common.isra.0+0x1e4/0x310
> [c000000007287d80] c00000000062858c sys_execve+0x4c/0x60
> [c000000007287db0] c00000000002c1b0 system_call_exception+0x160/0x2c0
> [c000000007287e10] c00000000000c53c system_call_common+0xec/0x250
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/memhotplug: Add add_pages override for PPC
      https://git.kernel.org/powerpc/c/ac790d09885d36143076e7e02825c541e8eee899

cheers
