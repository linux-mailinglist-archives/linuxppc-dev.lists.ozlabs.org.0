Return-Path: <linuxppc-dev+bounces-16077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAZDNWTNb2mgMQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 19:45:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7B49BC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 19:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwbqy6krVz2xS2;
	Wed, 21 Jan 2026 05:45:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768934750;
	cv=none; b=Q7AYtpelTisOKWIXQ+8aNgalZoM/qmL3KmF9qzB0AXdENpnpL4lsw6G7Ir7BKUN4Wq9xKH8/SlkQ7YNKKi0PYDu9P65pu2zcB4ewwh1TzdyuV/tHElUog4f6c6XojblF2BPowliMBjUgqdW50n4XgVt1h4ElPNk4kNlnJRXqQFQ3mKY3fJ4UtZsQ0Sm5Bd95qZQiWFzZDGRdGyh0QnM6Gf2pSIyScUXQSGo6wB8b4cT35tf2elEIvj2dFwnXsEzzs9dkmV0SqM+olzVxXPb7eOHw0UtrodNoyecoKApOJDDsCmYrcKExeo3FhwqydvOvELulROYRXQXMjqXP4k1ZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768934750; c=relaxed/relaxed;
	bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X4CUiGmU7a69ch3obLYLCgQVl1WsIBzwdATFu/maxVm3ELUixR4JDxGQutjXwk7JZ0PwRPY9NbEOK+0t5Zlm8N9mfepri9Ur2E0LSyiy2v78KNzaF9pHWfNwM09VoKQsNX+O6g6PKlypU58pyqeTMUZ2klWI8APtLQoqBU6Erwt1vcYTma1APuyIDco+aOr/1Sn+M5ClD3m8eb9dkMEvwqNH4rOI9OG0AP3cxgpyj4shFhsT6DXzbvg5iJZQmtRoBUtEBxNaaRdzJ9iowjga04fTiwqlZaT1a41BK5bcVVqdpCdI9nsTp9fGGBSichdVvrmyGsarAxICVF2Po1SAEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XM0foiBB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XM0foiBB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwbqw6GW9z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 05:45:47 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4358fb60802so65973f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768934743; x=1769539543; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=XM0foiBBR/+fnvFhMruU0DSUMe41Hpbg4cnpDfYAPL87ekPfGBSPql1qVLIfGpFt9k
         tWZ1dNu9mUtcK6XuIihv/Y+HJrD76dxoojgfvSTndR/kyY+kpt5ZtnTLCwWl6ZEoDrts
         5NJmHs+MrN7f5qyeDVqHBOWbdrk7gtwWxDdY5KvJl1cRt6KDcOGQ90uFVO/TOA53ajfw
         z9/Y3Zc6NCJ6nMuCXt7j1dep89f6sobLuvkkkYD2P5q1Wj2s6vSEG1sX24HVFk/h7O+1
         E7HgPZSQvaP7AQYFJxspdJ9jqb1l2G6XoQSfZ8Opd2Q6EFfFvvnOHbKCJFF/tx1DfYMM
         l45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768934743; x=1769539543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=f9GIX/xGcMwuZrWA2QQY6oJrvPdxCXimVhR7LlMOJPXfbeEw42fid8KByAZwOZ/zjx
         e+1ln0S8EMDrzqbBqDvZ8CKiJ+I+m+dkaYWGs8Kg82S9NtNbojvjfcjOImD8yxCG7BRx
         qvGCJlz0jG1OMlaDM4ti6snpd3qKejwpJWR7TEEPlZSBQ0VzggBVAV3a+SITw+4+6hwM
         lMwsYZr2h9Dh5B86sI8axOUnvzuMXfhSSRto23/3SmwtZAxwhXt2nWOi85J4w/WeVz9r
         4PQJu+nTa0T6q920M+Ekcvo2PQfo8eT/+QJn+skFMr5wBuBHqodUXZfmCON39UUw3Ven
         xLmw==
X-Forwarded-Encrypted: i=1; AJvYcCVyqjbLm41Q+bXm8hf4I4dOFFvBv12K838X6YAwl3r6Y+QqgmE/boaH0cefI5CpQ0aYSaLKeR7FlD54uA8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxO6ZDo6Rb7eu2yMijQaAFlOL/VmP2RgDwMo6OkNL3Xk7Wc0zNH
	1bCBXo/lYUdZ6LiwEx++TMEFF8JvpfAR4WzVL2Zrum04Bt15DI7RNdLS
X-Gm-Gg: AZuq6aKetpsd5JONrYcXP1hOPDfuXbfo25PcijB8mBGplbSZM1QYO19NBeaojk4y7n2
	dM1oaotMxiLbNAlrPd5ANpeAHmqxTZO47Yt4Z7kV6szuCCVG8O6HParW6hfz9tMTiQCVfVuHUw0
	YKrO3Wau36xu5ee2XwO7qyWFUcWt2xEPjEZPwLzwBQpP8OjhXkJ3K9AF4aGcMxiWkMHdlTOK+rF
	lY5WUn/bhWYHiCU2iyXYXs0cKKOcO7W9fkuXdzkWaLD9WFA8uG5wy99pUkNPU2O7rQnxD7rpGUE
	3kxgPi8p7mAkjXotJS4gbcuHhoLkaXVMHIUc29Xxb1XzPC3cV2JAUlBbfbGWA//Je8IUnVnkalx
	mLMylxjXBryZjxGE7t8MYvj9G7MqxF5n5dAO22IwtorYkyhlLcfd0PDbYigxoPgTTeED/LHQsSZ
	P2QjoIduWgNpWYNeIOMndGthyYVVv0VtbIgV/iMgB1A0Urp+9pzYZ7
X-Received: by 2002:a05:6000:2484:b0:430:fcbc:dc4a with SMTP id ffacd0b85a97d-434d75c16c1mr25592154f8f.19.1768934743113;
        Tue, 20 Jan 2026 10:45:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm30869735f8f.35.2026.01.20.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:45:42 -0800 (PST)
Date: Tue, 20 Jan 2026 18:45:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260120184541.0a463cd1@pumpkin>
In-Reply-To: <a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
	<C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
	<785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
	<a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:ryan.roberts@arm.com,m:kees@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16077-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 61F7B49BC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 08:37:43 -0800
Dave Hansen <dave.hansen@intel.com> wrote:

> On 1/20/26 08:32, Ryan Roberts wrote:
> > I don't think this question was really addressed to me, but I'll give m=
y opinion
> > anyway; I agree it's pretty binary - it will either work or it will exp=
lode.
> > I've tested on arm64 and x86_64 so I have high confidence that it works=
. If you
> > get it into -next ASAP it has 3 weeks to soak before the merge window o=
pens
> > right? (Linus said he would do an -rc8 this cycle). That feels like eno=
ugh time
> > to me. But it's your tree =F0=9F=98=89 =20
>=20
> First of all, thank you for testing it on x86! Having that one data
> point where it helped performance is super valuable.
>=20
> I'm more worried that it's going to regress performance somewhere and
> then it's going to be a pain to back out. I'm not super worried about
> functional regressions.

Unlikely, on x86 the 'rdtsc' is ~20 clocks on Intel cpu and even slower
on amd (according to Agner).
(That is serialised against another rdtsc rather than other instructions.)
Whereas the four TAUSWORTHE() are independent so can execute in parallel.
IIRC each is a memory read and 5 ALU instructions - not much at all.
The slow bit will be the cache miss on the per-cpu data.
You lose a clock at the end because gcc will compile the a | b | c | d
as (((a | b) | c) | d) not ((a | b) | (c | d)).

I think someone reported the 'new' version being faster on x86,
that might be why.

	David

