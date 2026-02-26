Return-Path: <linuxppc-dev+bounces-17277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPopN65JoGkuhwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 14:25:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2CF1A6738
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 14:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMByf4kVQz2yFc;
	Fri, 27 Feb 2026 00:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772112298;
	cv=none; b=Ow3qgLj3rYwQDxm94vACZACLuxVbn0QoQVLunqSk/68Sk9R+PQYnvEGmfdwXflrhkhJvfD2a2YUT2IFLX0Pxczd63o1Y9f77r7ei8H44xSNjIsucc2xIqoVlZPCCIYJ5R2O0/pWhHFnx7Fwk7XYZT1ne5aIlDGAlX0yUfD0Um/pA9Xyj4uDAHrzeEa5StbdSZ/mWFLNINOWHbaF465WOallrWWdIqbtrcAA7RNxXfFiqSvtU8PY7nLrqHcQ694kIVo2FsaMnGtyXX7zMzSb/iKfIFGEa4EeJirbMk8JVtgqbgCOtMSg57dwRHOZownFr4WRBRUyQ2/fiIb14Xl7JMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772112298; c=relaxed/relaxed;
	bh=azLj0kvf6Mg+6gUVBx3vMooazgnEhwTHxJdfye2a8Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiwlUzL+IeYWjvcZmjbwoDXzT86ul6s36linM0iwzXj0LMCg51xbkxW436bYlmQJWA8/vkwpziEdlnPda0Y2Sj9TtY+MrK2Zyza1fcJ2iCWcueXklQ+RB3bKJV/9EilQQsWvbWzSJ77KT537FgZxoPZtbAfekHkYpB1XjWQ12WTEAsf7BOr6nof1rip7wIizyrar0u/jDe6z9weJbBcf5gqgaq++zBZLl8PAH5gDvJF79Veq20U8OANZj+bzexIrs5+EwS9E1XDHf4/cC/rkyW4Esi64keeT3aIEkZNn4Y/AT8uZATfANSt4yphRk8VBciQbNnQ1AlFEf2/0+RDcbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZzRWg6m3; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZzRWg6m3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMByd25k5z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 00:24:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB61A41B01;
	Thu, 26 Feb 2026 13:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D220C116C6;
	Thu, 26 Feb 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772112294;
	bh=2/QPW79kVlJl5CXnRPzQ9jK+/xV64cz0chwvlkpUCTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZzRWg6m3RkIiQsJnc5Rn30PQvsl3rrrmyfR917f2UY7UE2nwVO3siznjTO/0Yw5J4
	 Sed00gijglV/Z8/jXNTglE+v102BhOFpTrHJg1fDqU8rMl17AnlBdAEXRllRx3ARmQ
	 SHkp5RpkIfK/t9004lI3/tjAq/2V20Itfsl4afyGVcOD9pTR0Du9eOM182lHXJdqPE
	 zENeXInjUc0gRjvF+njZ8zD4K5TcY/Rw8n4tgdhyKbx4fZ3qOAeOL9WO0c0wkLvrSh
	 ZfS3mJnDCPCTaP/3c5knJOl5zz/7+tSUXZ+amLqCXYg+M4S46GgBnrYweFDMEtPmpg
	 T4qtzqNx+vZfg==
Message-ID: <8c6f2510-1dc5-4c45-9288-6b9c8f9b6b24@kernel.org>
Date: Thu, 26 Feb 2026 14:24:50 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux PPC] Disable PREEMPT
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
 <1c9b879a-7907-4849-a416-5df3db5617d6@kernel.org>
 <34112e67-85a5-a380-a42b-24c6562d65be@xenosoft.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <34112e67-85a5-a380-a42b-24c6562d65be@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17277-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:peterz@infradead.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,outlook.com:url]
X-Rspamd-Queue-Id: 7F2CF1A6738
X-Rspamd-Action: no action

Hi Christian,

Le 26/02/2026 à 06:37, Christian Zigotzky a écrit :
> On 25/02/26 08:16, Christophe Leroy (CS GROUP) wrote:
>> +Peter
>>
>> Hi Christian,
>>
>> Le 25/02/2026 à 06:54, Christian Zigotzky a écrit :
>>> Hello,
>>>
>>> We were previously able to disable PREEMPT in the kernel 
>>> configuration, but the latest kernels now enable it by default and it 
>>> is no longer possible to disable it.
>>>
>>> Is it possible to let us decide whether to activate PREEMPT or not?
>>
>> Can you give more details on why you want to be able to deactivate 
>> PREEMPT ?
>>
>> Read https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fgithub.com%2Ftorvalds%2Flinux%2Fcommit%2F7dadeaa6e851e&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C7006c8b4b98c4315a7e508de74f9388a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639076810956939768%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6xLB%2FOVSkmgZRamaBM9zaxm%2FUTk9ssf4409QJdiXkDg%3D&reserved=0
> I use PREEMPT_NONE kernels on my Linux PPC servers. (Without desktop)

You are doing that today because it is possible. Tomorrow it will not be 
possible anymore, for the reasons explained by Peter.

My question was not to know what you are doing but why, and why you 
think you still need PREEMPT_NONE and why the modern PREEMPT_LAZY is not 
good enough for you.

Christophe

>>
>>
>>>
>>> Currently we use the following revert patch for our non-preempt kernels.
>>>
>>> --- a/kernel/Kconfig.preempt    2026-02-14 10:06:32.000000000 +0000
>>> +++ b/kernel/Kconfig.preempt    2026-02-08 21:03:27.000000000 +0000
>>> @@ -16,13 +16,11 @@ config ARCH_HAS_PREEMPT_LAZY
>>>
>>>   choice
>>>       prompt "Preemption Model"
>>> -    default PREEMPT_LAZY if ARCH_HAS_PREEMPT_LAZY
>>>       default PREEMPT_NONE
>>>
>>>   config PREEMPT_NONE
>>>       bool "No Forced Preemption (Server)"
>>>       depends on !PREEMPT_RT
>>> -    depends on ARCH_NO_PREEMPT
>>>       select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
>>>       help
>>>         This is the traditional Linux preemption model, geared towards
>>> @@ -37,7 +35,6 @@ config PREEMPT_NONE
>>>
>>>   config PREEMPT_VOLUNTARY
>>>       bool "Voluntary Kernel Preemption (Desktop)"
>>> -    depends on !ARCH_HAS_PREEMPT_LAZY
>>>       depends on !ARCH_NO_PREEMPT
>>>       depends on !PREEMPT_RT
>>>       select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC
>>>
>>> ---
>>>
>>> Thanks in advance,
>>>
>>> Christian
>>>
>>
> 
> 


