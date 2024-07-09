Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C158D92BA69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:03:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HDICM+k6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJLlv4RpWz3cWd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:03:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HDICM+k6;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJLl94VF8z3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 23:03:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720530191;
	bh=Q8gSg+bXfSIMjxyQ8VqEPJ+/eqbSrn9qWPO7jTl1J6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HDICM+k6YMmx/TgvJ+7XibgE8njhjCC8Rt77rRZKFZaVDksi1xMTL+cgGCdcxAoym
	 HiQlgWqb9+q7Jdcncs8D0FKWPrwRC/oFi2y1rGdXn3voe8uqcSuHZaOhZy8hgTHdkT
	 7OIDXsgwAnTKqp6fVcUD/rJlnP4NMhWoxD632+YJmCS2L/EceQxyVKATEMumbBAwig
	 4V2ketbAQnR3aGhg/FCia/yjnMz/61tIinh+9Fq6aln3WMfr0mJC1XoT34UltNclAy
	 yNAHfWd1rMM4sxbFw7Shq70e6OkwlO/Um322HAvRQ2Cc2nqb/qu9nLSBfqn8P/hL6Q
	 ktE+itiIR9mGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJLl30Zwgz4w2P;
	Tue,  9 Jul 2024 23:03:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
In-Reply-To: <20240709105314.GA26833@kitsune.suse.cz>
References: <20240625134047.298759-1-npiggin@gmail.com>
 <20240709105314.GA26833@kitsune.suse.cz>
Date: Tue, 09 Jul 2024 23:03:10 +1000
Message-ID: <87h6cy67ld.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> On Tue, Jun 25, 2024 at 11:40:47PM +1000, Nicholas Piggin wrote:
>> kexec on pseries disables AIL (reloc_on_exc), required for scv
>> instruction support, before other CPUs have been shut down. This means
>> they can execute scv instructions after AIL is disabled, which causes an
>> interrupt at an unexpected entry location that crashes the kernel.
>>=20
>> Change the kexec sequence to disable AIL after other CPUs have been
>> brought down.
>>=20
>> As a refresher, the real-mode scv interrupt vector is 0x17000, and the
>> fixed-location head code probably couldn't easily deal with implementing
>> such high addresses so it was just decided not to support that interrupt
>> at all.
>>=20
>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv in=
structions")
>
> looks like this is only broken by
> commit 2ab2d5794f14 ("powerpc/kasan: Disable address sanitization in kexe=
c paths")
>
> This change reverts the kexec parts done in that commit.
>
> That is the fix is 5.19+, not 5.9+

Commit 2ab2d5794f14 moved the kexec code from one file to another, but
didn't change when the key function (pseries_disable_reloc_on_exc()) was
called.

The old code was:

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platform=
s/pseries/setup.c
index a3dab15b0a2f..c9fcc30a0365 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -421,16 +421,6 @@ void pseries_disable_reloc_on_exc(void)
 }
 EXPORT_SYMBOL(pseries_disable_reloc_on_exc);

-#ifdef CONFIG_KEXEC_CORE
-static void pSeries_machine_kexec(struct kimage *image)
-{
-       if (firmware_has_feature(FW_FEATURE_SET_MODE))
-               pseries_disable_reloc_on_exc();
-
-       default_machine_kexec(image);
-}
-#endif
-

ie. pseries_disable_reloc_on_exc() (which disables AIL) is called before
default_machine_kexec() where secondary CPUs are collected.

So AFAICS the bug would still have been there prior to 2ab2d5794f14. But
it's late here so I could be reading it wrong.

cheers
