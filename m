Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB08CAA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 07:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467dWX69rPzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 15:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="le8hW77E"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467dTf385nzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 15:30:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467dTZ0yN9z9ttRm;
 Wed, 14 Aug 2019 07:30:42 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=le8hW77E; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Sns30lawNcwX; Wed, 14 Aug 2019 07:30:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467dTY5v8Gz9tyrq;
 Wed, 14 Aug 2019 07:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565760641; bh=UgUweD+YyDfxITgN/wE6y8wwm2H0Uq5whGmrSXarMB0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=le8hW77ESrTPytogTEMwNvIsBu4I2sq5aF/OFBTQ6Z5Up9fyVczw1T1kyawS9UDZX
 oa+miFtFCHBDCTmZlAGeJG/gy0Pbi7CurRYC838sTJMqmHFi2eq5KiV+a9sDov9p7+
 /bZWdOL/LO7XIv75VIl/Jcoy5ztucmO8zWvNEQn8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB76D8B780;
 Wed, 14 Aug 2019 07:30:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IU43IinyT_iE; Wed, 14 Aug 2019 07:30:42 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A040B8B761;
 Wed, 14 Aug 2019 07:30:42 +0200 (CEST)
Subject: Re: [REGRESSION] Boot failure with DEBUG_PAGEALLOC on Wii, after
 PPC32 KASAN patches
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linuxppc-dev@lists.ozlabs.org
References: <20190813155152.GH1966@latitude>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f9fc40d2-a641-7e50-468c-2583425c9a7b@c-s.fr>
Date: Wed, 14 Aug 2019 07:30:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813155152.GH1966@latitude>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

Le 13/08/2019 à 17:51, Jonathan Neuschäfer a écrit :
> Hi,
> 
> I noticed that my Nintendo Wii doesn't boot with wii_defconfig plus
> CONFIG_DEBUG_PAGEALLOC=y and CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
> on recent kernels. I get a splash like this one:
> 
> [    0.022245] BUG: Unable to handle kernel data access at 0x00006601
> [    0.025172] Faulting instruction address: 0xc01afa48
> [    0.027522] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.030076] BE PAGE_SIZE=4K MMU=Hash PREEMPT DEBUG_PAGEALLOC wii

[...]

> 
> (Without CONFIG_DEBUG_PAGEALLOC I haven't noticed any problems.)
> 
> 
> 'git bisect' says:
> 
> 72f208c6a8f7bc78ef5248babd9e6ed6302bd2a0 is the first bad commit
> commit 72f208c6a8f7bc78ef5248babd9e6ed6302bd2a0
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Fri Apr 26 16:23:35 2019 +0000
> 
>      powerpc/32s: move hash code patching out of MMU_init_hw()
> 

[...]

> 
> 
> I can revert this commit, and then 5.3-rc2 (plus a patchset adding a
> serial driver) boot again.
> 
> Christophe, is there anything I should test in order to figure out how
> to fix this properly?

I just sent out a patch that should fix it. Please test and tell me.

Thanks
Christophe
