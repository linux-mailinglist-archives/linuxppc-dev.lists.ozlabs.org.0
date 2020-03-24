Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC21903BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 03:58:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mbXn5TBpzDqSW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 13:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mbVh2THLzDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:56:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=DNxftHWN; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48mbVf1JVmz9sSJ; Tue, 24 Mar 2020 13:56:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1585018586; bh=KM0wn3HncBXutXd42xeQNpPkis4AM+gDD2DG4oOYGWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNxftHWNgOLQyQH/VLV1qoxnIrYyLlpqUNX+buuwbCnuNRLHUA+hozgLLpstodGfW
 unHa3a6Io23AXpkrtnMAAW5PvBsE9BqMvsrwYw7x9B6GhWLuKNRndIq2YiqXAGST2g
 E8/1WmwpxAyTs/JY2l/486DPKwxIxTwlyqr8WHphvB9ZIpsql2j6VetKKMOjR7KIcy
 wfdle+Jv1AZmuN9hRt/Bn051iX+6puM8CJMEjuBj2IMy9XnFurQyhY+5kAxTXWSaTd
 wx0Yr070YJpmu9+wrOSksgUcRumTqefB78TZDGQA/idU7E5UfhGQyffME2dkiT5mLU
 w8BqZt69DCKhg==
Date: Tue, 24 Mar 2020 13:56:20 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Skip kvmppc_uvmem_free if
 Ultravisor is not supported
Message-ID: <20200324025620.GE5604@blackberry>
References: <20200319225510.945603-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319225510.945603-1-farosas@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 19, 2020 at 07:55:10PM -0300, Fabiano Rosas wrote:
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

Thanks, applied to my kvm-ppc-next branch (Michael Ellerman decided
that he didn't need to take it as the crash only occurs with
CONFIG_PPC_UV=n, which is not the default).

Paul.
