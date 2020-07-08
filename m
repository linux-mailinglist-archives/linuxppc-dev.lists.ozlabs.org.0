Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D200F218A19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 16:24:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B21m7006PzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 00:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B21hz1Xy7zDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 00:22:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B21hk73Ykz9v1YG;
 Wed,  8 Jul 2020 16:21:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IFAGcwFDL8rW; Wed,  8 Jul 2020 16:21:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B21hk6CvFz9v1YF;
 Wed,  8 Jul 2020 16:21:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ADEFC8B804;
 Wed,  8 Jul 2020 16:22:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P9LsSujiNsy4; Wed,  8 Jul 2020 16:22:00 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E6AA18B7FE;
 Wed,  8 Jul 2020 16:21:59 +0200 (CEST)
Subject: Re: Failure to build librseq on ppc
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org>
 <841816533.1735.1594211583710.JavaMail.zimbra@efficios.com>
 <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96994487-ae4a-3bfb-b0f1-34228e51bea2@csgroup.eu>
Date: Wed, 8 Jul 2020 16:21:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/07/2020 à 16:00, Mathieu Desnoyers a écrit :
> ----- On Jul 8, 2020, at 8:33 AM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:
> 
>> ----- On Jul 7, 2020, at 8:59 PM, Segher Boessenkool segher@kernel.crashing.org
>> wrote:
> [...]
>>>
>>> So perhaps you have code like
>>>
>>>   int *p;
>>>   int x;
>>>   ...
>>>   asm ("lwz %0,%1" : "=r"(x) : "m"(*p));
>>
>> We indeed have explicit "lwz" and "stw" instructions in there.
>>
>>>
>>> where that last line should actually read
>>>
>>>   asm ("lwz%X1 %0,%1" : "=r"(x) : "m"(*p));
>>
>> Indeed, turning those into "lwzx" and "stwx" seems to fix the issue.
>>
>> There has been some level of extra CPP macro coating around those instructions
>> to
>> support both ppc32 and ppc64 with the same assembly. So adding %X[arg] is not
>> trivial.
>> Let me see what can be done here.
> 
> I did the following changes which appear to generate valid asm.
> See attached corresponding .S output.
> 
> I grepped for uses of "m" asm operand in Linux powerpc code and noticed it's pretty much
> always used with e.g. "lwz%U1%X1". I could find one blog post discussing that %U is about
> update flag, and nothing about %X. Are those documented ?

As far as I can see, %U is mentioned in 
https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html in the 
powerpc subpart, at the "m" constraint.

For the %X I don't know.

Christophe

> 
> Although it appears to generate valid asm, I have the feeling I'm relying on undocumented
> features here. :-/
> 
