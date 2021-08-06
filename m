Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF53E2085
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 03:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgndJ74p9z3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 11:17:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j9ZGvITu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=j9ZGvITu; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggncn6QBwz3dCN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 11:16:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ggnch3SS2z9sT6;
 Fri,  6 Aug 2021 11:16:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628212596;
 bh=qzBSBCGCdmBE2RDHJZuwYJaVGQV98VMQ96dVPfIdCe0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j9ZGvITulsrwtJeTKf99DnnkxENKha2tUy+dsuXTw0jODq+1EUMo/CDvzWMTqQGaj
 oIldu4hZ5bdRyNAfEyjwlc0CfHl3e9iFN9eldZtiKxOAV3bxqKqCM60JCLw43Roi67
 8y0Taxy5opecPURcEemWgQ9J+xu+RBVmAxpQuTegqQ87agLPjWqKptlAjNqgH/9/nJ
 FABwqD90N2VDbuDdkkp73PNE1EoeDC4cHCryrdV7EBpy3BZXBEmSbFOLZhgFwfZkcx
 P7uYaeUisY+dUfbmMSuIDuxvgX9w0vWqe+9Glv6u3ope2NW1eiFUVTJiwbnPgLLl+7
 6mGZeFI2kzcFg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v1 02/55] KVM: PPC: Book3S HV P9: Fixes for TM softpatch
 interrupt
In-Reply-To: <20210726035036.739609-3-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-3-npiggin@gmail.com>
Date: Fri, 06 Aug 2021 11:16:32 +1000
Message-ID: <87a6lvnzin.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> The softpatch interrupt sets HSRR0 to the faulting instruction +4, so
> it should subtract 4 for the faulting instruction address. Also have it
> emulate and deliver HFAC interrupts correctly, which is important for
> nested HV and facility demand-faulting in future.

The nip being off by 4 sounds bad. But I guess it's not that big a deal
because it's only used for reporting the instruction address?

Would also be good to have some more explanation of why it's OK to
change from illegal to HFAC, which is a guest visible change.

> diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv_tm.c
> index cc90b8b82329..e4fd4a9dee08 100644
> --- a/arch/powerpc/kvm/book3s_hv_tm.c
> +++ b/arch/powerpc/kvm/book3s_hv_tm.c
> @@ -74,19 +74,23 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>  	case PPC_INST_RFEBB:
>  		if ((msr & MSR_PR) && (vcpu->arch.vcore->pcr & PCR_ARCH_206)) {
>  			/* generate an illegal instruction interrupt */
> +			vcpu->arch.regs.nip -= 4;
>  			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
>  			return RESUME_GUEST;
>  		}
>  		/* check EBB facility is available */
>  		if (!(vcpu->arch.hfscr & HFSCR_EBB)) {
> -			/* generate an illegal instruction interrupt */
> -			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
> -			return RESUME_GUEST;
> +			vcpu->arch.regs.nip -= 4;
> +			vcpu->arch.hfscr &= ~HFSCR_INTR_CAUSE;
> +			vcpu->arch.hfscr |= (u64)FSCR_EBB_LG << 56;
> +			vcpu->arch.trap = BOOK3S_INTERRUPT_H_FAC_UNAVAIL;
> +			return -1; /* rerun host interrupt handler */

This is EBB not TM. Probably OK to leave it in this patch as long as
it's mentioned in the change log?

>  		}
>  		if ((msr & MSR_PR) && !(vcpu->arch.fscr & FSCR_EBB)) {
>  			/* generate a facility unavailable interrupt */
> -			vcpu->arch.fscr = (vcpu->arch.fscr & ~(0xffull << 56)) |
> -				((u64)FSCR_EBB_LG << 56);
> +			vcpu->arch.regs.nip -= 4;
> +			vcpu->arch.fscr &= ~FSCR_INTR_CAUSE;
> +			vcpu->arch.fscr |= (u64)FSCR_EBB_LG << 56;

Same.


cheers
