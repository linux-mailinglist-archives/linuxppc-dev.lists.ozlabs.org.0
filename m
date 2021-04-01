Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC22351554
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB4D21rK7z3c1m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:44:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB4Cj1nDKz2xb5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:43:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FB4Cb1lVsz9v3Xp;
 Thu,  1 Apr 2021 15:43:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yxEuLDOMoY9i; Thu,  1 Apr 2021 15:43:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FB4Cb0Hxbz9v3Xj;
 Thu,  1 Apr 2021 15:43:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 986D08BB1D;
 Thu,  1 Apr 2021 15:43:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ym_JGFu42o0b; Thu,  1 Apr 2021 15:43:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E8BA8B99D;
 Thu,  1 Apr 2021 15:43:54 +0200 (CEST)
Subject: Re: [PATCH] powerpc/8xx: Load modules closer to kernel text
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <db20abbecb129c49d3c663de67dac6a87501ac0b.1617001615.git.christophe.leroy@csgroup.eu>
 <87czvf788t.fsf@mpe.ellerman.id.au>
 <e50f8127-3a87-92eb-d88a-72aa1557ffe7@csgroup.eu>
 <87ft0a1v5i.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7ff6c893-8dcb-3908-3b6c-7172bc224c77@csgroup.eu>
Date: Thu, 1 Apr 2021 15:43:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87ft0a1v5i.fsf@mpe.ellerman.id.au>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/04/2021 à 06:33, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 31/03/2021 à 15:39, Michael Ellerman a écrit :
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> On the 8xx, TASK_SIZE is 0x80000000. The space between TASK_SIZE and
>>>> PAGE_OFFSET is not used.
>>>>
>>>> Use it to load modules in order to minimise the distance between
>>>> kernel text and modules and avoid trampolines in modules to access
>>>> kernel functions or other module functions.
>>>>
>>>> Define a 16Mbytes area for modules, that's more than enough.
>>>
>>> 16MB seems kind of small.
>>>
>>> At least on 64-bit we could potentially have hundreds of MBs of modules.
>>>
>>
>> Well, with a 16 MB kernel and 16 MB modules, my board is full :)
> 
> Heh.

ARM set it to 16M or 8M.

> 
>> Even on the more recent board that has 128 MB, I don't expect more than a few MBs of modules in
>> addition to the kernel which is approx 8M.
>>
>> But ok, I'll do something more generic, though it will conflict with Jordan's series.
> 
> Don't feel you have to. You're the expert on 8xx, not me.
> 

Doing it generic allows to also get it on book3s/32 for free.

Christophe
