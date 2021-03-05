Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B232E25B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 07:38:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsJ3b29skz3dGx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 17:38:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsJ3F4H8rz30Jn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 17:38:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DsJ361tD8z9v0yd;
 Fri,  5 Mar 2021 07:38:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IJ5de3KGMh2A; Fri,  5 Mar 2021 07:38:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DsJ360HPSz9v0yc;
 Fri,  5 Mar 2021 07:38:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA39B8B78D;
 Fri,  5 Mar 2021 07:38:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LcyMHL2QgMzb; Fri,  5 Mar 2021 07:38:26 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D2998B78B;
 Fri,  5 Mar 2021 07:38:26 +0100 (CET)
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
 <YEEYDSJeLPvqRAHZ@elver.google.com>
 <CAKwvOd=wBArMwvtDC8zV-QjQa5UuwWoxksQ8j+hUCZzbEAn+Fw@mail.gmail.com>
 <20210304192447.GT29191@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ed3c08d2-04ba-217e-9924-28cab7750234@csgroup.eu>
Date: Fri, 5 Mar 2021 07:38:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304192447.GT29191@gate.crashing.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-toolchains@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/03/2021 à 20:24, Segher Boessenkool a écrit :
> On Thu, Mar 04, 2021 at 09:54:44AM -0800, Nick Desaulniers wrote:
>> On Thu, Mar 4, 2021 at 9:42 AM Marco Elver <elver@google.com> wrote:
>> include/linux/compiler.h:246:
>> prevent_tail_call_optimization
>>
>> commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")

https://github.com/linuxppc/linux/commit/a9a3ed1eff36

> 
> That is much heavier than needed (an mb()).  You can just put an empty
> inline asm after a call before a return, and that call cannot be
> optimised to a sibling call: (the end of a function is an implicit
> return:)
> 
> Instead of:
> 
> void g(void);
> void f(int x)
> 	if (x)
> 		g();
> }
> 
> Do:
> 
> void g(void);
> void f(int x)
> 	if (x)
> 		g();
> 	asm("");
> }
> 
> This costs no extra instructions, and certainly not something as heavy
> as an mb()!  It works without the "if" as well, of course, but with it
> it is a more interesting example of a tail call.

In the commit mentionned at the top, it is said:

The next attempt to prevent compilers from tail-call optimizing
the last function call cpu_startup_entry(), ... , was to add an empty asm("").

This current solution was short and sweet, and reportedly, is supported
by both compilers but we didn't get very far this time: future (LTO?)
optimization passes could potentially eliminate this, which leads us
to the third attempt: having an actual memory barrier there which the
compiler cannot ignore or move around etc.

Christophe
