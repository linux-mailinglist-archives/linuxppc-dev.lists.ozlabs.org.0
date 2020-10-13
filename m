Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4B28CB77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 12:17:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9Wgj53mgzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 21:17:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9Wdp5WsSzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 21:15:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KMycuC8k; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Wdp0WCgz9sVH;
 Tue, 13 Oct 2020 21:15:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602584142;
 bh=SQPNY+N9Jz8DH/0ADaruUwdPNuZlX8z+oBbq3gOlFTg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KMycuC8kT6PHLlYV79o7xJsj3BgonMFxzrXRX5HLu1IB6bKup+zZ7BZigT6Vy8pAs
 sJnjApueZWxgymV6aWQW16fzi6xUahpkQBRBukKizq0TtOq0VQFU/+TTMugeOPlD+T
 Y33c2nz2s0jxYhsvVCMlfhvkItZE19O7BS5ZqjO2YrJkwzyBw2yo5cwm9g7jMKz8WA
 9fgFerkIIzcmBQc2jsHW11hilGANJKSiwpOGxdF4uIscWPmERVHHBbnucPZqz/n+3O
 cKpP9rcWnYtOprDjYxqxpT6XCy8bAmlASMd+RuSCfysuHZwg8jseuzvDKpgKRTQs6E
 Ox2tsVl8+z0pQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/features: Remove CPU_FTR_NODSISRALIGN
In-Reply-To: <cb22e9a8-4a8c-38d9-66f1-24af5ebd7520@csgroup.eu>
References: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
 <875z7ea8t7.fsf@linux.ibm.com>
 <cb22e9a8-4a8c-38d9-66f1-24af5ebd7520@csgroup.eu>
Date: Tue, 13 Oct 2020 21:15:38 +1100
Message-ID: <87wnzuzb1x.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 13/10/2020 =C3=A0 09:23, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>=20
>>> CPU_FTR_NODSISRALIGN has not been used since
>>> commit 31bfdb036f12 ("powerpc: Use instruction emulation
>>> infrastructure to handle alignment faults")
>>>
>>> Remove it.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/cputable.h | 22 ++++++++++------------
>>>   arch/powerpc/kernel/dt_cpu_ftrs.c   |  8 --------
>>>   arch/powerpc/kernel/prom.c          |  2 +-
>>>   3 files changed, 11 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt=
_cpu_ftrs.c
>>> index 1098863e17ee..c598961d9f15 100644
>>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>>> @@ -273,13 +273,6 @@ static int __init feat_enable_idle_nap(struct dt_c=
pu_feature *f)
>>>   	return 1;
>>>   }
>>>=20=20=20
>>> -static int __init feat_enable_align_dsisr(struct dt_cpu_feature *f)
>>> -{
>>> -	cur_cpu_spec->cpu_features &=3D ~CPU_FTR_NODSISRALIGN;
>>> -
>>> -	return 1;
>>> -}
>>> -
>>>   static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
>>>   {
>>>   	u64 lpcr;
>>> @@ -641,7 +634,6 @@ static struct dt_cpu_feature_match __initdata
>>>   	{"tm-suspend-hypervisor-assist", feat_enable, CPU_FTR_P9_TM_HV_ASSIS=
T},
>>>   	{"tm-suspend-xer-so-bug", feat_enable, CPU_FTR_P9_TM_XER_SO_BUG},
>>>   	{"idle-nap", feat_enable_idle_nap, 0},
>>> -	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},

Rather than removing it entirely, I'd rather we left a comment, so that
it's obvious that we are ignoring that feature on purpose, not because
we forget about it.

eg:

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu=
_ftrs.c
index f204ad79b6b5..45cb7e59bd13 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -640,7 +640,7 @@ static struct dt_cpu_feature_match __initdata
 	{"tm-suspend-hypervisor-assist", feat_enable, CPU_FTR_P9_TM_HV_ASSIST},
 	{"tm-suspend-xer-so-bug", feat_enable, CPU_FTR_P9_TM_XER_SO_BUG},
 	{"idle-nap", feat_enable_idle_nap, 0},
-	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
+	// "alignment-interrupt-dsisr" ignored
 	{"idle-stop", feat_enable_idle_stop, 0},
 	{"machine-check-power8", feat_enable_mce_power8, 0},
 	{"performance-monitor-power8", feat_enable_pmu_power8, 0},


>>>   	{"idle-stop", feat_enable_idle_stop, 0},
>>>   	{"machine-check-power8", feat_enable_mce_power8, 0},
>>>   	{"performance-monitor-power8", feat_enable_pmu_power8, 0},
>>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>>> index c1545f22c077..a5a5acb627fe 100644
>>> --- a/arch/powerpc/kernel/prom.c
>>> +++ b/arch/powerpc/kernel/prom.c
>>> @@ -165,7 +165,7 @@ static struct ibm_pa_feature {
>>>   #ifdef CONFIG_PPC_RADIX_MMU
>>>   	{ .pabyte =3D 40, .pabit =3D 0, .mmu_features  =3D MMU_FTR_TYPE_RADI=
X | MMU_FTR_GTSE },
>>>   #endif
>>> -	{ .pabyte =3D 1,  .pabit =3D 1, .invert =3D 1, .cpu_features =3D CPU_=
FTR_NODSISRALIGN },
>>> +	{ .pabyte =3D 1,  .pabit =3D 1, .invert =3D 1, },
>>>   	{ .pabyte =3D 5,  .pabit =3D 0, .cpu_features  =3D CPU_FTR_REAL_LE,
>>>   				    .cpu_user_ftrs =3D PPC_FEATURE_TRUE_LE },
>>=20
>> I didn't follow this change. Should the line be dropped?
>>=20
>
> Don't know. I have to look closer, I don't know what it is used for.

All it does is clear the CPU feature if firmware tells us to. So if
we're dropping the CPU feature we can drop the whole entry in the
feature array.

cheers
