Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C255899D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 21:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTWK6006wz3chC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 05:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4670 seconds by postgrey-1.36 at boromir; Fri, 24 Jun 2022 05:58:10 AEST
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net [188.165.49.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTWJf0yz8z3brm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 05:58:06 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 63A6526EE9;
	Thu, 23 Jun 2022 18:40:11 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 20:40:10 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-99G0032e11886d-8812-4608-9b84-ef78a0ab74e3,
                    1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bb0fc1be-2285-7090-4458-276dfb4d80c8@kaod.org>
Date: Thu, 23 Jun 2022 20:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/xive/spapr: correct bitmap allocation size
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20220623182509.3985625-1-nathanl@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220623182509.3985625-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fdd15833-a291-4ffb-93f1-73abd297c068
X-Ovh-Tracer-Id: 12937434356735314909
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedguddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghulhhushesshgrmhgsrgdrohhrghdpoffvtefjohhsthepmhhoheehvd
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
Cc: paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/23/22 20:25, Nathan Lynch wrote:
> kasan detects access beyond the end of the xibm->bitmap allocation:
> 
> BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0x40/0x140
> Read of size 8 at addr c00000001d1d0118 by task swapper/0/1
> 
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc2-00001-g90df023b36dd #28
> Call Trace:
> [c00000001d98f770] [c0000000012baab8] dump_stack_lvl+0xac/0x108 (unreliable)
> [c00000001d98f7b0] [c00000000068faac] print_report+0x37c/0x710
> [c00000001d98f880] [c0000000006902c0] kasan_report+0x110/0x354
> [c00000001d98f950] [c000000000692324] __asan_load8+0xa4/0xe0
> [c00000001d98f970] [c0000000011c6ed0] _find_first_zero_bit+0x40/0x140
> [c00000001d98f9b0] [c0000000000dbfbc] xive_spapr_get_ipi+0xcc/0x260
> [c00000001d98fa70] [c0000000000d6d28] xive_setup_cpu_ipi+0x1e8/0x450
> [c00000001d98fb30] [c000000004032a20] pSeries_smp_probe+0x5c/0x118
> [c00000001d98fb60] [c000000004018b44] smp_prepare_cpus+0x944/0x9ac
> [c00000001d98fc90] [c000000004009f9c] kernel_init_freeable+0x2d4/0x640
> [c00000001d98fd90] [c0000000000131e8] kernel_init+0x28/0x1d0
> [c00000001d98fe10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64
> 
> Allocated by task 0:
>   kasan_save_stack+0x34/0x70
>   __kasan_kmalloc+0xb4/0xf0
>   __kmalloc+0x268/0x540
>   xive_spapr_init+0x4d0/0x77c
>   pseries_init_irq+0x40/0x27c
>   init_IRQ+0x44/0x84
>   start_kernel+0x2a4/0x538
>   start_here_common+0x1c/0x20
> 
> The buggy address belongs to the object at c00000001d1d0118
>   which belongs to the cache kmalloc-8 of size 8
> The buggy address is located 0 bytes inside of
>   8-byte region [c00000001d1d0118, c00000001d1d0120)
> 
> The buggy address belongs to the physical page:
> page:c00c000000074740 refcount:1 mapcount:0 mapping:0000000000000000 index:0xc00000001d1d0558 pfn:0x1d1d
> flags: 0x7ffff000000200(slab|node=0|zone=0|lastcpupid=0x7ffff)
> raw: 007ffff000000200 c00000001d0003c8 c00000001d0003c8 c00000001d010480
> raw: c00000001d1d0558 0000000001e1000a 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   c00000001d1d0000: fc 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   c00000001d1d0080: fc fc 00 fc fc fc fc fc fc fc fc fc fc fc fc fc
>> c00000001d1d0100: fc fc fc 02 fc fc fc fc fc fc fc fc fc fc fc fc
>                              ^
>   c00000001d1d0180: fc fc fc fc 04 fc fc fc fc fc fc fc fc fc fc fc
>   c00000001d1d0200: fc fc fc fc fc 04 fc fc fc fc fc fc fc fc fc fc
> 
> This happens because the allocation uses the wrong unit (bits) when it
> should pass (BITS_TO_LONGS(count) * sizeof(long)) or equivalent. With small
> numbers of bits, the allocated object can be smaller than sizeof(long),
> which results in invalid accesses.
> 
> Use bitmap_zalloc() to allocate and initialize the irq bitmap, paired with
> bitmap_free() for consistency.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   arch/powerpc/sysdev/xive/spapr.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index 7d5128676e83..d02911e78cfc 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -15,6 +15,7 @@
>   #include <linux/of_fdt.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> +#include <linux/bitmap.h>
>   #include <linux/cpumask.h>
>   #include <linux/mm.h>
>   #include <linux/delay.h>
> @@ -57,7 +58,7 @@ static int __init xive_irq_bitmap_add(int base, int count)
>   	spin_lock_init(&xibm->lock);
>   	xibm->base = base;
>   	xibm->count = count;
> -	xibm->bitmap = kzalloc(xibm->count, GFP_KERNEL);
> +	xibm->bitmap = bitmap_zalloc(xibm->count, GFP_KERNEL);
>   	if (!xibm->bitmap) {
>   		kfree(xibm);
>   		return -ENOMEM;
> @@ -75,7 +76,7 @@ static void xive_irq_bitmap_remove_all(void)
>   
>   	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
>   		list_del(&xibm->list);
> -		kfree(xibm->bitmap);
> +		bitmap_free(xibm->bitmap);
>   		kfree(xibm);
>   	}
>   }

