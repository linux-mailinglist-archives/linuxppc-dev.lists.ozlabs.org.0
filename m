Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D852FBD9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:30:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKwdw5yNmzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 04:30:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKwZj01d0zDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 04:27:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DKwZR4Ybsz9v6Jy;
 Tue, 19 Jan 2021 18:27:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tQGVZ9BnH2i8; Tue, 19 Jan 2021 18:27:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DKwZR3Wlbz9v6Jw;
 Tue, 19 Jan 2021 18:27:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 309A08B7DE;
 Tue, 19 Jan 2021 18:27:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H3vc7DNMvSAO; Tue, 19 Jan 2021 18:27:13 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D0A3A8B7C7;
 Tue, 19 Jan 2021 18:27:12 +0100 (CET)
Subject: Re: [PATCH v3 1/8] powerpc/uaccess: Add unsafe_copy_from_user
To: "Christopher M. Riedl" <cmr@codefail.de>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <C8NAORBNJH4S.KKQFN1HWO8XH@geist>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1e6309a4-58fe-c6a4-6e47-d8659177846c@csgroup.eu>
Date: Tue, 19 Jan 2021 18:27:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <C8NAORBNJH4S.KKQFN1HWO8XH@geist>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/01/2021 à 18:02, Christopher M. Riedl a écrit :
> On Tue Jan 19, 2021 at 6:33 AM CST, Christophe Leroy wrote:
>>
>>
>> Le 19/01/2021 à 03:11, Michael Ellerman a écrit :
>>> "Christopher M. Riedl" <cmr@codefail.de> writes:
>>>> On Mon Jan 11, 2021 at 7:22 AM CST, Christophe Leroy wrote:
>>>>> Le 09/01/2021 à 04:25, Christopher M. Riedl a écrit :
>>>>>> Implement raw_copy_from_user_allowed() which assumes that userspace read
>>>>>> access is open. Use this new function to implement raw_copy_from_user().
>>>>>> Finally, wrap the new function to follow the usual "unsafe_" convention
>>>>>> of taking a label argument.
>>>>>
>>>>> I think there is no point implementing raw_copy_from_user_allowed(), see
>>>>> https://github.com/linuxppc/linux/commit/4b842e4e25b1 and
>>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8c74fc9ce8131cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu/
>>>>>
>>>>> You should simply do:
>>>>>
>>>>> #define unsafe_copy_from_user(d, s, l, e) \
>>>>> unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
>>>>>
>>>>
>>>> I gave this a try and the signal ops decreased by ~8K. Now, to be
>>>> honest, I am not sure what an "acceptable" benchmark number here
>>>> actually is - so maybe this is ok? Same loss with both radix and hash:
>>>>
>>>> 	|                                      | hash   | radix  |
>>>> 	| ------------------------------------ | ------ | ------ |
>>>> 	| linuxppc/next                        | 118693 | 133296 |
>>>> 	| linuxppc/next w/o KUAP+KUEP          | 228911 | 228654 |
>>>> 	| unsafe-signal64                      | 200480 | 234067 |
>>>> 	| unsafe-signal64 (__copy_tofrom_user) | 192467 | 225119 |
>>>>
>>>> To put this into perspective, prior to KUAP and uaccess flush, signal
>>>> performance in this benchmark was ~290K on hash.
>>>
>>> If I'm doing the math right 8K is ~4% of the best number.
>>>
>>> It seems like 4% is worth a few lines of code to handle these constant
>>> sizes. It's not like we have performance to throw away.
>>>
>>> Or, we should chase down where the call sites are that are doing small
>>> constant copies with copy_to/from_user() and change them to use
>>> get/put_user().
>>>
>>
>> Christopher, when you say you gave it a try, is I my series or only the
>> following ?
>>
>> #define unsafe_copy_from_user(d, s, l, e) \
>> unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
>>
> 
> I only used the above to replace this patch in my series (so none of my
> changes implementing raw_copy_from_user_allowed() are included).

Then I see no reason why the performance would be different, because you only call 
unsafe_copy_from_user() with non trivial lengthes.

> 
>>
>> Because I see no use of unsafe_copy_from_user() that would explain that.
>>
>> Christophe
