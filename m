Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8A1C4C5C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 04:50:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GPNl5jNPzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 12:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GPLz0YtSzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 12:49:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GPLy03tGz9sRf;
 Tue,  5 May 2020 12:49:13 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 22/28] powerpc: Define new SRR1 bits for a future ISA
 version
Date: Tue, 05 May 2020 12:49:13 +1000
Message-ID: <2283452.Tms9ZVSFdi@townsend>
In-Reply-To: <20200501034220.8982-23-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-23-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:14 PM AEST Jordan Niethe wrote:
> Add the BOUNDARY SRR1 bit definition for when the cause of an alignment
> exception is a prefixed instruction that crosses a 64-byte boundary.
> Add the PREFIXED SRR1 bit definition for exceptions caused by prefixed
> instructions.
> 
> Bit 35 of SRR1 is called SRR1_ISI_N_OR_G. This name comes from it being
> used to indicate that an ISI was due to the access being no-exec or
> guarded. A future ISA version adds another purpose. It is also set if
> there is an access in a cache-inhibited location for prefixed
> instruction.  Rename from SRR1_ISI_N_OR_G to SRR1_ISI_N_G_OR_CIP.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Combined all the commits concerning SRR1 bits.
> ---
>  arch/powerpc/include/asm/reg.h      | 4 +++-
>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 773f76402392..f95eb8f97756 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -762,7 +762,7 @@
>  #endif
> 
>  #define   SRR1_ISI_NOPT		0x40000000 /* ISI: Not found in hash */
> -#define   SRR1_ISI_N_OR_G	0x10000000 /* ISI: Access is no-exec or G */
> +#define   SRR1_ISI_N_G_OR_CIP	0x10000000 /* ISI: Access is no-exec or G or
> CI for a prefixed instruction */ #define   SRR1_ISI_PROT		0x08000000 /*
> ISI: Other protection fault */ #define   SRR1_WAKEMASK		0x00380000 /*
> reason for wakeup */
>  #define   SRR1_WAKEMASK_P8	0x003c0000 /* reason for wakeup on POWER8 and 9
> */ @@ -789,6 +789,8 @@
>  #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
> 
>  #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused 
interrupt
> */ +#define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses
> 64-byte boundary */ +#define   SRR1_PREFIXED		0x20000000 /* Exception
> caused by prefixed instruction */
> 
>  #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
>  #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c
> b/arch/powerpc/kvm/book3s_hv_nested.c index dc97e5be76f6..6ab685227574
> 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1169,7 +1169,7 @@ static int kvmhv_translate_addr_nested(struct kvm_vcpu
> *vcpu, } else if (vcpu->arch.trap == BOOK3S_INTERRUPT_H_INST_STORAGE) { /*
> Can we execute? */
>  			if (!gpte_p->may_execute) {
> -				flags |= SRR1_ISI_N_OR_G;
> +				flags |= SRR1_ISI_N_G_OR_CIP;
>  				goto forward_to_l1;
>  			}
>  		} else {
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> b/arch/powerpc/kvm/book3s_hv_rm_mmu.c index 220305454c23..b53a9f1c1a46
> 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -1260,7 +1260,7 @@ long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu,
> unsigned long addr, status &= ~DSISR_NOHPTE;	/* DSISR_NOHPTE ==
> SRR1_ISI_NOPT */
>  	if (!data) {
>  		if (gr & (HPTE_R_N | HPTE_R_G))
> -			return status | SRR1_ISI_N_OR_G;
> +			return status | SRR1_ISI_N_G_OR_CIP;
>  		if (!hpte_read_permission(pp, slb_v & key))
>  			return status | SRR1_ISI_PROT;
>  	} else if (status & DSISR_ISSTORE) {




