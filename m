Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6D657CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 15:19:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kxTk2V1LzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 23:19:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kx184XThzDqgH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 22:57:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45kx180fqwz9sNm; Thu, 11 Jul 2019 22:57:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45kx151mswz9sNT;
 Thu, 11 Jul 2019 22:57:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v4 8/8] KVM: PPC: Ultravisor: Check for MSR_S during
 hv_reset_msr
In-Reply-To: <20190628200825.31049-9-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-9-cclaudio@linux.ibm.com>
Date: Thu, 11 Jul 2019 22:57:43 +1000
Message-ID: <87ef2wg248.fsf@concordia.ellerman.id.au>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> From: Michael Anderson <andmike@linux.ibm.com>
>
>  - Check for MSR_S so that kvmppc_set_msr will include it. Prior to this
>    change return to guest would not have the S bit set.

That sounds like it would be bad?

Please spell out what the practical impact of the patch is, ie.
somewhere on the spectrum from "without this patch everything catches
fire", to "this is not a bug but makes things clearer because ..."

cheers

>  - Patch based on comment from Paul Mackerras <pmac@au1.ibm.com>
>
> Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index ab3d484c5e2e..ab62a66f9b4e 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -295,6 +295,7 @@ static void kvmppc_mmu_book3s_64_hv_reset_msr(struct kvm_vcpu *vcpu)
>  		msr |= MSR_TS_S;
>  	else
>  		msr |= vcpu->arch.shregs.msr & MSR_TS_MASK;
> +	msr |= vcpu->arch.shregs.msr & MSR_S;
>  	kvmppc_set_msr(vcpu, msr);
>  }
>  
> -- 
> 2.20.1
