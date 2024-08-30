Return-Path: <linuxppc-dev+bounces-801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB4965DCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 12:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwDG52hGKz307K;
	Fri, 30 Aug 2024 20:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725012125;
	cv=none; b=RdmwzEjsd7VlIiVkwpHnAEOf9Olu/DkSpNa6k/upS/6fx0IgImP2Ha4otZuB57ySS4lpeLN9p5pz3HKQDX93VQTttUVBMDS12BAa5m6YPBWfgAoduVVkVSK9csj9RVE2p8bMHGaOZ1MmOBzGQSQ2lGkZKvwILcF6j/ArEazd5+GAsJ6Ga9irVHvnlVGrBUQCDg+C9UOvab81gVr6z207Y6bginw74EHrPtASMg5vAtrD3O/1vNK2t1PMRRv3YXr3U4oh4xHCUMaq9V6FF36wtYi4fpgjdkrD/0nlihQ0T+uH8R61CYGtrLTr07Jpwe4zVjcGo7tLEisaxMBJci0qUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725012125; c=relaxed/relaxed;
	bh=lPcPtY81gFF3u7n0A2RVPpHqZKSc08Lj9bnrJizsMEQ=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=HOQa+yD0QCHFVUCcNMVHH1gngTjnKJ54PRZfmOqL5m4sZRDsKAEbsYR+e9QSQd0JZ9anpm+oJDsWnk6KWfuCEuSYLiKw/6ieVQ0cfGRtNW1HrYwGrGdKNEu7emRrIjzxopBLfM5W/K+l/9l5FZnPmUwqn01XSscLWe6oQ9V06iGIjyUc+xN6tUDrzIFBNSqia8pD7ogfo28zdA+4M8fhiL65Gqb4cHeRl0BwNREgN6xGHsy6bfZkbxYNuIrw2/IDT53zsQ6lxTOygZlY2Ry+4pOM5ust0hXrXIdjTlRl3tis/UEN7yVClCK9DvyBxaOEJpbUycndya+E/iuS30/Y6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NNcmrTyt; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NNcmrTyt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwDG432QLz306G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 20:02:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725012123;
	bh=lPcPtY81gFF3u7n0A2RVPpHqZKSc08Lj9bnrJizsMEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NNcmrTytNe5K01YNEaaZ19cRsK3cVkZsPx09KELB11fMi0p0LaIX5DEwSFpG6peNy
	 ISAellXAO+xLaSRbUK+pojAHnpn4mXhQ6Xi7aXgPNSvfk1Fhhy97z3qo3PUX1Q1jRr
	 2dNrvbGjMGW1FqKKrMfKdMnOYumxQuAOYNTy0i1fviy9HjXmvUY4p8bDjh83ht9EjH
	 yYNATupCNzqj23A6fjAnQZotlcbf/AcIWq7SPsN2wMldKWCJpNeeAVJfDGraO9mfkL
	 nu1POz8pU9cnmrPtuY8NQqHP6jmqW67hqV/EN6svLc1HdzcViESWbiCV6jJzitD/1o
	 cUcK4jBAfhGPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WwDG04LmLz4wnw;
	Fri, 30 Aug 2024 20:01:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
In-Reply-To: <20240829180241.GJ29862@gate.crashing.org>
References: <20240827180819.GB2049@sol.localdomain>
 <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com>
 <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
 <20240828124519.GE29862@gate.crashing.org>
 <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
 <20240828162025.GG29862@gate.crashing.org>
 <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
 <20240828172538.GI29862@gate.crashing.org>
 <e5a36d98-c880-4d33-954a-2a05240ef02f@csgroup.eu>
 <20240829180241.GJ29862@gate.crashing.org>
Date: Fri, 30 Aug 2024 20:01:58 +1000
Message-ID: <87jzfye3c9.fsf@mail.lhotse>
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

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Thu, Aug 29, 2024 at 07:36:38PM +0200, Christophe Leroy wrote:
>>=20
>>=20
>> Le 28/08/2024 =C3=A0 19:25, Segher Boessenkool a =C3=A9crit=C2=A0:
>> >
>> >>Not sure about static binaries, though: do those even use the VDSO?
>> >
>> >With "static binary" people usually mean "a binary not using any DSOs",
>> >I think the VDSO is a DSO, also in this respect?  As always, -static
>> >builds are *way* less problematic (and faster and smaller :-) )
>> >
>>=20
>> AFAIK on powerpc even static binaries use the vDSO, otherwise signals=20
>> don't work.
>
> How can that work?  Non-dynamic binaries do not use ld.so (that is the
> definition of a dynamic binary, even).  So they cannot link (at runtime)
> to any DSO (unless that is done manually?!)

At least for signals I don't think the application needs to know
anything about the VDSO. The kernel sets up the return to the signal
trampoline (in the VDSO), and as long as userspace returns from its
signal handler with blr it will land back on the trampoline.

cheers

