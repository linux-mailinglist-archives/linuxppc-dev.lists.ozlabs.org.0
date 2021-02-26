Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559B326547
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 17:10:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnF4t20tKz3d3t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 03:10:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnF4W2j4Hz3cGQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 03:10:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DnF4J5PZmz9v0Z6;
 Fri, 26 Feb 2021 17:10:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SEiNXZJaWrQW; Fri, 26 Feb 2021 17:10:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DnF4J4JM2z9v0Z5;
 Fri, 26 Feb 2021 17:10:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A78F48B921;
 Fri, 26 Feb 2021 17:10:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PpWdLG12plMx; Fri, 26 Feb 2021 17:10:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B3C58B925;
 Fri, 26 Feb 2021 17:10:24 +0100 (CET)
Subject: Re: Latest Git kernel doesn't compile because of the
 LINUX_VERSION_CODE issue
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
 <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
 <99f6d05a-d431-7444-bb0a-180c042c2afd@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e73a866b-f755-f227-e60a-4be05f467221@csgroup.eu>
Date: Fri, 26 Feb 2021 17:10:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <99f6d05a-d431-7444-bb0a-180c042c2afd@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/02/2021 à 13:34, Christian Zigotzky a écrit :
> Hello,
> 
> I tried to compile the latest Git kernel today. Unfortunately it doesn't compile.

I have no such problem with latest git kernel.

Christophe

> 
> Error messages:
> 
>    CC      arch/powerpc/kernel/udbg_16550.o
> In file included from ./include/linux/stackprotector.h:10:0,
>                   from arch/powerpc/kernel/smp.c:35:
> ./arch/powerpc/include/asm/stackprotector.h: In function ‘boot_init_stack_canary’:
> ./arch/powerpc/include/asm/stackprotector.h:29:30: error: expected expression before ‘;’ token
>    canary ^= LINUX_VERSION_CODE;
>                                ^
> scripts/Makefile.build:271: recipe for target 'arch/powerpc/kernel/smp.o' failed
> make[2]: *** [arch/powerpc/kernel/smp.o] Error 1
> 
> ----
> 
> drivers/media/cec/core/cec-api.c: In function ‘cec_adap_g_caps’:
> drivers/media/cec/core/cec-api.c:85:35: error: expected expression before ‘;’ token
>    caps.version = LINUX_VERSION_CODE;
> 
> ----
> 
> I have found the bad commit. It's "Merge tag 'kbuild-v5.12' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild" [1]
> 
> The changes in the Makefile (a/Makefile) are responsible for the compiling errors. [2]
> 
> I was able to revert this bad commit. After that it compiled without any problems.
> 
> Could you please compile the latest Git kernel and confirm this issue?
> 
> Thanks,
> Christian
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab 
> 
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/Makefile?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab 
> 
