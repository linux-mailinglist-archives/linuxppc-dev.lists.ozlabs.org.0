Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFB24D642D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 15:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFTYg518zz3bbx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 01:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFTYB5n5Yz2y6K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 01:56:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFTY43pHCz9sS8;
 Fri, 11 Mar 2022 15:56:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vtr32IuOipKO; Fri, 11 Mar 2022 15:56:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFTY42whNz9sS7;
 Fri, 11 Mar 2022 15:56:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B5D88B78D;
 Fri, 11 Mar 2022 15:56:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ob3X9aOzhGZu; Fri, 11 Mar 2022 15:56:56 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 773B58B763;
 Fri, 11 Mar 2022 15:56:55 +0100 (CET)
Message-ID: <c0b8cb0e-cd96-d660-db87-51ded45435c2@csgroup.eu>
Date: Fri, 11 Mar 2022 15:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] powerpc/32: Add support for out-of-line static calls
Content-Language: fr-FR
To: Peter Zijlstra <peterz@infradead.org>
References: <97f252fcd63e145f54fbf85124c75fb01e96e1bb.1630415517.git.christophe.leroy@csgroup.eu>
 <YS419Exj6PpESVc/@hirez.programming.kicks-ass.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <YS419Exj6PpESVc/@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jason Baron <jbaron@akamai.com>, Paul Mackerras <paulus@samba.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

Le 31/08/2021 à 16:00, Peter Zijlstra a écrit :
> On Tue, Aug 31, 2021 at 01:12:26PM +0000, Christophe Leroy wrote:
> 
> Yes, this should work nicely!
> 
> Since you have the two nop's at the end, you could frob in an
> optimization for __static_call_return0 without too much issue.
> 
> Replace the two nops with (excuse my ppc asm):
> 
> 	li r3, 0
> 	blr
> 
> and augment arch_static_call_transform() with something like:
> 
> 	if (func == &__static_call_return0)
> 		err = patch_branch(tramp, tramp+24, 0);

I just discovered that we likely have an issue with the implementation 
of that RET0 static call.

Looking at System.map I have:

	c0004fc0 t __static_call_return0
	c0011518 t __static_call_return0
	c00d8160 t __static_call_return0


So when we do:

	if (func == &__static_call_return0)

It is unlikely that we'll get the expected one.


I see __static_call_return0 is defined as 'static inline' in 
include/linux/static_call.h

Any reason for not having it as a single global symbol instead ?

Thanks
Christophe
