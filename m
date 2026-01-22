Return-Path: <linuxppc-dev+bounces-16143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKkKAeUEcmmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 12:07:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1765B8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 12:07:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxdYr50qzz2ySb;
	Thu, 22 Jan 2026 22:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769080032;
	cv=none; b=DIrOsWKjiXYy22fP535sJP97oU55m8tzuFGWoaN1xvXpxracdJjUGsUdwkWBdgPxDEOMg87OoVx7o+/6jtbSQDMfg6UY4C3QqE5BCBdcDGJO3n2NQ6abwL6IkSNXlt3bqf87x0LNQu4yOopZcOCkwLokSdDpylHnTCiOOyE5YY2FVWrBIpT19dMJbltS3EzTPkn9bZwUkH4+h185YWRi0xXqIewnyN4rVQOeme2tlmG5hsoEmCN9UhY2VZWgohvUaiCcdkRuStrrqSq+kyBCR+5iJmyTDp9ROVTlEtBCV0q4IIVCeaGVrpcc4u3g8Tak6vyXPP46lMUfVVQqIeSBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769080032; c=relaxed/relaxed;
	bh=5uGDLKvqcAo5CRaOFmm/0szWk6vsDD1mekXqcA7uMWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTRsA4OgEZ51Z45iNpUkxGObBLNG5ktrbBIqnJ+wURvxAg7It1wOl6qv2foMJB8xc5P5hCKylCodKANZNIi8rNGcbssNornLc809oiOn2HGy4vACDJo0kVTws1bZpBN5EFcOTaI2aZjEp287ifc8oUDboyLh+LSWDRAoSTmD3tInc6inxIyZUUBgjNJ5cfBpcxEKsq70mctw1n+l+HpXTJ/rK0pWPoxMps9rPJl+pOFA9szC0LO+DA+VoKUyl1A09s9+g8NhfJsQksngrQIh8VoasPlE8TJfoSUdMgAEFM2Lq/E4QbeL0S6GcrZmn7DKJTa7xZiIDL3LGS73yGdOEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gJBgOL8U; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q52AyGk8; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gJBgOL8U;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q52AyGk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxdYq5Mzxz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 22:07:11 +1100 (AEDT)
Date: Thu, 22 Jan 2026 12:07:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769080024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5uGDLKvqcAo5CRaOFmm/0szWk6vsDD1mekXqcA7uMWk=;
	b=gJBgOL8U5V+P2sYDfe6LBBoDzEEVS/AN3uAwk/mSwweD1pMSnk/MupvdfaWTklyKdgWlzG
	XaMkAHcJQeVKA57vHL2B1qGhMwK96cg02EDwx+uu0k6fbvcda1sYKwiTg7Y1dONgVpwrP/
	5LZmjHCoNqwNro4KzRvlr8PJNeoaaujD+4twtOYLejtHK7jyHHLPhIGKcj4UDT1BF0uJbU
	4zzqM4VKp4LGNDkD46h75Pg4gdQpu7RCNUtXL7d973GvUKmi/Aiqqw7tlMbj6QPADjB3SH
	KQhbJbUCP7/oHaaMXKVAJeP+MIK6b1bTeHDoUpluewRdw+PFZKlTKYrrdhwV1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769080024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5uGDLKvqcAo5CRaOFmm/0szWk6vsDD1mekXqcA7uMWk=;
	b=Q52AyGk8ApkJo3jYPiICZN0nzJNy2ioche5DC2C5Wo4o6QVKRuPTYh3+s1mvcLigtysVZR
	qoEMPlWyvhAT9vAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"npiggin@gmail.com" <npiggin@gmail.com>, "luto@kernel.org" <luto@kernel.org>, 
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Message-ID: <20260122120333-59de004f-2273-49d2-ae93-eb3abe498ab1@linutronix.de>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
 <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
 <20260122114217-79f13c16-0931-4c33-b68c-08e884a26004@linutronix.de>
 <230c749f-ebd6-4829-93ee-601d88000a45@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <230c749f-ebd6-4829-93ee-601d88000a45@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16143-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[siemens.com,gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: 5DF1765B8E
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:58:04AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 22/01/2026 ‡ 11:49, Thomas Weiﬂschuh a Ècrit†:
> > On Thu, Jan 22, 2026 at 11:27:43AM +0100, Christophe Leroy (CS GROUP) wrote:
> > > Hi Thomas,
> > > 
> > > Le 22/01/2026 ‡ 10:50, Thomas Weiﬂschuh a Ècrit†:
> > > > Hi Alexander,
> > > > 
> > > > On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
> > > > > Hi Thomas, Christophe,
> > > > > 
> > > > > On Wed, 2026-01-14 at 08:26 +0100, Thomas Weiﬂschuh wrote:
> > > > > > For consistency with __vdso_clock_gettime64() there should also be a
> > > > > > 64-bit variant of clock_getres(). This will allow the extension of
> > > > > > CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
> > > > > > time types from the kernel and UAPI.
> > > > > > 
> > > > > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > > > 
> > > > > I've bisected this patch to cause the following build failure on my side:
> > > > > 
> > > > >     LDS     arch/powerpc/kernel/vdso/vdso32.lds
> > > > >     VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/note-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
> > > > >     VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
> > > > >     VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
> > > > >     VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
> > > > >     VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > > > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
> > > > > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> > > > > make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> > > > 
> > > > Thanks for the report!
> > > > 
> > > > > Does it ring any bells? What could I try/test?
> > > > 
> > > > Not immediately, but I'll look into it.
> > > > 
> > > > > I'm using gcc-15.2.0 and binutils 2.45.1.
> > > > 
> > > > Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C937051154ddf479721f708de59a3e01c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046757528646789%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=qkl4zNfg2j%2F24vZV7nQ7LLDtxG0WbgaJc30kjHQZqpk%3D&reserved=0 ?
> > > > Could you also share your configuration?
> > > 
> > > I've just been able to reproduce it with ppc64_defconfig +
> > > CONFIG_CC_OPTIMIZE_FOR_SIZE
> > 
> > Thanks for the hint, no I can reproduce it, too.
> > > 
> > >    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
> > > supported
> > > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
> > > arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> > > make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> > > make: *** [Makefile:248: __sub-make] Error 2
> > > 
> > > I'll investigate
> > 
> > It seems the compiler decides to call memset(), which is not valid from the
> > vDSO. We are are using -ffreestanding. Disabling CONFIG_INIT_STACK_ALL_ZERO
> > fixes the issue. So I guess we should a) figure out why -ffreestanding does
> > not seem to work here and b) exclude the vDSO from the stack initialization
> > logic.
> > 
> 
> Ah, ok.
> 
> Reminds me commit b91c8c42ffdd ("lib/vdso: Force inlining of
> __cvdso_clock_gettime_common()")

Good pointer.

> Problem fixed with:
> 
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 95df0153f05ab..4399e143d43a5 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -421,7 +421,7 @@ static __maybe_unused __kernel_old_time_t
> __cvdso_time(__kernel_old_time_t *time
>  #endif /* VDSO_HAS_TIME */
> 
>  #ifdef VDSO_HAS_CLOCK_GETRES
> -static __maybe_unused
> +static __always_inline
>  bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t
> clock,
>  				 struct __kernel_timespec *res)
>  {

Do you want to run the measurements for this one, too and submit a fix?
This should get us past the immediate breakage.

I'll still try to get the stack initialization out of the vDSO.
It might bite us at any time in the future. As these options are meant
to prevent information leaks and the vDSO has no sensitive information in
the first place, we might as well filter them out.


Thomas

