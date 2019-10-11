Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A664D3B25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 10:30:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qLkV2CtgzDq77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 19:30:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qLXg5wQzzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 19:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46qLXg19TWz9sPk; Fri, 11 Oct 2019 19:22:10 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7fe4e1176dfe47a243d8edd98d26abd11f91b042
In-Reply-To: <20191004025317.19340-1-jniethe5@gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kvm: Fix kvmppc_vcore->in_guest value in
 kvmhv_switch_to_host
Message-Id: <46qLXg19TWz9sPk@ozlabs.org>
Date: Fri, 11 Oct 2019 19:22:10 +1100 (AEDT)
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
Cc: aik@ozlabs.ru, alistair@popple.id.au, patch-notifications@ellerman.id.au,
 kvm-ppc@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-10-04 at 02:53:17 UTC, Jordan Niethe wrote:
> kvmhv_switch_to_host() in arch/powerpc/kvm/book3s_hv_rmhandlers.S needs
> to set kvmppc_vcore->in_guest to 0 to signal secondary CPUs to continue.
> This happens after resetting the PCR. Before commit 13c7bb3c57dc
> ("powerpc/64s: Set reserved PCR bits"), r0 would always be 0 before it
> was stored to kvmppc_vcore->in_guest. However because of this change in
> the commit:
> 
>         /* Reset PCR */
>         ld      r0, VCORE_PCR(r5)
> -       cmpdi   r0, 0
> +       LOAD_REG_IMMEDIATE(r6, PCR_MASK)
> +       cmpld   r0, r6
>         beq     18f
> -       li      r0, 0
> -       mtspr   SPRN_PCR, r0
> +       mtspr   SPRN_PCR, r6
>  18:
>         /* Signal secondary CPUs to continue */
>         stb     r0,VCORE_IN_GUEST(r5)
> 
> We are no longer comparing r0 against 0 and loading it with 0 if it
> contains something else. Hence when we store r0 to
> kvmppc_vcore->in_guest, it might not be 0.  This means that secondary
> CPUs will not be signalled to continue. Those CPUs get stuck and errors
> like the following are logged:
> 
>     KVM: CPU 1 seems to be stuck
>     KVM: CPU 2 seems to be stuck
>     KVM: CPU 3 seems to be stuck
>     KVM: CPU 4 seems to be stuck
>     KVM: CPU 5 seems to be stuck
>     KVM: CPU 6 seems to be stuck
>     KVM: CPU 7 seems to be stuck
> 
> This can be reproduced with:
>     $ for i in `seq 1 7` ; do chcpu -d $i ; done ;
>     $ taskset -c 0 qemu-system-ppc64 -smp 8,threads=8 \
>        -M pseries,accel=kvm,kvm-type=HV -m 1G -nographic -vga none \
>        -kernel vmlinux -initrd initrd.cpio.xz
> 
> Fix by making sure r0 is 0 before storing it to kvmppc_vcore->in_guest.
> 
> Fixes: 13c7bb3c57dc ("powerpc/64s: Set reserved PCR bits")
> Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/7fe4e1176dfe47a243d8edd98d26abd11f91b042

cheers
