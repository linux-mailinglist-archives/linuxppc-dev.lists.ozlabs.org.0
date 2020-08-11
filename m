Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E524241E6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 18:38:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQz6c375LzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 02:38:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.76.210; helo=huawei.com;
 envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQyzc659SzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 02:32:25 +1000 (AEST)
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 32B4919F89EF9A6C1C68;
 Tue, 11 Aug 2020 17:32:19 +0100 (IST)
Received: from localhost (10.227.96.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 11 Aug
 2020 17:32:18 +0100
Date: Tue, 11 Aug 2020 17:32:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/8] huge vmalloc mappings
Message-ID: <20200811173217.0000161e@huawei.com>
In-Reply-To: <20200810022732.1150009-1-npiggin@gmail.com>
References: <20200810022732.1150009-1-npiggin@gmail.com>
Organization: Huawei tech. R&D (UK)  Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.227.96.57]
X-ClientProxiedBy: lhreml728-chm.china.huawei.com (10.201.108.79) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Aug 2020 12:27:24 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> Not tested on x86 or arm64, would appreciate a quick test there so I can
> ask Andrew to put it in -mm. Other option is I can disable huge vmallocs
> for them for the time being.

Hi Nicholas,

For arm64 testing with a Kunpeng920.

I ran a quick sanity test with this series on top of mainline (yes mid merge window
so who knows what state is...).  Could I be missing some dependency?

Without them it boots, with them it doesn't.  Any immediate guesses?

[    0.069507] Dentry cache hash table entries: 33554432 (order: 16, 268435456 bytes, vmalloc)                                                               
[    0.087134] Inode-cache hash table entries: 16777216 (order: 15, 134217728 bytes, vmalloc)                                                                
[    0.097044] Mount-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc)                                                                    
[    0.106534] Mountpoint-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc)
[    0.116349] ------------[ cut here ]------------   
[    0.121465] kernel BUG at kernel/fork.c:402!
[    0.126194] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[    0.132273] Modules linked in:
[    0.135653] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.8.0-12307-g2b197e00c338 #637
[    0.144240] pstate: 20000009 (nzCv daif -PAN -UAO BTYPE=--)
[    0.150420] pc : copy_process+0x10c0/0x1690
[    0.155049] lr : copy_process+0x2e0/0x1690
[    0.159584] sp : ffffd96c55773d60
[    0.163250] x29: ffffd96c55773d70 x28: ffff20bf87060000
[    0.169134] x27: 0000000000800300 x26: 00000000ffffffff
[    0.175018] x25: ffff8000108a8000 x24: ffffd96c55a32708
[    0.180901] x23: ffff20bf87043800 x22: 0000000000000000
[    0.186787] x21: 0000000000000000 x20: ffffd96c55773ef0
[    0.192672] x19: ffffd96c55783bc0 x18: 0000000000000010
[    0.198557] x17: 00000000855c858e x16: 00000000a8256fca
[    0.204441] x15: ffffffffffffffff x14: ffff000000000000
[    0.210327] x13: ffff800010901000 x12: ffff8000108b1000
[    0.216212] x11: 0000000000000001 x10: ffffd96c55a6d000
[    0.222096] x9 : ffffd96c53bf7594 x8 : 0000000000000041
[    0.227980] x7 : ffff004fffffa6b0 x6 : ffff800010aa8000
[    0.233864] x5 : 000000000000fffd x4 : 0000000000000000
[    0.239748] x3 : ffffd96c55a63598 x2 : 0000000000000001
[    0.245632] x1 : ffffd96c55783bc0 x0 : 0000000000000008
[    0.251519] Call trace:
[    0.254221]  copy_process+0x10c0/0x1690
[    0.258466]  _do_fork+0x98/0x488
[    0.262036]  kernel_thread+0x6c/0x90
[    0.265997]  rest_init+0x38/0xf0
[    0.269568]  arch_call_rest_init+0x18/0x24
[    0.274105]  start_kernel+0x60c/0x644
[    0.278159] Code: f000a441 f943f421 cb010000 17ffffe1 (d4210000)
[    0.284961] ---[ end trace 985361e2cb97a0d9 ]---
[    0.290073] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.297532] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

Thanks,

Jonathan


> 
> Since v2:
> - Rebased on vmalloc cleanups, split series into simpler pieces.
> - Fixed several compile errors and warnings
> - Keep the page array and accounting in small page units because
>   struct vm_struct is an interface (this should fix x86 vmap stack debug
>   assert). [Thanks Zefan]
> 
> Nicholas Piggin (8):
>   mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
>   mm: apply_to_pte_range warn and fail if a large pte is encountered
>   mm/vmalloc: rename vmap_*_range vmap_pages_*_range
>   lib/ioremap: rename ioremap_*_range to vmap_*_range
>   mm: HUGE_VMAP arch support cleanup
>   mm: Move vmap_range from lib/ioremap.c to mm/vmalloc.c
>   mm/vmalloc: add vmap_range_noflush variant
>   mm/vmalloc: Hugepage vmalloc mappings
> 
>  .../admin-guide/kernel-parameters.txt         |   2 +
>  arch/arm64/mm/mmu.c                           |  10 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c      |   8 +-
>  arch/x86/mm/ioremap.c                         |  10 +-
>  include/linux/io.h                            |   9 -
>  include/linux/vmalloc.h                       |  13 +
>  init/main.c                                   |   1 -
>  mm/ioremap.c                                  | 231 +--------
>  mm/memory.c                                   |  60 ++-
>  mm/vmalloc.c                                  | 442 +++++++++++++++---
>  10 files changed, 453 insertions(+), 333 deletions(-)
> 

