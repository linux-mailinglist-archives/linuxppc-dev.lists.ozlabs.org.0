Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667514F82A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 15:56:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488xwv692TzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 01:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=VRbvmTl9; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488xss4ntMzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 01:53:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 488xsh46Ztz9vBmX;
 Sat,  1 Feb 2020 15:53:12 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VRbvmTl9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NHBcRM16WV_Q; Sat,  1 Feb 2020 15:53:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 488xsh2jncz9v0sP;
 Sat,  1 Feb 2020 15:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580568792; bh=0Dfdv+0PK3mslxxk3CI2MfzCNSIzsPvbEvSTURzTZDQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VRbvmTl9Yn3vuNrio4yo5ArAFmNwjYiF+b7LGlgiCipFJYcxQVlaf5/wiXSoULmsU
 DXDbe31Lkg/qUQXqKQjatFXUjk1zF9pPQqaqrdiehlaFCXy3aytcZ5eM546lOWqKHC
 5t2sZkTb1CiyQnxO+O3amOXNIK0c33aLv4gPotg4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B960E8B78A;
 Sat,  1 Feb 2020 15:53:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7ooRZZ9K5nFU; Sat,  1 Feb 2020 15:53:13 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F2BA8B752;
 Sat,  1 Feb 2020 15:53:13 +0100 (CET)
Subject: Re: [PATCH] powerpc/32s: Don't flush all TLBs when flushing one page
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <e31c57eb5308a5a73a5c8232454c0dd9f65f6175.1580485014.git.christophe.leroy@c-s.fr>
 <20200131155150.GD22482@gate.crashing.org>
 <27cef66b-df5b-0baa-abac-5532e58bd055@c-s.fr>
 <20200131193833.GF22482@gate.crashing.org>
 <248a3cf3-1b5e-a6e1-ceec-0e3904d1cf51@c-s.fr>
 <20200201140629.GM22482@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <96671e01-6206-8952-a498-942b42e98ef0@c-s.fr>
Date: Sat, 1 Feb 2020 15:53:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200201140629.GM22482@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/02/2020 à 15:06, Segher Boessenkool a écrit :
> On Sat, Feb 01, 2020 at 08:27:03AM +0100, Christophe Leroy wrote:
>> Le 31/01/2020 à 20:38, Segher Boessenkool a écrit :
>>> On Fri, Jan 31, 2020 at 05:15:20PM +0100, Christophe Leroy wrote:
>>>> Le 31/01/2020 à 16:51, Segher Boessenkool a écrit :
>>>>> On Fri, Jan 31, 2020 at 03:37:34PM +0000, Christophe Leroy wrote:
>>>>>> When the range is a single page, do a page flush instead.
>>>>>
>>>>>> +	start &= PAGE_MASK;
>>>>>> +	end = (end - 1) | ~PAGE_MASK;
>>>>>>   	if (!Hash) {
>>>>>> -		_tlbia();
>>>>>> +		if (end - start == PAGE_SIZE)
>>>>>> +			_tlbie(start);
>>>>>> +		else
>>>>>> +			_tlbia();
>>>>>>   		return;
>>>>>>   	}
>>>>>
>>>>> For just one page, you get  end - start == 0  actually?
>>>>
>>>> Oops, good catch.
>>>>
>>>> Indeed you don't get PAGE_SIZE but (PAGE_SIZE - 1) for just one page.
>>>
>>> You have all low bits masked off in both start and end, so you get zero.
>>> You could make the condion read "if (start == end)?
>>
>> No, in end the low bits are set, that's a BIT OR with ~PAGE_MASK, so it
>> sets all low bits to 1.
> 
> Oh, wow, yes, I cannot read apparently.
> 
> Maybe there are some ROUND_DOWN and ROUND_UP macros you could use?
> 

Yes but my intention was to modify the existing code as less as possible.
What do you think about version v2 of the patch ?

Christophe
