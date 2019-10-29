Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CA6E865A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 12:11:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472TRx2H0gzF1fB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472TNd2TpKzF31p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 22:08:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="IPydV/NQ"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 472TNc1G7Cz9sPK;
 Tue, 29 Oct 2019 22:08:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572347328;
 bh=ImuRXjBsYWVWmnxVaI0y5MD28qwUEaJ32j/QLV2XPRE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IPydV/NQaRxJBz0m8mIMHg25oNlZ2bavI2nAem/pwamkEUtPpHhEsqu+zu8d/eKvB
 2TS+Uh1FvRSWTL4qy2fGXJS0iU3hPHz7ok7pDY8BMuzCgaiqsJ9IfJTs3qnQv8Jf1I
 kEithUjbiExG2F/cHP18XlPEs2Y+JZ1+tq8BLzWIeS3vnbtBmoGEDpqNhVYz+1shKa
 KvGIe0oafB6ShGVANfYaGaEQ2CqChb0d+6TbC9UZDTgKWvVqniqBF5ozpYQqmHUfLn
 hcNu6uI8RVtYziTBr0HUGt2D2HrdtjMRN9G3WxmqupmwF1LI+LaRz+67BUeBCjkJHc
 i46+oGMItkRqA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerepc/book3s64/hash: Align start address correctly
 with bolt mapping
In-Reply-To: <20191028095148.22421-1-aneesh.kumar@linux.ibm.com>
References: <20191028095148.22421-1-aneesh.kumar@linux.ibm.com>
Date: Tue, 29 Oct 2019 22:08:47 +1100
Message-ID: <8736fbhkqo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Without this we can miss mapping the last page covering the end address passed
>
> BUG: Unable to handle kernel data access at 0xc001000406000000
> Faulting instruction address: 0xc000000000090790
> NIP [c000000000090790] arch_add_memory+0xc0/0x130
> LR [c000000000090744] arch_add_memory+0x74/0x130
> Call Trace:
>  arch_add_memory+0x74/0x130 (unreliable)
>  memremap_pages+0x74c/0xa30
>  devm_memremap_pages+0x3c/0xa0
>  pmem_attach_disk+0x188/0x770
>  nvdimm_bus_probe+0xd8/0x470
>  really_probe+0x148/0x570
>  driver_probe_device+0x19c/0x1d0
>  device_driver_attach+0xcc/0x100
>  bind_store+0x134/0x1c0
>  drv_attr_store+0x44/0x60
>  sysfs_kf_write+0x74/0xc0
>  kernfs_fop_write+0x1b4/0x290
>  __vfs_write+0x3c/0x70
>  vfs_write+0xd0/0x260
>  ksys_write+0xdc/0x130
>  system_call+0x5c/0x68
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Presumably you want this backported to kernels that have any nvdimm
support on powerpc?

cheers

> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 6c123760164e..f66a1c6922d6 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -257,8 +257,10 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
>  	DBG("htab_bolt_mapping(%lx..%lx -> %lx (%lx,%d,%d)\n",
>  	    vstart, vend, pstart, prot, psize, ssize);
>  
> -	for (vaddr = vstart, paddr = pstart; vaddr < vend;
> -	     vaddr += step, paddr += step) {
> +	vaddr = ALIGN_DOWN(vstart, step);
> +	paddr = ALIGN_DOWN(pstart, step);
> +
> +	for (; vaddr < vend; vaddr += step, paddr += step) {
>  		unsigned long hash, hpteg;
>  		unsigned long vsid = get_kernel_vsid(vaddr, ssize);
>  		unsigned long vpn  = hpt_vpn(vaddr, vsid, ssize);
> -- 
> 2.21.0
