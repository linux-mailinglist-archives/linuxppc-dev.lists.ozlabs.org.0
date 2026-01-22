Return-Path: <linuxppc-dev+bounces-16145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBmaM+MMcmksawAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 12:41:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12AD6623F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 12:41:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxfKD1vd1z2ySb;
	Thu, 22 Jan 2026 22:41:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769082080;
	cv=none; b=KP1zX6TfFzdczxUPawiKZVRlUuhVwB55qQkYfTfs2TRiy4DwhS3jX1Ks3IJpvqAhlzhO/qmcAq3omuGtLaXsi8B+I0kqXPHcuIrm2Pw6KHCAluT3jzuYUNL3t7Rzt4iafrqkLY9b+laLTRtlWx/RrIomc82hDdVVrNhEELmLAzRpU5xVnZjzrzLMqhaSec7B2rUYRkeo82Om0gyVj+nuKI/TGAk4bGvzXmaC0ie7RWmdSqPomFSKny+m4zPl83GvpQx8gfawrimDEyx0MqKsEuK+0TPLHTON9HvQeg9lxtSrCz6/2/L4Ene8p24Zj/tVyYigtNvwTk3AfktTfLC9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769082080; c=relaxed/relaxed;
	bh=IMab9KQtwRSeYSYCSxZO+KgvrgMjgddzhHrKfRsBQ00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNHB++/LOA2RcO57Jas53ouMKESrFrb6GZ6ZC5xq5+ILjTND54z19aY2HuBjNF/YeHpt/TjhdlcfszbhIfO8BorUU6b2OJqFB6vCAopY1Qnb02dLlSYXeHClSudLab8/n0nDdGcoWz7ro20Yy+zmieOPYFz09wwKqGxQGu9udtdoLQwlwTiueJIDRIwYweT2/IgwmZmUM+AghlywWYWXGrnkYomO35kzHa9UeC0FFYf7oPjMs2ojLfOA38q5AIJrMGpK7yLkRCmxsCb14HoolHzFx4QPBikHlyV3NXoXASvJNKZNJmidogkFG4dbHA+odVBrfWFrhOr4WJVAsDgqJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wT1NYn9V; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SuQstFOm; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wT1NYn9V;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SuQstFOm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxfKC1qyRz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 22:41:19 +1100 (AEDT)
Date: Thu, 22 Jan 2026 12:41:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769082070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMab9KQtwRSeYSYCSxZO+KgvrgMjgddzhHrKfRsBQ00=;
	b=wT1NYn9Vhoq3eSgAO9PZUEG591ottqsH+OpYSQt6vPw6L8VJVw0wP44V9Mk2x7T53TG5ck
	AcOQcFWmVpWLV69Igndss58C9vGSdBdZyCdbtwRDUBnhTpNPrWYxX16ZQ9bg3lUwRluhpX
	Fij5aryvb+bTQxM0dPMQx62EOLBJcH6lFQbO+iNMOhq3sFnOqtC0GOG3AmojwTzFcUM3RG
	5JVo9SdMNNZCxLgbwCb7cxQhY3/V4KH1Z3GQEF2cO8xwaypa1Xuo+J7jA7jGnq+c2maoKy
	ms+ldYey2gSyTfTpVPtjMg7gZfK9PvokAGA0uJ4Mv1oxn9lYcYKEkyI8vhI1vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769082070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMab9KQtwRSeYSYCSxZO+KgvrgMjgddzhHrKfRsBQ00=;
	b=SuQstFOmRNmvuYzo3izgO3mTP6zouU63U/x9seoJDfgOk0I82priyoxmAyMzfzm+8VWkR4
	Vx6zb8/Twuu21QAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"npiggin@gmail.com" <npiggin@gmail.com>, "luto@kernel.org" <luto@kernel.org>, 
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Message-ID: <20260122123416-4e3cd7de-5aa0-4fcc-ba64-4b5f089ab83a@linutronix.de>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
 <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
 <20260122114217-79f13c16-0931-4c33-b68c-08e884a26004@linutronix.de>
 <230c749f-ebd6-4829-93ee-601d88000a45@kernel.org>
 <20260122120333-59de004f-2273-49d2-ae93-eb3abe498ab1@linutronix.de>
 <6cb02dc1-bbaa-46e6-ace6-15698bc139e1@kernel.org>
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
In-Reply-To: <6cb02dc1-bbaa-46e6-ace6-15698bc139e1@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16145-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[siemens.com,gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,outlook.com:url]
X-Rspamd-Queue-Id: D12AD6623F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:31:32PM +0100, Christophe Leroy (CS GROUP) wrote:
> Le 22/01/2026 ‡ 12:07, Thomas Weiﬂschuh a Ècrit†:
> > On Thu, Jan 22, 2026 at 11:58:04AM +0100, Christophe Leroy (CS GROUP) wrote:
> > > 
> > > 
> > > Le 22/01/2026 ‡ 11:49, Thomas Weiﬂschuh a Ècrit†:
> > > > On Thu, Jan 22, 2026 at 11:27:43AM +0100, Christophe Leroy (CS GROUP) wrote:
> > > > > Hi Thomas,
> > > > > 
> > > > > Le 22/01/2026 ‡ 10:50, Thomas Weiﬂschuh a Ècrit†:
> > > > > > Hi Alexander,
> > > > > > 
> > > > > > On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
> > > > > > > Hi Thomas, Christophe,
> > > > > > > 
> > > > > > > On Wed, 2026-01-14 at 08:26 +0100, Thomas Weiﬂschuh wrote:
> > > > > > > > For consistency with __vdso_clock_gettime64() there should also be a
> > > > > > > > 64-bit variant of clock_getres(). This will allow the extension of
> > > > > > > > CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
> > > > > > > > time types from the kernel and UAPI.
> > > > > > > > 
> > > > > > > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > > > > > 
> > > > > > > I've bisected this patch to cause the following build failure on my side:
> > > > > > > 
> > > > > > >      LDS     arch/powerpc/kernel/vdso/vdso32.lds
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/note-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
> > > > > > >      VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
> > > > > > >      VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
> > > > > > >      VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
> > > > > > >      VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > > > > > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
> > > > > > > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> > > > > > > make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> > > > > > 
> > > > > > Thanks for the report!
> > > > > > 
> > > > > > > Does it ring any bells? What could I try/test?
> > > > > > 
> > > > > > Not immediately, but I'll look into it.
> > > > > > 
> > > > > > > I'm using gcc-15.2.0 and binutils 2.45.1.
> > > > > > 
> > > > > > Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C7f1accdfc7ef4d8ea82c08de59a664b8%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046768343248286%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7WB%2FCB2ZDhP9bD0GYwEftyRwfDCoRwuQ5uMA98JhfmE%3D&reserved=0 ?
> > > > > > Could you also share your configuration?
> > > > > 
> > > > > I've just been able to reproduce it with ppc64_defconfig +
> > > > > CONFIG_CC_OPTIMIZE_FOR_SIZE
> > > > 
> > > > Thanks for the hint, no I can reproduce it, too.
> > > > > 
> > > > >     VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > > > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
> > > > > supported
> > > > > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
> > > > > arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> > > > > make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> > > > > make: *** [Makefile:248: __sub-make] Error 2
> > > > > 
> > > > > I'll investigate
> > > > 
> > > > It seems the compiler decides to call memset(), which is not valid from the
> > > > vDSO. We are are using -ffreestanding. Disabling CONFIG_INIT_STACK_ALL_ZERO
> > > > fixes the issue. So I guess we should a) figure out why -ffreestanding does
> > > > not seem to work here and b) exclude the vDSO from the stack initialization
> > > > logic.
> > > > 
> > > 
> > > Ah, ok.
> > > 
> > > Reminds me commit b91c8c42ffdd ("lib/vdso: Force inlining of
> > > __cvdso_clock_gettime_common()")
> > 
> > Good pointer.
> > 
> > > Problem fixed with:
> > > 
> > > diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> > > index 95df0153f05ab..4399e143d43a5 100644
> > > --- a/lib/vdso/gettimeofday.c
> > > +++ b/lib/vdso/gettimeofday.c
> > > @@ -421,7 +421,7 @@ static __maybe_unused __kernel_old_time_t
> > > __cvdso_time(__kernel_old_time_t *time
> > >   #endif /* VDSO_HAS_TIME */
> > > 
> > >   #ifdef VDSO_HAS_CLOCK_GETRES
> > > -static __maybe_unused
> > > +static __always_inline
> > >   bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t
> > > clock,
> > >   				 struct __kernel_timespec *res)
> > >   {
> > 
> > Do you want to run the measurements for this one, too and submit a fix?
> > This should get us past the immediate breakage.
> 
> I'm travelling at the moment and won't be able to come with measurement
> before next month. But the performance degradation is obvious.

Ack, then I'll send a patch. Thanks for all the information.

> With the fix, the function is stackless:

(...)

> Without the fix, see below, __c_kernel_clock_getres() has to setup a stack
> in order to call __cvdso_clock_getres_common(), and in addition we see that
> __cvdso_clock_getres_common() is more or less the same size as
> __c_kernel_clock_getres() above, so time increase unquestionable.

(...)

> > I'll still try to get the stack initialization out of the vDSO.
> > It might bite us at any time in the future. As these options are meant
> > to prevent information leaks and the vDSO has no sensitive information in
> > the first place, we might as well filter them out.
> 
> Well, from the first day we converted powerpc to C time vdso, we've done our
> best in order to keep vdso stackless. So I'm not sure it is worth dealing
> with the above. Indeed if keeping it as is helps us detect everytime a
> change jeoperdises the stackless approach, that's not bad.

I was not aware about the stacklessness. Then this should be reason enough.
We should get a better system to detect these additional stacks though.
I'll think about it a bit more.

Note: -finline-stringops=memset would also avoid the issues.


Thomas

