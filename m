Return-Path: <linuxppc-dev+bounces-7129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5571A64CB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 12:31:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGXqS3Xj6z2yhG;
	Mon, 17 Mar 2025 22:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742211092;
	cv=none; b=VJx9S7S/+S05qSD9819CQE8tghZO6mEWzaTro7HyAlDr8lO4sA7TkrUAYuoIrD/oF0q6s5n9DNw/5dLUzwgLMGeQZJqKJnzz0VEOtiggwqE/1gzV/1bmw73cT12S/u368JRNcVaOyvMUpOnx4EUA+ewozNoDM0yvh97OuiXfw0Q3ysH9FszL9QuOpXupsAuiz7MGGqwuR0GXEBWHuWgR2trp/V8JDY/4WDo2PBFKmJ4+sh1v16rpZW3WZGfvyXFku00E+37AenwiSnEhS+lAaGmYQXIZ54qMJFqMGWRoH2WHVuRUXUIZCrmoQD+WJE3aRQfH+IonxvJiR+YcwA5pXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742211092; c=relaxed/relaxed;
	bh=nfHTB/nIl+RDq3rL3kY2G+Hq2s8UAbra95K2RlIfv/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=msHujF7lPKL3eAzVdJI8CH3LwqN7M6HTdWjpEdclXBMp39igRuMnlqkG+vID10HSgQcyHvfOEpgAxo4YAfgxqBdod2x9qsnJd3oRDNjilTy788VhKpkjzh8SOD68gZ6S75grTtFBJ/noWOsC25zCj3RTtLNSfXn4FOivJKJUxCHWdq+rM+WQX/31gNeCSoMj2xJUalHnS8OrkRpbLEzu75dG4DFdSEiDrybFi1nmMjn8KvA+WFd1cZ/0mv0308U6FS8sBS2GaODlMxX+cqoU60dg3wSU1uLgK/smRq2veJH6uV1/cJHoPuFDYLov6N1ITalrpNK/wuh9H+4XJGU/Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=THULKh4Q; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=THULKh4Q;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGXqR4dh3z2ygm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 22:31:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1742211091;
	bh=nfHTB/nIl+RDq3rL3kY2G+Hq2s8UAbra95K2RlIfv/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=THULKh4QeDj55AGiFjLvKR+ppiee88dNU1yxt7aAdWCXRewUJdRUk+1hEnpKs5vnk
	 8cN8/X9HSmCrSl7icuzk389a6XR3oUfqtWruR4sSbc/nIuBeHSJSKIqUYh/FlDi23G
	 nkrv4kmO9QetcPTFpFiXpUBuULetOEIp9su0DIBRRiQkc1Z/y7is3xcXThvcY8yLrJ
	 01mZVeWIgX+XwpT50e4SFKqqEfCpqQ9MgzXR9PwVFEbpiGkAKlE94Q12ksS1BrFJun
	 82FcMT/zCyL1BoG4qzRICkOVKy/3J/0u1OcRuH4J2iJUXGewuGDBA9SqIVT2Q2Blk5
	 zrnx8kdaVEaEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGXqN4Vq7z4wbv;
	Mon, 17 Mar 2025 22:31:28 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Julian Vetter
 <julian@outer-limits.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: Re: [PATCH 4/6] powerpc: asm/io.h: remove split ioread64/iowrite64
 helpers
In-Reply-To: <20250315105907.1275012-5-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-5-arnd@kernel.org>
Date: Mon, 17 Mar 2025 22:31:25 +1100
Message-ID: <87senbdhbm.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Arnd Bergmann <arnd@kernel.org> writes:
> From: Arnd Bergmann <arnd@arndb.de>
>
> In previous kernels, there were conflicting definitions for what
> ioread64_lo_hi() and similar functions were supposed to do on
> architectures with native 64-bit MMIO. Based on the actual usage in
> drivers, they are in fact expected to be a pair of 32-bit accesses on
> all architectures, which makes the powerpc64 definition wrong.
>
> Remove it and use the generic implementation instead.
>
> Drivers that want to have split lo/hi or hi/lo accesses on 32-bit
> architectures but can use 64-bit accesses where supported should instead
> use ioread64()/iowrite64() after including the corresponding header file.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/include/asm/io.h | 48 -----------------------------------
>  1 file changed, 48 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

