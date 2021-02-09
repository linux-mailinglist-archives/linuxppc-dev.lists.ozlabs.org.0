Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EDD315499
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 18:05:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZq5N1ShJzDvZM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 04:05:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZq3j2JcgzDsmZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 04:03:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZq3R6lxTz9v2fx;
 Tue,  9 Feb 2021 18:03:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Gcz4YRACtslA; Tue,  9 Feb 2021 18:03:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZq3R5Y7Qz9v2fv;
 Tue,  9 Feb 2021 18:03:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CE8E8B7EE;
 Tue,  9 Feb 2021 18:03:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id d9oR9oP2EDOI; Tue,  9 Feb 2021 18:03:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E0608B7EA;
 Tue,  9 Feb 2021 18:03:32 +0100 (CET)
Subject: Re: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
To: David Laight <David.Laight@ACULAB.COM>,
 'Segher Boessenkool' <segher@kernel.crashing.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <24804747098369ebcdac38970b8f7a1260bdd248.1612796617.git.christophe.leroy@csgroup.eu>
 <1612838134.rvncv9kzls.astroid@bobo.none>
 <20210209135053.GD27854@gate.crashing.org>
 <d35cc46eca474b2c9f94a4de269321e7@AcuMS.aculab.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f6ae2e77-3a89-c294-9a6e-58d84fbb46b1@csgroup.eu>
Date: Tue, 9 Feb 2021 18:03:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d35cc46eca474b2c9f94a4de269321e7@AcuMS.aculab.com>
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
Cc: Paul Mackerras <paulus@samba.org>, "msuchanek@suse.de" <msuchanek@suse.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/02/2021 à 15:31, David Laight a écrit :
> From: Segher Boessenkool
>> Sent: 09 February 2021 13:51
>>
>> On Tue, Feb 09, 2021 at 12:36:20PM +1000, Nicholas Piggin wrote:
>>> What if you did this?
>>
>>> +static inline struct task_struct *get_current(void)
>>> +{
>>> +	register struct task_struct *task asm ("r2");
>>> +
>>> +	return task;
>>> +}
>>
>> Local register asm variables are *only* guaranteed to live in that
>> register as operands to an asm.  See
>>    https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-Register-Variables
>> ("The only supported use" etc.)
>>
>> You can do something like
>>
>> static inline struct task_struct *get_current(void)
>> {
>> 	register struct task_struct *task asm ("r2");
>>
>> 	asm("" : "+r"(task));
>>
>> 	return task;
>> }
>>
>> which makes sure that "task" actually is in r2 at the point of that asm.
> 
> If "r2" always contains current (and is never assigned by the compiler)
> why not use a global register variable for it?
> 


The change proposed by Nick doesn't solve the issue.

The problem is that at the begining of the function we have:

	unsigned long *ti_flagsp = &current_thread_info()->flags;

When the function uses ti_flagsp for the first time, it does use 112(r2)

Then the function calls some other functions.

Most likely because the function could update 'current', GCC copies r2 into r30, so that if r2 get 
changed by the called function, ti_flagsp is still based on the previous value of current.

Allthough we know r2 wont change, GCC doesn't know it. And in order to save r2 into r30, it needs to 
save r30 in the stack.


By using &current_thread_info()->flags directly instead of this intermediaite ti_flagsp pointer, GCC 
uses r2 instead instead of doing a copy.


Nick, I don't understand the reason why you need that 'ti_flagsp' local var.

Christophe
