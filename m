Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA035BFE89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 15:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXdnk1ZB9z3cCL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 23:00:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hjA4SvFW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXdn73gZ7z30LJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 23:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hjA4SvFW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MXdn0035Tz4xG9;
	Wed, 21 Sep 2022 23:00:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663765221;
	bh=QT/Sl5AvXoUzaa7Mvmu4tMi+mbhfGfOR2s8x//+T2VY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hjA4SvFWM/5Cex+dNXi9ZS8vBM8YsfJ2esWTPctRWZuPxP8Zr1thsxjaxFiUVdJbm
	 cYkKXj8QJq3eUhadLV8HDf3qMWwXdhtDyNX5yEPJj46HF7MuP5sZE9GQVUtIlJRJFY
	 GAuTf0KYAfy1F09+xy3KD8PC+JMCyd6LSW5Opsbt2Ha7fkxRYPwqsj/KxSp7Rtt3w5
	 CiwzFpaE3ybt+1ljMDmHxoDaU7Qgnb6nZWlVXCbNV8wwBwjEki6CwtCRlQ75+Rnmnh
	 jISwtL+dfAdsZDPV7EIQe/JjoUdVrHXW93wgz+QCX4S7Oq662PaU/hP58nEUYjFy9/
	 pgxXLkacus4vw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Samuel Holland
 <samuel@sholland.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
In-Reply-To: <9a433048-ab0d-6d57-7aa8-c9acbe7b7a99@csgroup.eu>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
 <87h713leu8.fsf@mpe.ellerman.id.au>
 <9a433048-ab0d-6d57-7aa8-c9acbe7b7a99@csgroup.eu>
Date: Wed, 21 Sep 2022 23:00:16 +1000
Message-ID: <87a66s287z.fsf@mpe.ellerman.id.au>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/09/2022 =C3=A0 14:37, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 16/09/2022 =C3=A0 07:05, Samuel Holland a =C3=A9crit=C2=A0:
>>>> With CONFIG_PREEMPT=3Dy (involuntary preemption enabled), it is possib=
le
>>>> to switch away from a task inside copy_{from,to}_user. This left the C=
PU
>>>> with userspace access enabled until after the next IRQ or privilege
>>>> level switch, when AMR/IAMR got reset to AMR_KU[AE]P_BLOCKED. Then, wh=
en
>>>> switching back to the original task, the userspace access would fault:
>>>
>>> This is not supposed to happen. You never switch away from a task
>>> magically. Task switch will always happen in an interrupt, that means
>>> copy_{from,to}_user() get interrupted.
>>=20
>> Unfortunately this isn't true when CONFIG_PREEMPT=3Dy.
>
> Argh, yes, I wrote the above with the assumption that we properly follow=
=20
> the main principles that no complex fonction is to be used while KUAP is=
=20
> open ... Which is apparently not true here. x86 would have detected it=20
> with objtool, but we don't have it yet in powerpc.

Yes and yes :/

>> We can switch away without an interrupt via:
>>    __copy_tofrom_user()
>>      -> __copy_tofrom_user_power7()
>>         -> exit_vmx_usercopy()
>>            -> preempt_enable()
>>               -> __preempt_schedule()
>>                  -> preempt_schedule()
>>                     -> preempt_schedule_common()
>>                        -> __schedule()
>
>
> Should we use preempt_enable_no_resched() to avoid that ?

Good point :)

...
>>=20
>> Still I think it might be our best option for an easy fix.
>
> Wouldn't it be even easier and less abusive to use=20
> preemt_enable_no_resched() ? Or is there definitively a good reason to=20
> resched after a VMX copy while we don't with regular copies ?

I don't think it's important to reschedule there. I guess it means
another task that wants to preempt will have to wait a little longer,
but I doubt it's measurable.

One reason to do the KUAP lock is it also protects us from running
disable_kernel_altivec() with KUAP unlocked.

That in turn calls into msr_check_and_clear() and
__msr_check_and_clear(), none of which is a problem per-se, but we'd
need to make that all notrace to be 100% safe.

At the moment we're running that all with KUAP unlocked anyway, so using
preempt_enable_no_resched() would fix the actual bug and is much nicer
than my patch, so we should probably do that.

We can look at making disable_kernel_altivec() etc. notrace as a
follow-up.

cheers
