Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7180B1BE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 13:01:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VCPQ10m2zF5PS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 21:01:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ZMxtNP3u"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VCMG12g3zF3F2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 20:59:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46VCM86DMLz9tykB;
 Fri, 13 Sep 2019 12:59:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZMxtNP3u; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nFZiyoqF3F_M; Fri, 13 Sep 2019 12:59:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46VCM854bqz9tyk9;
 Fri, 13 Sep 2019 12:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568372372; bh=PFT2imOGaHgvctcTYuVwoMHpMQBOPw/fM32Pu9Q/A5I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZMxtNP3udpntKBpuh9VLJh+f+N+9ucXH19eM2oHhwPzKZED1+FYZoTdaHiSPEKS8c
 +Uq4KUGDPyQvva3HWfPVEw7omeVxY3wUy4UuX/Gimy7XPpFOcjkQibpmfb8MFxElIB
 O7Np2Zi50vPPkPhKPAqNaZfpvxccexmeWo5bRhiE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA20D8B987;
 Fri, 13 Sep 2019 12:59:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 56Gk8pTuWhWo; Fri, 13 Sep 2019 12:59:33 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C99078B958;
 Fri, 13 Sep 2019 12:59:33 +0200 (CEST)
Subject: Re: [PATCH v2 4/8] powerpc/vdso32: inline __get_datapage()
To: Santosh Sivaraj <santosh@fossix.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
 <194fb7bc973ef2ce43016c97dd32f2b2dcbae4e7.1566491310.git.christophe.leroy@c-s.fr>
 <87h864iiq9.fsf@santosiv.in.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a95c4a58-bc59-3e75-46db-414f6d0f1412@c-s.fr>
Date: Fri, 13 Sep 2019 12:59:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87h864iiq9.fsf@santosiv.in.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Santosh,

Le 26/08/2019 à 07:44, Santosh Sivaraj a écrit :
> Hi Christophe,
> 
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> __get_datapage() is only a few instructions to retrieve the
>> address of the page where the kernel stores data to the VDSO.
>>
>> By inlining this function into its users, a bl/blr pair and
>> a mflr/mtlr pair is avoided, plus a few reg moves.
>>
>> The improvement is noticeable (about 55 nsec/call on an 8xx)
>>
>> vdsotest before the patch:
>> gettimeofday:    vdso: 731 nsec/call
>> clock-gettime-realtime-coarse:    vdso: 668 nsec/call
>> clock-gettime-monotonic-coarse:    vdso: 745 nsec/call
>>
>> vdsotest after the patch:
>> gettimeofday:    vdso: 677 nsec/call
>> clock-gettime-realtime-coarse:    vdso: 613 nsec/call
>> clock-gettime-monotonic-coarse:    vdso: 690 nsec/call
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/kernel/vdso32/cacheflush.S   | 10 +++++-----
>>   arch/powerpc/kernel/vdso32/datapage.S     | 29 ++++-------------------------
>>   arch/powerpc/kernel/vdso32/datapage.h     | 11 +++++++++++
>>   arch/powerpc/kernel/vdso32/gettimeofday.S | 13 ++++++-------
>>   4 files changed, 26 insertions(+), 37 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/vdso32/datapage.h
> 
> The datapage.h file should ideally be moved under include/asm, then we can use
> the same for powerpc64 too.

I have a more ambitious project indeed.

Most of the VDSO code is duplicated between vdso32 and vdso64. I'm 
aiming at merging everything into a single source code.

This means we would have to generate vdso32.so and vdso64.so out of the 
same source files. Any idea on how to do that ? I'm not too good at 
creating Makefiles. I guess we would have everything in 
arch/powerpc/kernel/vdso/ and would have to build the objects twice, 
once in arch/powerpc/kernel/vdso32/ and once in arch/powerpc/kernel/vdso64/

Christophe
