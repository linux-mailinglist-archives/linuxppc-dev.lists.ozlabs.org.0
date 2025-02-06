Return-Path: <linuxppc-dev+bounces-5900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38422A2A68E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 12:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpYzG3bv9z306x;
	Thu,  6 Feb 2025 22:00:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738839610;
	cv=none; b=LcMKnauqmQfve4MhugFarrXnk+WaFN4hd9iRgsOF6bToAFRWw0D69Xnxr58MQnPXiXecR9lN3hOwdmvj4dWHcCeXvr51UuukjS+vpg/9uhXpXi3xD2828NLpfDimnZL+1lZhM6/15hzsgCKa1km8LVL9m1B6s+IWuhCUl3KYhvYl8S80/krGQ0HIFGmAGutFg4G/knUb17E13V/v7OeB7V6iYVWUv9GICiFxHF2jvGG4nJ47E//m0RDnHuV3E99Xl9vUu1xji4lH2WhNoPDd6CRB2nIN5OERtQ7zB9ysZ5ATtn9VBLhFPpV5JiS0BRiYp8IMai3ZqK25CaDjZPZT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738839610; c=relaxed/relaxed;
	bh=ru5WdIbpSL0IOKGQMyXAT/ZbwjxtTCZKvCRArp1oQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivTmZAY/Q+xBHvQFB1VAjEPkOlqiXSNgsmSxTpfrzciO/oR3cJJKESM/RSq5mktdBjcY3fkOukTorXn2FAlj2/5F9vxaDUKjKbaeyxM7fxA37HZvrC7hI5wRxmBUcMXCm22m2iBFVdZdVCHDshwAksZjLg9oDF2TXNqlFsmMCIolkOZfoBtha/AFvl1BsnulB/2Cf1KNES0t7a8s8sZ+A/cWvAx3TbzU+7NznKSxnPG04DgSCqM10Spc3H3NAs2WuV5sLq0emBC4EwqamNvY8j7jcDE64uydEdMv6lpNrYbjlgz9U65pkVHMWmPeEuR8xaA+8WJhQ9NMJfNuMd0tNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YGZTZnxX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gSo8yfFy; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YGZTZnxX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gSo8yfFy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YpYzD2sNlz301v
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 22:00:08 +1100 (AEDT)
Date: Thu, 6 Feb 2025 11:59:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738839601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ru5WdIbpSL0IOKGQMyXAT/ZbwjxtTCZKvCRArp1oQDE=;
	b=YGZTZnxXjpdI6oZKS05b+5XvnP+boGHN1C9QVygV7IAjLA8pAEovdmFAH8xFn7WI+w/Xhp
	8K+GjBJMH0JXK40pNxioacxcseFzn+iXVx4WoYt+J0VaxAt6ID0MNK8tJHkPrEinPnHwJG
	q7T7uflCus2GZC60/Vo9hxiLt7lbmMt3uhYS5TbYuilZ8s9n9kIooocVm9DSgR45+vozV8
	mKs7HvnUnL+HLLe1fD2OiCIYZL6f6ix3Bee88IjX4iDMFE94To0mtXdotTD+DhoAabPdO5
	+hTLhUwkR8YuE1I+6rX+payvbnygcsEtyByLEI0nCsLk7XsBFKKaA2MPCL7vew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738839601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ru5WdIbpSL0IOKGQMyXAT/ZbwjxtTCZKvCRArp1oQDE=;
	b=gSo8yfFya9Ajm2CmxNsGxQ1eCLyB3wbR/PEUj366khtBpyQwoXLrVFgUwGilu8dL/eMyJd
	VQWqN9SewyqCZ4BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>, linux-csky@vger.kernel.org, 
	"Ridoux, Julien" <ridouxj@amazon.com>, "Luu, Ryan" <rluu@amazon.com>, kvm <kvm@vger.kernel.org>
Subject: Re: [PATCH v3 00/18] vDSO: Introduce generic data storage
Message-ID: <20250206110648-ec4cf3d0-0aef-4feb-a859-c69e53ab110c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <ff83dc5c91b4e46bcf2d99680ec6af250fb05b27.camel@infradead.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff83dc5c91b4e46bcf2d99680ec6af250fb05b27.camel@infradead.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 06, 2025 at 09:31:42AM +0000, David Woodhouse wrote:
> On Tue, 2025-02-04 at 13:05 +0100, Thomas Weißschuh wrote:
> > Currently each architecture defines the setup of the vDSO data page on
> > its own, mostly through copy-and-paste from some other architecture.
> > Extend the existing generic vDSO implementation to also provide generic
> > data storage.
> > This removes duplicated code and paves the way for further changes to
> > the generic vDSO implementation without having to go through a lot of
> > per-architecture changes.
> > 
> > Based on v6.14-rc1 and intended to be merged through the tip tree.

Note: The real answer will need to come from the timekeeping
maintainers, my personal two cents below.

> Thanks for working on this. Is there a plan to expose the time data
> directly to userspace in a form which is usable *other* than by
> function calls which get the value of the clock at a given moment?

There are no current plans that I am aware of.

> For populating the vmclock device¹ we need to know the actual
> relationship between the hardware counter (TSC, arch timer, etc.) and
> real time in order to propagate that to the guest.
> 
> I see two options for doing this:
> 
>  1. Via userspace, exposing the vdso time data (and a notification when
>     it changes?) and letting the userspace VMM populate the vmclock.
>     This is complex for x86 because of TSC scaling; in fact userspace
>     doesn't currently know the precise scaling from host to guest TSC
>     so we'd have to be able to extract that from KVM.

Exposing the raw vdso time data is problematic as it precludes any
evolution to its datastructures, like the one we are currently doing.

An additional, trimmed down and stable data structure could be used.
But I don't think it makes sense. The vDSO is all about a stable
highlevel function interface on top of an unstable data interface.
However the vmclock needs the lowlevel data to populate its own
datastructure, wrapping raw data access in function calls is unnecessary.
If no functions are involved then the vDSO is not needed. The data can
be maintained separately in any other place in the kernel and accessed
or mapped by userspace from there.
Also the vDSO does not have an active notification mechanism, this would
probably be implemented through a filedescriptor, but then the data
can also be mapped through exactly that fd.

>  2. In kernel, asking KVM to populate the vmclock structure much like
>     it does other pvclocks shared with the guest. KVM/x86 already uses
>     pvclock_gtod_register_notifier() to hook changes; should we expand
>     on that? The problem with that notifier is that it seems to be
>     called far more frequently than I'd expect.

This sounds better, especially as any custom ABI from the host kernel to
the VMM would look a lot like the vmclock structure anyways.

Timekeeper updates are indeed very frequent, but what are the concrete
issues? That frequency is fine for regular vDSO data page updates,
updating the vmclock data page should be very similar.
The timekeeper core can pass context to the notifier callbacks, maybe
this can be used to skip some expensive steps where possible.

> ¹ https://gitlab.com/qemu-project/qemu/-/commit/3634039b93cc5

