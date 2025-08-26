Return-Path: <linuxppc-dev+bounces-11343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DDAB3731F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 21:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBHs54yQbz3dWc;
	Wed, 27 Aug 2025 05:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756236825;
	cv=none; b=EzzPTKMOp7NA3TlGBldb+bIVH6c1yUOvCB+r/AiZ0LOJLfbjm0gMRcqIGL3Ov5pAPRB0DSIjgxDdvhP9mNb2T2TmrZIRh1XsrwXUv9oXYKp6H2HjThVCv/bDAKG/wnBcJg6FbLC+hifc0OaJSrV8tiRF7IMJWuDtWknwEjLI/O4z+jIj/7XziF320qc2k5IU98C16W/z+WumGDc+FOEAroBsEnJucQfIQRgL4+23DraGOwwKbfDYBZCAXHGvjyMI49L8KahNtHVWi5FgHk9F65fI/xRPYtuNOIVM5wTEPO2Q7e4MF7tSlY5zEzAe/d8CJeRvI8Va56TvcUgNQrbgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756236825; c=relaxed/relaxed;
	bh=j7GF6qbANdeHD0+NB3SknfHzSFRBt4CnVhinOJKAXII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuygBAXMhBZ56eRK1lWzGJ7L39sCAtMu2Ni66LrgK2j5ioov7JJpTZRivRA6Tw71ibNh2wNsJZ/W8lAB/Yx/SDJ9XlRvlD6/GwXIy7rFBvXtwZKkTlavuRX8J9J4K9CY+ESGc1KI5u++G5pbJ4Wwdxle3PwSYl88iJtgnFtLbxTchh1i3ymJsnF7/aESA5Tnmw66VlI16Mit59txjTPNeUtijpiRvJENjNlmLW15e0U/L3VDlYQXj3I9RE+E84HOgl8Fs7eluD9I/7cN7ThhNy6Q+s37m+8CuOX7jBI0BMCJPJI9mMoOISGdJmdipz9tddYPMAJeuSqPlSfxa2dv1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBHs511FZz3dWb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 05:33:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FEEA601E9;
	Tue, 26 Aug 2025 19:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AAAC4CEF1;
	Tue, 26 Aug 2025 19:33:35 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:33:37 +0100
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
Subject: Re: [PATCH 08/11] vdso: Drop kconfig GENERIC_COMPAT_VDSO
Message-ID: <aK4MES_GHUQ-9zoY@arm.com>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
 <20250826-vdso-cleanups-v1-8-d9b65750e49f@linutronix.de>
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
In-Reply-To: <20250826-vdso-cleanups-v1-8-d9b65750e49f@linutronix.de>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 08:17:11AM +0200, Thomas Weiﬂschuh wrote:
> This configuration is never used.
> 
> Remove it.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/Kconfig | 1 -
>  lib/vdso/Kconfig   | 5 -----
>  2 files changed, 6 deletions(-)

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

