Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F71150E92
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 18:21:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BF4152HSzDqBc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 04:21:37 +1100 (AEDT)
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
 header.s=mail header.b=TBfGDlMp; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDyW69nDzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 04:16:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48BDyM0Gd0z9vC0j;
 Mon,  3 Feb 2020 18:16:43 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TBfGDlMp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L2EgvSc5tJns; Mon,  3 Feb 2020 18:16:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48BDyL5k3bz9vC0h;
 Mon,  3 Feb 2020 18:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580750202; bh=CbGM+lhkMhDFeqH22kN9rGKdr+DO5kF57vrZYdUevkk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TBfGDlMpIs3iBnu1efmB/bvuM3U13ivka5Z4Mm2uZgaA1D0UVGDvJV0N5HTaaM+JN
 QBGASI28LFCqKPYZ5HGxOyKfb42DgiIxn0G+TFQx9n9IR+CT9iaWKsVDl0y8lNiplc
 pBDzIisDVtmnHs4n6EKOXL7Msf97rs+MltEXZ/wE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 21B988B7B5;
 Mon,  3 Feb 2020 18:16:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZylV4ap6PF-H; Mon,  3 Feb 2020 18:16:48 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3BFA8B7AC;
 Mon,  3 Feb 2020 18:16:47 +0100 (CET)
Subject: Re: [PATCH] powerpc/32s: Slenderize _tlbia() for powerpc 603/603e
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "paulus@samba.org" <paulus@samba.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
References: <12f4f4f0ff89aeab3b937fc96c84fb35e1b2517e.1580748445.git.christophe.leroy@c-s.fr>
 <bfab6635148b83deed8ac9fcbb19dde8c32fb988.camel@infinera.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5771d787-67f5-f29c-2a9e-0ea7194cffa1@c-s.fr>
Date: Mon, 3 Feb 2020 18:16:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <bfab6635148b83deed8ac9fcbb19dde8c32fb988.camel@infinera.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/02/2020 à 17:57, Joakim Tjernlund a écrit :
> On Mon, 2020-02-03 at 16:47 +0000, Christophe Leroy wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> _tlbia() is a function used only on 603/603e core, ie on CPUs which
>> don't have a hash table.
>>
>> _tlbia() uses the tlbia macro which implements a loop of 1024 tlbie.
>>
>> On the 603/603e core, flushing the entire TLB requires no more than
>> 32 tlbie.
>>
>> Replace tlbia by a loop of 32 tlbie.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/mm/book3s32/hash_low.S | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
>> index c11b0a005196..a5039ad10429 100644
>> --- a/arch/powerpc/mm/book3s32/hash_low.S
>> +++ b/arch/powerpc/mm/book3s32/hash_low.S
>> @@ -696,18 +696,21 @@ _GLOBAL(_tlbia)
>>          bne-    10b
>>          stwcx.  r8,0,r9
>>          bne-    10b
>> +#endif /* CONFIG_SMP */
>> +       li      r5, 32
>> +       lis     r4, KERNELBASE@h
>> +       mtctr   r5
>>          sync
>> -       tlbia
>> +0:     tlbie   r4
>> +       addi    r4, r4, 0x1000
> 
> Is page size always 4096 here or does it not matter ?

603 and its derivatives (G2, e300, ...) only support 4k pages.

And regardless, the reference manual says:

The tlbia instruction is not implemented on the MPC603e and when its 
opcode is encountered, an illegal instruction program exception is 
generated. To invalidate all entries of both TLBs, 32 tlbie instructions 
must be executed, incrementing the value in EA[15–19] by 1 each time

Christophe
