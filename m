Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC303AD36F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 22:10:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G695N5kZlz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 06:10:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=e77uVsXB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=e77uVsXB; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G694q4Wdsz3brv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 06:09:45 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id E90AD3471A5;
 Fri, 18 Jun 2021 16:09:41 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0PN0fCTZy7ax; Fri, 18 Jun 2021 16:09:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 4087A346F53;
 Fri, 18 Jun 2021 16:09:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 4087A346F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1624046981;
 bh=RiNKa2ffpPcEXrIGxaU+1uydyZY6BHogRXG8v2M9Ck8=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=e77uVsXBX5qiwUn51JyjsPbsx1rdqqPTFf2DG2RqPenZfYhfCQwtf2FHA//bGQ3IB
 Y6WNpMUpvQLBxLobyFwHAq7DAObsQatZuENFxMgyGinXx4zN/AJmuuY0ARE1eZBp3s
 mUsuzO7zMEgCiavmPKhz0od8CLMhb+Yfsh+S7kcgnIfKm+1jgcu60otbcfxsMP79RQ
 2cmBE2lGzqkEYG+Dve3pXbFXep6+OAn8HCA+WRsRhzCi+R0wLpEx/rMJjkcaYNLG+q
 dSSkOgLwiRuFtkmMAIKxduH9VCzd+ala0si/o6H5FWCcaxFpeyOtEmPHyR8rgobb4J
 ii9MbSj+EaOnw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X2OkAGLs_MUX; Fri, 18 Jun 2021 16:09:41 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 2C3B4347027;
 Fri, 18 Jun 2021 16:09:41 -0400 (EDT)
Date: Fri, 18 Jun 2021 16:09:41 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <639092151.13266.1624046981084.JavaMail.zimbra@efficios.com>
In-Reply-To: <1d617df2-57fa-4953-9c75-6de3909a6f14@www.fastmail.com>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
 <26196903-4aee-33c4-bed8-8bf8c7b46793@kernel.org>
 <593983567.12619.1624033908849.JavaMail.zimbra@efficios.com>
 <1d617df2-57fa-4953-9c75-6de3909a6f14@www.fastmail.com>
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4026)
Thread-Topic: membarrier: Rewrite sync_core_before_usermode() and improve
 documentation
Thread-Index: TNI8bcpJxqg3ikOEgJlOrb/5dX9ixA==
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jun 18, 2021, at 3:58 PM, Andy Lutomirski luto@kernel.org wrote:

> On Fri, Jun 18, 2021, at 9:31 AM, Mathieu Desnoyers wrote:
>> ----- On Jun 17, 2021, at 8:12 PM, Andy Lutomirski luto@kernel.org wrote=
:
>>=20
>> > On 6/17/21 7:47 AM, Mathieu Desnoyers wrote:
>> >=20
>> >> Please change back this #ifndef / #else / #endif within function for
>> >>=20
>> >> if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)) {
>> >>   ...
>> >> } else {
>> >>   ...
>> >> }
>> >>=20
>> >> I don't think mixing up preprocessor and code logic makes it more rea=
dable.
>> >=20
>> > I agree, but I don't know how to make the result work well.
>> > membarrier_sync_core_before_usermode() isn't defined in the !IS_ENABLE=
D
>> > case, so either I need to fake up a definition or use #ifdef.
>> >=20
>> > If I faked up a definition, I would want to assert, at build time, tha=
t
>> > it isn't called.  I don't think we can do:
>> >=20
>> > static void membarrier_sync_core_before_usermode()
>> > {
>> >    BUILD_BUG_IF_REACHABLE();
>> > }
>>=20
>> Let's look at the context here:
>>=20
>> static void ipi_sync_core(void *info)
>> {
>>     [....]
>>     membarrier_sync_core_before_usermode()
>> }
>>=20
>> ^ this can be within #ifdef / #endif
>>=20
>> static int membarrier_private_expedited(int flags, int cpu_id)
>> [...]
>>                if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE))
>>                         return -EINVAL;
>>                 if (!(atomic_read(&mm->membarrier_state) &
>>                       MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY=
))
>>                         return -EPERM;
>>                 ipi_func =3D ipi_sync_core;
>>=20
>> All we need to make the line above work is to define an empty ipi_sync_c=
ore
>> function in the #else case after the ipi_sync_core() function definition=
.
>>=20
>> Or am I missing your point ?
>=20
> Maybe?
>=20
> My objection is that an empty ipi_sync_core is a lie =E2=80=94 it doesn=
=E2=80=99t sync the core.
> I would be fine with that if I could have the compiler statically verify =
that
> it=E2=80=99s not called, but I=E2=80=99m uncomfortable having it there if=
 the implementation is
> actively incorrect.

I see. Another approach would be to implement a "setter" function to popula=
te
"ipi_func". That setter function would return -EINVAL in its #ifndef CONFIG=
_ARCH_HAS_MEMBARRIER_SYNC_CORE
implementation.

Would that be better ?

Thanks,

Mathieu

--=20
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
