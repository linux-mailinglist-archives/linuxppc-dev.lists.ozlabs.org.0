Return-Path: <linuxppc-dev+bounces-17383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBu0NUFvoWm6swQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 11:17:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9511B5E9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 11:17:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMklx2D11z3bmk;
	Fri, 27 Feb 2026 21:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772187453;
	cv=none; b=jc1gXC7lFWFAu2FaWenkIE0ANfb+47KKphfdxmkq0JSqmxRBg4m+1cYYXNLxmdmT3bV6gdD1CAjJqsmhxS2NVvoQxZNHdbmeyZYIQytLo5PjWngBzm1SCWm8CIgDAXvOs3DVBRcrvbDD5HOW4bNGeHNwirUtELWtEorC3ySo+LFlav6Q6ITNYYzThP5VKewXb3XRKd8Py0VLuA64wqdQwVPWDic6azgG4uXp1I5ijvrW1srEFuVyKZtTiMza1LK4Tcou89DdPpPUxPCjLjQTcOkPY1XjiO4/rier2O2+bn/eDWCWvstrEHu0DHkQg/dvCmiRQqvGT4kqNzmjsPVU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772187453; c=relaxed/relaxed;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrMuzVDNCjFkUCQ3kdTP5AcF0Pmbu/YkcswjwL7ex0N4XorwVAy7LFf5OEeobyoP1UFyHCAe/Cxbqah8FJnkgKPuIRmy2ZiB5f9jl/+1y2J5BT6qFhcbtWwOb8wPeBuwHrWc9ukG2t4fiThTmsFz36n8VV9Lu338c4jT9KyljN43q8zbmkkfowe3aiseU/ilAtqANpfQi4/SZUNrkGHp+7tlR9bv4bH1uLomwBoOJRCybG8OkjhjOezTc9tXODoa44uDEDBCFkbpvVSd7lrcayddFxf0WLMKyCPD6U8gkFdEjXpXwXIt+kyHKQDnm1X6Vzj6X+i5YtZ2A3kUNaeL6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uvUScOGe; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zMotJU6z; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uvUScOGe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zMotJU6z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMklw25hGz3bmR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 21:17:32 +1100 (AEDT)
Date: Fri, 27 Feb 2026 11:17:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772187447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	b=uvUScOGeEtjwcP5o+9FlkcoM/tsQ2p+iS4golr6rEQzvNnBmfRrB15eREn36vin9xWtk4R
	R+scJBIbCwcu8ejzzwna0XvtrSvCJU0S8aMZFE7pPGYvoRQA/K66wp+k9XyoG6GyRWbLsR
	m+LrU3AmcH990iPdr88i4WX/bALPzfMPTotlvi/ViucHGI3Fg2oOsAThppaAKPHfkJyGCd
	KRNj5KvHaT/t5HDzXtvuP7H/4Gjxk7RJ16thKkCrlhyt+V5Coe+QKQ4+XyfXfRJ+5CnPYx
	ANjXNees6mZDGAcgX4GITascJiWwlGJVtUzrfRYlIUwjLMYaRBdBHsN98ofYrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772187447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	b=zMotJU6zK8AJTd+oBLmYBsNqn5Y7oSIh33pnZakNw1vXBlklgnk+o8FNEKHG956G47ENbM
	iokcOGZSBbhwZKDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Message-ID: <20260227110939-7ba009bc-3223-4d85-8ac8-e388568af399@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
 <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
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
In-Reply-To: <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17383-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EF9511B5E9A
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:03:30AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 10:31, Thomas Weißschuh wrote:
> > On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
> >> On Fri, Feb 27, 2026, at 07:57, Thomas Weißschuh wrote:
> >> 
> >> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
> >> Fix gettimeofday() in the vdso library") as a bug fix. This may not
> >> have been the correct fix because I don't see how it addressed the
> >> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
> >> CPU without the timer registers, but I think we should try to make
> >> sure that there is no regression from reverting it now.
> >
> > I can't make sense out of this commit. The generic vDSO automatically falls
> > back to the syscall if it can not handle the current clocksource.
> > There is no explanation *why* this should be broken on MIPS.
> > It works correctly on my x86 machines.
> 
> Agreed, the explanation is incomplete at best. Maybe Vincenzo remembers
> more details as he did the original patch.

That would be great.

> Maybe the fallback logic didn't exist at the time of that fix?

It did, and as far as I can see it looks fine.

> > Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday()
> > and apparently that is not broken.
> 
> Not sure, maybe nobody noticed the bug yet, or maybe both 
> vdso_gettimeofday() and vdso_clock_gettime() now work correctly
> after another bugfix.

This is my suspicion.

If I mark the R4K and GIC clocksources as not vDSO compatible,
the automatic syscall fallback works correctly in my tests.

> The condition is fairly rare, as almost all MIPS systems have
> a working clocksource, the few exceptions I see in Kconfig are
> 
> - R3000 based DECstation
> - Sibyte
> - Ingenic Xburst
> - Octeon
> 
> There are not many users left on R3000 and Sibyte platforms, but
> Xburst and Octeon were reasonably common in the past, so it should
> have come up at some point.
> 
> >>  config MIPS_DISABLE_VDSO
> >> -	def_bool CPU_MICROMIPS
> >> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)
> >
> > That is an an independent optimization IMO.
> 
> The idea here was that doing this would save you the trouble
> of figuring out exactly how it was broken in the past and
> whether the #ifdef is still needed.

We would still have the problem that on modern systems the clocksource
can get marked as unstable which will trigger a switchover to another
clocksource. If that one is not vDSO compatible the systemcall fallback
will also be used. So we want to fix this properly in any case. And then
the config change is only an optimization.


Thomas

