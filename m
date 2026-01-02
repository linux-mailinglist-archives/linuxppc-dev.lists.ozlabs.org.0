Return-Path: <linuxppc-dev+bounces-15174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5182CCEF730
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 23:55:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djfD02nvvz2xpl;
	Sat, 03 Jan 2026 09:55:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767394512;
	cv=none; b=Wsh5v4Rb/kzv11D9XDyw2eqo3b2ivUabd35w5gx2uf9QCFlNhks4bwzXljEvB/YbTBkFP0srr9xSDJvN6eaLbAcw6KIDv4IB1Enq0876T55aLHGMyKm+7qd3/BBLV104XcXllGk0bu/Fru0B06OK0u84xbLIBCiRCz4CAUJWJ9Ly7w1rlM0MLQl/uMwm0YAApEqWc9vZ3Ghp7P5J54tOrBPMDziAIbh0lslgVII1MEp1DQg/ymb/Fof/w5O6kLn0eWrEwDkJOcD2t+oYC28aG0bDufRULc7IzINdjOCWBEgytXpmP2CSndLO8js9d38tdNUiI41NZF6WRsviutuTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767394512; c=relaxed/relaxed;
	bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXODCUz6dXhr38RBF074lEGsoFZbbi5msZASkuJ0IIc+6FvdPv9ONwcQtHpTb8fzthO9ujBO10MEemDVp0MdS49QDzEUvEYZaGJYe1NIbeoHXQW9buRHX9aLOs0r1YLAuBF7UvukNfcvQekmUPZgWURHCUzU8+XwCKGVvriUt3tC/aIVz+Mn4VHCmHBzTT3BvR7wFHj87ajO0PjdIairL1HMZ4Q2YZRo+naucdDfivEanctYygne0YR1TLfDNRQOunU9VjSTAM+5zuBFLfGiserWzqrOdlTSB0DBQa55e4uI4f/1zHJhoOoeXFOw9Y7ADDk4fJR5voQ0dc6/JSwc6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=InS5eu0s; dkim-atps=neutral; spf=pass (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=InS5eu0s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djfCy4WK4z2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 09:55:09 +1100 (AEDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so5070457f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 14:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767394446; x=1767999246; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=InS5eu0sA4M46zB0+a5Cg1i6n4s0Q0HWc+y531YcS4ehPyp0ItHDrRThVJET6mVBB1
         IznnsoB0lPXOxy6iIBHBhv8HmZcY18NS2xFSndE9bh3xSfuWz9rI1VLaWRVFt8wir80a
         RNdwk1XhujMdZDvWFa+YMM75e77iepeJ7PfKkdqXTDXFuYZSjA+g1qr8T4bWI5GQFE/c
         MxSIga83UKzcfKcyotbq3NZmFKzSnnYYBhV8lEvqcrD2z7xAojl1sKApxgSw8VCSRxkK
         WJxXgVREck6rjZYpl4FUaQNdaVjLxdSoPg3WyNAtOwcK5SWaml9t5qFzvOKSLv8Yhk6V
         Dpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767394446; x=1767999246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=orDONx9343zz497HfsXVmTcKwXknYQ7hCLdblfuXRegWiv6y8KRByqeI45AEFxWMrO
         6Pvaqfq5Hmr4Ps5BCnrW6o+sKmW+uBKk844ErN6Wl3KchdYEbojX6l3Z0LORbRiO7fUQ
         /+2kgb7hz5ArUWpQ2iyN8z8IGCnc/6yCPabziD9SmA0ieSJFHx/J/rvDKDhwe577GVGT
         kZkjATz+wer4ZbP0D8GZS9YXWTrLq2z4WhK85LI/v23Re4+wGKccWyxkBIyXIhMbAHEK
         oNCnIaZQJcDhIzQ9PSdYL/9EYmJkAGv0n4APHxj94SVwS3e5Y+pvauY8h4bC3Uba7f6/
         x3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqTKfhBeC5QzG/C3Y7o1BACnQqgShZjRgXc1eVdCppypFw4B5upbeibXNmktsNI5LWLizG7/HsgrlO/9w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUsM2OxEhZtzMDhsMXups3FZexNFXTTHqjx8Yt5NmsxjLQXK0T
	zRodK9qYDAnDPQZ5rV6qA+SL18nWp2F/kmOnsxNhhuM7l9rHGotvgO0d
X-Gm-Gg: AY/fxX501eiIgTnY82kADTEMRGRuGJ0S0ndDdGNmkP1DdHrTZ7s6VeEjAT07kwIi9SG
	B/YwE/Lev0Chq4hIbeHys/eB1usBPa8rHIgleIZjpnmY4Bpi7k1gY2FBC2FXBPNHjXbwmbfOkpd
	1UZ4OptuNWIwRskQBT3ecXfKZSrzUebSMHNnE2WRr+JNW3DNwz1FBZV1029hN6l4NetdwUQBpk5
	5ZlBRj23OZ0Zx+d/y/3YphlrWjp15lli4LAKZ0jjzMJnt0SPquvaA92LTMrntQt7e7+cmXitGzR
	TJSRz3E+05PcpodAwI/fjwOfehlHGk5bjh0VysYJBaYRG1EBoiSxFdntDVCdlKYxKIgqYX+2XzC
	pdOGY75vA59JKzRbMD0muaLsLPichg8b83SfFtFo2WrmaytLR9N74aVl96eXWKVS2fhPwrvFPnf
	7nwPr3JByYoQ+ipoiAhyIO1LlrkqDePKH72DQ6T+X0eND5FAXxyJRF
X-Google-Smtp-Source: AGHT+IHhZlcstoHojBz97OFk5owjy0cbb1cp4fYnQEbcnWo+WUycqSneA9mdGDNlnSrZ5xQclO2tXg==
X-Received: by 2002:a5d:5392:0:b0:42f:edb6:3642 with SMTP id ffacd0b85a97d-4324e704c03mr44422531f8f.60.1767394445433;
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm86000586f8f.40.2026.01.02.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Date: Fri, 2 Jan 2026 22:54:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260102225403.78e26214@pumpkin>
In-Reply-To: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
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
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2 Jan 2026 14:39:21 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Ryan,
...
> > +static __always_inline u32 prandom_u32_state(struct rnd_state *state)  
> 
> Why not just normal `inline`? Is gcc disagreeing with the inlinability
> of this function?

gcc has a mind of its own when it comes to inlining.
If there weren't some massive functions marked 'inline' that should never
really be inlined then making 'inline' '__always_inline' would make sense.
But first an audit would be needed.
(This has come up several times in the past.)
But if you need a function to be inlined (for any reason) it needs to be
always_inline.

Whether there should be an non-inlined 'option' here is another matter.
There could be a normal function that calls the inlined version.

	David


> 
> Jason
> 


