Return-Path: <linuxppc-dev+bounces-15984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F039D3A89F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 13:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvqNm5sPBz2xjb;
	Mon, 19 Jan 2026 23:23:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768825384;
	cv=none; b=k3ZJpUXnD0IvkqCPdINa6c6evcLghkOSCtu5tlMmb9C6lW4SJSHmbiQh0un92iYNiGxWzvAmOvxkU/n9WHJ/0OHwAfr2+bAHIDEERi701doWLG18lKrFeTQ1oZczgmTgcKlyzVTMborVAxqI91l8zY8RpODDvCKjUkuuG8V7tu8yh9Q0p0eg4urBFsw+OhPuL/ha4CfsEMIg8e70Id6gtArrzcp+tJFDtv7m7Ky98L4FmINzOCKnGLzV91jKRmoTKfLZ5F2pAn1QWowYHU9O4RKWj6D3/qarhokV8OCLF8lIah10kxt8WUvCaEp/0Jo8ePIMe4KwgssgP/f/S2NMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768825384; c=relaxed/relaxed;
	bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mrg4DXDCkqSEH96IsWRcGKlr2jfMpJvGuhOkrLiUrqVsO/jxd2PRbWmaARnFktBrpvSCnGzXs0w+u70F9FjEfWyIG7QmIQr38WKScMQUucJ0BxClMacxYyjBwtPBRsm0l/HksBKeGSJCQbl0lEGSJm6QAtpDP7EDEFpLnjZSKkj0F7xqbEaFKVAKmuS3C6A3oMtvSk0bv75DbOH67DK5QWKmaRhW73jp9MbSmCSwKdK42Hco61D1ZA6BxvNuu/d6WOc3pKp/bPyLap1CZxouK6FE7OVJTpF+b7BI+ROhA6Hj8jw26OQ6Xfb36tbcn8glCHeCSsfAp72JQbHzRLB1uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a4yHZEjb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a4yHZEjb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvqNk5xTYz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 23:23:01 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so20180755e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 04:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768825373; x=1769430173; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
        b=a4yHZEjbBwCudJrIpn/7Ln9+gEL8htYJoqT7+tCaeJIB8TC8r15YyRAjcYOVcBcrWU
         DSBpoW0lQMffcxTOOXunJTsW9N13vA518RIiYZ61iM9u7+6v6p1/HWbFIs/t8PeIkXnz
         txbVkOs5jj11BqEECo9n+S4/fE0MBG4K5H2wL6MmAP6aTssoifCoxZ4q0OvuMiXaWzGN
         Mx2dbnK7jalru4PMYY/pv3+b9XXQjn9Z/pF69ax/VcoQaZlgspcy+28Ot8/ixXfNBeYC
         ukdoYve0qj0aRRfvcWxjWiyxtuYtsx+mcCaAIoaHkDNCMGMoHfm64hNqSTjgYb7r9jzi
         dH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825373; x=1769430173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
        b=fNVV0ZCAB5+Ec923Vyk27Y1UHhU2jmnuS/NropyPei9j8k1Kwt2XgsDjz7ELiodN+o
         8xXA0BYr7+rlokpujALLcMAhka1xUK+D6CvziqkUh1c8Q2aaTaDcvu6K0KVmEpLy6SGP
         bkkTCGOEaD9RDJks1aviqAYl8JuHuiKyFxHz4nq1NPHFjqqewUcqsFDN+7M/R1kiKath
         ELPwfX06dCNb4m9ATTIND/bXTeXoT1mcaxXETL6ZX8HUtU+uNJ3+7sor/JN5fLS6BbUb
         G4KAXFnfxeyQnIyOagOzdvG+kVpZkiYGRU0KXZZiKO+SmAto0UFprvjR2pgTWVvCVegn
         10Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWChz89YbUV7JBeoe+QUPJcNgpOrmQ7uuh95Qgn1tMZh4/XceKs3diVUG+hxJ308TRs5dd/qunRyZzDHzY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6xdE04iBKje4YagO2vtia36cjgCBEweXQobOXpEuzEufZtQ0R
	uuheKYiNaTsW4Yb+ds2Bho11DKt0EPh4PkWL8t4y7BvZB2xIzty6LTst
X-Gm-Gg: AY/fxX7naDTm9HWHcIuT0ZQWQDkYa9aN4w98vuJgF0VGrXxE4ZBx8z8pTCZq8ZL+aCJ
	MQ5o7Wlov+8WtYBeSbK5CNPA6+ci/v1XZalR89XqKaDiFSbuz7thdd00V67pue4hfY3ZxtUJLMa
	t06ZMcbEuWW5k+0N4PzwasbAZv2b3QfF4jCVuW+zKDhoZMcm+gDV9GNzQYcKlAB/0lcELwzByzb
	7mGaJp1i+Tp2TNnp8xsIKpL/FhyzRPvKjUUzYgTnA9AKRpNNGaY/3iQ2qFGHMT0jRVwWblg8YRP
	jLIPIDcgL+hVh/J7P0/QT96HqU/AatAEm2fAJhyjGugpBpDXyIlxWpkKnMVGAdsM/Dr+XGl6Qa2
	lzJb6NIqTELplyYoJfGito5p6IHZrekZjgE52x1NBpFr5bCaFfOiYteOBllNL662LYS2lTTCZ5X
	+rElHVFSyFrralyXahrUfboifaYMGluCUFLJimrMH4kMrIGPqmLltk
X-Received: by 2002:a05:600c:3509:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-4801eab54e2mr107589925e9.2.1768825373288;
        Mon, 19 Jan 2026 04:22:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe67780sm78105625e9.16.2026.01.19.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:22:52 -0800 (PST)
Date: Mon, 19 Jan 2026 12:22:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260119122248.30974c78@pumpkin>
In-Reply-To: <aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 19 Jan 2026 10:52:59 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Fri, Jan 02, 2026 at 01:11:51PM +0000, Ryan Roberts wrote:
> > Hi All,  
> 
> Hi Ryan,
> 
> > As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> > and, on arm64 at least, the performance is poor. This series attempts to fix
> > both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
> > propose a performance improvement approach.
> > 
> > I've looked at a few different options but ultimately decided that Jeremy's
> > original prng approach is the fastest. I made the argument that this approach is
> > secure "enough" in the RFC [2] and the responses indicated agreement.  
> 
> FWIW, the series all looks good to me. I understand you're likely to
> spin a v4 with a couple of minor tweaks (fixing typos and adding an
> out-of-line wrapper for a prandom function), but I don't think there's
> anything material that needs to change.
> 
> I've given my Ack on all three patches. I've given the series a quick
> boot test (atop v6.19-rc4) with a bunch of debug options enabled, and
> all looks well.
> 
> Kees, do you have any comments? It would be nice if we could queue this
> up soon.

I don't want to stop this being queued up in its current form.
But I don't see an obvious need for multiple per-cpu prng
(there are a couple of others lurking), surely one will do.

How much overhead does the get_cpu_var() add?
I think it has to disable pre-emption (or interrupts) which might
be more expensive on non-x86 (which can just do 'inc %gs:address').

I'm sure I remember a version that used a per-task prng.
That just needs 'current' - which might be known and/or be cheaper
to get.
(Although I also remember a reference some system where it was slow...)

The other option is just to play 'fast and loose' with the prng data.
Using the state from the 'wrong cpu' (if the code is pre-empted) won't
really matter.
You might get a RrwW (or even RrwrwW) sequence, but the prng won't be used
for anything 'really important' so it shouldn't matter.

	David

