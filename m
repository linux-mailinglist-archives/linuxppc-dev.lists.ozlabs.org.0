Return-Path: <linuxppc-dev+bounces-17796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIIAOpChqmlLUgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:42:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF021E1DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 10:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS1fP4BCcz3c5f;
	Fri, 06 Mar 2026 20:42:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772790157;
	cv=none; b=IUU+a5WAJpZqNmcWG+VcETq5yuWUL5kbmKqEpvtIHp2jtRmfdJLi8BmFGmob2C9E11MtMv95b1kGlI+zWPiRLSsCoX1Kg1Qm4jtVkBfMHOaVsu9cvdUQeC7bwayOLy+78sCWTPX9ZpmGRDL25jw+Ugh6lf9hILBRZjm2j8f7coJKIiV+1z0H3rb5UNShlz+fckoFW3Nhk1FF2/E80vXNgxKZ5PU2ItF7tkSzZGnXKsUTAXyZVfT/3XoIb8c2cDRqSUI0R/6TAYJ5CPkQHkvZfk+eX8+WvS/0+R58tUY5iu76QBThjCmUuXTfW4RI6Of+k5i7sqKd3SpiJpopHIqDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772790157; c=relaxed/relaxed;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjVB0WoPXXUXE8oLx2aHTpaeIh/ISyXRLWW22GvP4UF1uV6Ja5KmJURAJEFE0bxi0wEcQFWuRocdB3YHzNgO4hRNl7ZnhgVBX2zBs/c5He7Akqr53pqR1w79BXzmMLfPxeoMCT69lnU+kbKgtza7fMiotGdddbOzpcf8VKJm1bLtOFN9nyvWH+KMbFUvDodv50e5q/PFa5KvX5bYJFNkWG+oNMtqAsJ1EcvfmareRREZ7rsAISLkf0QFWGNyqyt76RknewZSgrn7iPN3VIn6ZEu20WRbOPnlZ5F5EWHBaPn7O0CNL8ZIeD6okY5sh6JwfTf7nJP+fZ7tcxBfEUoY5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TM4Rdzu3; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oyC+xISo; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TM4Rdzu3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oyC+xISo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS1fL4KTcz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 20:42:34 +1100 (AEDT)
Date: Fri, 6 Mar 2026 10:42:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772790145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	b=TM4Rdzu39Bd9EAADRCXrB648dHPFDbYqmHJbCPos+LO9cH+N8pmFEyN+hOFtV9Kt8vFREp
	Vz2d+r04CS5ZPWOfQLcxGiyBvVHBxYRUtF0f1J9roudzSb1xR2chbQbxJSmHaEE+zr5Dkh
	L980N3PTaFG/bNJvDDtnHT5s+qCpSi2kJ0polx7Ls3enbAQiD1TTXRK44vYDO2YjkASHPU
	NcseRSNfevWaqtFyIOePiKkptS7YvDO+KHjX9sQrWXgbEsq3RysABGWDsVTq2zH0syqzaW
	c2ZSYUco1APMwU44ZlLCRzJW8URBj5+vvYNvPlfpPRcw72zg8BDv8lqMl8a+Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772790145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	b=oyC+xISo6E2zXVjIcJcEaqD5pbEEgZsXJW0zYYh1sU9SGKFdilGyiunD6wDIAtY/VR2cdj
	CPkN1r8IejPumgBA==
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
Message-ID: <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
 <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
 <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
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
In-Reply-To: <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: F3FF021E1DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17796-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,vdso.so:url,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 03:57:59PM -0800, H. Peter Anvin wrote:
> On 2026-03-05 01:24, Thomas Weißschuh wrote:
> > 
> >> Weak references would be a way to work around the link failures. 
> > 
> > I am still not sure where "the link failures" should be coming from.
> > The only sense I can make out of it, is if somebody manually and directly links
> > to vdso.so. Like in the following example:

(...)

> > This actually works on glibc (not on musl). But it is highly non-standard and
> > relies on multiple implementation details. Furthermore it can fail to run on
> > systems without a vDSO, as mentioned before.
> > 
> > Is this the usage pattern you have in mind?
> > Do you know of anybody doing things this way?
> > 
> 
> Yes, and yes, I do.

Thanks.

Do you know why it is done this way? Are these applications public and
if so, could you point me to them?
In case we stub out the vDSO functions with ENOSYS, would these
applications be able to handle that error gracefully?

Personally I am still in favor of removing these functions completely
when !COMPAT_32BIT_TIME.


Thomas

