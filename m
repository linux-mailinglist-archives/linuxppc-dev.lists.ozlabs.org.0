Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 036CD8993BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 05:21:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oeh6yhkc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9kK65Hzlz3cSd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 14:20:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oeh6yhkc;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9kJR194wz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 14:20:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712287223;
	bh=BzOgV/+Na+A/Ref7N5qSUr8kt2YEgbL91XAVdwt4w18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oeh6yhkcpwXKcHmtw6MAbTvlbPXAM/96yJA9sgFi/cSRHxSZU1GOlWjCnNuO+71da
	 aybge/mqP0XmlGCOOBryClA3ybY8Er/3bGlwL9tGjZdh7kAb5qOgmrRs0+9n9uTAAi
	 YHv4pRrhlDmNffTfyCMT0mnEIrCiRpN8MZTQh1ne5zYsvqdu4cHnDcigpAp2Pohx0G
	 K8h0V+AV1fl5Q9OengudjNlIoReVGlTBuSTpYEliUABPpiaz9smSu2g6mr4ffKgEMA
	 5cZbPzKAqmR5pYQmPHQ9NMeEaZMm8I4HcBjzjsslCO7/TkUK/cqj2DGYS7cZDAw17g
	 H+bTqfOwcS4dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V9kJQ1GQNz4wcb;
	Fri,  5 Apr 2024 14:20:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Nicholas Piggin <npiggin@gmail.com>, Vaibhav
 Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC
 exception
In-Reply-To: <a4f022e8-1f84-4bbb-b00d-00f1eba1f877@leemhuis.info>
References: <20240313072625.76804-1-vaibhav@linux.ibm.com>
 <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
 <a4f022e8-1f84-4bbb-b00d-00f1eba1f877@leemhuis.info>
Date: Fri, 05 Apr 2024 14:20:21 +1100
Message-ID: <87sf007ax6.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, Linux kernel regressions list <regressions@lists.linux.dev>, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> Was this regression ever resolved? Doesn't look like it, but maybe I
> just missed something.

I'm not sure how it ended up on the regression list. IMHO it's not
really a regression. It was an attempt at a performance optimisation,
which is no longer needed due to changes in (unreleased) firmware.

I haven't merged it because Nick's reply contained several questions for
Vaibhav, so I'm expecting either a reply to those or a new version of
the patch.

cheers

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
> On 20.03.24 14:43, Nicholas Piggin wrote:
>> On Wed Mar 13, 2024 at 5:26 PM AEST, Vaibhav Jain wrote:
>>> This reverts commit 180c6b072bf360b686e53d893d8dcf7dbbaec6bb ("KVM: PPC:
>>> Book3S HV nestedv2: Do not cancel pending decrementer exception") which
>>> prevented cancelling a pending HDEC exception for nestedv2 KVM guests. It
>>> was done to avoid overhead of a H_GUEST_GET_STATE hcall to read the 'HDEC
>>> expiry TB' register which was higher compared to handling extra decrementer
>>> exceptions.
>>>
>>> This overhead of reading 'HDEC expiry TB' register has been mitigated
>>> recently by the L0 hypervisor(PowerVM) by putting the value of this
>>> register in L2 guest-state output buffer on trap to L1. From there the
>>> value of this register is cached, made available in kvmhv_run_single_vcpu()
>>> to compare it against host(L1) timebase and cancel the pending hypervisor
>>> decrementer exception if needed.
>> 
>> Ah, I figured out the problem here. Guest entry never clears the
>> queued dec, because it's level triggered on the DEC MSB so it
>> doesn't go away when it's delivered. So upstream code is indeed
>> buggy and I think I take the blame for suggesting this nestedv2
>> workaround.
>> 
>> I actually don't think that is necessary though, we could treat it
>> like other interrupts.  I think that would solve the problem without
>> having to test dec here.
>> 
>> I am wondering though, what workload slows down that this patch
>> was needed in the first place. We'd only get here after a cede
>> returns, then we'd dequeue the dec and stop having to GET_STATE
>> it here.
>> 
>> Thanks,
>> Nick
>> 
>>>
>>> Fixes: 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
>>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>> ---
>>>  arch/powerpc/kvm/book3s_hv.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>> index 0b921704da45..e47b954ce266 100644
>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>> @@ -4856,7 +4856,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>>  	 * entering a nested guest in which case the decrementer is now owned
>>>  	 * by L2 and the L1 decrementer is provided in hdec_expires
>>>  	 */
>>> -	if (!kvmhv_is_nestedv2() && kvmppc_core_pending_dec(vcpu) &&
>>> +	if (kvmppc_core_pending_dec(vcpu) &&
>>>  			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
>>>  			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
>>>  			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
>> 
