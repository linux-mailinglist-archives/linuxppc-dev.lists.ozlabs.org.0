Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8410BF5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:23:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vQGP62DfzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 03:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dNFlA7q+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vQF24T19zDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 03:22:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vQDv2VRLz9tyc2;
 Wed,  1 May 2019 19:22:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dNFlA7q+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id InMtWq2E-DNV; Wed,  1 May 2019 19:22:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vQDv1Rlxz9tybh;
 Wed,  1 May 2019 19:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556731327; bh=P+ycD4GZ6KQ1BUKCv6VtK/4BHfP/mJbbQKvt313twl8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dNFlA7q+L3AUpX1FPbXjlvyXrkKoTPNPVmqPEu1AZxaF47kLmQoiAHYJWDTdEqeeY
 OqLMsekNdjBkK3IaPX3BwfKLDJj/oaY8dKB5zA7LSYsBdjglEVtP8y+Z96EbAuRa1z
 faemrRGFe5Rvhfesl97Rn8XF59+XQ714ce3b2fzk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E49368B84C;
 Wed,  1 May 2019 19:22:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t2ZbW3fjtIaX; Wed,  1 May 2019 19:22:08 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BE8B8B74C;
 Wed,  1 May 2019 19:22:08 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/32s: fix BATs setting with
 CONFIG_STRICT_KERNEL_RWX
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <09733bd9d90f2ab9dfee9838442e0bea01df194d.1556640535.git.christophe.leroy@c-s.fr>
 <878svrat7x.fsf@concordia.ellerman.id.au>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <47f3caee-510b-a95c-cf08-013a282141b6@c-s.fr>
Date: Wed, 1 May 2019 19:22:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <878svrat7x.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190501-4, 01/05/2019), Outbound message
X-Antivirus-Status: Clean
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



Le 01/05/2019 à 02:55, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Serge reported some crashes with CONFIG_STRICT_KERNEL_RWX enabled
>> on a book3s32 machine.
>>
>> Analysis shows two issues:
>> - BATs addresses and sizes are not properly aligned.
>> - There is a gap between the last address covered by BATs and the
>> first address covered by pages.
>>
>> Memory mapped with DBATs:
>> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
>> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
>> 2: 0xc0c00000-0xc13fffff 0x00c00000 Kernel RW coherent
>> 3: 0xc1400000-0xc23fffff 0x01400000 Kernel RW coherent
>> 4: 0xc2400000-0xc43fffff 0x02400000 Kernel RW coherent
>> 5: 0xc4400000-0xc83fffff 0x04400000 Kernel RW coherent
>> 6: 0xc8400000-0xd03fffff 0x08400000 Kernel RW coherent
>> 7: 0xd0400000-0xe03fffff 0x10400000 Kernel RW coherent
>>
>> Memory mapped with pages:
>> 0xe1000000-0xefffffff  0x21000000       240M        rw       present           dirty  accessed
>>
>> This patch fixes both issues. With the patch, we get the following
>> which is as expected:
>>
>> Memory mapped with DBATs:
>> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
>> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
>> 2: 0xc0c00000-0xc0ffffff 0x00c00000 Kernel RW coherent
>> 3: 0xc1000000-0xc1ffffff 0x01000000 Kernel RW coherent
>> 4: 0xc2000000-0xc3ffffff 0x02000000 Kernel RW coherent
>> 5: 0xc4000000-0xc7ffffff 0x04000000 Kernel RW coherent
>> 6: 0xc8000000-0xcfffffff 0x08000000 Kernel RW coherent
>> 7: 0xd0000000-0xdfffffff 0x10000000 Kernel RW coherent
>>
>> Memory mapped with pages:
>> 0xe0000000-0xefffffff  0x20000000       256M        rw       present           dirty  accessed
>>
>> Reported-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
>> Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
>> Cc: stable@vger.kernel.org
> 
> I could probably still get this into v5.1 if you're confident it's a
> good fix.

If possible it would be great.

Yes I'm confident it is a good fix:
- The fix has no impact on the configurations I tested originally (they 
were lacking a trailing area not mapped with BATs and the boundarie 
between RW and RO was a power of 2 so ffs() returned the same as lfs())
- The fix was tested by myself on QEMU.
- The fix was tested by Serge.
- The fix was acked by Segher.
- The fix make sense (ie ffs() is the good one, fls() was definitly wrong)

Christophe

> 
> cheers
> 

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

