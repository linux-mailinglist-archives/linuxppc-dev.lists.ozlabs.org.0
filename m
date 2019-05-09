Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A10188FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 13:29:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450B2L2SBHzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 21:29:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="SY9KuSHm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450B0g2l0KzDq5y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 21:28:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 450B0X4Z0Xz9v114;
 Thu,  9 May 2019 13:27:56 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SY9KuSHm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YU_cHU7ABhH9; Thu,  9 May 2019 13:27:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 450B0X3SDxz9v10f;
 Thu,  9 May 2019 13:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557401276; bh=te5Ea9Nu7fIuisOgqijviIon2+QUqVw422cO21j19e8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SY9KuSHmnrVh2Yoqk8T/eCt5yHV5/NpWi6CRNnujTHOhKVF3ddsxyof+YRlucevjn
 mr1IY0uPe088P/n1iLq5V2QRJNuJEKH+pB3Tlgi5VPekRTQxWYuE9ncek1jbTFYkQN
 pjBh+r7J8axOCTugpg+JoO8Bz7BmjLyEbLqTcTE0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C265E8B913;
 Thu,  9 May 2019 13:27:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OYNhdwwfftva; Thu,  9 May 2019 13:27:57 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5555E8B90D;
 Thu,  9 May 2019 13:27:57 +0200 (CEST)
Subject: Re: [PATCH] powerpc/ftrace: Enable C Version of recordmcount
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <4464516c0b6835b42acc65e088b6d7f88fe886f2.1557235811.git.christophe.leroy@c-s.fr>
 <87ef59wz8n.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1a731776-2b9f-ae62-c858-cfd22923f03a@c-s.fr>
Date: Thu, 9 May 2019 13:27:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87ef59wz8n.fsf@concordia.ellerman.id.au>
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



Le 08/05/2019 à 02:45, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Selects HAVE_C_RECORDMCOUNT to use the C version of the recordmcount
>> intead of the old Perl Version of recordmcount.
>>
>> This should improve build time. It also seems like the old Perl Version
>> misses some calls to _mcount that the C version finds.
> 
> That would make this a bug fix possibly for stable even.
> 
> Any more details on what the difference is, is it just some random
> subset of functions or some pattern?

I have not been able to identify any pattern. Will add a few details in 
the 'issue' on github.

Christophe

> 
> cheers
> 
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 2711aac24621..d87de4f9da61 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -180,6 +180,7 @@ config PPC
>>   	select HAVE_ARCH_NVRAM_OPS
>>   	select HAVE_ARCH_SECCOMP_FILTER
>>   	select HAVE_ARCH_TRACEHOOK
>> +	select HAVE_C_RECORDMCOUNT
>>   	select HAVE_CBPF_JIT			if !PPC64
>>   	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
>>   	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
>> -- 
>> 2.13.3
