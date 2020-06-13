Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9C1F8566
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 23:22:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49krBw0HrWzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 07:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kb.kras.ru (client-ip=62.213.33.10; helo=ispman.iskranet.ru;
 envelope-from=asolokha@kb.kras.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kb.kras.ru
Received: from ispman.iskranet.ru (ispman.iskranet.ru [62.213.33.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kr9C61nPzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 07:20:31 +1000 (AEST)
Received: from himel (121.253.33.171.ip.orionnet.ru [171.33.253.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: asolokha@kb.kras.ru)
 by ispman.iskranet.ru (Postfix) with ESMTPSA id 927FE8217A3;
 Sun, 14 Jun 2020 04:20:27 +0700 (KRAT)
From: Arseny Solokha <asolokha@kb.kras.ru>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/fsl_booke/32: fix build with CONFIG_RANDOMIZE_BASE
References: <20200613162801.1946619-1-asolokha@kb.kras.ru>
 <754d31be-730b-8f18-4ead-ba2f303650d0@csgroup.eu>
Date: Sun, 14 Jun 2020 04:20:25 +0700
In-Reply-To: <754d31be-730b-8f18-4ead-ba2f303650d0@csgroup.eu> (Christophe
 Leroy's message of "Sat, 13 Jun 2020 19:28:19 +0200")
Message-ID: <87imfupsrq.fsf@himel>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Arseny Solokha <asolokha@kb.kras.ru>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Le 13/06/2020 =C3=A0 18:28, Arseny Solokha a =C3=A9crit=C2=A0:
>> Building the current 5.8 kernel for a e500 machine with
>> CONFIG_RANDOMIZE_BASE set yields the following failure:
>>
>>    arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_early_init':
>>    arch/powerpc/mm/nohash/kaslr_booke.c:387:2: error: implicit declarati=
on
>> of function 'flush_icache_range'; did you mean 'flush_tlb_range'?
>> [-Werror=3Dimplicit-function-declaration]
>>
>> Indeed, including asm/cacheflush.h into kaslr_booke.c fixes the build.
>>
>> The issue dates back to the introduction of that file and probably went
>> unnoticed because there's no in-tree defconfig with CONFIG_RANDOMIZE_BASE
>> set.
>
> I don't get this problem with mpc85xx_defconfig + RELOCATABLE +
> RANDOMIZE_BASE.

Ah, OK. So the critical difference between mpc85xx_defconfig and our custom
config is that the former sets CONFIG_BLOCK while ours doesn't. Then we hav=
e the
following dependence chain:

arch/powerpc/mm/nohash/kaslr_booke.c
  include/linux/swap.h
    include/linux/memcontrol.h
      include/linux/writeback.h
        include/linux/blk-cgroup.h
          include/linux/blkdev.h

          #ifdef CONFIG_BLOCK
          #include <linux/pagemap.h>
          #endif

          include/linux/pagemap.h
            include/linux/highmem.h
              arch/powerpc/include/asm/cacheflush.h

and that's how the latter doesn't get included in
arch/powerpc/mm/nohash/kaslr_booke.c, because in our config CONFIG_BLOCK is=
 not
defined in the first place.

Arseny

> Christophe
>
>>
>> Fixes: 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR infrastructu=
re")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Arseny Solokha <asolokha@kb.kras.ru>
>> ---
>>   arch/powerpc/mm/nohash/kaslr_booke.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/noha=
sh/kaslr_booke.c
>> index 4a75f2d9bf0e..bce0e5349978 100644
>> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
>> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/memblock.h>
>>   #include <linux/libfdt.h>
>>   #include <linux/crash_core.h>
>> +#include <asm/cacheflush.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/prom.h>
>>   #include <asm/kdump.h>
>>
