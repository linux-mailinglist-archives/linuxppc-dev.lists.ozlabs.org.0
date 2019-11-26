Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF0109AA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 10:03:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MdH368phzDqYb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 20:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="SWnUau61"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MdDn21hnzDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 20:01:27 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47MdDf6sVfz9tycG;
 Tue, 26 Nov 2019 10:01:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SWnUau61; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QxTVwnd9ys7n; Tue, 26 Nov 2019 10:01:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47MdDf5pKzz9tycC;
 Tue, 26 Nov 2019 10:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574758882; bh=U9V+RbsOlne0cDu4/Cs4Z/0IfVOfKQcJt4tUL3ne7Ao=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SWnUau61xntSe6pletc1YrYHkkny/RR6BAJeY++1dikgh8DEpCAKFsozUypRHeMKt
 fQLOIrTW/PHNIGVQgEDT2gPF/x5D04qbOft8iuQzLtW4wjibrAZx8t0dlIQmff5Ehk
 pkUZYWIjK7WQEO04FO0PSx0bgQKnaKTtn6vQzfDc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9FEB8B7E6;
 Tue, 26 Nov 2019 10:01:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IBBgv0SfDZqq; Tue, 26 Nov 2019 10:01:23 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 22A0F8B7E5;
 Tue, 26 Nov 2019 10:01:23 +0100 (CET)
Subject: Re: [PATCH v3 15/15] powerpc/32s: Activate CONFIG_VMAP_STACK
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com, dja@axtens.net
References: <cover.1568106758.git.christophe.leroy@c-s.fr>
 <a99bdfb64e287b16b8cd3f7ec1abfdfb50c7cc64.1568106758.git.christophe.leroy@c-s.fr>
 <875zjgcpyx.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f3074852-ef83-5426-9928-f0201f704b49@c-s.fr>
Date: Tue, 26 Nov 2019 10:01:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <875zjgcpyx.fsf@mpe.ellerman.id.au>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/11/2019 à 07:58, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> A few changes to retrieve DAR and DSISR from struct regs
>> instead of retrieving them directly, as they may have
>> changed due to a TLB miss.
>>
>> Also modifies hash_page() and friends to work with virtual
>> data addresses instead of physical ones.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/kernel/entry_32.S         |  4 +++
>>   arch/powerpc/kernel/head_32.S          | 19 +++++++++++---
>>   arch/powerpc/kernel/head_32.h          |  4 ++-
>>   arch/powerpc/mm/book3s32/hash_low.S    | 46 +++++++++++++++++++++-------------
>>   arch/powerpc/mm/book3s32/mmu.c         |  9 +++++--
>>   arch/powerpc/platforms/Kconfig.cputype |  2 ++
>>   6 files changed, 61 insertions(+), 23 deletions(-)
> 
> This is faulting with qemu mac99 model:
> 
>    Key type id_resolver registered
>    Key type id_legacy registered
>    BUG: Unable to handle kernel data access on read at 0x2f0db684
>    Faulting instruction address: 0x00004130
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    BE PAGE_SIZE=4K MMU=Hash PowerMac
>    Modules linked in:
>    CPU: 0 PID: 65 Comm: modprobe Not tainted 5.4.0-rc2-gcc49+ #63
>    NIP:  00004130 LR: 000008c8 CTR: b7eb86e0

Problem found, that's in load_up_fpu(), have to apply tovirt() to the 
address read from SPRN_SPRG_THREAD. Same problem in load_up_altivec().
I'll fix that in v4 today.

Christophe
