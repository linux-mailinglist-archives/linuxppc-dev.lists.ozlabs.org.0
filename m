Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F953ADC50
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 04:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6x2n4FXwz3c3N
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 12:10:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mYHoj3Iu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mYHoj3Iu; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6x2J0V1hz301t
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 12:10:15 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id i4so2932276plt.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 19:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zwJcdQn5NGse0S2evsaTo3yHirbFc9Aqtf3cv84Z/JQ=;
 b=mYHoj3IuaNFDkcH56IPxD9mcPgU+OLwdJFlgaGAr7xcwHJzBEGSKO6E8FOC80VNlfA
 UwW8r1xMCnXPzk2C4c6RjNU3BFfW12JbCddmt7z42K6NL2EXPKUdmJo/6/LKNaLaB8e3
 bE/v8UsVz0ikwgfF+PKy5rw5h7a979ZxqBgGoLDdszh4XVjbeY5n2PtfRj8ygwjW/tLo
 I9xAPVfx7ov81mPIWYV/aW9KgkjP4gW0f8pKY1WGkT0Ng+Z/tHdndgdbZGUTfKCzitig
 n28ITlaO5xR2TEcEOxCxDc3YDNtlNMeamoltHBMHAAgp4LxuHaADctPJvA9GWVvycK1j
 7EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zwJcdQn5NGse0S2evsaTo3yHirbFc9Aqtf3cv84Z/JQ=;
 b=ZWfkXHTJdGOklGHVnplza2TOlOTYUCWb54C8sOqjgLRv1MrHnjuSBT9ZDXUhAndUOO
 N1Wa5A0ZJw2E/X6Yh1BCXVe41MpypXwEOQvVlDxDDw/+imq1vLXR/XX31qB78+5EkVeL
 aRNYftg+52qb3SO68Yld7WEhBhIZAkQxDW4AK7+HKovu0DVEZqwhP76N2qOOy5E923jo
 NNqLVc3AWl4NjygpliDoKxbnJDv5bxZMn0qCufQH3bt838G64FkZ2VUIwGFuwqa7PcwT
 oh0x9Pm8SwuAKiP7cwKeR+evnOIi5v+6Oev2iti3MpQUbdpg6p0UrZjh8T+hf91eEP3c
 ijaw==
X-Gm-Message-State: AOAM530/gZXHfxcy0iPzIB+fFX/Ntbg62i6AIAbDa5rCH/PN2SOcCJDQ
 jP3+bST8RBaaFx70AC0qMoI=
X-Google-Smtp-Source: ABdhPJyqXUsiG6ibTfaxcmtOeTqG/JCNSRGz0ZCXX34hSVqlrCEbCSyQsN2c/6irjDf0xtAeEbeZiA==
X-Received: by 2002:a17:90b:3142:: with SMTP id
 ip2mr29424960pjb.63.1624155009968; 
 Sat, 19 Jun 2021 19:10:09 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id ls13sm11268684pjb.23.2021.06.19.19.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 19:10:09 -0700 (PDT)
Date: Sun, 20 Jun 2021 12:10:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Andy Lutomirski <luto@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
 <26196903-4aee-33c4-bed8-8bf8c7b46793@kernel.org>
 <593983567.12619.1624033908849.JavaMail.zimbra@efficios.com>
 <1d617df2-57fa-4953-9c75-6de3909a6f14@www.fastmail.com>
 <639092151.13266.1624046981084.JavaMail.zimbra@efficios.com>
 <1624080924.z61zvzi4cq.astroid@bobo.none>
 <2f9e52eb-0105-4bc6-a903-f4ecbfc9b999@www.fastmail.com>
In-Reply-To: <2f9e52eb-0105-4bc6-a903-f4ecbfc9b999@www.fastmail.com>
MIME-Version: 1.0
Message-Id: <1624154254.9g8ebnq8vg.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Will Deacon <will@kernel.org>, linux-mm <linux-mm@kvack.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of June 20, 2021 1:50 am:
>=20
>=20
> On Fri, Jun 18, 2021, at 11:02 PM, Nicholas Piggin wrote:
>> Excerpts from Mathieu Desnoyers's message of June 19, 2021 6:09 am:
>> > ----- On Jun 18, 2021, at 3:58 PM, Andy Lutomirski luto@kernel.org wro=
te:
>> >=20
>> >> On Fri, Jun 18, 2021, at 9:31 AM, Mathieu Desnoyers wrote:
>> >>> ----- On Jun 17, 2021, at 8:12 PM, Andy Lutomirski luto@kernel.org w=
rote:
>> >>>=20
>> >>> > On 6/17/21 7:47 AM, Mathieu Desnoyers wrote:
>> >>> >=20
>> >>> >> Please change back this #ifndef / #else / #endif within function =
for
>> >>> >>=20
>> >>> >> if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)) {
>> >>> >>   ...
>> >>> >> } else {
>> >>> >>   ...
>> >>> >> }
>> >>> >>=20
>> >>> >> I don't think mixing up preprocessor and code logic makes it more=
 readable.
>> >>> >=20
>> >>> > I agree, but I don't know how to make the result work well.
>> >>> > membarrier_sync_core_before_usermode() isn't defined in the !IS_EN=
ABLED
>> >>> > case, so either I need to fake up a definition or use #ifdef.
>> >>> >=20
>> >>> > If I faked up a definition, I would want to assert, at build time,=
 that
>> >>> > it isn't called.  I don't think we can do:
>> >>> >=20
>> >>> > static void membarrier_sync_core_before_usermode()
>> >>> > {
>> >>> >    BUILD_BUG_IF_REACHABLE();
>> >>> > }
>> >>>=20
>> >>> Let's look at the context here:
>> >>>=20
>> >>> static void ipi_sync_core(void *info)
>> >>> {
>> >>>     [....]
>> >>>     membarrier_sync_core_before_usermode()
>> >>> }
>> >>>=20
>> >>> ^ this can be within #ifdef / #endif
>> >>>=20
>> >>> static int membarrier_private_expedited(int flags, int cpu_id)
>> >>> [...]
>> >>>                if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)=
)
>> >>>                         return -EINVAL;
>> >>>                 if (!(atomic_read(&mm->membarrier_state) &
>> >>>                       MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_R=
EADY))
>> >>>                         return -EPERM;
>> >>>                 ipi_func =3D ipi_sync_core;
>> >>>=20
>> >>> All we need to make the line above work is to define an empty ipi_sy=
nc_core
>> >>> function in the #else case after the ipi_sync_core() function defini=
tion.
>> >>>=20
>> >>> Or am I missing your point ?
>> >>=20
>> >> Maybe?
>> >>=20
>> >> My objection is that an empty ipi_sync_core is a lie =E2=80=94 it doe=
sn=E2=80=99t sync the core.
>> >> I would be fine with that if I could have the compiler statically ver=
ify that
>> >> it=E2=80=99s not called, but I=E2=80=99m uncomfortable having it ther=
e if the implementation is
>> >> actively incorrect.
>> >=20
>> > I see. Another approach would be to implement a "setter" function to p=
opulate
>> > "ipi_func". That setter function would return -EINVAL in its #ifndef C=
ONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
>> > implementation.
>>=20
>> I still don't get the problem with my suggestion. Sure the=20
>> ipi is a "lie", but it doesn't get used. That's how a lot of
>> ifdef folding works out. E.g.,
>>=20
>> diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
>> index b5add64d9698..54cb32d064af 100644
>> --- a/kernel/sched/membarrier.c
>> +++ b/kernel/sched/membarrier.c
>> @@ -5,6 +5,15 @@
>>   * membarrier system call
>>   */
>>  #include "sched.h"
>> +#ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
>> +#include <asm/sync_core.h>
>> +#else
>> +static inline void membarrier_sync_core_before_usermode(void)
>> +{
>> +	compiletime_assert(0, "architecture does not implement=20
>> membarrier_sync_core_before_usermode");
>> +}
>> +
>=20
> With the assert there, I=E2=80=99m fine with this. Let me see if the resu=
lt builds.

It had better, because compiletime_assert already relies on a similar=20
level of code elimination to work.

I think it's fine to use for now, but it may not be quite the the=20
logically correct primitive if we want to be really clean, because a=20
valid compiletime_assert implementation should be able to fire even for=20
code that is never linked. We would want something like to be clean=20
IMO:

#ifdef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
#include <asm/sync_core.h>
#else
extern void membarrier_sync_core_before_usermode(void) __compiletime_error(=
"architecture does not implement membarrier_sync_core_before_usermode");
#endif

However that does not have the ifdef for optimising compile so AFAIKS it=20
could break with a false positive in some cases.

Something like compiletime_assert_not_called("msg") that either compiles
to a noop or a __compiletime_error depending on __OPTIMIZE__ would be=20
the way to go IMO. I don't know if anything exists that fits, but it's
certainly not a unique thing in the kernel so I may not be looking hard
enough.

Thanks,
Nick

