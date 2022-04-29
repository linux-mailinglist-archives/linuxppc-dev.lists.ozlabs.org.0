Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0055149B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 14:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqXGP1bZdz3bsD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 22:43:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eEFfzFic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqXFl5nLFz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 22:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eEFfzFic; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KqXFh0Xt5z4xL5;
 Fri, 29 Apr 2022 22:42:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651236168;
 bh=vbkmVg/r6rxNBbDiZTaNN5fNBHgL7vXyQfqZMANX7+I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eEFfzFic/pULKG6dKbJMRqt39yySGPNbzHf0ESwn/imXPpgd1BTbWd5SlZYzVc88l
 zotrQvCd/bhq43RE3KMlksMzu2Y8D9MjDfJCRY8jk9MBOhBhtJZNAR3nXvDuCMtvuY
 yREI8xymtj1rvOIuikj41WiL6q8frVeLBdAbbrEEK0rVkRR0iwYwBTgmU52mMhrT3F
 two2z+huXBuKUN78qtc5gg6naVSvnBbcdCEE1Vk5VAw5/trXMkJmisiO7qmI7vSykS
 ZeFaHfvGtU8j3KQEn+qzxJVgOhS8nNI0seVoCrmIYF5I348luugSC+9NDK4ePkGu3T
 wbSlwY3qgnJZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/time: Always set decrementer in timer_interrupt()
In-Reply-To: <1651119254.5iw3tsme9w.astroid@bobo.none>
References: <20220420141657.771442-1-mpe@ellerman.id.au>
 <20220420142821.GR163591@kunlun.suse.cz>
 <1650506701.dv7x3vxlhb.astroid@bobo.none>
 <1651119254.5iw3tsme9w.astroid@bobo.none>
Date: Fri, 29 Apr 2022 22:42:45 +1000
Message-ID: <878rro9i2i.fsf@mpe.ellerman.id.au>
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
Cc: miguel.ojeda.sandonis@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Nicholas Piggin's message of April 21, 2022 12:07 pm:
>> Excerpts from Michal Such=C3=A1nek's message of April 21, 2022 12:28 am:
>>> Hello,
>>>=20
>>> On Thu, Apr 21, 2022 at 12:16:57AM +1000, Michael Ellerman wrote:
>>>> This is a partial revert of commit 0faf20a1ad16 ("powerpc/64s/interrup=
t:
>>>> Don't enable MSR[EE] in irq handlers unless perf is in use").
>>>>=20
>>>> Prior to that commit, we always set the decrementer in
>>>> timer_interrupt(), to clear the timer interrupt. Otherwise we could end
>>>> up continuously taking timer interrupts.
>>>>=20
>>>> When high res timers are enabled there is no problem seen with leaving
>>>> the decrementer untouched in timer_interrupt(), because it will be
>>>> programmed via hrtimer_interrupt() -> tick_program_event() ->
>>>> clockevents_program_event() -> decrementer_set_next_event().
>>>>=20
>>>> However with CONFIG_HIGH_RES_TIMERS=3Dn or booting with highres=3Doff,=
 we
>>>=20
>>> How difficult is it to detect this condition?
>>>=20
>>> Maybe detecting this could be just added?
>>=20
>> Possibly not too difficult but I'd like to see if we can get this to work
>> in core timer code -
>>=20
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-April/242212.html
>>=20
>> I'll resend as a patch and see what flamage I get...
>
> tglx merged it into his tree, so we could try again after its
> upstream.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dt=
imers/core&id=3D62c1256d544747b38e77ca9b5bfe3a26f9592576
>
> I'm kind of worried the patch will explode some strange clock event=20
> device in an obscure way so we may wait for a release or two first.

Hah yep, :face-with-cold-sweat:

I created an issue so hopefully we don't forget:

  https://github.com/linuxppc/issues/issues/408

cheers
