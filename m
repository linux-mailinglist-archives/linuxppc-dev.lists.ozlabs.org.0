Return-Path: <linuxppc-dev+bounces-11344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5809B37322
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 21:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBHsS53zVz3dWv;
	Wed, 27 Aug 2025 05:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756236844;
	cv=none; b=O9h6hrcPmNycgNmMHvYIctD+Cz434SRPMqM2ZMhO56bEt9R9qZs1QVW6sj5ry4rIkjJmTli37Em0byVr2pD+3WKjPAFUQBKMgFq3Xaz/szWVogDfbGlD86ax9dw+3vnk8bh5Q0yEEKVp0WKzTBwhNswO08a8Nu0+vcoaxgUh0UaE61IukA/x8XMTmanXvniNWMQL7Q55sThkD/mK+lxVQURcnZ5Oyx5VXnOjzyJVIiWP27dVMpecEyY+HWLa0oaZPDqDegFFooOUcVDktnp7MZer/zwgNm1tP55URvEYWQMyYmFd1YyDo20akBMc2jaL756IZFkAEjIe4raJjxdkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756236844; c=relaxed/relaxed;
	bh=ijTR+jgMQsvUEUMot4chx8VkAXhUUr1IMPkpEtMOHBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e14O9DgMyNd86Xh7uOWKmXzhhmfrzAiVx5jhhlMnoKnyQbfiw9e2Tz9q6XGpB5hlvXlwSYfKzJafGyUeTw5k/wNiLHfSXIsM2zjNaAQh8VgjUtJoD+kEFrhFADPJmL/hqGrss/bgsaHXdRFZiybuIAKA85FAPpWOmwvrn6mlYitdAyW/QN55pAWHXuIcLNhYO1IV9catq12QAVq6jceSN7ItVmnPbL81NV/uJ69Lw1elK//6VDvN8k+W4n7BPzNGVOaTkJC03zsKcUgakuc8145vBT1pn2oUsYgIfbolfNagWNwcWHTHChlyPTRk8nHgI9cjIjrROY+IOTl9nD3r1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBHsS1Hchz3dWb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 05:34:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 804664505B;
	Tue, 26 Aug 2025 19:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FDAC4CEF1;
	Tue, 26 Aug 2025 19:33:55 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:33:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 09/11] vdso: Drop kconfig GENERIC_VDSO_DATA_STORE
Message-ID: <aK4MJl3dfjsY8pPM@arm.com>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
 <20250826-vdso-cleanups-v1-9-d9b65750e49f@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826-vdso-cleanups-v1-9-d9b65750e49f@linutronix.de>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 08:17:12AM +0200, Thomas Weiﬂschuh wrote:
> All users of the generic vDSO library also use the generic vDSO datastore.
> 
> Remove the now unnecessary kconfig symbol.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/Kconfig                        | 2 +-
>  arch/arm/mm/Kconfig                 | 1 -
>  arch/arm64/Kconfig                  | 1 -

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

