Return-Path: <linuxppc-dev+bounces-7989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D672A9CD34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 17:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkcNJ5C9Kz304Z;
	Sat, 26 Apr 2025 01:34:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745595296;
	cv=none; b=dPTuEs2KL/tabslrTCgAjIRx4C1anXkNetmA5nVjA/Tbz92yrTQoSvGvmjHdSX/S7IwA2XzMs/Axx1V/CmxmkAPJDn+xCoe9u0ScjOHcfzpidjZ1/60bQ1V6AtTKgCIfFI4APMU1VEBaNO7/EQUCLorg+4HPE3IDrOMWJwoY4kivaXW/PCzj15T7rJHDiDL4YODeitZPdfiajWDOlq3Al8yc9L0gDYWVcQnHt43olgyV8mznYJjun1G8RLQ+/Egcss+yRc6tPnYVuD1ma4sEwg/F2UjOeeQiZYqHyZc+KpYGtmZf/p7SmS3ESKV3IAQ8n95eJWi+CEtCK6fiBkV82A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745595296; c=relaxed/relaxed;
	bh=pZfB6rVZVRvFwPOC2mIb+Lex3AbasEMEJSEtzwVhu8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clhGOjhfbkF3bmaPPf4KP1JKYV4+bJZ62gW5ePiQ51rYxDjAs8m7mjhLX842DdaddTzWZ0nuR+cBAkNOegreFkM947SgqTjoUhmNtd2TclZtb3DZ3bb2UY6Ju10eiE7/iYMaWe4yPey3Nk7rJzVHEqqH+W+mqulzOAP29rQhxhHExyc5KsN9Ot+HNw0LQS+T2PJSkCK9DOgOUmaO3oYwbOa99q5Au/FGRw4ZnfjG+J+SoTgjBPn45ZxD0Kn+rnnHu1ZA7QxypnIjZJaoT4fYI4hFw9EzkjapKhpfwTmJSV7zzZAsDW1GdyBZbueR9YNxX52Tp6dG4XpoH1M4byGY1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CAQGX5ZM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oeQCafVZ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CAQGX5ZM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oeQCafVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4ZkcNH0Hr7z300M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 01:34:55 +1000 (AEST)
Date: Fri, 25 Apr 2025 17:34:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745595289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZfB6rVZVRvFwPOC2mIb+Lex3AbasEMEJSEtzwVhu8Y=;
	b=CAQGX5ZMKcx+gH46PjJwuLZ1t9TcvbFo6LX/q/nmTvNk7kW23MJ+hE5FxgJ1hv0yB1DRzF
	KBOXWWgV6pIivBMErwQOuB2nWprnnWM+up3MqP4Ih22BAYn4qU07DRa9Uf//zzQtKVgwE8
	PrStc/hUc0DrQL3XjwjkiR3COHh8ojkW7XMUpITrGH+GccFDvCHrA83Ciy/Q7mL2jN+mO9
	RlfK6xHBf8DfsaeyHq3S8SDdGX7y16K3lUSrDrQJ7hXLypPEkTW7rOSXRjBU0M/ryqhqDz
	Nqy0F1Q98GgBeEueZGvb5xIpOQnpcHUE+GPVlH8lQEdxyMNIS4X0gw5x7P5H4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745595289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZfB6rVZVRvFwPOC2mIb+Lex3AbasEMEJSEtzwVhu8Y=;
	b=oeQCafVZQ1lKq1NxkoOK+UaNraaSv3v3lJOx0jFFppeRLdPcSyF7n/HCmoLGD7aHpjxMs8
	fv0uqcFsR4LPQCAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jan Stancek <jstancek@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <20250425165448-f2ba7d6d-e54e-4f3e-ac14-5986bb1a74fc@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
 <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
 <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
 <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
 <aAueO89ng7GX2iyl@t14ultra>
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
In-Reply-To: <aAueO89ng7GX2iyl@t14ultra>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 04:37:47PM +0200, Jan Stancek wrote:
> On Fri, Apr 25, 2025 at 03:40:55PM +0200, Thomas Weißschuh wrote:
> 
> <snip>
> 
> > 
> > Some more information:
> > 
> > The crash comes from the address arithmetic in "vc = &vc[CS_RAW]" going wrong.
> 
> That appears to be because it's not doing any arithmetic, but using value
> from some linker-generated symbol (I'll refer to it as "7a8").

The compiler emits a absolute relocation:


$ objdump -r --disassemble-all -z arch/arm64/kernel/vdso/vgettimeofday.o
...
Disassembly of section .text:

0000000000000000 <__kernel_clock_gettime>:
...
 29c:   d503201f        nop
 2a0:   00000000        udf     #0
                        2a0: R_AARCH64_ABS64    vdso_u_time_data+0x100e0
 2a4:   00000000        udf     #0


Which then gets resolved by the linker to the absolute address from the
symbol table.
As the vDSO is placed completely dynamically this can't work.
One central idea behind the vDSO is that the compiler will only ever generate
PC-relative relocations. To force this the symbols are marked as "hidden".
But apparently that assumption is not always true.

One way around would be to add an implementation of __arch_get_vdso_u_time_data()
to arch/arm64/include/asm/vdso/gettimeofday.h which mirrors the one from
arch/arm64/include/asm/vdso/compat_gettimeofday.h.
The generated code does look a lot better (to my untrained eye).

(Another workaround I stumbled upon was -fno-ipa-cp)

__arch_get_vdso_u_time_data() can also be simplifed with OPTIMIZER_HIDE_VAR().
I have been wondering before if this should be done in the generic vDSO code.

And on top of that we should validate at buildtime that no absolute relocations
sneak in.


Thomas

