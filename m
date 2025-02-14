Return-Path: <linuxppc-dev+bounces-6185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F99A35C9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 12:35:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvVMk2Rm2z30Tk;
	Fri, 14 Feb 2025 22:34:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739532898;
	cv=none; b=IWO6GFpV+toeIm8zr7qXQHRj1wW/NNHKr2F3pgiYcmB70fHo0CiBqVkyAvV/MTojvEPOegX0XugQg+8TyoIDf5Evvkz1k4WKAVDj1fvF6ZkzYoqSSBeP//JuyjCyVaB3H8WIJahMMRj9NILCiC0biku+WeXql1fF3uXIJ2d6NGwZzfSDTi2T7Z0jNhVzw8be9Mmt168y3VbBb4a6oUoBGkT7wW/yt6rX1LpdODDcjSPzZfWEvrIUI7530SqRRzGjkvGxIlNyRGS9dytzhSdexh7zan4xWsWKI2NpNOVBTyAzDoMZDmrYT6HdZRWKgRBHKcLyEX1MgUtf/hTD6mM2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739532898; c=relaxed/relaxed;
	bh=WWdSDqLPiHMtkC3qRBjEr7KgW5xesCDv6jmHPBIB4Zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ETy1frWBhi05+cmgf5jfF8lklX56QWFTRQ5G4L1Snp3/uk4ySPM/TRADKH2I6klbbSQtrarHA0EcEbDVVfp1Ky+UTLOkjY+2JaehC8ANY+g4eSMnwHIHC7gZliQOxTa+WZJRELn5Gs2ThKzP3emjMZPBI4ejA+UctOXObrTnI0xzga4TwOn1K6F1iqLasTQDLn57iRuyAd4HW5z3mB4groWjJLlep7aQ/vn/riI5hEpevtKmmfxUcFRSJaDH0Yju4sVRE5HKaais7PkMuXqR5uUNkP3NJoFsVftjZ5bvauZHv2rrlYhIcfC3En4AZ7tHBb/QQzPdFR0p1siyGawSWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0VNtTEYh; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WFnwPIfj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0VNtTEYh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WFnwPIfj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvVMj3XMBz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 22:34:57 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739532886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWdSDqLPiHMtkC3qRBjEr7KgW5xesCDv6jmHPBIB4Zc=;
	b=0VNtTEYhNZqymGENVsUmuk+rnlFfX7RSGT3Ho51Jzxq38FSlmeIElqqU148QkLgRvvbxMF
	oARriYR4RFpth96NjMkBo5hNBkelucCuzn5JwatniL1M08uy4SKjyhCAdV/qdQ/eba99LI
	XiEfVSgYOnLLjTtprHlvawcrkXxeqR+m8TpQcRwp+J+sEstFenL0586F5ak1q3mLy7LV6n
	qnrektVapcPsyxUDFZn8atapF68IW+EhNarZoqS+FgcZ3nF1GslRp9zthgkNswbWYfqivE
	2J78e9sNA7ZDPletmeb/HsB02wyQreu92A/Zp2E3TtpGj+8SwnWuzKOp2Uz71Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739532886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWdSDqLPiHMtkC3qRBjEr7KgW5xesCDv6jmHPBIB4Zc=;
	b=WFnwPIfjvhMmBrrfQwvQ/cPdgZnaXQkJD4fxKY5hU7USn1NEKaf7iB28bu/zo8sPSUnwBx
	KGOlqDpRoCYGNWAw==
To: David Woodhouse <dwmw2@infradead.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Russell King <linux@armlinux.org.uk>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
 linux-csky@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>, "Luu,
 Ryan" <rluu@amazon.com>, kvm <kvm@vger.kernel.org>
Subject: Re: [PATCH v3 00/18] vDSO: Introduce generic data storage
In-Reply-To: <ff83dc5c91b4e46bcf2d99680ec6af250fb05b27.camel@infradead.org>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <ff83dc5c91b4e46bcf2d99680ec6af250fb05b27.camel@infradead.org>
Date: Fri, 14 Feb 2025 12:34:44 +0100
Message-ID: <87ed00kbe3.ffs@tglx>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

David!

On Thu, Feb 06 2025 at 09:31, David Woodhouse wrote:
> Thanks for working on this. Is there a plan to expose the time data
> directly to userspace in a form which is usable *other* than by
> function calls which get the value of the clock at a given moment?
>
> For populating the vmclock device=C2=B9 we need to know the actual
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

Exposing the raw data is not going to happen as we would create an ABI
preventing any modifications to the internals. VDSO data is considered a
fully internal (think kernel) representation and the accessor functions
create an ABI around it. So if at all you can add a accessor function
which exposes data to user space so that the internal data
representation can still be modified as necessary.

>  2. In kernel, asking KVM to populate the vmclock structure much like
>     it does other pvclocks shared with the guest. KVM/x86 already uses
>     pvclock_gtod_register_notifier() to hook changes; should we expand
>     on that? The problem with that notifier is that it seems to be
>     called far more frequently than I'd expect.

It's called once per tick to expose the continous updates to the
conversion factors and related internal data.

Thanks,

        tglx


