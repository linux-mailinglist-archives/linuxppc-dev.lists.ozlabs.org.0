Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B7931E60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 03:17:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TvweJxsz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNLm24MXYz3cWW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 11:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TvweJxsz;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNLlK03P0z30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 11:17:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721092635;
	bh=Q1jIChmgdEnBmrz69/fPODiz0wMaK/AiIWdVBtqH+CU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TvweJxsz0Rv7qrlm26p9wecfCrPSmIizMcVgyDmBMTCwSOKUpDkaTcaJKSi0pROwO
	 N2VuFdU92RUYU/g3o01OUyFuqjsetjHCky4eATZhFv2pB5g3xTx/DXH6QEKUk5/DZq
	 SrLEEOwvK7X1XNyoBWeTf5ORYTDLZTxnKSswjn+xa4UaCNWm3ughdmd/hn5oy9LYTn
	 SoSiKn8B5OW1+7N6KNqZq7ycf7nBbwpgyTsS0qzLkZbr9P+2E2Z7H6d3NGRGi9i9LU
	 /A61Ri2WTMyg574R8o/mUFuDbPC2q7svsQHBOgS3ZjdQEuL0cTV9HgOkLScpyXJDHX
	 UFdhXLauw+0ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNLlG6P1dz4wcl;
	Tue, 16 Jul 2024 11:17:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH] arch/powerpc/kvm: Avoid extra checks when emulating
 HFSCR bits
In-Reply-To: <20240626123447.66104-1-gautam@linux.ibm.com>
References: <20240626123447.66104-1-gautam@linux.ibm.com>
Date: Tue, 16 Jul 2024 11:17:13 +1000
Message-ID: <87v816w2xy.fsf@mail.lhotse>
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautam Menghani <gautam@linux.ibm.com> writes:
> When a KVM guest tries to use a feature disabled by HFSCR, it exits to
> the host for emulation support, and the code checks for all bits which
> are emulated. Avoid checking all the bits by using a switch case.

The patch looks fine, but I don't know what you mean by "avoid checking
all the bits".

The existing code checks 4 cases, the case statement checks the same 4
cases (plus the default case).

There are other cause values (not bits), but the new and old code don't
check them all anyway. (Which is OK because the default return value is
EMULATE_FAIL)

AFAICS it generates almost identical code.

So I think the change log should just say something like "all the FSCR
cause values are exclusive so use a case statement which better
expresses that" ?

Also please try to copy the existing subject style for the KVM code, for
this file it would be "KVM: PPC: Book3S HV: ...". I agree it's verbose,
and wouldn't be my choice, but thats what's always been used so let's
stick to it.

cheers

> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 99c7ce825..a72fd2543 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1922,14 +1922,22 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>  
>  		r = EMULATE_FAIL;
>  		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> -			if (cause == FSCR_MSGP_LG)
> +			switch (cause) {
> +			case FSCR_MSGP_LG:
>  				r = kvmppc_emulate_doorbell_instr(vcpu);
> -			if (cause == FSCR_PM_LG)
> +				break;
> +			case FSCR_PM_LG:
>  				r = kvmppc_pmu_unavailable(vcpu);
> -			if (cause == FSCR_EBB_LG)
> +				break;
> +			case FSCR_EBB_LG:
>  				r = kvmppc_ebb_unavailable(vcpu);
> -			if (cause == FSCR_TM_LG)
> +				break;
> +			case FSCR_TM_LG:
>  				r = kvmppc_tm_unavailable(vcpu);
> +				break;
> +			default:
> +				break;
> +			}
>  		}
>  		if (r == EMULATE_FAIL) {
>  			kvmppc_core_queue_program(vcpu, SRR1_PROGILL |
> -- 
> 2.45.2
