Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37133B06B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 11:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzYGz6QBsz3048
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 21:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzYGf5CBwz2yZB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 21:55:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzYGP6PxCz9tyQr;
 Mon, 15 Mar 2021 11:54:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SecQISiySvDz; Mon, 15 Mar 2021 11:54:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzYGP3v9Qz9tyQq;
 Mon, 15 Mar 2021 11:54:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 944058B77B;
 Mon, 15 Mar 2021 11:54:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vyBges3r4mBy; Mon, 15 Mar 2021 11:54:55 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F03148B75B;
 Mon, 15 Mar 2021 11:54:49 +0100 (CET)
Subject: Re: Build regressions/improvements in v5.12-rc3
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210315104409.1598822-1-geert@linux-m68k.org>
 <CAMuHMdVJFprsj9njwv13jWTBELuq8RcXOmR7AoR9dqDdydLcNQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2c123f94-ceae-80c0-90e2-21909795eb76@csgroup.eu>
Date: Mon, 15 Mar 2021 11:54:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVJFprsj9njwv13jWTBELuq8RcXOmR7AoR9dqDdydLcNQ@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 11:49, Geert Uytterhoeven a écrit :
> On Mon, Mar 15, 2021 at 11:46 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> JFYI, when comparing v5.12-rc3[1] to v5.12-rc2[3], the summaries are:
>>    - build errors: +2/-2
> 
>> 2 error regressions:
>>    + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_248' declared with attribute error: BUILD_BUG failed:  => 320:38
>>    + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_249' declared with attribute error: BUILD_BUG failed:  => 320:38
> 
> powerpc-gcc4.9/ppc64_book3e_allmodconfig
> 
> So we traded implicit declaration errors:
> 
>    - /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
> error: implicit declaration of function 'disable_kernel_vsx'
> [-Werror=implicit-function-declaration]: 674:2 =>
>    - /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
> error: implicit declaration of function 'enable_kernel_vsx'
> [-Werror=implicit-function-declaration]: 638:2 =>
> 
> for compile-time assertions.
> 

You are missing https://github.com/linuxppc/linux/commit/eed5fae00593ab9d261a0c1ffc1bdb786a87a55a

Christophe
