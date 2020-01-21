Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CB144322
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 18:24:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482Flq3tC9zDqRn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 04:24:55 +1100 (AEDT)
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
 header.s=mail header.b=gFTk7nIS; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482Fjm1gQLzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 04:23:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482FjS293hz9v1S7;
 Tue, 21 Jan 2020 18:22:52 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gFTk7nIS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1oAV2srf0Lba; Tue, 21 Jan 2020 18:22:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482FjS108jz9v1S6;
 Tue, 21 Jan 2020 18:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579627372; bh=sMXDwBt01Cd62ThXPHiPled8Rp8cKUezeik7kezRUaM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gFTk7nISCQ6YwsCKDldBxyRo17VC7Hwqw3vyPk4sgmpHuazFD4jPGwVeCNwEOB0d5
 Yx9uk840B7OHaR+LWAKROZLvdNjI5p+YMY1m72edZxhkBhjzjXAoF5WGg6tYJ0bGZD
 4LDwC4Pm55Z4zK4eLh3yHS28M9G8E7TWNFdKao+I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE1B28B7E6;
 Tue, 21 Jan 2020 18:22:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lslBuyCx9qG5; Tue, 21 Jan 2020 18:22:53 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB55A8B776;
 Tue, 21 Jan 2020 18:22:52 +0100 (CET)
Subject: GCC bug ? Re: [PATCH v2 10/10] powerpc/32s: Implement Kernel
 Userspace Access Protection
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, ruscur@russell.cc,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <cover.1552292207.git.christophe.leroy@c-s.fr>
 <a2847248a92cb1641b1740fa121c5a30593ae662.1552292207.git.christophe.leroy@c-s.fr>
 <87ftqfu7j1.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a008a182-f1db-073c-7d38-27bfd1fd8676@c-s.fr>
Date: Tue, 21 Jan 2020 17:22:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87ftqfu7j1.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 04/18/2019 06:55 AM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
>> index 5f97c742ca71..b3560b2de435 100644
>> --- a/arch/powerpc/include/asm/book3s/32/kup.h
>> +++ b/arch/powerpc/include/asm/book3s/32/kup.h
>> @@ -37,6 +37,113 @@
> ...
>> +
>> +static inline void allow_user_access(void __user *to, const void __user *from, u32 size)
>> +{
>> +	u32 addr = (__force u32)to;
>> +	u32 end = min(addr + size, TASK_SIZE);
>> +
>> +	if (!addr || addr >= TASK_SIZE || !size)
>> +		return;
>> +
>> +	current->thread.kuap = (addr & 0xf0000000) | ((((end - 1) >> 28) + 1) & 0xf);
>> +	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
>> +}
> 
> When rebasing on my v6 I changed the above to:
> 
> static inline void allow_user_access(void __user *to, const void __user *from, u32 size)
> {
> 	u32 addr, end;
> 
> 	if (__builtin_constant_p(to) && to == NULL)
> 		return;

Look like the above doesn't work: gcc bug ?

#define NULL (void*)0

static inline int f1(void *to)
{
	if (__builtin_constant_p(to) && to == NULL)
		return 3;
	return 5;
}

int g1(void)
{
	return f1(NULL);
}

static inline int f2(int x)
{
	if (__builtin_constant_p(x) && x == 0)
		return 7;
	return 9;
}

int g2(void)
{
	return f2(0);
}



toto.o:     file format elf32-powerpc


Disassembly of section .text:

00000000 <g1>:
    0:	38 60 00 05 	li      r3,5
    4:	4e 80 00 20 	blr

00000008 <g2>:
    8:	38 60 00 07 	li      r3,7
    c:	4e 80 00 20 	blr



It works for the int const, but not for the pointer const:

g1() should return 3, not 5. GCC bug ?

Christophe
