Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D623B7BC973
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 19:33:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wFggfl5S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2spk52JWz3vZW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 04:33:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2snl32Nzz307V
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 04:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=aJVvBE4SP5c8uAtSdDAuWAVhLtX7ZDGEDfCptajDH6k=; b=wFggfl5SM9G9zYhKm7l+YGoy21
	oqRvLUxgsvRf5bDmcQ3izmplXtWY3KQ+rSU5OYf3uN0FyrbnbgGHok1snt20q59SL5E80/9lu9fy3
	1+hElBG2xZM0QUmg66Xjz6GthUS6gJM8a3npbi9fxUaEXk9Sw0X+cQty9L2Hqyr/VV2fT76f4Jpj7
	XIUVecYZOwjhq/nwla/GYBYF0dl4Aqis4aZek2MQGSkvAXRVQX/x6gcp8jZYUDHlf8PbQDmtuZL40
	3gQF5xrl01yAF1PxvDpHrLgIqxdlqEp5UwtTJea2WleKR3vSnskg7/XNUGXBuaSzWXX5F9URhTlIz
	cQiQ3Q+Q==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qpBAO-007lyk-11;
	Sat, 07 Oct 2023 17:32:40 +0000
Message-ID: <bc92f6cb-71dd-4b15-8d83-db7579ec7fb9@infradead.org>
Date: Sat, 7 Oct 2023 10:32:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 20 (ppc32: ADB_CUDA Kconfig warning)
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, tanyuan@tinylab.org
References: <20230920133714.351f83f9@canb.auug.org.au>
 <fe130d55-7b5e-4444-85ea-c3fbf4eb238d@infradead.org>
 <87il83m5k0.fsf@mail.lhotse>
 <47afe095-0dd9-47bc-a4d1-dcd66f87ac7c@infradead.org>
In-Reply-To: <47afe095-0dd9-47bc-a4d1-dcd66f87ac7c@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 9/21/23 21:51, Randy Dunlap wrote:
> 
> 
> On 9/21/23 17:10, Michael Ellerman wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>> On 9/19/23 20:37, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20230919:
>>>>
>>>> The mm tree lost its boot warning.
>>>>
>>>> The drm-misc tree gained a conflict against Linus' tree.
>>>>
>>>> Non-merge commits (relative to Linus' tree): 6006
>>>>  3996 files changed, 459968 insertions(+), 111742 deletions(-)
>>>>
>>>> ----------------------------------------------------------------------------
>>>
>>> 4 out of 10 randconfigs have this warning:
>>>
>>> WARNING: unmet direct dependencies detected for ADB_CUDA
>>>   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
>>>   Selected by [y]:
>>>   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]
>>>
>>> WARNING: unmet direct dependencies detected for ADB_CUDA
>>>   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
>>>   Selected by [y]:
>>>   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]
>>>
>>> WARNING: unmet direct dependencies detected for ADB_CUDA
>>>   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
>>>   Selected by [y]:
>>>   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]
>>
>> Crud. Caused by:
>>
>> a3ef2fef198c ("powerpc/32: Add dependencies of POWER_RESET for pmac32")
>>
>> I was suspicious of that select, I should have been *more* suspicious :)
>>
>> I think this is a fix. The PPC32 isn't needed because ADB depends on (PPC_PMAC && PPC32).
> 
> Yes, that fixes the problem. Thanks.
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 

Will you be merging this fix?

Thanks.

>>
>> diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
>> index 8bdae0caf21e..84f101ec53a9 100644
>> --- a/arch/powerpc/platforms/powermac/Kconfig
>> +++ b/arch/powerpc/platforms/powermac/Kconfig
>> @@ -2,7 +2,7 @@
>>  config PPC_PMAC
>>         bool "Apple PowerMac based machines"
>>         depends on PPC_BOOK3S && CPU_BIG_ENDIAN
>> -       select ADB_CUDA if POWER_RESET && PPC32
>> +       select ADB_CUDA if POWER_RESET && ADB
>>         select MPIC
>>         select FORCE_PCI
>>         select PPC_INDIRECT_PCI if PPC32
>>
>> cheers
> 

-- 
~Randy
