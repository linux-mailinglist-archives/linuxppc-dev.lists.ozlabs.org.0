Return-Path: <linuxppc-dev+bounces-14538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A3C911A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 09:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHmFB1Gkrz2yvZ;
	Fri, 28 Nov 2025 19:10:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764317422;
	cv=none; b=fhcFSN6SRAXAzvNZmiX6DsZ+OxeuMILSnuDa+TrfGyCF4qAaja67ZIr4NRb02u80zU7sW14cHMg15gBreyGiV4GKEcrnUHkw6KC772z2a0INTsIQb0JbiN9gL4oP75zLaUjimQp6eL7B/a9eFkKFOe6SLK1ECHpenuJXpDE5qPAHIYKA/lBBJokXT2RB8XI/VggR3jwRTRE2NZ/O5vnIxjXAn6yexWcVM8+1X/fkYF+aDeGvvLdF0rvWmsI9mGylGWa6XmlZoRhuxYhhPr87E9oiyv2eqB4A1B9j7w1an45cQlGDPwfUIvKNegyb7seXaRHHtlHQiFL9cXlOVwV2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764317422; c=relaxed/relaxed;
	bh=rPUgLyrLVRPj+xDkCuG45E1AHTojdinwpaoVaApco/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+uB3PTMz2VuAfIRwzBsUn0LLKqXzQ2wRHYPEL4rRm+ubWIxqwzPdGI5GWGwYCMMurlgMKnItWBDZ8NkoWGILo/0HOWXWMu/q6JBe+yMasZynrlATZQg7SNL9TUbw5qj6msRnbXj0/7MbVAwZq99ozap2wIL23Xny4vZ30qovaezM6xpT+2DG+0QdwNDfzQQad380kXGLfXITo2FUpostHPfwGhncvMBCDnyg7tD069+KATzJFk9vko4xvKODA/aL1rc0K+jHwzoUOeJlgwLouFCnQGWKqXhs7WwqOJoSHfYvxVBjbFjqzEHuChKqI1WNzIwCy6QrPjlyRwtqVjbsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Acs3hkuX; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Acs3hkuX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHmF91DWZz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 19:10:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 385D84398D;
	Fri, 28 Nov 2025 08:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1CAC4CEF1;
	Fri, 28 Nov 2025 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764317419;
	bh=sEqqBSoUyz9ZEJQFOk2T8A74KM+YnuZfci4BtVr6KfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Acs3hkuXdCqFgVhHJMvRY+qHQTFITwID5SUPmsy2EZPng4pGzKN/RwGoIPtq7Csog
	 kRMk5eLXzUeLRhKYT+C4IsU0trN+bSCIIXbnTHiZm5rgn77yqc3emDcfe0xs4P0sM0
	 NRwoQGKd7UO+1vVJAdpgcZZBhs5k4l5ItS3YbnXnLXYIMNgWiz0WFrEF53iHMlcb3q
	 NBIdVzsNN1V3EMIvvdT8avUxZSof98aMgjmyjPs93ZHib70dexoa08ZdDeQ/7KRwFO
	 y4NYyBJogBtdlCfkZ7L8Klm0JcS0X0HrujvwgRYiMD9UjlZlPz/DNSETrxAdNPXvqn
	 eDW80vtgeIWqA==
Message-ID: <a3bb0e8e-72c9-4a9c-b347-e899ae29b289@kernel.org>
Date: Fri, 28 Nov 2025 09:10:13 +0100
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
Subject: Re: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20251021100606.148294-1-david@redhat.com>
 <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org>
 <87zf86n3vq.ritesh.list@gmail.com>
 <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org>
 <87y0nqmwaz.ritesh.list@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <87y0nqmwaz.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/28/25 08:49, Ritesh Harjani (IBM) wrote:
> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
> 
>> On 11/28/25 06:05, Ritesh Harjani (IBM) wrote:
>>> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
>>>
>>>> On 10/21/25 12:06, David Hildenbrand wrote:
>>>>> Two smaller fixes identified while doing a bigger rework.
>>>>>
>>>>> Compile-tested only as I don't have an easy way to test right now.
>>>>>
>>>>> I would prefer for these patches to go through the MM tree as I will
>>>>> be sending out a bigger version soon that is based on this series --
>>>>> I split of the fixes from the other stuff.
>>>>>
>>>>
>>>> Ping,
>>>>
>>>> I tried to get CMM running again (using the simulation mode I introduced
>>>> a while back), but so far my attempts to get a reasonable powernv VM
>>>> booted in QEMU failed :(
>>>>
>>>> (e.g., Fedora qcow2 images use xfs, but the open powernv loader is based
>>>> on a 5.10 kernel without some mystical XFS feature ...)
>>>>
>>>
>>
>> Hi Ritesh,
>>
>>> Sorry, I missed seeing this earlier.
>>>
>>> Do you have the link to simulation mode which you are referring above
>>> please? So far I didn't find the support of this beyond Linux LPAR
>>> (pseries), but maybe I missed it.
>>
>> When I did a rework of the CMM balloon in 2019, I needed a way to test
>> it. So I added
>>
>> commit b1713975c31ae20ecc40fd00191ee3fa51445d4a
>> Author: David Hildenbrand <david@kernel.org>
>> Date:   Thu Oct 31 15:29:31 2019 +0100
>>
>>       powerpc/pseries/cmm: Simulation mode
> 
> aah right. I should have looked closely. I was thinking you meant
> somewhere in Qemu, so I was only looking there.
> 
>>       
>>       Let's allow to test the implementation without needing HW support.
>>       When "simulate=1" is specified when loading the module, we bypass all
>>       HW checks and HW calls. The sysfs file "simulate_loan_target_kb" can
>>       be used to simulate HW requests.
>>       
>>       The simualtion mode can be activated using:
>>         modprobe cmm debug=1 simulate=1
>>       
>>       And the requested loan target can be changed using:
>>         echo X > /sys/devices/system/cmm/cmm0/simulate_loan_target_kb
>>
>>
>> I allows for bypassing the absence of FW_FEATURE_CMO.
>>
> 
> Right. Let me give it a try first with pseries Qemu. Otherwise I have an
> access to pseries LPAR too. I can verify it there.

Ah, now I realize my problem: I tried with Fedora 43 in a powerpc VM but 
the modprobe didn't do anything.

Looking again:

# grep CONFIG_CMM /boot/config-6.17.1-300.fc43.ppc64le
CONFIG_CMM=y

So modprob'ing won't do as the module is built in.

Anyhow, compiling a kernel inside a QEMU VM might take a while, so if 
you can beat me to it I wouldn't be mad :)


Re powernv vs. powerpc: yeah, it's confusing. For some reason I thought 
I tested it in the days on powernv. Maybe that's simply because I was 
only able to get my hands on such a machine. Looking again, it should 
indeed be able to be simulated on a simple powerpc VM.

-- 
Cheers

David

