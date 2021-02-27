Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A514326CB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 11:31:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnjVy48zGz3d42
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 21:31:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnjVd40Hjz30Gl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 21:31:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DnjVW038rz9ty5v;
 Sat, 27 Feb 2021 11:31:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4h_HczVVdAdx; Sat, 27 Feb 2021 11:31:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DnjVV54hBz9ty5t;
 Sat, 27 Feb 2021 11:31:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC11A8B77A;
 Sat, 27 Feb 2021 11:31:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id W-ItOljZNSxg; Sat, 27 Feb 2021 11:31:15 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 186948B75B;
 Sat, 27 Feb 2021 11:31:15 +0100 (CET)
Subject: Re: [PATCH] powerpc/bug: Remove specific powerpc BUG_ON()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <694c7195c81d1bcc781b3c14f452886683d6c524.1613029237.git.christophe.leroy@csgroup.eu>
 <20210211114910.GA28121@gate.crashing.org>
 <6126ca14-419a-9e15-7ffa-b295f26a552e@csgroup.eu>
 <20210211143059.GE28121@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f6f7ae76-c6d9-9a5e-043d-07f6d0270ceb@csgroup.eu>
Date: Sat, 27 Feb 2021 11:31:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211143059.GE28121@gate.crashing.org>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2021 à 15:30, Segher Boessenkool a écrit :
> On Thu, Feb 11, 2021 at 03:09:43PM +0100, Christophe Leroy wrote:
>> Le 11/02/2021 à 12:49, Segher Boessenkool a écrit :
>>> On Thu, Feb 11, 2021 at 07:41:52AM +0000, Christophe Leroy wrote:
>>>> powerpc BUG_ON() is based on using twnei or tdnei instruction,
>>>> which obliges gcc to format the condition into a 0 or 1 value
>>>> in a register.
>>>
>>> Huh?  Why is that?
>>>
>>> Will it work better if this used __builtin_trap?  Or does the kernel only
>>> detect very specific forms of trap instructions?
>>
>> We already made a try with __builtin_trap() 1,5 year ago, see
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr/
>>
>> The main problems encountered are:
>> - It is only possible to use it for BUG_ON, not for WARN_ON because GCC
>> considers it as noreturn. Is there any workaround ?
> 
> A trap is noreturn by definition:
> 
>   -- Built-in Function: void __builtin_trap (void)
>       This function causes the program to exit abnormally.
> 
>> - The kernel (With CONFIG_DEBUG_BUGVERBOSE) needs to be able to identify
>> the source file and line corresponding to the trap. How can that be done
>> with __builtin_trap() ?
> 
> The DWARF debug info should be sufficient.  Perhaps you can post-process
> some way?
> 
> You can create a trap that falls through yourself (by having a trap-on
> condition with a condition that is always true, but make the compiler
> not see that).  This isn't efficient though.
> 
> Could you file a feature request (in bugzilla)?  It is probably useful
> for generic code as well, but we could implement this for powerpc only
> if needed.
> 

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99299

Christophe
