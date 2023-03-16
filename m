Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EE6BC4D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 04:41:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcY2q71hTz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 14:41:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VSUShDq/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcY1y4cZ9z3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 14:40:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VSUShDq/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PcY1y3h2Nz4x8y;
	Thu, 16 Mar 2023 14:40:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678938038;
	bh=I3HdvAcjOnC3mWz6xETiXQNQkQ+kPYn2LRCsS1aHHxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VSUShDq/swzrokk+AQXZlmmNSi1MzAzEvXjT7bq6peUqR5Ewi6p1APbXY1kSVSbxY
	 0UE+BuRiNnuB66zAS5iVv+opzSjKHYw4DLdZkxi4DjBPiYMvtZK9OQPzDAaPo1MQEY
	 JqoDlE+rN17JmcXqVkxo9jPzFXqwMZpldavTPLCzb3t20HqHcibHL3uGAapkn37fJ8
	 QR/syeAzzKw5SWpZ69p60PP8W8b/hVUdrc8Gxum2if2wyVZMcCILAEho1U1rPspHxg
	 9Q8ah4/KqW5RG6oVNXZShpB3S7I2tiSgoA3ol+YsVUGmdfxGj7awNI5XoCBRzKz4Bk
	 NhJZfSKQ2xOQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4
 argument
In-Reply-To: <87wn3hmkkj.fsf@mpe.ellerman.id.au>
References: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
 <20230306123740.3648841-3-kconsul@linux.vnet.ibm.com>
 <875yb2oc0a.fsf@mpe.ellerman.id.au>
 <ZBFVAxAFsUJtuzEy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87wn3hmkkj.fsf@mpe.ellerman.id.au>
Date: Thu, 16 Mar 2023 14:40:38 +1100
Message-ID: <87ttylmki1.fsf@mpe.ellerman.id.au>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>> On 2023-03-15 15:48:53, Michael Ellerman wrote:
>>> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>>> > kvmppc_hv_entry is called from only 2 locations within
>>> > book3s_hv_rmhandlers.S. Both of those locations set r4
>>> > as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
>>> > So, shift the r4 load instruction to kvmppc_hv_entry and
>>> > thus modify the calling convention of this function.
>>> >
>>> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> > ---
>>> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 ++++-----
>>> >  1 file changed, 4 insertions(+), 5 deletions(-)
>>> >
>>> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> > index b81ba4ee0521..da9a15db12fe 100644
>>> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> > @@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
>>> >  	RFI_TO_KERNEL
>>> >  
>>> >  kvmppc_call_hv_entry:
>>> > -	ld	r4, HSTATE_KVM_VCPU(r13)
>>> > +	/* Enter guest. */
>>> >  	bl	kvmppc_hv_entry
>>> >  
>>> >  	/* Back from guest - restore host state and return to caller */
>>> > @@ -352,9 +352,7 @@ kvm_secondary_got_guest:
>>> >  	mtspr	SPRN_LDBAR, r0
>>> >  	isync
>>> >  63:
>>> > -	/* Order load of vcpu after load of vcore */
>>> > -	lwsync
>>> 
>>> Where did this barrier go?
>>> 
>>> I don't see that it's covered by any existing barriers in
>>> kvmppc_hv_entry, and you don't add it back anywhere. 
>>
>> My concept about this is that since now the call to kvmppc_hv_entry
>> is first taken before the load to r4 shouldn't the pending load in the
>> pipeline of the HSTATE_KVM_VCORE as per the earlier comment be ordered anyway
>> before-hand ?
>
> No.
>  
>> Or do you mean to say that pending loads may not be
>> cleared/flushed across the "bl <funcname>" boundary ?
>
> Right.
>
> The "bl" imposes no ordering on loads before or after it.
>
> In general nothing orders two independant loads, other than a barrier.

There's some docs on barriers here:

  https://www.kernel.org/doc/Documentation/memory-barriers.txt

Though admittedly it is pretty dense.

cheers
