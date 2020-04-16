Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 318CA1AC20F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 15:08:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49300C6xMyzDrgR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 23:08:27 +1000 (AEST)
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
 header.s=mail header.b=c8TasGQY; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492zPn1WXpzDrbj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 22:42:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492zPh13xMz9tyrG;
 Thu, 16 Apr 2020 14:42:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=c8TasGQY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aVjCzTv4DTiP; Thu, 16 Apr 2020 14:42:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492zPh01qQz9tylm;
 Thu, 16 Apr 2020 14:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587040920; bh=2ljz1nBL0vCUAzYsmnWMgAQ1qstKSVseeRiTlYNCisw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c8TasGQY5NCkEsCb/sMMNlOMPh5/phE1iiPq1mCNdcnugijQ+I3aJvCt6VHWD9FvA
 kwM+raumBoqTBRoapNS1cNvXLqt/zyb63lIWK7MOYT0e2kc7WBbjY2Ntc8XlrjEOsZ
 Nj5J4t1ahc5l8MRIVgmEBDiiv/TrlsK+J7Os54gw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 874B68BBCF;
 Thu, 16 Apr 2020 14:42:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id A-kyLt3tW5FA; Thu, 16 Apr 2020 14:42:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BBC78BB88;
 Thu, 16 Apr 2020 14:42:00 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <c9abd91e9bb0b3dd6e3470015e92b98bc2483780.1586942304.git.christophe.leroy@c-s.fr>
 <20200415223747.GX26902@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f797e5ac-a29a-0eb0-89c8-ff0a9f537ccf@c-s.fr>
Date: Thu, 16 Apr 2020 14:41:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415223747.GX26902@gate.crashing.org>
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



Le 16/04/2020 à 00:37, Segher Boessenkool a écrit :
> Hi!
> 
> On Wed, Apr 15, 2020 at 09:25:59AM +0000, Christophe Leroy wrote:
>> +#define __put_user_goto(x, ptr, label) \
>> +	__put_user_nocheck_goto((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), label)
> 
> This line gets too long, can you break it up somehow?

This line has 86 chars.

powerpc arch tolerates lines with up to 90 chars, see 
arch/powerpc/tools/checkpatch.sh

> 
>> +#define __put_user_asm_goto(x, addr, label, op)			\
>> +	asm volatile goto(					\
>> +		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
>> +		EX_TABLE(1b, %l2)				\
>> +		:						\
>> +		: "r" (x), "m" (*addr)				\
>> +		:						\
>> +		: label)
> 
> Same "%Un" problem as in the other patch.  You could use "m<>" here,
> but maybe just dropping "%Un" is better.

Ok.

I kept it to be consistent with the other patch.

> 
>> +#ifdef __powerpc64__
>> +#define __put_user_asm2_goto(x, ptr, label)			\
>> +	__put_user_asm_goto(x, ptr, label, "std")
>> +#else /* __powerpc64__ */
>> +#define __put_user_asm2_goto(x, addr, label)			\
>> +	asm volatile goto(					\
>> +		"1:	stw%U1%X1 %0, %1\n"			\
>> +		"2:	stw%U1%X1 %L0, %L1\n"			\
>> +		EX_TABLE(1b, %l2)				\
>> +		EX_TABLE(2b, %l2)				\
>> +		:						\
>> +		: "r" (x), "m" (*addr)				\
>> +		:						\
>> +		: label)
>> +#endif /* __powerpc64__ */
> 
> Here, you should drop it for sure.

Done.

Christophe
