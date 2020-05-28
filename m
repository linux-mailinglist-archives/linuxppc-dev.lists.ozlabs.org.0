Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B81E6181
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 14:56:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XnkQ5458zDqTq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 22:55:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XngM5zxvzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 22:53:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HIxznnat; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49XngM1Bcfz9sSJ;
 Thu, 28 May 2020 22:53:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590670399;
 bh=8gJQs06+xrl+1L/tcAmdCSKZ+wAahs5NVgXbRD0OV0o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HIxznnatMHXIxZGAxnlFGDkR89mVAlqUGRAtZe6H/QR8u1GlNyMbs4OQq2cRp7Ugb
 wcOz98FUDl3HO6cEgVrPPsQX/B+8o4LS8bPn3y2V4wbxRnuzfHby8zKaEDXV/0WnWe
 UHgDLnjsI6hZoLDAIx7xrf/b/puuY66k821CqFPRLF3c/00Y1bxP7Clqyz+ztrsCiA
 tszslJ3Hrrw9MQzyBp5SkJGeFyWqMmKkPM9wp5S5uZcDao3sLQDcAUNvT4Fri/LX95
 g1Y4qhvtfWQj/FNY9Rrtw6eB0A7B93e3CsgQQbS2jJATgPmxQPrzaT/nM0ROWjghBV
 9f7NtmlJH/Stg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 paulus@ozlabs.org
Subject: Re: [PATCH] powerpc/book3s64/kvm: Fix secondary page table walk
 warning during migration
In-Reply-To: <20200528080456.87797-1-aneesh.kumar@linux.ibm.com>
References: <20200528080456.87797-1-aneesh.kumar@linux.ibm.com>
Date: Thu, 28 May 2020 22:53:43 +1000
Message-ID: <87a71sjk4o.fsf@mpe.ellerman.id.au>
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
> This patch fix the below warning reported during migration.
>
>  find_kvm_secondary_pte called with kvm mmu_lock not held
>  CPU: 23 PID: 5341 Comm: qemu-system-ppc Tainted: G        W         5.7.0-rc5-kvm-00211-g9ccf10d6d088 #432
>  NIP:  c008000000fe848c LR: c008000000fe8488 CTR: 0000000000000000
>  REGS: c000001e19f077e0 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-kvm-00211-g9ccf10d6d088)
>  MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 42222422  XER: 20040000
>  CFAR: c00000000012f5ac IRQMASK: 0
>  GPR00: c008000000fe8488 c000001e19f07a70 c008000000ffe200 0000000000000039
>  GPR04: 0000000000000001 c000001ffc8b4900 0000000000018840 0000000000000007
>  GPR08: 0000000000000003 0000000000000001 0000000000000007 0000000000000001
>  GPR12: 0000000000002000 c000001fff6d9400 000000011f884678 00007fff70b70000
>  GPR16: 00007fff7137cb90 00007fff7dcb4410 0000000000000001 0000000000000000
>  GPR20: 000000000ffe0000 0000000000000000 0000000000000001 0000000000000000
>  GPR24: 8000000000000000 0000000000000001 c000001e1f67e600 c000001e1fd82410
>  GPR28: 0000000000001000 c000001e2e410000 0000000000000fff 0000000000000ffe
>  NIP [c008000000fe848c] kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
>  LR [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv]
>  Call Trace:
>  [c000001e19f07a70] [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv] (unreliable)
>  [c000001e19f07b50] [c008000000fd42e4] kvm_vm_ioctl_get_dirty_log_hv+0x33c/0x3c0 [kvm_hv]
>  [c000001e19f07be0] [c008000000eea878] kvm_vm_ioctl_get_dirty_log+0x30/0x50 [kvm]
>  [c000001e19f07c00] [c008000000edc818] kvm_vm_ioctl+0x2b0/0xc00 [kvm]
>  [c000001e19f07d50] [c00000000046e148] ksys_ioctl+0xf8/0x150
>  [c000001e19f07da0] [c00000000046e1c8] sys_ioctl+0x28/0x80
>  [c000001e19f07dc0] [c00000000003652c] system_call_exception+0x16c/0x240
>  [c000001e19f07e20] [c00000000000d070] system_call_common+0xf0/0x278
>  Instruction dump:
>  7d3a512a 4200ffd0 7ffefb78 4bfffdc4 60000000 3c820000 e8848468 3c620000
>  e86384a8 38840010 4800673d e8410018 <0fe00000> 4bfffdd4 60000000 60000000
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s_64.h |  9 ++++++
>  arch/powerpc/kvm/book3s_64_mmu_radix.c   | 35 ++++++++++++++++++++----
>  2 files changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
> index c58e64a0a74f..cd5bad08b8d3 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
> @@ -635,6 +635,15 @@ extern void kvmhv_remove_nest_rmap_range(struct kvm *kvm,
>  				unsigned long gpa, unsigned long hpa,
>  				unsigned long nbytes);
>  
> +static inline pte_t *__find_kvm_secondary_pte(struct kvm *kvm, unsigned long ea,
> +					      unsigned *hshift)
> +{
> +	pte_t *pte;
> +
> +	pte = __find_linux_pte(kvm->arch.pgtable, ea, NULL, hshift);
> +	return pte;
> +}

Why not just open code this in the single caller?

Leaving it here someone will invariably decide to call it one day.

If you think it's worth keeping then it should have a comment explaining
why it doesn't check the lock, and find_kvm_secondary_pte() should call
it no?

cheers
