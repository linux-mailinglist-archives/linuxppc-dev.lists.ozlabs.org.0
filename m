Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0DB144C03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 07:53:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482bjD2PWSzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 17:53:52 +1100 (AEDT)
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
 header.s=mail header.b=Zey8fdjO; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482bgH07tBzDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 17:52:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482bg62dYRz9v1G1;
 Wed, 22 Jan 2020 07:52:02 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Zey8fdjO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oG7b4NC5O0Sq; Wed, 22 Jan 2020 07:52:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482bg619Vtz9v1G0;
 Wed, 22 Jan 2020 07:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579675922; bh=AYb/CdJwlLdwhR85yWkNEPcYAl+1WHLldoMOxAkLGpM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zey8fdjOenKuqzua5w7ccePCzStkQRBuJaWxnsJVniBNEICcjqz/Qq/mZfkoDcKWj
 m7jTcAVVcCwoLKA8mePd5gFGZTjv/4HtUxHQIysp9aTF3f5X20ObtxEcM/gKav5zr+
 TtH/cAfLoGS2ZgGfk8V5vjYRKFaDLsXnVLmJ2Heg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E56D58B7EC;
 Wed, 22 Jan 2020 07:52:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id T8XazIT7FdGs; Wed, 22 Jan 2020 07:52:02 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF7998B776;
 Wed, 22 Jan 2020 07:52:02 +0100 (CET)
Subject: Re: GCC bug ? Re: [PATCH v2 10/10] powerpc/32s: Implement Kernel
 Userspace Access Protection
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1552292207.git.christophe.leroy@c-s.fr>
 <a2847248a92cb1641b1740fa121c5a30593ae662.1552292207.git.christophe.leroy@c-s.fr>
 <87ftqfu7j1.fsf@concordia.ellerman.id.au>
 <a008a182-f1db-073c-7d38-27bfd1fd8676@c-s.fr>
 <20200121195501.GJ3191@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <af9ad296-401c-cb5c-868a-7a6f91d1e8bc@c-s.fr>
Date: Wed, 22 Jan 2020 07:52:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121195501.GJ3191@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/01/2020 à 20:55, Segher Boessenkool a écrit :
> On Tue, Jan 21, 2020 at 05:22:32PM +0000, Christophe Leroy wrote:
>> g1() should return 3, not 5.
> 
> What makes you say that?

What makes me say that is that NULL is obviously a constant pointer and 
I think we are all expecting gcc to see it as a constant during kernel 
build, ie at -O2

> 
> "A return of 0 does not indicate that the
>   value is _not_ a constant, but merely that GCC cannot prove it is a
>   constant with the specified value of the '-O' option."
> 
> (And the rules it uses for this are *not* the same as C "constant
> expressions" or C "integer constant expression" or C "arithmetic
> constant expression" or anything like that -- which should be already
> obvious from that it changes with different -Ox).
> 
> You can use builtin_constant_p to have the compiler do something better
> if the compiler feels like it, but not anything more.  Often people
> want stronger guarantees, but when they see how much less often it then
> returns "true", they do not want that either.
> 

in asm/book3s/64/kup-radix.h we have:

static inline void allow_user_access(void __user *to, const void __user 
*from,
				     unsigned long size)
{
	// This is written so we can resolve to a single case at build time
	if (__builtin_constant_p(to) && to == NULL)
		set_kuap(AMR_KUAP_BLOCK_WRITE);
	else if (__builtin_constant_p(from) && from == NULL)
		set_kuap(AMR_KUAP_BLOCK_READ);
	else
		set_kuap(0);
}

and in asm/kup.h we have:

static inline void allow_read_from_user(const void __user *from, 
unsigned long size)
{
	allow_user_access(NULL, from, size);
}

static inline void allow_write_to_user(void __user *to, unsigned long size)
{
	allow_user_access(to, NULL, size);
}


If GCC doesn't see NULL as a constant, then the above doesn't work as 
expected.

What's surprising and frustrating is that if you remove the 
__builtin_constant_p() and only leave the NULL check, then GCC sees it 
as a constant and drops the other leg.

So if we remove the __builtin_constant_p(to) and leave only the (to == 
NULL), it will work as expected for allow_read_from_user(). But for the 
others where (to) is not a constant, the NULL test will remain together 
with the associated leg.

Christophe
