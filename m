Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D741CC282
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 17:56:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KBd75880zDqHf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 01:56:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KBbD65dSzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 01:54:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49KBb73l86z9v0Zm;
 Sat,  9 May 2020 17:54:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hhT93JtYMSPR; Sat,  9 May 2020 17:54:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49KBb72sdxz9v2CW;
 Sat,  9 May 2020 17:54:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 91C698B775;
 Sat,  9 May 2020 17:54:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QdzKxSQXGUVx; Sat,  9 May 2020 17:54:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6232E8B75F;
 Sat,  9 May 2020 17:54:28 +0200 (CEST)
Subject: Re: [PATCH v8 8/8] powerpc/vdso: Provide __kernel_clock_gettime64()
 on vdso32
To: Arnd Bergmann <arnd@arndb.de>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <e78344d3fcc1d33bfb1782e430b7f0529f6c612f.1588079622.git.christophe.leroy@c-s.fr>
 <CAK8P3a2aXJRWjxWO8oMRX2AJkfeVeeoYbOPbpd9-UTgjqM4B7g@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d3f303f1-8b2c-0c54-5380-0b9a370a4eb3@csgroup.eu>
Date: Sat, 9 May 2020 17:54:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2aXJRWjxWO8oMRX2AJkfeVeeoYbOPbpd9-UTgjqM4B7g@mail.gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/04/2020 à 18:05, Arnd Bergmann a écrit :
> On Tue, Apr 28, 2020 at 3:16 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> Provides __kernel_clock_gettime64() on vdso32. This is the
>> 64 bits version of __kernel_clock_gettime() which is
>> y2038 compliant.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> Looks good to me
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> There was a bug on ARM for the corresponding function, so far it is unclear
> if this was a problem related to particular hardware, the 32-bit kernel code,
> or the common implementation of clock_gettime64 in the vdso library,
> see https://github.com/richfelker/musl-cross-make/issues/96
> 
> Just to be sure that powerpc is not affected by the same issue, can you
> confirm that repeatedly calling clock_gettime64 on powerpc32, alternating
> between vdso and syscall, results in monotically increasing times?
> 

I think that's one of the things vdsotest checks, so yes that's ok I think.

Christophe
