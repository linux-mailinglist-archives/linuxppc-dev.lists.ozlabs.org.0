Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FC140603
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 10:28:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zbN12p95zDqpg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 20:28:33 +1100 (AEDT)
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
 header.s=mail header.b=i9BMvz3E; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zbLN4h7dzDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 20:27:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47zbL80nqyzB09b7;
 Fri, 17 Jan 2020 10:26:56 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=i9BMvz3E; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SBcmuNiYkyF6; Fri, 17 Jan 2020 10:26:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47zbL76pYtzB09b5;
 Fri, 17 Jan 2020 10:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579253216; bh=9zDNZlzTkeycpSWCb0TYhvoG++VQ0gIX3RE4mUEvdOg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i9BMvz3Et5VUQDFvPy+FmGSkBzSFXqfiloNAGK6ETWirQC9BSIX++qp5CDw2aZert
 7ZvsFo1ljH6SQeneQhVz/i5r8XjA4pPDw6RSVCjw8z88fAGEB5eOFuEaHhNOp6Saa6
 njr+TNa2sSfV/s65M9dLdazSTLW/6PBL5xvi/9Nc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F18298B83E;
 Fri, 17 Jan 2020 10:26:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QrD_JOibNVgE; Fri, 17 Jan 2020 10:26:56 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C07418B83B;
 Fri, 17 Jan 2020 10:26:56 +0100 (CET)
Subject: Re: [RFC PATCH v4 00/11] powerpc: switch VDSO to C implementation.
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <20200117085851.GS3191@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <345e2772-cde9-7d86-874e-347db1453c80@c-s.fr>
Date: Fri, 17 Jan 2020 10:26:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117085851.GS3191@gate.crashing.org>
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
Cc: nathanl@linux.ibm.com, arnd@arndb.de, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, tglx@linutronix.de,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/01/2020 à 09:58, Segher Boessenkool a écrit :
> Hi!
> 
> On Thu, Jan 16, 2020 at 05:58:24PM +0000, Christophe Leroy wrote:
>> On a powerpc8xx, with current powerpc/32 ASM VDSO:
>>
>> gettimeofday:    vdso: 907 nsec/call
>> clock-getres-realtime:    vdso: 484 nsec/call
>> clock-gettime-realtime:    vdso: 899 nsec/call
>>
>> The first patch adds VDSO generic C support without any changes to common code.
>> Performance is as follows:
>>
>> gettimeofday:    vdso: 1211 nsec/call
>> clock-getres-realtime:    vdso: 722 nsec/call
>> clock-gettime-realtime:    vdso: 1216 nsec/call
>>
>> Then a few changes in the common code have allowed performance improvement. At
>> the end of the series we have:
>>
>> gettimeofday:    vdso: 974 nsec/call
>> clock-getres-realtime:    vdso: 545 nsec/call
>> clock-gettime-realtime:    vdso: 941 nsec/call
>>
>> The final result is rather close to pure ASM VDSO:
>> * 7% more on gettimeofday (9 cycles)
>> * 5% more on clock-gettime-realtime (6 cycles)
>> * 12% more on clock-getres-realtime (8 cycles)
> 
> Nice!  Much better.
> 
> It should be tested on more representative hardware, too, but this looks
> promising alright :-)
> 

Yes.

Now the challenge is to get VDSO32 buildable on PPC64. The big issue is 
that in most powerpc/include/asm/*.h , CONFIG_PPC64 is used to know if 
the build is a 64 bits build or a 32 bits build, so VDSO32 build fails.

I don't know how this could be easily fixed.

Christophe
