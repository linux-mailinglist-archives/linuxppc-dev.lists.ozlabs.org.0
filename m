Return-Path: <linuxppc-dev+bounces-16135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFCkJwfzcWmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:51:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2285164CE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:51:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxbsv3Flpz2ySb;
	Thu, 22 Jan 2026 20:50:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769075459;
	cv=none; b=Eb7KQienMhQuZTgOpFUPrtDj+VmPYaYbbx8DS0PaCVcnCZE4b0GiWH3gfoks8Tf/6kjpWtZSt9wtkviNl18rjdJZ71eP0b2EzxcPSgGFSY2dIyuPr4GBtnN1EjycQmIKZ+Meh/UUpl6N24+pigWGKZ8F5wZML6auXvbt8RgZgdVFZe1pTvrtgXa0F3AYJVUpVc7KZ531dO293JIuW4Twb63YxdGwm1Ksz+Tr/HJkQYcjIw3pQgQwCXX5ug7bCQGDhGed8bPLj1cz/86UgRNvJskILz561ikrLiS2zXQW8SnE39LvYIa4All5Vz93eJ0MOw0hGJM/1QTPK4mFc8ITVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769075459; c=relaxed/relaxed;
	bh=7gj/wHKpGFnRKrflFTWaiMuLeEIdxmsmeaQTiiQQI50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azlzzBrICAPnIbgFqZcMAKpLF41qnCP9LpaBnmWBCj5d8H6NnAOUeLly2smKYJR+MM0X/EkZ3D2jHoP3JjD5+R91pVvnWlWWDqqERTumelv2714n11HYoyAPLSHZmwOgW7KvF6GABEBn1RUMepzHv3W8LJeSnUWpu9Robr5ld9wRLuJJQUB/Oi95s5B472ox6ij1biAmRvXedSZ5AeAhOJJpSwwhhA27NY6C9SgZNFs17Dp1nAsCRKM7cjhlzhOJb2aAVO3d6LNaJKsJjWLT9Ujn13fSF6TwJDs2H99Ryh3gOnL/h37PDYPpb9fP8DxAKU5vjhqUGz4QzmzgRxfk9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rGYvSFuZ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iJKOhJDI; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rGYvSFuZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iJKOhJDI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxbss4gYrz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 20:50:57 +1100 (AEDT)
Date: Thu, 22 Jan 2026 10:50:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769075443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gj/wHKpGFnRKrflFTWaiMuLeEIdxmsmeaQTiiQQI50=;
	b=rGYvSFuZ6QEK2UTVkgRP55mqviom8IDiB1yBonsdcEhM00e1pSOZuqNXcTktkRR7C0u7ig
	W6YZCWxhMtcS0+coRw6t7qOg33xWbf4iph2052TXTcgNJP0PvcJfvjnSBQNdnLaiJtn5FC
	GaaWDln+tH3o2G3+Lk5pV4FCumf64zOc8ELge2BXaNiE82bw4xcsuqDb+vAQPtNkWuXpzA
	9BTe31PTQxucOxKfBCWioN3cWQex3AQeCWV/OmyI15qv+3SyLa1LHl994xgXt4Na7VhYh6
	rlGLZE4vdLe/szBGowtz5lEgQrSQTKmi4H5ATry9amdFw8Fz+YDsalVpUj9K9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769075443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gj/wHKpGFnRKrflFTWaiMuLeEIdxmsmeaQTiiQQI50=;
	b=iJKOhJDIyI0iAn9MnqCYXuc9t61Hlj/DyJlYxxlQY4H9OeGktg+nOiHefe5jhrfnizMmw4
	0Wdv98hwyu5H/XDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, 
	"luto@kernel.org" <luto@kernel.org>, "chleroy@kernel.org" <chleroy@kernel.org>, 
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Message-ID: <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
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
In-Reply-To: <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
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
	TAGGED_FROM(0.00)[bounces-16135-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: 2285164CE5
X-Rspamd-Action: no action

Hi Alexander,

On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
> Hi Thomas, Christophe,
> 
> On Wed, 2026-01-14 at 08:26 +0100, Thomas Weiﬂschuh wrote:
> > For consistency with __vdso_clock_gettime64() there should also be a
> > 64-bit variant of clock_getres(). This will allow the extension of
> > CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
> > time types from the kernel and UAPI.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> I've bisected this patch to cause the following build failure on my side:
> 
>   LDS     arch/powerpc/kernel/vdso/vdso32.lds
>   VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
>   VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>   VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
>   VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
>   VDSO32A arch/powerpc/kernel/vdso/note-32.o
>   VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
>   VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
>   VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
>   VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>   VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
>   VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2

Thanks for the report!

> Does it ring any bells? What could I try/test?

Not immediately, but I'll look into it.

> I'm using gcc-15.2.0 and binutils 2.45.1.

Is this a toolchain from https://cdn.kernel.org/pub/tools/crosstool/ ?
Could you also share your configuration?

> > ---
> > Based on tip/timers/vdso.
> > 
> > This was missed in the original vdso_getres_time64() series as powerpc
> > does not use include/vdso/gettime.h.
> > ---
> >  arch/powerpc/include/asm/vdso/gettimeofday.h |  2 ++
> >  arch/powerpc/kernel/vdso/gettimeofday.S      | 12 ++++++++++++
> >  arch/powerpc/kernel/vdso/vdso32.lds.S        |  1 +
> >  arch/powerpc/kernel/vdso/vgettimeofday.c     |  6 ++++++
> >  4 files changed, 21 insertions(+)

(...)

