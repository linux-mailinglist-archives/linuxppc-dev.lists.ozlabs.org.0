Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3CD46F7BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:56:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J99tT6tydz3cPt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k4Ixw+o1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J99sp2s7Dz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:56:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k4Ixw+o1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J99sn4XY5z4xZ1;
 Fri, 10 Dec 2021 10:56:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639094174;
 bh=/v4SVtZq8xW+evoRy4+yM+wHmPlfA9nlX7pd5+hkz40=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k4Ixw+o1rT6uKSLGyAz9FDErqBItZ0z/IJjiPwPEEjOgFLb/Z/rHctYSMJ0nkj2Vh
 P4yJKALFXD1W6yrnl+kKtZE9lQ5KI5ZQ1K1ARmodGr3xtyRGrSeYs3S3RoeAZvBrE7
 C2n/mUVNgeKx+AX9Dv4NZ7BtgRRqqCDD71OCe55pHw/5Pq4zKKHEGWHHWav0kEArSE
 M6Ddew6uJFVhz9ss/8oNLA3/G/xAI2Hw9B4HetqPfJzdZ/igxLgPXNd2qfVi1ts1dl
 n3PkPAHdqjSQ2/1I0XJzJcgvFHbuO5RMZAGxoaLmlW5msnOXjs1HMzlzVV9SMu4XNi
 xf8Fk9DnbM7zg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
In-Reply-To: <7990b457-0b16-b4fb-d279-89a4cdc093a7@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
 <1639044621.jeow25j0pr.astroid@bobo.none>
 <360e2a3e-63c6-3ce2-f481-695ad0ec4880@csgroup.eu>
 <1639046542.qkwu4mjtew.astroid@bobo.none>
 <87v8zym39m.fsf@mpe.ellerman.id.au>
 <7990b457-0b16-b4fb-d279-89a4cdc093a7@csgroup.eu>
Date: Fri, 10 Dec 2021 10:56:11 +1100
Message-ID: <87r1almixw.fsf@mpe.ellerman.id.au>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/12/2021 =C3=A0 12:22, Michael Ellerman a =C3=A9crit=C2=A0:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>=20
>>> Excerpts from Christophe Leroy's message of December 9, 2021 8:22 pm:
>>>>
>>>>
>>>> Le 09/12/2021 =C3=A0 11:15, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>> Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
>>>>>> Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
>>>>>> remove arch/powerpc/mm/mmap.c
>>>>>>
>>>>>> This change provides standard randomisation of mmaps.
>>>>>>
>>>>>> See commit 8b8addf891de ("x86/mm/32: Enable full randomization on i3=
86
>>>>>> and X86_32") for all the benefits of mmap randomisation.
>>>>>
>>>>> The justification seems pretty reasonable.
>>>>>
>>>>>>
>>>>>> Comparison between powerpc implementation and the generic one:
>>>>>> - mmap_is_legacy() is identical.
>>>>>> - arch_mmap_rnd() does exactly the same allthough it's written
>>>>>> slightly differently.
>>>>>> - MIN_GAP and MAX_GAP are identical.
>>>>>> - mmap_base() does the same but uses STACK_RND_MASK which provides
>>>>>> the same values as stack_maxrandom_size().
>>>>>> - arch_pick_mmap_layout() is almost identical. The only difference
>>>>>> is that it also adds the random factor to mm->mmap_base in legacy mo=
de.
>>>>>>
>>>>>> That last point is what provides the standard randomisation of mmaps.
>>>>>
>>>>> Thanks for describing it. Could you add random_factor to mmap_base for
>>>>> the legacy path for powerpc as a 2-line change that adds the legacy
>>>>> randomisation. And then this bigger patch would be closer to a no-op.
>>>>>
>>>>
>>>> You mean you would like to see the following patch before doing the
>>>> convert ?
>>>>
>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/7dabf1cbde67a3=
46a187881d4f0bd17347e0334a.1533732583.git.christophe.leroy@c-s.fr/
>>>
>>> Yes.
>>=20
>> My comment at the time was:
>>=20
>>    Basically mmap_is_legacy() tells you if any of these is true:
>>=20=20=20=20
>>     - process has the ADDR_COMPAT_LAYOUT personality
>>     - global legacy_va_layout sysctl is enabled
>>     - stack is unlimited
>>=20
>>    And we only want to change the behaviour for the stack. Or at least t=
he
>>    change log of your patch only talks about the stack limit, not the
>>    others.
>>=20=20=20=20
>>    Possibly we should just enable randomisation for all three of those
>>    cases, but if so we must spell it out in the patch.
>>=20=20=20=20
>>    It'd also be good to see the output of /proc/x/maps for some processes
>>    before and after, to show what actually changes.
>>=20
>>=20
>> From: https://github.com/linuxppc/issues/issues/59#issuecomment-502066947
>>=20
>>=20
>> So I think at least the change log on that patch still needs updating to
>> be clear that it's changing behaviour for all mmap_is_legacy() cases,
>> not just the stack unlimited case.
>>=20
>> There's also a risk changing the mmap legacy behaviour breaks something.
>> But we are at least matching the behaviour of other architectures, and
>> there is also an escape hatch in the form of `setarch -R`.
>
> That was the purpose of adding in the change log a reference to commit=20
> 8b8addf891de ("x86/mm/32: Enable full randomization on i386
> and X86_32")
>
> All this applies to powerpc as well.

Yeah, I'm just a pessimist :) So although the security benefit is nice,
I'm more worried that the layout change will break some mission critical
legacy app somewhere. So I just like to have that spelled out in the
change log, or at least in the discussion like here.

> But I can copy paste the changelog of that commit into mine if you think=
=20
> it is more explicit.

Just referring to it is probably fine.

> I agree that old patch was only refering to stack limit, I had no clue=20
> of everything else at that time.

No worries.

cheers
