Return-Path: <linuxppc-dev+bounces-17379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGWyKC9loWnIsQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 10:34:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A67951B5658
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 10:34:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMjpM6wNsz3bkL;
	Fri, 27 Feb 2026 20:34:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772184875;
	cv=none; b=VqN7J+7NNV7MAD7bi56V7LrXHFDNggS55A88eRqhVtU2DE31locVxmTDK9ooHcARV140oDcdoMpWtWn6xnW8I9CXH0/iSt1NFUT/tekR0FCxOBb6E11P0uC477xfTbQRGlMIV1C9Gl0zmXjkIdIHlfyrZ7kEYBcWuef0ADrx+myBCWAmDFwplUY9i0PM7y3JsQTFZ8KyP36L1siKWDIW3uk0hbl9ldb80s1xON5gdNM+WI2byvpPV5qbTO/j3ElqBP+StHOZU6QaPtFkqiP4DcZa2XNt5zoMIkIgWhYPnNmXkVbh6C4Zw37AiNcsklS6wdxm1mzyuUWQY8AttXtWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772184875; c=relaxed/relaxed;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqQF+qzet6PY6dC2ow/aPIwkzoGz+tc5KigdT5iYy55osmcaEuLZz42pyj0uauDnCVho1DuolK26zYOjdKsA2gxrXpleOMdUeRG9QzQVsGcSoqzn8AFYYE1gvzwFOo9DFjzmBrQplAw8Eay9Fi20UcmbBvqwA+Z8S4aOUjh0s5nnYv8F7tkwMAfDHDcGqcRnHZPy0nPyB7oOj71X+BTH7aFxmSESJH3ZudGYfgSDVDQVn0It9otuRb9sc8UeFO5X+tmStEgrIX+0MPRWt7VH/CuB78+ScoLmRXRUk8qQFJXzlgAabcctE8uuch4UbR3KYoh8DXAvckuQzE81EyACYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CGeabxmB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RkiVfxGB; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CGeabxmB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RkiVfxGB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMjpM201cz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 20:34:35 +1100 (AEDT)
Date: Fri, 27 Feb 2026 10:34:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772184871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	b=CGeabxmBw+/AZ7oTl4E2tz8AJVILisXZZ+HNXpb2gagxjIcuU2+QlmjVTBAFP3VTpXMqr+
	W4LZp+Y98Z5CymhdlUDmIV64Kea7ln250JaQXXgOvmXr0ziVAGXOUhHjOQPW37tYikya19
	ijGc3SnCUR0mMJA6wDzyZy7kzqN1z3+BsFswojH/kuj7OSLMqwIFbK91Wgzv2r0KNkXIpa
	QVzGpfZ54UM3MZbDS6QpSoIR/3BuCpDmd6uAIGVpBtOFvmw2nxGO5fRDlL8UZCBRpaYRoy
	sNf035yrsMm4QtLm60j1cvAUFKhO2cM/+nIq1+vGI+k7FW6Uj8XN0kGtxPVlVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772184871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	b=RkiVfxGB7rsEx+NudL1Y/YXS7uzosxv9jyyl7qgxbgo9VIT5IDWFrH11EpmknzII7KIYCe
	b8t8QbY2jBr8fVBw==
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
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
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
In-Reply-To: <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17379-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,arndb.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A67951B5658
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:58:35AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 09:51, Arnd Bergmann wrote:
> > On Fri, Feb 27, 2026, at 07:57, Thomas Weiﬂschuh wrote:
> >> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> >> provide any 32-bit time related functionality. This is the intended
> >> effect of the kconfig option and also the fallback system calls would
> >> also not be implemented.
> >>
> >> Currently the kconfig option does not affect the gettimeofday() syscall,
> >> so also keep that in the vDSO.
> >>
> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Actually, I need to revise that. I think gettimeofday() should be
> guarded by CONFIG_COMPAT_32BIT_TIME for both the syscall and the
> vdso. Looking back at the history, I see that we added the #ifdef
> for each syscall we modified to have both time32 and time64 version.
> 
> The thing about gettimeofday() and time() is that they don't have
> a 64-bit version and libc implementations are expected to call
> clock_gettime() instead. The result was that there was never a
> patch to turn the off either.

gettimeofday() is currently the only way to get the timezone of the kernel.
But I guess this is a legacy thing anyways. If you say we should drop it,
let's drop it.


Thomas

