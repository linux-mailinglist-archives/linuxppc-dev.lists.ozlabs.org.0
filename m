Return-Path: <linuxppc-dev+bounces-11345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7AB3732C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 21:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBHtF6mrjz301n;
	Wed, 27 Aug 2025 05:34:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756236885;
	cv=none; b=YljtEMyW0z6cIAJFl4/6FS2rEg9l7IstlWngVgGVaMNGKRlUW3f+4fudf8+9XY9HqXuM7F9sI9wuEb4KdYpFfEqSU/MkvBZR7eRuYpRAlFHiqUGS30b4caXDAktoWKhlwU1g5ZgKzjlVIs1k0BhvURAhk/kUX91ApGgu3a6gUhvjT7SBO16hQKpMXOwZsOf/8ixc8ttsQqGE1VkKaXXUdiMnVIqCBjU14no7eNzv4OzEC2sLRMYppDdHzQ3ueIISdn9lcSHVnT9i79/hregQ59pUIisM7/xh36ea+2BXqa4FgcZ+2zco983lCQ5JEiCUDkrt6jOgwPumN7MIWIy+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756236885; c=relaxed/relaxed;
	bh=C6gESCLwBqMn5oFxc+A3Sws4vzsSLzoYx1R3nBe9zdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiB9KoceBFcltiy93QwDBoToXZSq6xhub6jC9nBSMkDHHV2m9mwkLUPJ6CXaQP1BMthwTg+v1yNYh8c0XFgFnl0Zu1pwc4lbAIkdRTy7OxQkZy+7y13c2QYkIXOgxylqZPw02oEpoBxCmkuS8XOLRfDDo7gz2LSUNh5rC+v/RGpDQm9EUJO7Mbc+BgOQsUPcnL5J8BYy196oAMXB8L3Thi17hd/2S5J5H77FNB2YsEyNqAZru4xfu5dmsZ2X/0abiAni6L+pNiikWSTQSaFeNqnpLGwEynsGoIyCw5M05Y/P4EmJaI8VmQUqJJDCHFGcS4YsvUKPbMQyJDe3tChE5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBHtF396gz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 05:34:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6EB43C0C;
	Tue, 26 Aug 2025 19:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D17BC4CEF1;
	Tue, 26 Aug 2025 19:34:37 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:34:39 +0100
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
Subject: Re: [PATCH 10/11] vdso: Drop kconfig GENERIC_VDSO_TIME_NS
Message-ID: <aK4MTxWGoe461HGb@arm.com>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
 <20250826-vdso-cleanups-v1-10-d9b65750e49f@linutronix.de>
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
In-Reply-To: <20250826-vdso-cleanups-v1-10-d9b65750e49f@linutronix.de>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 08:17:13AM +0200, Thomas Weiﬂschuh wrote:
> All architectures implementing time-related functionality in the vDSO are
> using the generic vDSO library which handles time namespaces properly.
> 
> Remove the now unnecessary kconfig symbol.
> 
> Enables the use of time namespaces on architectures, which use the
> generic vDSO but did not enable GENERIC_VDSO_TIME_NS, namely MIPS and arm.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> ---
> Technically this is still too restrictive, as it prevents architectures
> without a real vDSO to enable CONFIG_TIME_NS. Right now this restriction
> only protects the SPARC vDSO. I have patches to drop it completely,
> as soon as SPARC is usingthe generic vDSO.
> ---
>  arch/arm64/Kconfig                   | 1 -

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

