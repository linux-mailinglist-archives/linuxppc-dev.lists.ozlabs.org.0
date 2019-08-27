Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9799F271
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:36:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HyHw5l5pzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 04:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Se7EgIR6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HyF96mlKzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 04:33:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HyF60c9Kz9tyVK;
 Tue, 27 Aug 2019 20:33:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Se7EgIR6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id J_eUXk7cwSWF; Tue, 27 Aug 2019 20:33:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HyF56fMVz9tyVG;
 Tue, 27 Aug 2019 20:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566930825; bh=S21lhrPpGd6dbYfJ8cqZd9xshNHamMkQCPlDAE1DQLQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Se7EgIR6k6yEUFd0XqRUPKvOIkZd2w0BG6cAq1TQGDUZPr4lrsTG39DLpT2B1NarH
 hLUUSSbklI0KhG+T3Ji9rdL+SOyOrzBrlfmY+I2ffps7TqPox9MYQDMIDkYFmBwl3S
 Z2nnkpAVernPwu3vTZB2n1DuYDpIhHBkWzhR527U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E61778B847;
 Tue, 27 Aug 2019 20:33:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fvXHAOH7aW9s; Tue, 27 Aug 2019 20:33:45 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FF4B8B842;
 Tue, 27 Aug 2019 20:33:45 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc: cleanup hw_irq.h
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <0f7e164afb5d1b022441559fe5a999bb6d3c0a23.1566893505.git.christophe.leroy@c-s.fr>
 <81f39fa06ae582f4a783d26abd2b310204eba8f4.1566893505.git.christophe.leroy@c-s.fr>
 <1566909844.x4jee1jjda.astroid@bobo.none>
 <20190827172909.GA31406@gate.crashing.org>
 <1410046b-e1a3-b892-2add-6c1d353cb781@c-s.fr>
 <20190827182616.GB31406@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <00cc71bd-35f5-b0d5-e4fa-8368fe4fe78c@c-s.fr>
Date: Tue, 27 Aug 2019 20:33:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827182616.GB31406@gate.crashing.org>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/08/2019 à 20:26, Segher Boessenkool a écrit :
> On Tue, Aug 27, 2019 at 07:36:35PM +0200, Christophe Leroy wrote:
>> Le 27/08/2019 à 19:29, Segher Boessenkool a écrit :
>>> On Tue, Aug 27, 2019 at 10:48:24PM +1000, Nicholas Piggin wrote:
>>>> Christophe Leroy's on August 27, 2019 6:13 pm:
>>>>> +#define wrtee(val)	asm volatile("wrtee %0" : : "r" (val) : "memory")
>>>>> +#define wrteei(val)	asm volatile("wrteei %0" : : "i" (val) :
>>>>> "memory")
>>>>
>>>> Can you implement just one macro that uses __builtin_constant_p to
>>>> select between the imm and reg versions? I forgot if there's some
>>>> corner cases that prevent that working with inline asm i constraints.
>>>
>>> static inline void wrtee(long val)
>>> {
>>> 	asm volatile("wrtee%I0 %0" : : "n"(val) : "memory");
>>> }
>>
>> Great, didn't know that possibility.
>>
>> Can it be used with any insn, for instance with add/addi ?
>> Or with mr/li ?
> 
> Any instruction, yes.  %I<n> simply outputs an "i" if operand n is a
> constant integer, and nothing otherwise.

Thinking about it once more, I'm not sure this form is possible, because 
wrteei expect 0 or 1. If someone calls wrtee(MSR_EE); (or any constant 
containing MSR_EE) wrteei 1 is expected. And any constant with MSR_EE 
cleared should result in wrteei 0.

> 
> So
>    asm("add%I2 %0,%1,%2" : "=r"(dst) : "r"(src1), "ri"(src1));

"ri", not "n" as for wrtee ?

Christophe

> works well.  I don't see how you would use it for li/mr...  You can do
>    asm("add%I1 %0,0,%1" : "=r"(dst) : "ri"(src));
> I suppose, but that is not really an mr.
> 
>>> (This output modifier goes back to the dark ages, some 2.4 or something).
>>
>> Hope Clang support it ...
> 
> I don't know, sorry.  But it is used all over the place, see sfp-machine.h
> for example, so maybe?
> 
> 
> Segher
> 
