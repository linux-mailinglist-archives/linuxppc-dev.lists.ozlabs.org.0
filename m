Return-Path: <linuxppc-dev+bounces-2647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D39B3957
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 19:39:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XchyK73xlz2yHj;
	Tue, 29 Oct 2024 05:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730140793;
	cv=none; b=oczej4ay4zSpV7YlMckPQw/vExFXLWbvsKhyTvksisQ6+MoaYs98tne3J8Ny3TanM7kqY1Ahg0AA+ihFLZE1/ZJVIY77LF6fxCtnr1mLpG8GgCcUfuuM2CDJd1GN/p2Gi8xl78VIXhwq3jzwm0QCCZf3KJeiHd6CCkQ4MPTZrzfSkjyn9wdQv0J/Joez1yKRy76D35ekjQobQgWFtet1FxDW5qYch1yrYmfFU1iyuUJ8TM7OZj1ft6J1qm5dswISwfcV0QsQKiU89vUh8BV/wOjZuRNul92VpHhlOtSsI0WH1kCJh7bJP9EWmIxW6LLhRUlLaK2QJ20Hl7U2UHO85g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730140793; c=relaxed/relaxed;
	bh=ek29lxR6g00/9jAh9fH2VYgRnMqm2ZzZD8wQM6+8rOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cm/WRYy/6045ourRIL5R573biDN0JB9ly5t8DVUocVphDL3UiIfAYn+c8p3i18r0phXHNg40nJl+y+XAf11JlGeyf8S2cN6PAAuLXYzoeuR22rdQEA8Qx42e6X7wvCccsXRRCt5NZmNEj0cTdxSgnBq5HimDy9+gIENdbG3eI/Zj16ewN/D4pkoa46jAoffy+7mQwtRHV2gaNpIrKr55TNTxyA6eSppM34cpNRFufRKpWKSd51cTzUx5333u8Gw0z0xOywB+4IF1yDJ1i86R6IQqYdplrfwOJIlI2F1yT8JGejIcCRSSgZwFpvXGqHkHNFUGbAgOV7Bt1W6EjMD4jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ufVbxxkT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ufVbxxkT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XchyK0VyKz2y7J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 05:39:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51C75A42B3F;
	Mon, 28 Oct 2024 18:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611F4C4CEC3;
	Mon, 28 Oct 2024 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730140789;
	bh=uk4BWPlVVVwanPbUBrAaB+ERcnlLbOL0Xx2a3Ixjboc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufVbxxkTWxJDj8HIHfBS/e+90hOVJwh2ipSDoAm1RUfU5KMmgV7WmmTEjAnysS0gC
	 z5jEygQH1q1/a4tB71R8Bp1ATC7U76OqZCKr7wjOu+I99j4mc2QjAt8Nucxunj7xg1
	 wZGv+VyMIcKunGsRclb7iUvRyfGDDFbVTaCVCog4/uhm9IRpC0XmzA5NwCl+5V8/Bn
	 9wZ5570n4BR8rOzU1bjzDuSdR42R13+66vSllQDn/p2SFwTnRgy26PwXV6Ke4S75WX
	 FEIMyZc4Wgc+/rkrpAtXMY0SjfvDNi/ydcZe2lrkEs8d5xkzyJZMRC4Uj03ufeh6Rh
	 9Iy6DC7COCGhw==
Date: Mon, 28 Oct 2024 18:39:38 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/28] arm64: vdso: Use only one single vvar mapping
Message-ID: <20241028183937.GA3132@willie-the-truck>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
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
In-Reply-To: <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 09:01:07AM +0200, Thomas Weiﬂschuh wrote:
> The vvar mapping is the same for all processes. Use a single mapping to
> simplify the logic and align it with the other architectures.
> 
> In addition this will enable the move of the vvar handling into generic code.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/kernel/vdso.c | 43 +++++++++++++------------------------------
>  1 file changed, 13 insertions(+), 30 deletions(-)

I took this for a spin in qemu to double-check that compat and native
tasks can peacefully co-exist while using the vDSO. It all seems ok, so:

Acked-by: Will Deacon <will@kernel.org>
Tested-by: Will Deacon <will@kernel.org>

Will

