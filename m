Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC813A11A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:44:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgsc3W79zDqH2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:44:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xglP6VxYzDqCq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 17:38:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ReZikxMR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xglP3VjHz9sP6;
 Tue, 14 Jan 2020 17:38:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578983921;
 bh=8Xd/62pEsfJImxqU2Q8fAGyIgUR8Q6dVQGOz7mkkj+0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ReZikxMRCgXPcN9LdjIiMWt82hBEotcBTQOdAbmt2qPC9Lrkg/f+Z+D/cEKkP6Amk
 UFwMxtvq0GIdH4xoE44foW8horARE0i044FMZuEqBONDLczM/PNke2/o7+5J5mj0rt
 JXd6kA5Jx4bwzQkdrwzgRBMYx0jT7uTcwlCTyH4JNJCtz1Dhd+XsUIN/2xRYrfD+UK
 kEEZVwRPwS9j1efhcLoFCbj0njF0XumxKFnoZYCVNGS9ZOELAb44iGefQrK84QqoU+
 nWsJRdDlQVzU8AHUz+bnysKK/cx6Gc8RiPwDiADwjdbW785iRb90jDv6PBztwR7GeB
 Wz8ZmW5+MOwgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/pmac/smp: Fix old-style declaration
In-Reply-To: <20191226222202.Horde.0xaecj7x1FoNwm4fHxlH0Q2@messagerie.si.c-s.fr>
References: <20191226222202.Horde.0xaecj7x1FoNwm4fHxlH0Q2@messagerie.si.c-s.fr>
Date: Tue, 14 Jan 2020 16:38:44 +1000
Message-ID: <87k15ua6ff.fsf@mpe.ellerman.id.au>
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> YueHaibing <yuehaibing@huawei.com> a =C3=A9crit=C2=A0:
>
>> There expect the 'static' keyword to come first in a declaration
>>
>> arch/powerpc/platforms/powermac/smp.c:664:1: warning: static is not=20=20
>> at beginning of declaration [-Wold-style-declaration]
>> arch/powerpc/platforms/powermac/smp.c:665:1: warning: static is not=20=20
>> at beginning of declaration [-Wold-style-declaration]
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  arch/powerpc/platforms/powermac/smp.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powermac/smp.c=20=20
>> b/arch/powerpc/platforms/powermac/smp.c
>> index f95fbde..7233b85 100644
>> --- a/arch/powerpc/platforms/powermac/smp.c
>> +++ b/arch/powerpc/platforms/powermac/smp.c
>> @@ -661,8 +661,8 @@ static void smp_core99_gpio_tb_freeze(int freeze)
>>  #endif /* !CONFIG_PPC64 */
>>
>>  /* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
>> -volatile static long int core99_l2_cache;
>> -volatile static long int core99_l3_cache;
>> +static volatile long int core99_l2_cache;
>> +static volatile long int core99_l3_cache;
>
> Is it correct to declare it as volatile ?

I don't see any reason why it needs to be volatile, so I think we can
just remove that?

cheers
