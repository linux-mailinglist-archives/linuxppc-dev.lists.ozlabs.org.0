Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F78326C1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 08:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DndZl5Mn6z3d4M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 18:34:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DndZQ38q9z3cLy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 18:34:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DndZC4c2Wz9ty3K;
 Sat, 27 Feb 2021 08:34:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XV-KKcfIRBS6; Sat, 27 Feb 2021 08:34:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DndZC2xvrz9ty3J;
 Sat, 27 Feb 2021 08:34:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 503808B77E;
 Sat, 27 Feb 2021 08:34:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3bXHmbc0B38t; Sat, 27 Feb 2021 08:34:12 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E2068B77A;
 Sat, 27 Feb 2021 08:34:11 +0100 (CET)
Subject: Re: Latest Git kernel doesn't compile because of the
 LINUX_VERSION_CODE issue
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Sasha Levin <sashal@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
 <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
 <99f6d05a-d431-7444-bb0a-180c042c2afd@xenosoft.de>
 <e73a866b-f755-f227-e60a-4be05f467221@csgroup.eu>
 <93173e85-3663-8d79-ca4b-f38b505e6e05@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <80696a7a-44fb-9ce0-76a4-42006ebe2928@csgroup.eu>
Date: Sat, 27 Feb 2021 08:34:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <93173e85-3663-8d79-ca4b-f38b505e6e05@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Le 27/02/2021 à 08:13, Christian Zigotzky a écrit :
> Hello Christophe,
> 
> Thanks a lot for compiling the latest git kernel.
> 
> I have solved the compiling issue through setting up a value for the SUBLEVEL variable in 
> "a/Makefile". Before it wasn't necessary to set up a value for the SUBLEVEL variable.

I see, so it is a regression introduced by commit 9b82f13e7ef3 ("kbuild: clamp SUBLEVEL to 255").

In the past there had already been such a regression at some point, which had then been fixed by 
commit cacd54ef49b7 ("kbuild: Fix KERNELVERSION for empty SUBLEVEL or PATCHLEVEL")

Sasha, can you fix it ?

Thanks
Christophe


> 
> Cheers,
> Christian
> 
> On 26 February 21 at 5:10 pm, Christophe Leroy wrote:
>>
>>
>> Le 26/02/2021 à 13:34, Christian Zigotzky a écrit :
>>> Hello,
>>>
>>> I tried to compile the latest Git kernel today. Unfortunately it doesn't compile.
>>
>> I have no such problem with latest git kernel.
>>
>> Christophe
>>
>>>
>>> Error messages:
>>>
>>>    CC      arch/powerpc/kernel/udbg_16550.o
>>> In file included from ./include/linux/stackprotector.h:10:0,
>>>                   from arch/powerpc/kernel/smp.c:35:
>>> ./arch/powerpc/include/asm/stackprotector.h: In function ‘boot_init_stack_canary’:
>>> ./arch/powerpc/include/asm/stackprotector.h:29:30: error: expected expression before ‘;’ token
>>>    canary ^= LINUX_VERSION_CODE;
>>>                                ^
>>> scripts/Makefile.build:271: recipe for target 'arch/powerpc/kernel/smp.o' failed
>>> make[2]: *** [arch/powerpc/kernel/smp.o] Error 1
>>>
>>> ----
>>>
>>> drivers/media/cec/core/cec-api.c: In function ‘cec_adap_g_caps’:
>>> drivers/media/cec/core/cec-api.c:85:35: error: expected expression before ‘;’ token
>>>    caps.version = LINUX_VERSION_CODE;
>>>
>>> ----
>>>
>>> I have found the bad commit. It's "Merge tag 'kbuild-v5.12' of 
>>> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild" [1]
>>>
>>> The changes in the Makefile (a/Makefile) are responsible for the compiling errors. [2]
>>>
>>> I was able to revert this bad commit. After that it compiled without any problems.
>>>
>>> Could you please compile the latest Git kernel and confirm this issue?
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab 
>>>
>>> [2] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/Makefile?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab 
>>>
