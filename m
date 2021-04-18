Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30754363696
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 18:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNZzW1Cwmz3bSv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 02:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNZzB2vhmz302H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 02:24:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FNZyz5sfkz9tynS;
 Sun, 18 Apr 2021 18:24:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6vOFJhRsGw-R; Sun, 18 Apr 2021 18:24:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FNZyz4n1kz9tynR;
 Sun, 18 Apr 2021 18:24:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D9BB8B79C;
 Sun, 18 Apr 2021 18:24:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id w_yOQKn4wsA3; Sun, 18 Apr 2021 18:24:31 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D1FDA8B79B;
 Sun, 18 Apr 2021 18:24:30 +0200 (CEST)
Subject: Re: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
To: Randy Dunlap <rdunlap@infradead.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
Date: Sun, 18 Apr 2021 18:24:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/04/2021 à 22:17, Randy Dunlap a écrit :
> Hi,
> 
> kernel test robot reports:
> 
>>> drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
>             enable_kernel_fp();
>             ^
> 
> when
> # CONFIG_PPC_FPU is not set
> CONFIG_ALTIVEC=y
> 
> I see at least one other place that does not handle that
> combination well, here:
> 
> ../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
> ../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
>    637 |   put_vr(rn, &u.v);
>        |   ^~~~~~
> ../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
> ../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
>    660 |   get_vr(rn, &u.v);
>        |   ^~~~~~
> 
> 
> Should the code + Kconfigs/Makefiles handle that kind of
> kernel config or should ALTIVEC always mean PPC_FPU as well?

As far as I understand, Altivec is completely independant of FPU in Theory. So it should be possible 
to use Altivec without using FPU.

However, until recently, it was not possible to de-activate FPU support on book3s/32. I made it 
possible in order to reduce unneccessary processing on processors like the 832x that has no FPU.
As far as I can see in cputable.h/.c, 832x is the only book3s/32 without FPU, and it doesn't have 
ALTIVEC either.

So we can in the future ensure that Altivec can be used without FPU support, but for the time being 
I think it is OK to force selection of FPU when selecting ALTIVEC in order to avoid build failures.

> 
> I have patches to fix the build errors with the config as
> reported but I don't know if that's the right thing to do...
> 

Lets see them.

Christophe
