Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE28983D2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:12:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=X1tiRC+A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9G9L4qhmz3vZb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 20:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=X1tiRC+A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 2156 seconds by postgrey-1.37 at boromir; Thu, 04 Apr 2024 20:11:57 AEDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9G8Y52Zwz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 20:11:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=XGHxVqk4pP10Jn+yNRakH5zgTP0QZEzijKIINGCO2kM=;
	t=1712221917; x=1712653917; b=X1tiRC+A9vdcrcpLwM/g0OwyC8gONqs4zueJ5DhDVHGgTiR
	9H47EJ7I9y9umdGjzMAcyg/hZ8Hp22+bfOfXFEuRPdOjpghYm24WcpKS/7USPN5yiJO6C3BoIrDUc
	gsROFmzxy9XDBeGbDM0wuJTC0yDAtOZmSIvpApCTZutrSksj1XV0mbU3zS2ngYTiySWFAC9WR8EEe
	Jgf3T1/xFTS9s3RRo1XH8dWWurFhBTRZ5GwOoCK2YoEHenUWgZzET4syrbOgcG/QwvmlMju85TRFk
	/qshTiFhv5ZCeR9N12Ad/g5DTXuB7riaUWvF98Gp/aEWTcr8+5P/6gp09Kp6+H8A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rsIZd-0002eV-40; Thu, 04 Apr 2024 10:35:53 +0200
Message-ID: <a4f022e8-1f84-4bbb-b00d-00f1eba1f877@leemhuis.info>
Date: Thu, 4 Apr 2024 10:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC
 exception
To: Nicholas Piggin <npiggin@gmail.com>, Vaibhav Jain
 <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org
References: <20240313072625.76804-1-vaibhav@linux.ibm.com>
 <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1712221917;9d369991;
X-HE-SMSGID: 1rsIZd-0002eV-40
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: mikey@neuling.org, Linux kernel regressions list <regressions@lists.linux.dev>, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Was this regression ever resolved? Doesn't look like it, but maybe I
just missed something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 20.03.24 14:43, Nicholas Piggin wrote:
> On Wed Mar 13, 2024 at 5:26 PM AEST, Vaibhav Jain wrote:
>> This reverts commit 180c6b072bf360b686e53d893d8dcf7dbbaec6bb ("KVM: PPC:
>> Book3S HV nestedv2: Do not cancel pending decrementer exception") which
>> prevented cancelling a pending HDEC exception for nestedv2 KVM guests. It
>> was done to avoid overhead of a H_GUEST_GET_STATE hcall to read the 'HDEC
>> expiry TB' register which was higher compared to handling extra decrementer
>> exceptions.
>>
>> This overhead of reading 'HDEC expiry TB' register has been mitigated
>> recently by the L0 hypervisor(PowerVM) by putting the value of this
>> register in L2 guest-state output buffer on trap to L1. From there the
>> value of this register is cached, made available in kvmhv_run_single_vcpu()
>> to compare it against host(L1) timebase and cancel the pending hypervisor
>> decrementer exception if needed.
> 
> Ah, I figured out the problem here. Guest entry never clears the
> queued dec, because it's level triggered on the DEC MSB so it
> doesn't go away when it's delivered. So upstream code is indeed
> buggy and I think I take the blame for suggesting this nestedv2
> workaround.
> 
> I actually don't think that is necessary though, we could treat it
> like other interrupts.  I think that would solve the problem without
> having to test dec here.
> 
> I am wondering though, what workload slows down that this patch
> was needed in the first place. We'd only get here after a cede
> returns, then we'd dequeue the dec and stop having to GET_STATE
> it here.
> 
> Thanks,
> Nick
> 
>>
>> Fixes: 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 0b921704da45..e47b954ce266 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -4856,7 +4856,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>  	 * entering a nested guest in which case the decrementer is now owned
>>  	 * by L2 and the L1 decrementer is provided in hdec_expires
>>  	 */
>> -	if (!kvmhv_is_nestedv2() && kvmppc_core_pending_dec(vcpu) &&
>> +	if (kvmppc_core_pending_dec(vcpu) &&
>>  			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
>>  			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
>>  			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
> 
