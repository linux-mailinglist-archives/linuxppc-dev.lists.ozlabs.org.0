Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DA472C8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 13:47:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCLrQ4p7Zz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 23:47:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FCYCETjA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCLqj2HLvz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 23:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FCYCETjA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JCLqg21XHz4xQs;
 Mon, 13 Dec 2021 23:46:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639399616;
 bh=W5VnYCvz7/mlHDYZbPhaQ5CNO1ZBQOxPjLpWHYJP0oo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FCYCETjAr0YAA0gTNjmpVVzSxElRjWZqAR1vlrvWLoAb7OiEpV7Mbp4Mnr7gQq4DX
 Wtz0UJAt5d7bOKGQDXQT/bHJY4mhZPa2nAYEFaeR/DAWO2NeblIfVhGCVFkklHxN4g
 JU8ToWI6dxI7oWuYorKFyadjdIAqoFQ1Sv7visIsjjFaMmAvnt4JjGoiDflRDXIJo2
 Dh03DlQSGX9PkelFfqk88s5EAdyduc8VKFJW7CSqJUbPQObr5w9RjqjtftGLAnEkMJ
 PtFUPSpkOjCetftc0sGd7fOtjnc7xTkpmBoWzd93b93LxlEz6P9sErMcB62uSXUX55
 UGXkIkz3yUahA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, John Crispin <john@phrozen.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Frank
 Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
In-Reply-To: <20211208155839.4084795-1-robh@kernel.org>
References: <20211208155839.4084795-1-robh@kernel.org>
Date: Mon, 13 Dec 2021 23:46:51 +1100
Message-ID: <87fsqwn03o.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> as libfdt provides a nicer set of APIs. Rework
> early_init_dt_scan_memory() to be called directly and use libfdt.
...
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 6e1a106f02eb..63762a3b75e8 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -532,19 +532,19 @@ static int  __init early_init_drmem_lmb(struct drmem_lmb *lmb,
>  }
>  #endif /* CONFIG_PPC_PSERIES */
>  
> -static int __init early_init_dt_scan_memory_ppc(unsigned long node,
> -						const char *uname,
> -						int depth, void *data)
> +static int __init early_init_dt_scan_memory_ppc(void)
>  {
>  #ifdef CONFIG_PPC_PSERIES
> -	if (depth == 1 &&
> -	    strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
> +	const void *fdt = initial_boot_params;
> +	int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
> +
> +	if (node > 0) {
>  		walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
>  		return 0;
>  	}
>  #endif
>  	
> -	return early_init_dt_scan_memory(node, uname, depth, data);
> +	return early_init_dt_scan_memory();
>  }
>  
>  /*
> @@ -749,7 +749,7 @@ void __init early_init_devtree(void *params)
>  
>  	/* Scan memory nodes and rebuild MEMBLOCKs */
>  	early_init_dt_scan_root();
> -	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
> +	early_init_dt_scan_memory_ppc();
>  
>  	parse_early_param();
>  
> @@ -858,7 +858,7 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
>  	 */
>  	add_mem_to_memblock = 0;
>  	early_init_dt_scan_root();
> -	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
> +	early_init_dt_scan_memory_ppc();
>  	add_mem_to_memblock = 1;
>  
>  	if (size)


This blows up one of my machines with:

  [    0.000000][    T0] printk: bootconsole [udbg0] enabled
   -> early_setup(), dt_ptr: 0x1ec90000
  [    0.000000][    T0] ------------[ cut here ]------------
  [    0.000000][    T0] kernel BUG at arch/powerpc/mm/book3s64/hash_utils.c:2117!
  [    0.000000][    T0] Oops: Exception in kernel mode, sig: 5 [#1]
  [    0.000000][    T0] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA
  [    0.000000][    T0] Modules linked in:
  [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.0-rc4-00073-g81291383ffde-dirty #69
  [    0.000000][    T0] NIP:  c0000000000924d8 LR: c000000002009764 CTR: c0000000000924d0
  [    0.000000][    T0] REGS: c000000002833bc0 TRAP: 0700   Not tainted  (5.16.0-rc4-00073-g81291383ffde-dirty)
  [    0.000000][    T0] MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 24000244  XER: 20000001
  [    0.000000][    T0] CFAR: 0000000000000730 IRQMASK: 1
  [    0.000000][    T0] GPR00: c000000002009764 c000000002833e60 c000000002834100 ffffffffffffffff
  [    0.000000][    T0] GPR04: 0000000000000000 c000000002080866 0000000000000000 0000000000000000
  [    0.000000][    T0] GPR08: c000000002080864 0000000000000001 c0000000028d4100 c000000000ffe598
  [    0.000000][    T0] GPR12: c0000000000924d0 c000000002082200 0000000000000000 0000000000000000
  [    0.000000][    T0] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  [    0.000000][    T0] GPR20: 0000000000000001 0000000010004604 0000000000000000 0000000010004bfc
  [    0.000000][    T0] GPR24: 0000000000000000 c000000000000000 0000000002970000 c00000000008a480
  [    0.000000][    T0] GPR28: c0000000028e19f8 c00000001ec90000 c000000002865af8 000000001ec90000
  [    0.000000][    T0] NIP [c0000000000924d8] hash__setup_initial_memory_limit+0x18/0x110
  [    0.000000][    T0] LR [c000000002009764] early_init_devtree+0x13c/0x4ec
  [    0.000000][    T0] Call Trace:
  [    0.000000][    T0] [c000000002833e60] [c0000000020096fc] early_init_devtree+0xd4/0x4ec (unreliable)
  [    0.000000][    T0] [c000000002833f10] [c00000000200b008] early_setup+0xc8/0x22c
  [    0.000000][    T0] [c000000002833f90] [000000000000d368] 0xd368
  [    0.000000][    T0] Instruction dump:
  [    0.000000][    T0] 4bffff0c eaa10028 4bffff44 60000000 60000000 60420000 3c4c027a 38421c40
  [    0.000000][    T0] 7c0802a6 4bfe2e5d 3123ffff 7d291910 <0b090000> 3d220003 392919f8 e9290000
  [    0.000000][    T0] random: get_random_bytes called from oops_exit+0x54/0xa0 with crng_init=0
  [    0.000000][    T0] ---[ end trace 0000000000000000 ]---


It's complaining about memstart_addr being 0, which implies
early_init_dt_add_memory_arch() was never called.

Will try and get some more debug tomorrow.

cheers

