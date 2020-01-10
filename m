Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A61367A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 07:47:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vD7T5157zDqcv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 17:47:33 +1100 (AEDT)
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
 header.s=mail header.b=ueN7Vpxn; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vD5d0RZczDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 17:45:54 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47vD5S13wRz9v3tv;
 Fri, 10 Jan 2020 07:45:48 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ueN7Vpxn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Av3l7EVHXBCa; Fri, 10 Jan 2020 07:45:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47vD5R6Z0Hz9v3tj;
 Fri, 10 Jan 2020 07:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578638747; bh=5TApiD5N/34vXaM+pQ7UUlq0/+wq9o7jjNc+pK8cRCg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ueN7VpxnzBcnWuZoF/iIk0abFzI/Og6E2TcMJ9xPs+8bq1JLbuwjMI10oN+xH1GW4
 DzTR5wk+czh2b56nyJo+0UKVXRL7LBJYds2dWPvb77f70oXNepmKK0hmzElSjKYQPC
 5TkwvFKiglrjZkvvPDDUdnzAbqHeggFMFpJlVGmE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C0BAF8B77D;
 Fri, 10 Jan 2020 07:45:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7nJRtiLkHgXr; Fri, 10 Jan 2020 07:45:48 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C2CD8B755;
 Fri, 10 Jan 2020 07:45:45 +0100 (CET)
Subject: Re: Surprising code generated for vdso_read_begin()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
Date: Fri, 10 Jan 2020 07:45:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109200733.GS3191@gate.crashing.org>
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
Cc: arnd@arndb.de, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/01/2020 à 21:07, Segher Boessenkool a écrit :
> On Thu, Jan 09, 2020 at 05:52:34PM +0000, Christophe Leroy wrote:
>> Wondering why we get something so complicated/redundant for
>> vdso_read_begin() <include/vdso/helpers.h>
>>
>> static __always_inline u32 vdso_read_begin(const struct vdso_data *vd)
>> {
>> 	u32 seq;
>>
>> 	while ((seq = READ_ONCE(vd->seq)) & 1)
>> 		cpu_relax();
>>
>> 	smp_rmb();
>> 	return seq;
>> }
>>
>>
>>   6e0:   81 05 00 f0     lwz     r8,240(r5)
>>   6e4:   71 09 00 01     andi.   r9,r8,1
>>   6e8:   41 82 00 10     beq     6f8 <__c_kernel_clock_gettime+0x158>
>>   6ec:   81 05 00 f0     lwz     r8,240(r5)
>>   6f0:   71 0a 00 01     andi.   r10,r8,1
>>   6f4:   40 82 ff f8     bne     6ec <__c_kernel_clock_gettime+0x14c>
>>   6f8:
>>
>> r5 being vd pointer
>>
>> Why the first triplet, not only the second triplet ? Something wrong
>> with using READ_ONCE() for that ?
> 
> It looks like the compiler did loop peeling.  What GCC version is this?
> Please try current trunk (to become GCC 10), or at least GCC 9?
> 

It is with GCC 5.5

https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more 
recent than 8.1

With 8.1, the problem doesn't show up.

Thanks
Christophe
