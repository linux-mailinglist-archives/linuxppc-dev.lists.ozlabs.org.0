Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEA6BA659
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 05:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbycK5ScSz3cXf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 15:49:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BtzPtgSY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbybN2j8Cz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 15:49:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BtzPtgSY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbybD67s6z4xDp;
	Wed, 15 Mar 2023 15:48:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678855738;
	bh=S8gHusNmlWu5JowBFK3q0Zr887hNLmMq3w8ufY3kxwc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BtzPtgSYNAw8sMcTMtq7f8n6bfIT0MlsANVTj/jQNBI0DLP0deQ1CMMIZQ3IXpLoN
	 6mNvitmoGAPNSO9oUonUqIUY3a8xWUZ7c2cViCCMBBFtyPh8c3oKEMYG9ICqAgOpAg
	 P9yaZ+534hb54SB3jQj8NwH0tYOAFJRIF92RGy/lcpfRcwvCTFA1pnIR9ayVwkNjFd
	 AsflYOWF/aG8AX33pnk3HtG0lZEUZn3SqnBYAnCRsWbOLtI0Eh2IA0FH0eZGzPC67p
	 IeVbNKNICvebhADK4Jc2PDWvQc87wLJ21db8xFiQHC1dNNy4Ke1BnGkV3i5AHJCAn2
	 KIWvKiZOCXQTg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Sathvika Vasireddy
 <sv@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Fabiano Rosas
 <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4
 argument
In-Reply-To: <20230306123740.3648841-3-kconsul@linux.vnet.ibm.com>
References: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
 <20230306123740.3648841-3-kconsul@linux.vnet.ibm.com>
Date: Wed, 15 Mar 2023 15:48:53 +1100
Message-ID: <875yb2oc0a.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> kvmppc_hv_entry is called from only 2 locations within
> book3s_hv_rmhandlers.S. Both of those locations set r4
> as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
> So, shift the r4 load instruction to kvmppc_hv_entry and
> thus modify the calling convention of this function.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index b81ba4ee0521..da9a15db12fe 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
>  	RFI_TO_KERNEL
>  
>  kvmppc_call_hv_entry:
> -	ld	r4, HSTATE_KVM_VCPU(r13)
> +	/* Enter guest. */
>  	bl	kvmppc_hv_entry
>  
>  	/* Back from guest - restore host state and return to caller */
> @@ -352,9 +352,7 @@ kvm_secondary_got_guest:
>  	mtspr	SPRN_LDBAR, r0
>  	isync
>  63:
> -	/* Order load of vcpu after load of vcore */
> -	lwsync

Where did this barrier go?

I don't see that it's covered by any existing barriers in
kvmppc_hv_entry, and you don't add it back anywhere. 
 
> -	ld	r4, HSTATE_KVM_VCPU(r13)
> +	/* Enter guest. */
>  	bl	kvmppc_hv_entry
>  
>  	/* Back from the guest, go back to nap */
> @@ -506,7 +504,6 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
>  
>  	/* Required state:
>  	 *
> -	 * R4 = vcpu pointer (or NULL)
>  	 * MSR = ~IR|DR
>  	 * R13 = PACA
>  	 * R1 = host R1
> @@ -524,6 +521,8 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
>  	li	r6, KVM_GUEST_MODE_HOST_HV
>  	stb	r6, HSTATE_IN_GUEST(r13)
>  
> +	ld	r4, HSTATE_KVM_VCPU(r13)
> +
>  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
>  	/* Store initial timestamp */
>  	cmpdi	r4, 0

cheers
