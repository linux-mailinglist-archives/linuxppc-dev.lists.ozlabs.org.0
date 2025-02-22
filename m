Return-Path: <linuxppc-dev+bounces-6390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC61A40750
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 11:14:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0NCF4903z2y8p;
	Sat, 22 Feb 2025 21:14:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740219273;
	cv=none; b=Guw4CXwc8LdAEF47AP6tJdk1Qgpp7gKidQKzAxcfN0tPEXj5XMvJCxLXYzD7BJWnxEBqWug8kQbXvKtsuNVyy85E2M9iwKVSDV13iQBX7jqDYQQhX2+6O8smzlSHDyLtQDKz5DJ/ZdKMssg0ihcVjGuTr96u8URRtzE4Yhnc9dAbBK0a2UloWKE94NphXbZFJV+j078IfZo5D4FXol6TUTD5HeEIBl3XNHipnE0MMshRGtsXa3SrEOmThfh7d9Xwr/0PbQIU+E6hb3ZZCbFh4mG9sd5xWMlPOepQIzFV0Qn6BpeRTC3MZx3xG8QdLeM+Hhl6qdn5qIWNKuZwYFTSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740219273; c=relaxed/relaxed;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O8ycnXiu52SD+5oKkAAKLASLuUqVxbV4Ammq00/EINhJ3kjeKyx9fwAnQrGcd/p5Lv9lTZ0vl6y5IS3V5PBohJQnq1WyOdsc7HfSitUKZg4b5DHOkBQTD5kE2GwtuH7Ah1wjgKUlL7YleFtzPyi0NVrttBPOA+PsCcV57XQQBg069Qoddnh9FXrFJErgJkMNrB6BT87O+ybuoIeZbZ0csVCC7EgE3nRjkLq50z6TUSq0EMsdwZ2LATCCAAExJY4GEga7itzJI+utLQbA1TyO4MOEme2iXOB9e+Oro+Tl2sBEcjsHCCi4bSW1Ig42qgJNu1hD/Rkx3KZPIPO+iGf0aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E0xbOLPR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z74TsqYt; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E0xbOLPR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z74TsqYt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0NCC6FQNz2xmS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 21:14:31 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	b=E0xbOLPRJ+XD/M3Ao9By6szoKCsyLxcxtVTGsSbhAcE5NU1NK5C2+Dfl+zJ4+rpk8p2vce
	IgpgL+eLpTnyqk83xyrJHvEqqHTXl3g07KURIn1lsZ0aq6OKRUYTD54okHfdjXqNbDsSjC
	8vSMloBPM2AV4QgA0stwUEWMG6uZx3A9biypqi3p4tS6E2BLtlPpYMDvXniwVQOifJQaz1
	6Qig6O/uBgxjjBbGrOo71YvA2kL4peLeza5WOnn/Kdf4/Lf3rBALBWYLzmAVI3S8o31rMK
	Fy+Fe19AlwTl2IsoJXlYAVNRDdBMW1sP8B0maDlcTMTjaB57ZbWi7eIerkehlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	b=z74TsqYtERi/FO28k1WNxuOk/eCrttvKrCalx/NPgzVgRgvry4d1qCKiaSmbcNlhBsMonW
	bE0L5AunrFXssYCw==
To: Xi Ruoyao <xry111@xry111.site>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
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
 linux-csky@vger.kernel.org
Subject: Re: [PATCH v3 09/18] riscv: vdso: Switch to generic storage
 implementation
In-Reply-To: <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <20250204-vdso-store-rng-v3-9-13a4669dfc8c@linutronix.de>
 <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
Date: Sat, 22 Feb 2025 11:14:23 +0100
Message-ID: <87a5aegubk.ffs@tglx>
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

On Sat, Feb 22 2025 at 16:17, Xi Ruoyao wrote:
> On Tue, 2025-02-04 at 13:05 +0100, Thomas Wei=C3=9Fschuh wrote:
>> The generic storage implementation provides the same features as the
>> custom one. However it can be shared between architectures, making
>> maintenance easier.
>>=20
>> Co-developed-by: Nam Cao <namcao@linutronix.de>
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
> I made a RISC-V vDSO getrandom implementation on top of this and it
> works fine.  I'll submit it when this is merged.

You can submit it right now. If it's reviewed and if Jason agrees, this
can be merged through the timers/vdso branch on top of the pending
changes.

Thanks for testing it!

       tglx

