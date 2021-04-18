Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A113634A9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 12:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNRQl51Vpz302l
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 20:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNRQP5Fn9z301q
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 20:44:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FNRQ86t5cz9vBmS;
 Sun, 18 Apr 2021 12:44:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id d54YPj4tRfSP; Sun, 18 Apr 2021 12:44:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FNRQ85vyTz9vBmQ;
 Sun, 18 Apr 2021 12:44:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB7918B79B;
 Sun, 18 Apr 2021 12:44:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Dh9WCAivhXwx; Sun, 18 Apr 2021 12:44:03 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A5CC8B799;
 Sun, 18 Apr 2021 12:44:03 +0200 (CEST)
Subject: Re: mmu.c:undefined reference to `patch__hash_page_A0'
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
References: <202102271820.WlZCxtzY-lkp@intel.com>
 <06227600-c5c5-3da7-a495-ae0b0849b62d@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ab9d4f9e-add6-900b-9fa7-83d5f7d1108b@csgroup.eu>
Date: Sun, 18 Apr 2021 12:43:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <06227600-c5c5-3da7-a495-ae0b0849b62d@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/04/2021 à 02:02, Randy Dunlap a écrit :
> HI--
> 
> I no longer see this build error.

Fixed by https://github.com/torvalds/linux/commit/acdad8fb4a1574323db88f98a38b630691574e16

> However:
> 
> On 2/27/21 2:24 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   3fb6d0e00efc958d01c2f109c8453033a2d96796
>> commit: 259149cf7c3c6195e6199e045ca988c31d081cab powerpc/32s: Only build hash code when CONFIG_PPC_BOOK3S_604 is selected
>> date:   4 weeks ago
>> config: powerpc64-randconfig-r013-20210227 (attached as .config)
> 
> ktr/lkp, this is a PPC32 .config file that is attached, not PPC64.
> 
> Also:
> 
>> compiler: powerpc-linux-gcc (GCC) 9.3.0

...

> 
> I do see this build error:
> 
> powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
> decompress.c:(.text+0x1f0): undefined reference to `__decompress'
> 
> when either
> CONFIG_KERNEL_LZO=y
> or
> CONFIG_KERNEL_LZMA=y
> 
> but the build succeeds when either
> CONFIG_KERNEL_GZIP=y
> or
> CONFIG_KERNEL_XZ=y
> 
> I guess that is due to arch/powerpc/boot/decompress.c doing this:
> 
> #ifdef CONFIG_KERNEL_GZIP
> #	include "decompress_inflate.c"
> #endif
> 
> #ifdef CONFIG_KERNEL_XZ
> #	include "xz_config.h"
> #	include "../../../lib/decompress_unxz.c"
> #endif
> 
> 
> It would be nice to require one of KERNEL_GZIP or KERNEL_XZ
> to be set/enabled (maybe unless a uImage is being built?).


Can you test by 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/a74fce4dfc9fa32da6ce3470bbedcecf795de1ec.1591189069.git.christophe.leroy@csgroup.eu/ 
?

Thanks
Christophe
