Return-Path: <linuxppc-dev+bounces-15160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC13CEEB03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 14:40:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djPvl3602z2xrC;
	Sat, 03 Jan 2026 00:40:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767361219;
	cv=none; b=k/3vqpOibV4M/xhx+FXEHLHOwF4PoB5QFCbtOV5enUeJS504OF+eUBkgPfdCDQ4IE2Jpgi9GnjnIg3Txkce1cKSZU3dgDGumyGuLpu1z44nKUb4eFjOJl+rY1sYeOjSRyQlSGOGIVnYTgv3qlg7bybrbILsXSF3aoLyOebx1vxqSCwkwW+pg7pmePa+HxyMH1cZdP4JFwAeY3Re5bt5/4VDlTgXv5/pO4nFa4ucrX8KF0v28Jn2+PPppYfmpvoxrD+Fto6YP0q3Vx7cBQ0de6vgWUwPuvkGu3tXQvqhMKHRCPO7gyFgmk838zcG46iV+3zu11H1USU3THp3D7qaH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767361219; c=relaxed/relaxed;
	bh=SVGIiSWIzg80Bqq7LCYYlALqbBWZ2ofIsrcdUHfyZPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAZojnt3Yzj+U5nNWLQspzaWq1tFOqrH3KkiMDgXfEmVUsZWJkqr3r4o78bG78WCr61aRhiQqOt+/uvx4dM0zRn0l9OFAVRs/AWGFoeOHcgQN6Ah0Ys8iJg2IWxl3a8M0S/1nR9xCeTRX2CtQA/LftElMA0t6fAk+6KNDwZzAexy7JghURq1gk+utehEKA/Enu5jl6cW02g7rI+tY1Qw5H7XmtcXqKPKdWPETj3GlWEKPc4vjxxvl9kSOdEpsDIYMjWXYSdXhef5lUgYW8yPSlazQanyKmQw7q1rAQSe6nisXWhZMG7qJOHD4ZB6gm8bOWWw7NihL32lhPVUVYTBig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=bW2ENvpW; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=8n2r=7h=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=bW2ENvpW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=8n2r=7h=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djPvh4VvXz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 00:40:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0883E442AA
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jan 2026 13:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A90C19423
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jan 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bW2ENvpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1767361177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVGIiSWIzg80Bqq7LCYYlALqbBWZ2ofIsrcdUHfyZPU=;
	b=bW2ENvpWXyyENTYao9a8vpF6KdMw2iFyt3fMDnWm28sEiGCG1ZAVfj8QBckNS1URBdKuSy
	qMkKWGSU/R3XJnRP9oKK+a6PfgA0khTJvm4Y4kYpV+AgAW4PmlGOVPDAd3T5sq+1zoMJ/V
	G5EA9eYLmQnrQH/pUXdhhleeLIDRB8c=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ab379328 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Fri, 2 Jan 2026 13:39:37 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7ce2b14202fso32041a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 05:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYW0esjJRBooIxvCV5yOdIDyf/wWyRIE/KzMhQrTJLvvbAtuczYTE0mSnhc/x3BB6WFbN5aD77SFXW6Uc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwfgwlZkX/9QdzhmhiutV/egiqdfvRZlsO1SPUYAqcli7f6ec2
	59OddpgIr0OHYR8llerccoCkZZrM6czIJaBpDw6ZXVsplNdV41dOi2zJBDvT9tCdr6ofncx+DXV
	9CezxNcAWUA3dxtVdyj/Kmok4RPBniN8=
X-Google-Smtp-Source: AGHT+IFV0P4UwOKgGcidVSe3+C3GT9JSRutBmyTJY+Ko+TYwuWXifwQH5m/QQSPv0qrqCY9iwE1wKuoYX25E7txH4AI=
X-Received: by 2002:a05:6830:4c08:b0:7c7:65f4:1120 with SMTP id
 46e09a7af769-7cc66a6f068mr24618037a34.23.1767361173696; Fri, 02 Jan 2026
 05:39:33 -0800 (PST)
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
References: <20260102131156.3265118-1-ryan.roberts@arm.com> <20260102131156.3265118-3-ryan.roberts@arm.com>
In-Reply-To: <20260102131156.3265118-3-ryan.roberts@arm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Jan 2026 14:39:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-Gm-Features: AQt7F2qdo3e8gMqv9IRozONnOouAGf6XyGKVO6JwEtjeNVfJ3A-5G4I57eyZbDw
Message-ID: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to __always_inline
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ryan,

On Fri, Jan 2, 2026 at 2:12=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
> context. Given the function is just a handful of operations and doesn't

How many? What's this looking like in terms of assembly? It'd also be
nice to have some brief analysis of other call sites to have
confirmation this isn't blowing up other users.

> +static __always_inline u32 prandom_u32_state(struct rnd_state *state)

Why not just normal `inline`? Is gcc disagreeing with the inlinability
of this function?

Jason

