Return-Path: <linuxppc-dev+bounces-16140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNqWKKcAcmmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:49:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28595657C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:49:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxd8z3D55z2ySb;
	Thu, 22 Jan 2026 21:49:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769078947;
	cv=none; b=QsKSoCtkKmbf+Y89mrEiia9rHDUK30x2dfaKort7nEPOse3cbRz4uh+Jerc7zq3Pvs+P8mRsezALMKewexzr5CIZRoLtDuzEkyhn7vPmo5fVkIsQUdJmuyOnXAy7Z9tt9dyx0GE7hBBPksPLT9+NUDg6Z0VWCYKTgrgboUNMdOONwlDuTztVYLAjXQFTdZImdDTWkoJI6fi/Ev6cIf9TCjzVZNRdg9KUwg9+NWRLYP1+qbDGknyIAco3iN4L62JsykviK2SJm/b0S9+3QXtZvRu3IEm/rvVSPDkIHkQs5eUvI0Dlibas3eBdaTHrEu6U9RnpMB5E+fsA/uUDSjJnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769078947; c=relaxed/relaxed;
	bh=yz+DSwWU8JZ0sAANnanhakZHSgTWOUASkzYNEIRkA4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnq/ta3w43e+4nXes1H5YianmT2fTrC9fvFnebb5fQyjwfTjoZTB0S/jumSkV0iznmKeqlUc6AMk/NR6sgCy/lfAReGt8vbiVWYxQMtozq7yag/Nn8kmaA7l3ARLYRDF530jYpTXD+j+85egHeGG9dN8G2d5NQ/G2MVAq6bdClQe2i8D+oGj7EAmw97AuiwyGjSNaPKaEfZnRG2Zf5CKDaYfKcR9GQ+Dss4O7okcP+wsBMe78CHkETGP8lPMyG8vL9OjkEc7rT8YSJOTu/I3Roi3W4ec1Vnv85qPnAJyV435vBjPvTCpVCxyIvuGpO6Ww06AwangLQg/xOiDAHFS9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HToVjISE; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VX4Jj/qv; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HToVjISE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VX4Jj/qv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 3493 seconds by postgrey-1.37 at boromir; Thu, 22 Jan 2026 21:49:06 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxd8y2Jtbz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 21:49:06 +1100 (AEDT)
Date: Thu, 22 Jan 2026 11:49:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769078942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yz+DSwWU8JZ0sAANnanhakZHSgTWOUASkzYNEIRkA4Y=;
	b=HToVjISEhrKfXzjoZssJtQjFFneR7YNHhnVNqYjz1IcvHp4fHVZixW7HtJILtujbeUodKw
	wmRBvsHzWWk6XH36VYs6V/0R9wD23Ege5llOuKxRXmBnuG6QJk1xcEhdLQAhAfL73nD3dp
	05N/uJ8zC4bDGExqr9KOBJdXiDajLNNZnTcAaQTss93Zdxqm2oe1L7Il7R3b3VAq/BTg74
	WzQ5WUPMZBtTE5JXnw+eH7Z8oWiNZHDiGZ7xuwiRF85JajQUHEGYAc0NhyBgYdFPVs/tC3
	RtXU9lFTHqJrRn5bcMogzLhfUgmP27faS2RvlJU0ts5br0nuOA25oCELMd3wfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769078942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yz+DSwWU8JZ0sAANnanhakZHSgTWOUASkzYNEIRkA4Y=;
	b=VX4Jj/qvm7cF3PiCu6/QcyqvXxmXDpzSS7pxWGGN0J8OQJQLZupNtqBUUZV1QS52zTdb62
	OufvVBY5mDQvPPBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, 
	"luto@kernel.org" <luto@kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	"vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Message-ID: <20260122114217-79f13c16-0931-4c33-b68c-08e884a26004@linutronix.de>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
 <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
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
In-Reply-To: <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16140-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 28595657C4
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:27:43AM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi Thomas,
> 
> Le 22/01/2026 ‡ 10:50, Thomas Weiﬂschuh a Ècrit†:
> > Hi Alexander,
> > 
> > On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
> > > Hi Thomas, Christophe,
> > > 
> > > On Wed, 2026-01-14 at 08:26 +0100, Thomas Weiﬂschuh wrote:
> > > > For consistency with __vdso_clock_gettime64() there should also be a
> > > > 64-bit variant of clock_getres(). This will allow the extension of
> > > > CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
> > > > time types from the kernel and UAPI.
> > > > 
> > > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > 
> > > I've bisected this patch to cause the following build failure on my side:
> > > 
> > >    LDS     arch/powerpc/kernel/vdso/vdso32.lds
> > >    VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/note-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
> > >    VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
> > >    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
> > >    VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
> > >    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
> > > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> > > make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> > 
> > Thanks for the report!
> > 
> > > Does it ring any bells? What could I try/test?
> > 
> > Not immediately, but I'll look into it.
> > 
> > > I'm using gcc-15.2.0 and binutils 2.45.1.
> > 
> > Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C03b93d2aa659407b3e5a08de599bb85e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046722536758587%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=b9WoZvMR2V3RUpOwrJtm6kmXrpnLti%2BeMJ6zpyB%2Fv4k%3D&reserved=0 ?
> > Could you also share your configuration?
> 
> I've just been able to reproduce it with ppc64_defconfig +
> CONFIG_CC_OPTIMIZE_FOR_SIZE

Thanks for the hint, no I can reproduce it, too.
> 
>   VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
> supported
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> I'll investigate

It seems the compiler decides to call memset(), which is not valid from the
vDSO. We are are using -ffreestanding. Disabling CONFIG_INIT_STACK_ALL_ZERO
fixes the issue. So I guess we should a) figure out why -ffreestanding does
not seem to work here and b) exclude the vDSO from the stack initialization
logic.

000007ac <__c_kernel_clock_getres>:
; __c_kernel_clock_getres():
; arch/powerpc/kernel/vdso/vgettimeofday.c:35
; {
     7ac: d0 ff 21 94   stwu 1, -48(1)
     7b0: a6 02 08 7c   mflr 0
     7b4: 30 00 61 39   addi 11, 1, 48
     7b8: 34 00 01 90   stw 0, 52(1)
     7bc: 01 00 00 48   bl 0x7bc <__c_kernel_clock_getres+0x10>
                        000007bc:  R_PPC_REL24  _savegpr_29
     7c0: 78 1b 7e 7c   mr      30, 3
     7c4: 78 2b bd 7c   mr      29, 5
     7c8: 78 23 9f 7c   mr      31, 4
; lib/vdso/gettimeofday.c:491
;       struct __kernel_timespec ts;
     7cc: 10 00 a0 38   li 5, 16
     7d0: 00 00 80 38   li 4, 0
     7d4: 08 00 61 38   addi 3, 1, 8
     7d8: 01 00 00 48   bl 0x7d8 <__c_kernel_clock_getres+0x2c>
                        000007d8:  R_PPC_REL24  memset
; lib/vdso/gettimeofday.c:494
;       ok = __cvdso_clock_getres_common(vd, clock, &ts);
     7dc: 78 f3 c4 7f   mr      4, 30
     7e0: 78 eb a3 7f   mr      3, 29
     7e4: 08 00 a1 38   addi 5, 1, 8
     7e8: 19 f8 ff 4b   bl 0x0 <__cvdso_clock_getres_common>
; lib/vdso/gettimeofday.c:496

(...)


Thomas

