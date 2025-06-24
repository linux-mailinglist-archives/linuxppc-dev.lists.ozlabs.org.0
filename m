Return-Path: <linuxppc-dev+bounces-9669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F11AE5C0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 07:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRDZR2cFzz2xRq;
	Tue, 24 Jun 2025 15:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750744239;
	cv=none; b=KJaXvmitCN99ZeLlZ09Zs8Itp9bsINKxNNg+J3zQcu6fgSIsEHKAAgEQkLSYgc7BIto9WHkkXeFCC7lmrQxZlUqQA/SlK0ZAd7fFUuudwLqv6Fso50J//Yc2SOOCBYGpRZBvWwnHdIS9gKVCEcRMVi3CYqB3YMY2lpbcpJl31tja/ntILdqNhI06RSs83sp3ex3pYWyBdkFyCM6WPXEyl7K3MxLv8NYPTx4ejSfJ/zNUZkXiF4Ez7T5ZlGaD6dVICfKCsiBqeff8gOOKboYKr6de0u+YA5pLedpXZ6oiSErhOZ4H4BffFZHUoQHouDQybF1T+e8lVaZHb8gEfWOBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750744239; c=relaxed/relaxed;
	bh=pZOxHzM6HNI3sFVl3hxIkbPLMYo5eqWVRMZxRVeJUkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osnzEVklNg32C4bFYrStMvtx9PFCtPLx0zNVxcGIvjLQJdVEAcQ652NlnzhyDSfKpzhlAx+WgFvSy3AWXGeceazJoFb0SWdxlx8t1aNAVP9GpZ26RCANkNZl4rt2BKdvOk+pTXUwq8rJpGpBDXAXlwKdR7MysMdrNWxEBn8IpqZxKGmy5RZZkvBqvgFPHKYIhLgfwZwJ7Xkr/C3AQj/N9R1jOdJXurDRRH9KHooqDS8hjmzYRMsK8B7762br57F459pJGAZ5GYtcApN48VooXGtxG2x5TpsZxaiVNTKsNYFn8+KmJNPDNf4gfBAJXQM5jpEd3vjvku+CNR1iK12HPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRDZQ3q2nz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 15:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bRDD93jvMz9sRp;
	Tue, 24 Jun 2025 07:34:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEbxvPxf50Ga; Tue, 24 Jun 2025 07:34:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bRDD92K1Tz9sN6;
	Tue, 24 Jun 2025 07:34:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47C598B768;
	Tue, 24 Jun 2025 07:34:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qwbFcTV72ImU; Tue, 24 Jun 2025 07:34:49 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 512018B767;
	Tue, 24 Jun 2025 07:34:48 +0200 (CEST)
Message-ID: <ce2c8557-cda6-4211-9873-9afd993c0580@csgroup.eu>
Date: Tue, 24 Jun 2025 07:34:48 +0200
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
Subject: Re: [PATCH 1/5] uaccess: Add masked_user_{read/write}_access_begin
To: David Laight <david.laight.linux@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <6fddae0cf0da15a6521bb847b63324b7a2a067b1.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622173554.7f016f96@pumpkin>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250622173554.7f016f96@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/06/2025 à 18:35, David Laight a écrit :
> On Sun, 22 Jun 2025 11:52:39 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> Allthough masked_user_access_begin() seems to only be used when reading
>> data from user at the moment, introduce masked_user_read_access_begin()
>> and masked_user_write_access_begin() in order to match
>> user_read_access_begin() and user_write_access_begin().
>>
>> Have them default to masked_user_access_begin() when they are
>> not defined.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   fs/select.c             | 2 +-
>>   include/linux/uaccess.h | 8 ++++++++
>>   kernel/futex/futex.h    | 4 ++--
>>   lib/strncpy_from_user.c | 2 +-
>>   lib/strnlen_user.c      | 2 +-
>>   5 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/select.c b/fs/select.c
>> index 9fb650d03d52..d8547bedf5eb 100644
>> --- a/fs/select.c
>> +++ b/fs/select.c
>> @@ -777,7 +777,7 @@ static inline int get_sigset_argpack(struct sigset_argpack *to,
>>   	// the path is hot enough for overhead of copy_from_user() to matter
>>   	if (from) {
>>   		if (can_do_masked_user_access())
>> -			from = masked_user_access_begin(from);
>> +			from = masked_user_read_access_begin(from);
>>   		else if (!user_read_access_begin(from, sizeof(*from)))
>>   			return -EFAULT;
>>   		unsafe_get_user(to->p, &from->p, Efault);
>> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
>> index 7c06f4795670..682a0cd2fe51 100644
>> --- a/include/linux/uaccess.h
>> +++ b/include/linux/uaccess.h
>> @@ -41,6 +41,14 @@
> 
>>   #ifdef masked_user_access_begin
>>    #define can_do_masked_user_access() 1
>>   #else
>>    #define can_do_masked_user_access() 0
>>    #define masked_user_access_begin(src) NULL
>>    #define mask_user_address(src) (src)
>>   #endif
>>   
>> +#ifndef masked_user_write_access_begin
>> +#define masked_user_write_access_begin masked_user_access_begin
>> +#endif
>> +#ifndef masked_user_read_access_begin
>> +#define masked_user_read_access_begin masked_user_access_begin
>> +#endif
> 
> I think that needs merging with the bit above.
> Perhaps generating something like:
> 
> #ifdef masked_user_access_begin
> #define masked_user_read_access_begin masked_user_access_begin
> #define masked_user_write_access_begin masked_user_access_begin
> #endif
> 
> #ifdef masked_user_read_access_begin
>    #define can_do_masked_user_access() 1
> #else
>    #define can_do_masked_user_access() 0
>    #define masked_user_read_access_begin(src) NULL
>    #define masked_user_write_access_begin(src) NULL
>    #define mask_user_address(src) (src)
> #endif
> 
> Otherwise you'll have to #define masked_user_access_begin even though
> it is never used.

I'm not sure I understand what you mean.

masked_user_access_begin() is used, for instance in 
arch/x86/include/asm/futex.h so it will remain.

masked_user_access_begin() is the analogy of user_access_begin(), it 
starts a read-write user access and is worth it.

> 
> Two more patches could change x86-64 to define both and then remove
> the 'then unused' first check - but that has to be for later.
> 

Christophe

