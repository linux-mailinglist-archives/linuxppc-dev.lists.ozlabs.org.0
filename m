Return-Path: <linuxppc-dev+bounces-527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DC95ED94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 11:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsm2t5wdYz2yDm;
	Mon, 26 Aug 2024 19:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724665430;
	cv=none; b=DUpY6aROsuAAGT2edoB+v/J65XnOGQCu9mErzd55cOFM7RHIuG03zLfINT1Yi8dknDkp4d052YeD7/Qm43hxDrutrMbligoICJih3sHjMnYh4EhalNqdu1lRe1NzLZr3Wovo8z7HO5awd0XTtcUpQhrozFKRhRsuAUYaje9BRHgRL7Qd5ai6NGDWyJc7coCe9fkZVD8Exuno7g6VFKGwEp7NgmIi/jRBHShtvyGSo4Rx/tbzNdbMyIR/8tVIL3ZjYA63ofUNQy+c+anJp7UASLWrtHDeQPpC6Dozc4eG6VeSCyrL0Fok43AsWQIB5EODbg/i60tS1Xn0FX165CesDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724665430; c=relaxed/relaxed;
	bh=SWCfkFVrFX69lQNtUh8BUdPXl70d8BgaQObUYTFPILY=;
	h=From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=OZu9ToHWHma7vVfHKvZy59ZGu+p/HRJ3Ftko1f1Y5E4vE1NGIefvZaJAmlLA/+sWruyP4pbvywa28KJczDwy1QKCH5vdE2O5ltk5ik55/llBX+zIUmr6IBDvMW/sQa1gNuxzafLienQPDbBSGiRsPRCaMLCuuPWymbCsUbbzQZy7PxZKY/XHObwEWvd/Dq/r0w33rUZJxUN1Zx6v5TtUtrv7vKBjBZ4v7nya7iuo+slIngZFGcFT6OmFX20aDAEIctkZ+72J6wGYpoej16igo6pkphT0wzkNb6Sfa6oqMo28jiRO/Fg2wtO8uRAaUEIr44DwMxBasMqAF/XCwOZ8Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bmPESgmv; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZbN8bFkN; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bmPESgmv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZbN8bFkN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsm2t1Np5z2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 19:43:50 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724665419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWCfkFVrFX69lQNtUh8BUdPXl70d8BgaQObUYTFPILY=;
	b=bmPESgmvVam6uU5EAujJz26OEz8vzU03VRka4i/NIHfcO0tvLgMQav7QZ5wjTdfWFsNZH9
	m/gcxCTXSaKrbFiJAtNTWkcCn1a4ZunRuUUoasin6t7EouB8Eg23E4cfndiKovgeCSQBYz
	azCmo6HpVRPPD0uWfpN6UMp4NrWbg+2sai7ZfHfA28PTcveLz6HognVZljULJOMHYICWRp
	VlNJmgDeTme9YI6usDRrT/0HoBj4xWY9nfw/nLeYCWL6cVZ/si5qxe+gtgS5GjTf0oU+vX
	STEm/BzYUg4sR/eJdC/VhwDD25Hbdt9UUcQHMGTfQYacZgFTJvpW65ZPJ3hWzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724665419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWCfkFVrFX69lQNtUh8BUdPXl70d8BgaQObUYTFPILY=;
	b=ZbN8bFkNzXf9ozXai8sskpGXdUYpkAo5Nk+tQIsKhxqftJyTPMZ0uuNnAKau3plmtS1IaZ
	Iofyp0/mQc8sPZBw==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Andy Lutomirski
 <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>, Arnd
 Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
 <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 06/17] vdso: Change getrandom's generation to
 unsigned long
In-Reply-To: <7d58be73-a8e5-4ec7-bbdc-238b0c25c77b@csgroup.eu>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <525b48eb79978ddba2d1b8ee23b27bd6c5b0b4ee.1724309198.git.christophe.leroy@csgroup.eu>
 <Zswzu1l3xO99KN3I@zx2c4.com>
 <7d58be73-a8e5-4ec7-bbdc-238b0c25c77b@csgroup.eu>
Date: Mon, 26 Aug 2024 11:43:39 +0200
Message-ID: <87v7znd3g4.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26 2024 at 10:01, Christophe Leroy wrote:
> Le 26/08/2024 =C3=A0 09:50, Jason A. Donenfeld a =C3=A9crit=C2=A0:
>> But tglx pointed out in that thread that this actually isn't necessary:
>>=20
>> | All of this is pointless because if a 32-bit application runs on a
>> | 64-bit kernel it has to use the 64-bit 'generation'. So why on earth do
>> | we need magic here for a 32-bit kernel?
>> |
>> | Just use u64 for both and spare all this voodoo. We're seriously not
>> | "optimizing" for 32-bit kernels.
>> |
>> | All what happens on a 32-bit kernel is that the RNG will store the
>> | unsigned long (32bit) generation into a 64bit variable:
>> |
>> | 	smp_store_release(&_vdso_rng_data.generation, next_gen + 1);
>> |
>> | As the upper 32bit are always zero, there is no issue vs. load store
>> | tearing at all. So there is zero benefit for this aside of slightly
>> | "better" user space code when running on a 32-bit kernel. Who cares?
>>=20
>> So I just got rid of it and used a u64 as he suggested.
>>=20
>> However, there's also an additional reason why it's not worth churning
>> further over this - because VM_DROPPABLE is 64-bit only (due to flags in
>> vma bits), likely so is vDSO getrandom() for the time being. So I think
>> it makes more sense to retool this series to be ppc64, and then if you
>> really really want 32-bit and can convince folks it matters, then all of
>> these parts (for example, here, the fact that the smp helper doesn't
>> want to tear) can be fixed up in a separate series.
>
> So yes I really really want it on ppc32 because this is the only type of=
=20
> boards I have and this is really were we need getrandom() to be=20
> optimised,

For nostalgic reasons?

> indeed ppc64 was sherry-on-the-cake in my series, I just added it
> because it was easy to do after doing ppc32.

The rng problem for ppc32 seems to be:

   smp_store_release(&_vdso_rng_data.generation, next_gen + 1);

right?=20

Your proposed type change creates inconsistency for 32-bit userspace
running on 64-bit kernels because the data struct layout changes.

As explained before, there is no problem with store or load tearing on
32bit systems because the generation counter is only 32bit wide. So the
obvious solution is to only update 32 bits on a 32bit kernel:

--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -282,7 +282,7 @@ static void crng_reseed(struct work_stru
 	 * is ordered with the write above to base_crng.generation. Pairs with
 	 * the smp_rmb() before the syscall in the vDSO code.
 	 */
-	smp_store_release(&_vdso_rng_data.generation, next_gen + 1);
+	smp_store_release((unsigned long *)&_vdso_rng_data.generation, next_gen +=
 1);
 #endif
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init =3D CRNG_READY;

Which is perfectly fine on 32-bit independent of endianess because the
user space side does READ_ONCE(data->generation) and the read value is
solely used for comparison so it does not matter at all whether the
generation information is in the upper or the lower 32bit of the u64.

No?

But that's a trivial fix compared to making VM_DROPPABLE work on 32-bit
correclty. :)

Thanks,

        tglx

