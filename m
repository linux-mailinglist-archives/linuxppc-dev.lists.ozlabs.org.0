Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C621478CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 08:05:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483qt03tFvzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 18:05:44 +1100 (AEDT)
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
 header.s=mail header.b=AmfhqxCL; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483qqd4FrHzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 18:03:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483qqX1ywTz9tyWR;
 Fri, 24 Jan 2020 08:03:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AmfhqxCL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1MTHMFIssLu8; Fri, 24 Jan 2020 08:03:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483qqW6WN3z9tyWM;
 Fri, 24 Jan 2020 08:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579849415; bh=ITaOlJ0/QZZrDkYtjFjngyVQpAL/zHUltBD1tC8H/AY=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=AmfhqxCLvYIIarRc5Sj6TqXdi78MZxs1FJIy8UehPMFzYNeRnkGrPgkHJmGwOZujp
 owUVkiZjvW4DtF3OJ28hx/nh5NlUgcag9iG4v4NCT7B8lTB0CRmNtoha0qps7OzE/o
 r00NWOLgPqUZvtDLxJJmjEqEg7OEz6W6rUUx14n8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BBC498B83D;
 Fri, 24 Jan 2020 08:03:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JdtNjI8kHPZZ; Fri, 24 Jan 2020 08:03:36 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AE098B768;
 Fri, 24 Jan 2020 08:03:36 +0100 (CET)
Subject: Re: [PATCH 1/2] powerpc/irq: don't use current_stack_pointer() in
 check_stack_overflow()
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <bae3e75a0c7f9037e4012ee547842c04cd527931.1575871613.git.christophe.leroy@c-s.fr>
 <87d0b9iez3.fsf@mpe.ellerman.id.au>
 <f4196f83-82ac-4df0-8c15-267a2c6c07ba@c-s.fr>
Message-ID: <74cb4227-1a24-6fe1-2df4-3d4b069453c4@c-s.fr>
Date: Fri, 24 Jan 2020 07:03:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f4196f83-82ac-4df0-8c15-267a2c6c07ba@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 01/24/2020 06:19 AM, Christophe Leroy wrote:
> 
> 
> Le 24/01/2020 à 06:46, Michael Ellerman a écrit :
>>
>> If I do this it seems to work, but feels a little dicey:
>>
>>     asm ("" : "=r" (r1));
>>     sp = r1 & (THREAD_SIZE - 1);
> 
> 
> Or we could do add in asm/reg.h what we have in boot/reg.h:
> 
> register void *__stack_pointer asm("r1");
> #define get_sp()    (__stack_pointer)
> 
> And use get_sp()
> 

It works, and I guess doing it this way is acceptable as it's exactly 
what's done for current in asm/current.h with register r2.

Now I (still) get:

	sp = get_sp() & (THREAD_SIZE - 1);
  b9c:	54 24 04 fe 	clrlwi  r4,r1,19
	if (unlikely(sp < 2048)) {
  ba4:	2f 84 07 ff 	cmpwi   cr7,r4,2047





Allthough GCC 8.1 what doing exactly the same with the form CLANG don't 
like:

	register unsigned long r1 asm("r1");
	long sp = r1 & (THREAD_SIZE - 1);
  b84:	54 24 04 fe 	clrlwi  r4,r1,19
	if (unlikely(sp < 2048)) {
  b8c:	2f 84 07 ff 	cmpwi   cr7,r4,2047


Christophe
