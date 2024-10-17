Return-Path: <linuxppc-dev+bounces-2336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 281599A1BE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 09:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTfxk75pTz2yTy;
	Thu, 17 Oct 2024 18:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729151098;
	cv=none; b=XA2OVOpujK6VZJ/Y4Udi05VLp2oRGqcLWGLbBbJa7uj4Px18QeQSzksQ7Ij4B7BmdJ0r44M6VkshI5S439fHGight9o042Zf1JdFTRLXh9U2X8tXc3cphz2lXNx3jmcP4LGoD4HpGyQm3nd4CooDh3ieCwTkFBR9DTptPIGTH+wwhmu3fWCBBXm3ZNRsPcVOdB5HetTEWJkbQd/DTkjxNn+x81kpWQr5einxKqsXzEqHkC4yRuvoqt757Q6r2dvbWCUgqi4WNdT2fqc7nuoNHpCyGk5+xcLnfr2LAjV3LbsoVaDX57aKqzSg4BTsn1LVSy3Z7fnMKnLdZxbuwa2V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729151098; c=relaxed/relaxed;
	bh=/UhWQm9eLeR8YNtGPI8a1RnIKQeZCQmW5PVmQJ1rnJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3a5hh11bkTv72/pU2y+E73SwCipabobZAIM7SIV/KHJiZBSJPp4cP8a43RziN6K9jrkuGuPVOAu0mvDyH6QxaFQU9m59if6VOdQcKzRwmuOwynEU3rhOoibqxCsInLSONHLmFV0B6uLN8VrbS4UZ5h/AHBLTiZ2uIpHig7yHkMJ/XLdxq4m4t8oWDiOja/4rnjzOn3I9j6/6hgq3yhS18w/8YFeX39GTThany3kf5r/JJTGFMVm1NlOhzIrzoy17wKE9j3wBIp5M7dNrjzvFKTOdnTCQtC/kGjAY453b/AbOUcOg+1wWym1oTb5p/FVFmIUQBPZZU2PDQQh/VXkZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTfxj1vVmz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 18:44:55 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6602DFEC;
	Thu, 17 Oct 2024 00:44:52 -0700 (PDT)
Received: from [10.57.66.61] (unknown [10.57.66.61])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EACE83F528;
	Thu, 17 Oct 2024 00:44:15 -0700 (PDT)
Message-ID: <c629869a-0cbf-4f0a-b361-cfb962177aeb@arm.com>
Date: Thu, 17 Oct 2024 09:44:13 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
To: Joey Gouly <joey.gouly@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
 akpm@linux-foundation.org, aneesh.kumar@kernel.org,
 aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
 broonie@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maz@kernel.org,
 mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com,
 npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org,
 skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de,
 x86@kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
 <20241014171023.GA18295@willie-the-truck>
 <20241015095911.GA3777204@e124191.cambridge.arm.com>
 <20241015114116.GA19334@willie-the-truck>
 <20241015122529.GA3820764@e124191.cambridge.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241015122529.GA3820764@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 15/10/2024 14:25, Joey Gouly wrote:
> On Tue, Oct 15, 2024 at 12:41:16PM +0100, Will Deacon wrote:
>> On Tue, Oct 15, 2024 at 10:59:11AM +0100, Joey Gouly wrote:
>>> On Mon, Oct 14, 2024 at 06:10:23PM +0100, Will Deacon wrote:
>>>> Kevin, Joey,
>>>>
>>>> On Wed, Oct 09, 2024 at 03:43:01PM +0100, Will Deacon wrote:
>>>>> On Tue, Sep 24, 2024 at 01:27:58PM +0200, Kevin Brodsky wrote:
>>>>>> On 22/08/2024 17:11, Joey Gouly wrote:
>>>>>>> @@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
>>>>>>>  		sme_smstop();
>>>>>>>  	}
>>>>>>>  
>>>>>>> +	if (system_supports_poe())
>>>>>>> +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
>>>>>> At the point where setup_return() is called, the signal frame has
>>>>>> already been written to the user stack. In other words, we write to the
>>>>>> user stack first, and then reset POR_EL0. This may be problematic,
>>>>>> especially if we are using the alternate signal stack, which the
>>>>>> interrupted POR_EL0 may not grant access to. In that situation uaccess
>>>>>> will fail and we'll end up with a SIGSEGV.
>>>>>>
>>>>>> This issue has already been discussed on the x86 side, and as it happens
>>>>>> patches to reset PKRU early [1] have just landed. I don't think this is
>>>>>> a blocker for getting this series landed, but we should try and align
>>>>>> with x86. If there's no objection, I'm planning to work on a counterpart
>>>>>> to the x86 series (resetting POR_EL0 early during signal delivery).
>>>>> Did you get a chance to work on that? It would be great to land the
>>>>> fixes for 6.12, if possible, so that the first kernel release with POE
>>>>> support doesn't land with known issues.
>>>> Looking a little more at this, I think we have quite a weird behaviour
>>>> on arm64 as it stands. It looks like we rely on the signal frame to hold
>>>> the original POR_EL0 so, if for some reason we fail to allocate space
>>>> for the POR context, I think we'll return back from the signal with
>>>> POR_EL0_INIT. That seems bad?
>>> If we don't allocate space for POR_EL0, I think the program recieves SIGSGEV?
>>>
>>> setup_sigframe_layout()
>>>         if (system_supports_poe()) {
>>>                 err = sigframe_alloc(user, &user->poe_offset,
>>>                                      sizeof(struct poe_context));
>>>                 if (err)
>>>                         return err;
>>>         }
>>>
>>> Through get_sigframe() and setup_rt_frame(), that eventually hets here:
>>>
>>> handle_signal()
>>> 	ret = setup_rt_frame(usig, ksig, oldset, regs);
>>>
>>> 	[..]
>>>
>>>         signal_setup_done(ret, ksig, test_thread_flag(TIF_SINGLESTEP));
>>>
>>> void signal_setup_done(int failed, struct ksignal *ksig, int stepping)                                                                                                                         
>>> {                                                                                                                                                                                              
>>>         if (failed)                                                                                                                                                                            
>>>                 force_sigsegv(ksig->sig);                                                                                                                                                      
>>>         else                                                                                                                                                                                   
>>>                 signal_delivered(ksig, stepping);                                                                                                                                              
>>> }  
>>>
>>> So I think it's "fine"?
>> Ah, yes, sorry about that. I got confused by the conditional push in
>> setup_sigframe():
>>
>> 	if (system_supports_poe() && err == 0 && user->poe_offset) {
>> 		...
>>
>> which gives the wrong impression that the POR is somehow optional, even
>> if the CPU supports POE. So we should drop that check of
>> 'user->poe_offset' as it cannot be NULL here.
>>
>> We also still need to resolve Kevin's concern, which probably means
>> keeping the thread's original POR around someplace.
> That was cargo culted (by me) from the rest of the function (apart from TPIDR2
> and FPMR). I think Kevin is planning on sending his signal changes still, but
> is on holiday, maybe he can remove the last part of the condition as part of
> his series.

Indeed just got back from holiday. I've got the series ready, about to
send it. I will add a clean-up patch removing this check on poe_offset.

Kevin

