Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F219AB31F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 11:07:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rlRm2qYrzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 19:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="pyuBfUOk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rlQ16mX3zDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 19:05:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44rlPs0MGhz9vDcL;
 Sat, 27 Apr 2019 11:05:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pyuBfUOk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YwkOYqnif-yh; Sat, 27 Apr 2019 11:05:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44rlPr6C96z9vDc4;
 Sat, 27 Apr 2019 11:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556355936; bh=Ewt7eba65BXhOJQIAeU/NIVbT7mlrUrQQ4w1hnEQR/Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pyuBfUOkc8+qieOa12yYUzKUTXDUbkUgJgkGKx/w/zgFdTjnptYFmybnSP4ddXqdR
 gJxi40J3AIzbVUTYm/TvhoFQZDxt1uQDAucytvG3pcjqiQ+Hta8aZn+arOPL1U/qjU
 rezg55n4AjBEjQ7lDr0RD5Nw94STxySOUR/2YIkg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F09888B75A;
 Sat, 27 Apr 2019 11:05:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s719m5IlrBTr; Sat, 27 Apr 2019 11:05:37 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CDD08B881;
 Sat, 27 Apr 2019 11:05:37 +0200 (CEST)
Subject: Re: BUG: crash in __tlb_remove_page_size with STRICT_KERNEL_RWX on
 BOOK3S_32
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <87pnp9mknl.fsf@depni.sinp.msu.ru>
 <db886597-8867-93e6-a507-6da4963ce0bd@c-s.fr>
 <878svwn85h.fsf@depni.sinp.msu.ru> <20190426170700.GD8599@gate.crashing.org>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <ecaa5b02-634e-79e5-e7f0-cc80050c58fc@c-s.fr>
Date: Sat, 27 Apr 2019 11:05:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426170700.GD8599@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190426-4, 26/04/2019), Outbound message
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 26/04/2019 à 19:07, Segher Boessenkool a écrit :
> On Fri, Apr 26, 2019 at 05:38:50PM +0300, Serge Belyshev wrote:
>> ---[ Instruction Block Address Translation ]---
>> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel EXEC coherent
>> 1: 0xc0800000-0xc087ffff 0x00800000 Kernel EXEC coherent
>> 2:         -
>> 3:         -
>> 4:         -
>> 5:         -
>> 6:         -
>> 7:         -
>>
>> ---[ Data Block Address Translation ]---
>> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
>> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
>> 2: 0xc0c00000-0xc13fffff 0x00c00000 Kernel RW coherent
>> 3: 0xc1400000-0xc23fffff 0x01400000 Kernel RW coherent
>> 4: 0xc2400000-0xc43fffff 0x02400000 Kernel RW coherent
>> 5: 0xc4400000-0xc83fffff 0x04400000 Kernel RW coherent
>> 6: 0xc8400000-0xd03fffff 0x08400000 Kernel RW coherent
>> 7: 0xd0400000-0xe03fffff 0x10400000 Kernel RW coherent
> 
> The starting address of a BAT block is always aligned to the block size.
> All of DBAT2..DBAT7 are wrong?
> 

Obviously function block_size() returns a wrong result, I'll try and fix 
that early next week.

Christophe

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

