Return-Path: <linuxppc-dev+bounces-14007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03071C46531
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 12:40:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4nlz5jq4z2xqZ;
	Mon, 10 Nov 2025 22:40:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762774831;
	cv=none; b=WvC+tEIZEcRcCmsEd8t6TMO40VjD3jUXELQxaZrwdpJfU8WO3ujsH6dIEsNkWEmAZucCdfFxwA6JLBSyAbsGxafIS6Y03zeRXvdxGwJDF7k5ktkMpZ8mG8pBsTEIkGUEh7vaR6l/ccD1y1zfKN3UJjLahk/GOXzupasCqxNvuiKuMdFO9gvnpfvWdT3KjrXkKZ9/zsDG2bC7ca3S+WjKj2T+PybNvUwbrsL3JTawdehUTZICC/XTAJuZ439hau1EKjBjT3CmZOWW+AC0JT1Nld7kZ43Mo4NN+rplCq8v2SKMhabmznghS2qPVA5iU3J5nVRp2o2Qlc4CUy/u2HBhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762774831; c=relaxed/relaxed;
	bh=WUP/wtp+QdGXlvt3yNjaBtNTKb3hr2sjUsHqlx5bmiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+tQe+bW1caI00m/cRdjdc8sBqVlEaMNAesOon/BgLO3Fjuzxi0zdl/q+sAu9ahJNkOeW4MrkaP3H9unP0nj58Jv4NTwZlQDnCk07M7NpZL/H82wxwrG1rpHLezkPE00WwmLu8PvofVviBeWRe3E+yDey5bVHTW1+aKdhp9oh+xUEdYJrrzWzm8Xu0s8Rqgx7Z7oK6CRs2FABteN+IIPesLcp+lLV9IVFj9eaOxTxgW/Q1ff8t6sIYVPefgoiAhzW670htIeJkd7TIN5lbQRY/JIw8adaua0cv5e9NFZ+EquBsvhQlsA3ttf7FhIoWguyYhhyZ32HgxSVfAFtoNfWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MkcLnaBT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=6s+/=5s=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MkcLnaBT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=6s+/=5s=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4nlx0HX6z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 22:40:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A194D429C1;
	Mon, 10 Nov 2025 11:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A8C19421;
	Mon, 10 Nov 2025 11:40:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MkcLnaBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762774821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUP/wtp+QdGXlvt3yNjaBtNTKb3hr2sjUsHqlx5bmiE=;
	b=MkcLnaBThnMlfY6qf22oV4PqRJxxV9sAEsGKWW9vBI8C6fduJC1phQC/KL5eRD3v2F09zD
	SMKKUag6VL9wsRLpIcAWX8HR444SZKLYuhbVw7XsNVIJ5uIDVyRfrdP33rS+EubmBkHMzC
	XsknOx/WV33HVZ0CEH07YX7KePjg4M4=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d386279 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Nov 2025 11:40:20 +0000 (UTC)
Date: Mon, 10 Nov 2025 12:40:17 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 19/34] random: vDSO: only access vDSO datapage after
 random_init()
Message-ID: <aRHPIXATFJAEv-CF@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
 <aQ6EvdukQytvqK-u@zx2c4.com>
 <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
 <aRHAU7bVAIyaOrpA@zx2c4.com>
 <20251110114550-a3f2afa8-4f86-4048-be5b-2dc4f4ef340d@linutronix.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110114550-a3f2afa8-4f86-4048-be5b-2dc4f4ef340d@linutronix.de>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 12:24:13PM +0100, Thomas Weißschuh wrote:
> > > > For example, one clean way of
> > > > doing that would be to make vdso_k_rng_data always valid by having it
> > > > initially point to __initdata memory, and then when it's time to
> > > > initialize the real datapage, memcpy() the __initdata memory to the new
> > > > specially allocated memory. Then we don't need the complex state
> > > > tracking that this commit and the prior one introduce.
> > > 
> > > Wouldn't that require synchronization between the update path and the memcpy()
> > > path? Also if the pointer is going to change at some point we'll probably need
> > > to use READ_ONCE()/WRITE_ONCE(). In general I would be happy about a cleaner
> > > solution for this but didn't find a great one.
> > 
> > This is still before userspace has started, and interrupts are disabled,
> > so I don't think so?
> 
> Interrupts being disabled is a good point. But we are still leaking
> implementation details from the random code into the vdso datastore.

It wouldn't. You do this generically with memcpy().

> 
> > Also, you only care about being after
> > mm_core_init(), right? So move your thing before sched_init() and then
> > you'll really have nothing to worry about.
> 
> The callchains random_init_early() -> crng_reseed()/_credit_init_bits() could
> still touch the datapage before it is allocated.
> Adding conditionals to prevent those is essentially what my patch does.

I think I wasn't very clear in my proposal, because this isn't an issue
in it.

Global scope:

static struct vdso_rng_data placeholder_vdso_k_rng_data __initdata;
struct vdso_rng_data *vdso_k_rng_data = &placeholder_vdso_k_rng_data;

Then,

void __init vdso_setup_data_pages(void)
{
    ...
    vdso_k_rng_data = blabla();
    ...
    memcpy(vdso_k_rng_data, &placeholder_vdso_k_rng_data, sizeof(*vdso_k_rng_data);
    ...
}

If vdso_setup_data_pages() is called early enough in init, this is safe
to do, and then you don't need to muck up the random code with awful
state machine ordering stuff.

Jason

