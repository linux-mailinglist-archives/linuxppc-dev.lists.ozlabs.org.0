Return-Path: <linuxppc-dev+bounces-11342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E0B37316
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 21:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBHrl301tz3dV3;
	Wed, 27 Aug 2025 05:33:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756236807;
	cv=none; b=DJXZ+ptkGkKYId8m7L5xjL1L9Rjp8/YkP7sVK55+My/6D5zkpCONpNCVGPLIyms3Gz89hnJRFiYw+zfQLRMUcr9AXKiYsg+l4/xMIEu+f0l31guTsayBJOtTFBOwsRrtTY0mLj4iCYIqA/HKRC4qJakPIjIsftGiAs+/SSMaE1SwdJbV9ksBdRCGLN0LHDyORiw9vGJInwfYJ/moI2uumU/DPP5zfyHrLbHsqgZ8KUk9XZASjBigrNwM9fpwi1f5sYMzk48gnPujQ6uSY07zSVXtczlGLSufE4K/IoGE0ryZB7Jzx8NnKRDVrV0jI4wDzjI/prRczDfFrY5isIKhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756236807; c=relaxed/relaxed;
	bh=83nqbXusDyTubGTbhXQBGu65dCkn2ysQjAnfnEcTrnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCYhCIQvCKkIaicyIjC61OCpb8/S81WCzpsUYfcNI9/Wd6tpARd8MH8FWJS92UC7LIicX5tEETnmr1+rhghMQkhpGHoUYaVEXLUhuo6uhxgwIEX4LZued/VpU5hAVW2azC6LKgTRjlYN4SjxMN8LPhPfQpcHW/cv5jGZWY4pjdgIbUsDtd8QH/cdswRTIWfO2gdiaHf+Lo2fGvT+ZTetwn5l0n8bkAcRo5+ghscn7J4o3bUZzKEjYq8QFq2+IBtFSv3A2NzA+phIfS7KifnSmrF4kS4rPsAQ8xiPad8qkizybIzCmOIDZD44S/82Gv3RUZiiT8KiXLmPwBAJvQtZNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBHrk2DqRz3dSJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 05:33:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A93B84414A;
	Tue, 26 Aug 2025 19:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D58C4CEF1;
	Tue, 26 Aug 2025 19:33:16 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:33:19 +0100
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
Subject: Re: [PATCH 03/11] vdso: Move ENABLE_COMPAT_VDSO from core to arm64
Message-ID: <aK4L_5xc-hXNvj7f@arm.com>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
 <20250826-vdso-cleanups-v1-3-d9b65750e49f@linutronix.de>
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
In-Reply-To: <20250826-vdso-cleanups-v1-3-d9b65750e49f@linutronix.de>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 08:17:06AM +0200, Thomas Weiﬂschuh wrote:
> The ENABLE_COMAPT_VDSO symbol is only used by arm64 and only for the
> time-related functionality. There should be no new users, so it doesn't
> need to be in the generic vDSO code.
> 
> Move the logic into arm64 architecture-specific code and replace the
> explicit define by the standard '#ifdef __aarch64__'.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

