Return-Path: <linuxppc-dev+bounces-17666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AaUEuXgp2mrlAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:36:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D56921FBAA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:36:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQkxF0J05z3bp0;
	Wed, 04 Mar 2026 18:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772609760;
	cv=none; b=VQdrVGjS/nYTumt92l3XSDpdCUZ8tV/1p9VEXPE957idrFMmbgbAND+/3IgxPwzE20UUty+Ra70sy0U9cCCpLnu5ZXL7oDNwv7gGxXgbHNNPjcRaVUCl82DABNF/KuQ+wwCxaDBKn4kj+VcUd35Lx3qKJDT9L2JYVkpGl/fUdHji9MrZF5gR7saDqGOXcAn8O1oBGx7sppLn+cWroMB9T2hWhPfH8mclMne1CYfTJOznDRiK3e4Gl0zczBelK/DxlRQItOOtyLyPsT6zyJ+UwzDWDkD2cykF/ZDc0U/LUta4W4ZK7NjqX1Wrt7mKkGsSVZyvkauGGzzlNF+wr5huIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772609760; c=relaxed/relaxed;
	bh=2nS0P0VdyIdVGVKOpPjEYkaSE/WndtzqXP/uXSM1srU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/PKBTTeXWZkxvm9Fsk9+dIbffDqb3ole117VZGrSSzZmi+dml7UycqobZoqzHXxXLKhcwgLh25/Edkm8jnPibetM2g/0CYy9mRbUgL/itYsbk/GGTMKcHRcU2uu78JVdqKwyK8qz6QF7BF9swf9uZwwPmm5SMAc0rdPPnj36lBS/fbRmiUwpQW6ztBRidbbFN4o9iyTL1kVfnS5vREg5HF/rKaACFFt+Hu33Ja2hOmNEkfY6rNzrCwFj4cR7Qie0JCR+lRhs94+5aaI2TVC649Db0Jx6+O7hIwu/ux3F4alX+ZKROOWQeHeQrMWYEm/q/9tPgyVkhEFxUjBBre7WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KgHt8zIL; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FeUnLDHc; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KgHt8zIL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FeUnLDHc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQkxC3hm8z2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 18:35:59 +1100 (AEDT)
Date: Wed, 4 Mar 2026 08:35:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772609753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nS0P0VdyIdVGVKOpPjEYkaSE/WndtzqXP/uXSM1srU=;
	b=KgHt8zILvTsVGSQwSsns57pHb2TloH3vD3uJPBjZl2obifyWkKUMup+CbS9Un0sr5Js9cn
	loqMUEKO3VL7C5ZoAaV8p9F/s5rmENwDQMVMMJZ1e/xbJU9lb6NBOgib9IOkHN04LBeCYK
	1btTqKkyq2KlPA6NLmuP25Gtx9M091s4DpATEeJd9Z6tZyZzFVQmvP4CYEx063m5Pe3DnJ
	SCNABHQOqRKWwnQnn2LPqTZbhyjRMbg0HCABUFv/8PdA3Bc8BQBz2jTv/scLxIXHgmwCw8
	Av89DsQgAibY7sITO5jpPlm/fukn3h3EnTBNkTaDvPbcGzrTyAjs6viGrE2/CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772609753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nS0P0VdyIdVGVKOpPjEYkaSE/WndtzqXP/uXSM1srU=;
	b=FeUnLDHcbU/dyPEQom2WG/MpgJXSq3BKlAV0VeTApGMVedxpYe1ZsGp9BuW+Xo+X9+23M5
	4zr2HrH69nZzcHCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
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
In-Reply-To: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D56921FBAA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17666-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:hpa@zytor.com,m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:11:52AM -0800, H. Peter Anvin wrote:
> On 2026-02-27 01:34, Thomas Weißschuh wrote:
> >>>
> >> The thing about gettimeofday() and time() is that they don't have
> >> a 64-bit version and libc implementations are expected to call
> >> clock_gettime() instead. The result was that there was never a
> >> patch to turn the off either.
> > 
> > gettimeofday() is currently the only way to get the timezone of the kernel.
> > But I guess this is a legacy thing anyways. If you say we should drop it,
> > let's drop it.
> > 
> 
> The time zone in the kernel has never worked anyway, as it would require the
> kernel to contain at least the forward portion of the zoneinfo/tzdata table in
> order to actually work correctly. The only plausible use of it would be for
> local time-based filesystems like FAT, but I don't think we bother.

sys_tz is currently used by a bunch of drivers and filesystems (including FAT).
It is also used when writing to the RTC.

> A bigger question is whether or not we should omit these from the vDSO
> completely (potentially causing link failures) or replace them with stubs
> returning -ENOSYS.

I am a bit confused here. You mention 'link failures' and in another mail
'weak references as fallback'. Both are things that happen during linking
('link failures' could also be interpreted as failures during loading).
Somewhere else someone also mentioned the vDSO to be 'linkable'.
But as far as I understand, only libc interprets the vDSO, it completely
bypasses both the linker and the loader. And libc already does graceful
fallbacks to the regular systemcalls if the vDSO is missing completely or
lacks one of the functions, as both cases may happen on normal systems.

What am I missing?


Thomas

