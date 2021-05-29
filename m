Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476C394CC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 17:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FslYh2DQ0z303j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 01:18:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FslYH53nKz2xvJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 May 2021 01:17:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FslY60NWYzBBP6;
 Sat, 29 May 2021 17:17:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BGtUzHSN--V; Sat, 29 May 2021 17:17:45 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FslY56ZrCzBBNq;
 Sat, 29 May 2021 17:17:45 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id DDD90478; Sat, 29 May 2021 17:22:14 +0200 (CEST)
Received: from 37.167.129.206 ([37.167.129.206]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sat, 29 May 2021 17:22:14 +0200
Date: Sat, 29 May 2021 17:22:14 +0200
Message-ID: <20210529172214.Horde.njR-7XrYj7R9yHI41_Pujw3@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH 11/15] powerpc: convert to setup_initial_init_mm()
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
 <20210529105504.180544-12-wangkefeng.wang@huawei.com>
 <87y2bxemi4.fsf@fossix.org>
In-Reply-To: <87y2bxemi4.fsf@fossix.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj <santosh@fossix.org> a =C3=A9crit=C2=A0:

> Kefeng Wang <wangkefeng.wang@huawei.com> writes:
>
>> Use setup_initial_init_mm() helper to simplify code.

I only got that patch, and patchwork as well=20=20
(https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D246315)

Can you tell where I can see and get the full series ?

And next time can you copy all patches to linuxppc-dev

Thanks
Christophe

>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>  arch/powerpc/kernel/setup-common.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup-common.c=20=20
>>=20b/arch/powerpc/kernel/setup-common.c
>> index 046fe21b5c3b..c046d99efd18 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -928,10 +928,7 @@ void __init setup_arch(char **cmdline_p)
>>
>>  	klp_init_thread_info(&init_task);
>>
>> -	init_mm.start_code =3D (unsigned long)_stext;
>> -	init_mm.end_code =3D (unsigned long) _etext;
>> -	init_mm.end_data =3D (unsigned long) _edata;
>> -	init_mm.brk =3D klimit;
>> +	setup_initial_init_mm(_stext, _etext, _edata, _end);
>
> This function definition is not visible for those who have subscribed onl=
y to
> linuxppc-dev mailing list. I had to do a web-search with the ID.
>
> Thanks,
> Santosh
>
>>
>>  	mm_iommu_init(&init_mm);
>>  	irqstack_early_init();
>> --
>> 2.26.2


