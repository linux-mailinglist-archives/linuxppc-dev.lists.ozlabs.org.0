Return-Path: <linuxppc-dev+bounces-15181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0813BCEFC95
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 09:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djtLl0DXVz2yFj;
	Sat, 03 Jan 2026 19:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767427310;
	cv=none; b=EYNV4KpqwD3r9pXiwxITJoOgR0AadETxZr3SZw8tetZsCksMwnbCuLsFQmG4d68vYz9iY3JPcfg7aB/+HTaXZfdGYxb6/kYwEwEkxJX/uhCvQUzh5ul31ns+9jzXwIQV7NNPgHNzGcGku7HvzLM2k2G+JwVTKQkRaVDGdqBCJehZMWbSsMydBjIiaScybb0UtMbmkz17946vVHpS0FHoDe4JYM6USpWvZFR9RrJqx+PVe+hKqI3UElbEvgknBQ4CjH5R+sRLRJFDOQDd+rmgicC/CL/9sR+GPr7OVdpRYpxgyh5d0bkCoSrobEy/xWk6QL/7dWjIXnSZGFV3CBpCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767427310; c=relaxed/relaxed;
	bh=j73oDxy8SiZUpE5Ll9bt+1jsi1FeXMi2dgKae70Pj8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3yDSjuXx+TzBm3U290ALiPak331iClH+4pnmy6sdMpYRrcsPt6QVjK8HAza+umfHLbC8lobfFGiZeBCw+2e5mSkbavHazrGWxMW4sw25hx+YzllHaRKVUqMQJSVisQyLo9chbS08fI7oad/aXz2nTb7cYzUmzcCTzO9Rg5Uj05kXfEjoO6XpzNw030KcPx/aTi+fxaloGHpVR9MbBg4JAIuingZQskKXVs8WQAHu4/WZCFiF10mViVAkBE5seds9VjyO7mwLUM+MA7VLxnQhEQEXQ8E9U1gFhGxrdN8B6CYzBp9LHquZFfWGS1hHL3mdJoSUdbRVU1F6wy0H2koWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O2dC+8T8; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O2dC+8T8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djtLj5SyMz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 19:01:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6630343EE9;
	Sat,  3 Jan 2026 08:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F995C113D0;
	Sat,  3 Jan 2026 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767427272;
	bh=KKYEiR4A+67li/fFpjG1HROz1QpvJKjgQzHkEoFFZiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O2dC+8T8gLSx916MuYF0Nv/n+kAhEibPvx9RD3n/K6gNRgXeyrwyz4uU8aTklMuqb
	 ye+atMNGHS6wdxKsPZxvXUEEqpNaatEzj7VjqCwpvrAwz/E/QlXTPBKGgCizdRGEJd
	 QkzM1rkeUsfMNQCO0uJ1AP+0mPCVJGkTsn87cVlNhtojPICkAQ0yuXsiUwu3RDCUU4
	 rTJVRVdf/uj6gpCzRpD9lUoldPn2jPoAbKRL5HEwgOCEl4141r4AUnllUH3lZDvAtS
	 WP/RQb4Bk7X7Xb6a+D6+pim/xregRZElEZqieR+HdyIvI2EGOf21g05IQx1ZAGxkHU
	 IdhpwKw5S9wog==
Message-ID: <563a5d0d-c27a-45de-9495-a82403026886@kernel.org>
Date: Sat, 3 Jan 2026 09:00:55 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
To: Ryan Roberts <ryan.roberts@arm.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-3-ryan.roberts@arm.com>
 <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
 <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 02/01/2026 à 15:09, Ryan Roberts a écrit :
> On 02/01/2026 13:39, Jason A. Donenfeld wrote:
>> Hi Ryan,
>>
>> On Fri, Jan 2, 2026 at 2:12 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>> context. Given the function is just a handful of operations and doesn't
>>
>> How many? What's this looking like in terms of assembly?
> 
> 25 instructions on arm64:

31 instructions on powerpc:

00000000 <prandom_u32_state>:
    0:	7c 69 1b 78 	mr      r9,r3
    4:	80 63 00 00 	lwz     r3,0(r3)
    8:	80 89 00 08 	lwz     r4,8(r9)
    c:	81 69 00 04 	lwz     r11,4(r9)
   10:	80 a9 00 0c 	lwz     r5,12(r9)
   14:	54 67 30 32 	slwi    r7,r3,6
   18:	7c e7 1a 78 	xor     r7,r7,r3
   1c:	55 66 10 3a 	slwi    r6,r11,2
   20:	54 88 68 24 	slwi    r8,r4,13
   24:	54 63 90 18 	rlwinm  r3,r3,18,0,12
   28:	7d 6b 32 78 	xor     r11,r11,r6
   2c:	7d 08 22 78 	xor     r8,r8,r4
   30:	54 aa 18 38 	slwi    r10,r5,3
   34:	54 e7 9b 7e 	srwi    r7,r7,13
   38:	7c e7 1a 78 	xor     r7,r7,r3
   3c:	51 66 2e fe 	rlwimi  r6,r11,5,27,31
   40:	54 84 38 28 	rlwinm  r4,r4,7,0,20
   44:	7d 4a 2a 78 	xor     r10,r10,r5
   48:	55 08 5d 7e 	srwi    r8,r8,21
   4c:	7d 08 22 78 	xor     r8,r8,r4
   50:	7c e3 32 78 	xor     r3,r7,r6
   54:	54 a5 68 16 	rlwinm  r5,r5,13,0,11
   58:	55 4a a3 3e 	srwi    r10,r10,12
   5c:	7d 4a 2a 78 	xor     r10,r10,r5
   60:	7c 63 42 78 	xor     r3,r3,r8
   64:	90 e9 00 00 	stw     r7,0(r9)
   68:	90 c9 00 04 	stw     r6,4(r9)
   6c:	91 09 00 08 	stw     r8,8(r9)
   70:	91 49 00 0c 	stw     r10,12(r9)
   74:	7c 63 52 78 	xor     r3,r3,r10
   78:	4e 80 00 20 	blr

Among those, 8 instructions are for reading/writing the state in stack. 
They of course disappear when inlining.

> 
>> It'd also be
>> nice to have some brief analysis of other call sites to have
>> confirmation this isn't blowing up other users.
> 
> I compiled defconfig before and after this patch on arm64 and compared the text
> sizes:
> 
> $ ./scripts/bloat-o-meter -t vmlinux.before vmlinux.after
> add/remove: 3/4 grow/shrink: 4/1 up/down: 836/-128 (708)
> Function                                     old     new   delta
> prandom_seed_full_state                      364     932    +568
> pick_next_task_fair                         1940    2036     +96
> bpf_user_rnd_u32                             104     196     +92
> prandom_bytes_state                          204     260     +56
> e843419@0f2b_00012d69_e34                      -       8      +8
> e843419@0db7_00010ec3_23ec                     -       8      +8
> e843419@02cb_00003767_25c                      -       8      +8
> bpf_prog_select_runtime                      448     444      -4
> e843419@0aa3_0000cfd1_1580                     8       -      -8
> e843419@0aa2_0000cfba_147c                     8       -      -8
> e843419@075f_00008d8c_184                      8       -      -8
> prandom_u32_state                            100       -    -100
> Total: Before=19078072, After=19078780, chg +0.00%
> 
> So 708 bytes more after inlining. The main cost is prandom_seed_full_state(),
> which calls prandom_u32_state() 10 times (via prandom_warmup()). I expect we
> could turn that into a loop to reduce ~450 bytes overall.
> 
With following change the increase of prandom_seed_full_state() remains 
reasonnable and performance wise it is a lot better as it avoids the 
read/write of the state via the stack

diff --git a/lib/random32.c b/lib/random32.c
index 24e7acd9343f6..28a5b109c9018 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -94,17 +94,11 @@ EXPORT_SYMBOL(prandom_bytes_state);

  static void prandom_warmup(struct rnd_state *state)
  {
+	int i;
+
  	/* Calling RNG ten times to satisfy recurrence condition */
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
-	prandom_u32_state(state);
+	for (i = 0; i < 10; i++)
+		prandom_u32_state(state);
  }

  void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state)

The loop is:

  248:	38 e0 00 0a 	li      r7,10
  24c:	7c e9 03 a6 	mtctr   r7
  250:	55 05 30 32 	slwi    r5,r8,6
  254:	55 46 68 24 	slwi    r6,r10,13
  258:	55 27 18 38 	slwi    r7,r9,3
  25c:	7c a5 42 78 	xor     r5,r5,r8
  260:	7c c6 52 78 	xor     r6,r6,r10
  264:	7c e7 4a 78 	xor     r7,r7,r9
  268:	54 8b 10 3a 	slwi    r11,r4,2
  26c:	7d 60 22 78 	xor     r0,r11,r4
  270:	54 a5 9b 7e 	srwi    r5,r5,13
  274:	55 08 90 18 	rlwinm  r8,r8,18,0,12
  278:	54 c6 5d 7e 	srwi    r6,r6,21
  27c:	55 4a 38 28 	rlwinm  r10,r10,7,0,20
  280:	54 e7 a3 3e 	srwi    r7,r7,12
  284:	55 29 68 16 	rlwinm  r9,r9,13,0,11
  288:	7d 64 5b 78 	mr      r4,r11
  28c:	7c a8 42 78 	xor     r8,r5,r8
  290:	7c ca 52 78 	xor     r10,r6,r10
  294:	7c e9 4a 78 	xor     r9,r7,r9
  298:	50 04 2e fe 	rlwimi  r4,r0,5,27,31
  29c:	42 00 ff b4 	bdnz    250 <prandom_seed_full_state+0x7c>

Which replaces the 10 calls to prandom_u32_state()

   fc:	91 3f 00 0c 	stw     r9,12(r31)
  100:	7f e3 fb 78 	mr      r3,r31
  104:	48 00 00 01 	bl      104 <prandom_seed_full_state+0x88>
			104: R_PPC_REL24	prandom_u32_state
  108:	7f e3 fb 78 	mr      r3,r31
  10c:	48 00 00 01 	bl      10c <prandom_seed_full_state+0x90>
			10c: R_PPC_REL24	prandom_u32_state
  110:	7f e3 fb 78 	mr      r3,r31
  114:	48 00 00 01 	bl      114 <prandom_seed_full_state+0x98>
			114: R_PPC_REL24	prandom_u32_state
  118:	7f e3 fb 78 	mr      r3,r31
  11c:	48 00 00 01 	bl      11c <prandom_seed_full_state+0xa0>
			11c: R_PPC_REL24	prandom_u32_state
  120:	7f e3 fb 78 	mr      r3,r31
  124:	48 00 00 01 	bl      124 <prandom_seed_full_state+0xa8>
			124: R_PPC_REL24	prandom_u32_state
  128:	7f e3 fb 78 	mr      r3,r31
  12c:	48 00 00 01 	bl      12c <prandom_seed_full_state+0xb0>
			12c: R_PPC_REL24	prandom_u32_state
  130:	7f e3 fb 78 	mr      r3,r31
  134:	48 00 00 01 	bl      134 <prandom_seed_full_state+0xb8>
			134: R_PPC_REL24	prandom_u32_state
  138:	7f e3 fb 78 	mr      r3,r31
  13c:	48 00 00 01 	bl      13c <prandom_seed_full_state+0xc0>
			13c: R_PPC_REL24	prandom_u32_state
  140:	7f e3 fb 78 	mr      r3,r31
  144:	48 00 00 01 	bl      144 <prandom_seed_full_state+0xc8>
			144: R_PPC_REL24	prandom_u32_state
  148:	80 01 00 24 	lwz     r0,36(r1)
  14c:	7f e3 fb 78 	mr      r3,r31
  150:	83 e1 00 1c 	lwz     r31,28(r1)
  154:	7c 08 03 a6 	mtlr    r0
  158:	38 21 00 20 	addi    r1,r1,32
  15c:	48 00 00 00 	b       15c <prandom_seed_full_state+0xe0>
			15c: R_PPC_REL24	prandom_u32_state


So approx the same number of instructions in size, while better performance.

> I'm not really sure if 708 is good or bad...

That's in the noise compared to the overall size of vmlinux, but if we 
change it to a loop we also reduce pressure on the cache.

Christophe

