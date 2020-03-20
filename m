Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067218C981
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:07:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kHwV3PZrzDvHl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 20:07:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.49.171; helo=4.mo178.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 991 seconds by postgrey-1.36 at bilbo;
 Fri, 20 Mar 2020 19:59:57 AEDT
Received: from 4.mo178.mail-out.ovh.net (4.mo178.mail-out.ovh.net
 [46.105.49.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHlx44vGzDrNp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:59:55 +1100 (AEDT)
Received: from player168.ha.ovh.net (unknown [10.110.171.117])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 9A9E196180
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 09:43:17 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id E53BB109753FC;
 Fri, 20 Mar 2020 08:43:12 +0000 (UTC)
Date: Fri, 20 Mar 2020 09:43:03 +0100
From: Greg Kurz <groug@kaod.org>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Skip kvmppc_uvmem_free if
 Ultravisor is not supported
Message-ID: <20200320094303.26143598@bahia.lan>
In-Reply-To: <20200319225510.945603-1-farosas@linux.ibm.com>
References: <20200319225510.945603-1-farosas@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9377901800952142130
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegtddguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudeikedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Mar 2020 19:55:10 -0300
Fabiano Rosas <farosas@linux.ibm.com> wrote:

> kvmppc_uvmem_init checks for Ultravisor support and returns early if
> it is not present. Calling kvmppc_uvmem_free at module exit will cause
> an Oops:
> 
> $ modprobe -r kvm-hv
> 
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   <snip>
>   NIP:  c000000000789e90 LR: c000000000789e8c CTR: c000000000401030
>   REGS: c000003fa7bab9a0 TRAP: 0300   Not tainted  (5.6.0-rc6-00033-g6c90b86a745a-dirty)
>   MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24002282  XER: 00000000
>   CFAR: c000000000dae880 DAR: 0000000000000008 DSISR: 40000000 IRQMASK: 1
>   GPR00: c000000000789e8c c000003fa7babc30 c0000000016fe500 0000000000000000
>   GPR04: 0000000000000000 0000000000000006 0000000000000000 c000003faf205c00
>   GPR08: 0000000000000000 0000000000000001 000000008000002d c00800000ddde140
>   GPR12: c000000000401030 c000003ffffd9080 0000000000000001 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 000000013aad0074 000000013aaac978
>   GPR20: 000000013aad0070 0000000000000000 00007fffd1b37158 0000000000000000
>   GPR24: 000000014fef0d58 0000000000000000 000000014fef0cf0 0000000000000001
>   GPR28: 0000000000000000 0000000000000000 c0000000018b2a60 0000000000000000
>   NIP [c000000000789e90] percpu_ref_kill_and_confirm+0x40/0x170
>   LR [c000000000789e8c] percpu_ref_kill_and_confirm+0x3c/0x170
>   Call Trace:
>   [c000003fa7babc30] [c000003faf2064d4] 0xc000003faf2064d4 (unreliable)
>   [c000003fa7babcb0] [c000000000400e8c] dev_pagemap_kill+0x6c/0x80
>   [c000003fa7babcd0] [c000000000401064] memunmap_pages+0x34/0x2f0
>   [c000003fa7babd50] [c00800000dddd548] kvmppc_uvmem_free+0x30/0x80 [kvm_hv]
>   [c000003fa7babd80] [c00800000ddcef18] kvmppc_book3s_exit_hv+0x20/0x78 [kvm_hv]
>   [c000003fa7babda0] [c0000000002084d0] sys_delete_module+0x1d0/0x2c0
>   [c000003fa7babe20] [c00000000000b9d0] system_call+0x5c/0x68
>   Instruction dump:
>   3fc2001b fb81ffe0 fba1ffe8 fbe1fff8 7c7f1b78 7c9c2378 3bde4560 7fc3f378
>   f8010010 f821ff81 486249a1 60000000 <e93f0008> 7c7d1b78 712a0002 40820084
>   ---[ end trace 5774ef4dc2c98279 ]---
> 
> So this patch checks if kvmppc_uvmem_init actually allocated anything
> before running kvmppc_uvmem_free.
> 
> Fixes: ca9f4942670c ("KVM: PPC: Book3S HV: Support for running secure guests")
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

Thanks for the quick fix :)

Tested-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/kvm/book3s_hv_uvmem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 79b1202b1c62..9d26614b2a77 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -806,6 +806,9 @@ int kvmppc_uvmem_init(void)
>  
>  void kvmppc_uvmem_free(void)
>  {
> +	if (!kvmppc_uvmem_bitmap)
> +		return;
> +
>  	memunmap_pages(&kvmppc_uvmem_pgmap);
>  	release_mem_region(kvmppc_uvmem_pgmap.res.start,
>  			   resource_size(&kvmppc_uvmem_pgmap.res));

