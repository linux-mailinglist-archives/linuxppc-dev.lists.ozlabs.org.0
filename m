Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1B46E788
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 12:23:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8s9V081Gz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 22:23:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EE66aZj/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8s873tbcz3c74
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 22:22:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EE66aZj/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J8s865gcxz4xZ1;
 Thu,  9 Dec 2021 22:22:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639048951;
 bh=L4KhAjslg+bTyBL9obtudj08BBzaKbkkrH1InEo6//Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EE66aZj/Y+no5HK1ypXKUCgJCl4leAZ9HZs1ltsJUW7STjfgBgq7Ej4CtbMw4EMY4
 rhqQ65rZSY9oZgk3C72JzvePeEZ/oZUX1VhKOzDHEMOFdbgpKjWCRZvagiP3k0YnOZ
 G3Mah6bSvwHKkSRV+CDp2Cy44Yx5xRDvMjBL5BC8DOuNeKEkRJxSFUTl3+PhN0cq6n
 EQvGTaezM8CfgruLjVwyL6GTT+wnQHVDJfBwgWZXBE6UISbal2B9yK6oH7RHVqqT+c
 +AirC57MK7fi60Cr1CLlc02d+ems/YJ4uwP8DchIOZardwIXnQj0I+YF2vQQ+gStM7
 YRCYYnEJioOZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
In-Reply-To: <1639046542.qkwu4mjtew.astroid@bobo.none>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
 <1639044621.jeow25j0pr.astroid@bobo.none>
 <360e2a3e-63c6-3ce2-f481-695ad0ec4880@csgroup.eu>
 <1639046542.qkwu4mjtew.astroid@bobo.none>
Date: Thu, 09 Dec 2021 22:22:29 +1100
Message-ID: <87v8zym39m.fsf@mpe.ellerman.id.au>
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

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Christophe Leroy's message of December 9, 2021 8:22 pm:
>>=20
>>=20
>> Le 09/12/2021 =C3=A0 11:15, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
>>>> Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
>>>> remove arch/powerpc/mm/mmap.c
>>>>
>>>> This change provides standard randomisation of mmaps.
>>>>
>>>> See commit 8b8addf891de ("x86/mm/32: Enable full randomization on i386
>>>> and X86_32") for all the benefits of mmap randomisation.
>>>=20
>>> The justification seems pretty reasonable.
>>>=20
>>>>
>>>> Comparison between powerpc implementation and the generic one:
>>>> - mmap_is_legacy() is identical.
>>>> - arch_mmap_rnd() does exactly the same allthough it's written
>>>> slightly differently.
>>>> - MIN_GAP and MAX_GAP are identical.
>>>> - mmap_base() does the same but uses STACK_RND_MASK which provides
>>>> the same values as stack_maxrandom_size().
>>>> - arch_pick_mmap_layout() is almost identical. The only difference
>>>> is that it also adds the random factor to mm->mmap_base in legacy mode.
>>>>
>>>> That last point is what provides the standard randomisation of mmaps.
>>>=20
>>> Thanks for describing it. Could you add random_factor to mmap_base for
>>> the legacy path for powerpc as a 2-line change that adds the legacy
>>> randomisation. And then this bigger patch would be closer to a no-op.
>>>=20
>>=20
>> You mean you would like to see the following patch before doing the=20
>> convert ?
>>=20
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/7dabf1cbde67a346=
a187881d4f0bd17347e0334a.1533732583.git.christophe.leroy@c-s.fr/
>
> Yes.

My comment at the time was:

  Basically mmap_is_legacy() tells you if any of these is true:
=20=20
   - process has the ADDR_COMPAT_LAYOUT personality
   - global legacy_va_layout sysctl is enabled
   - stack is unlimited

  And we only want to change the behaviour for the stack. Or at least the
  change log of your patch only talks about the stack limit, not the
  others.
=20=20
  Possibly we should just enable randomisation for all three of those
  cases, but if so we must spell it out in the patch.
=20=20
  It'd also be good to see the output of /proc/x/maps for some processes
  before and after, to show what actually changes.


From: https://github.com/linuxppc/issues/issues/59#issuecomment-502066947


So I think at least the change log on that patch still needs updating to
be clear that it's changing behaviour for all mmap_is_legacy() cases,
not just the stack unlimited case.

There's also a risk changing the mmap legacy behaviour breaks something.
But we are at least matching the behaviour of other architectures, and
there is also an escape hatch in the form of `setarch -R`.

cheers

