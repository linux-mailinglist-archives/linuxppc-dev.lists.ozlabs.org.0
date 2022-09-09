Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD555B36F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFFC3pXbz3dR1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:10:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDY2jctz2xBl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDX2zd5z4xXy;
	Fri,  9 Sep 2022 22:10:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <8403854a4c187459b2f4da3537f51227b70b9223.1662134272.git.christophe.leroy@csgroup.eu>
References: <8403854a4c187459b2f4da3537f51227b70b9223.1662134272.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/math_emu/efp: Include module.h
Message-Id: <166272521909.2076816.16685747643958755021.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:06:59 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2 Sep 2022 18:00:08 +0200, Christophe Leroy wrote:
> From: Nathan Chancellor <nathan@kernel.org>
> 
> When building with a recent version of clang, there are a couple of
> errors around the call to module_init():
> 
>   arch/powerpc/math-emu/math_efp.c:927:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
>   module_init(spe_mathemu_init);
>   ^
>   int
>   arch/powerpc/math-emu/math_efp.c:927:13: error: a parameter list without types is only allowed in a function definition
>   module_init(spe_mathemu_init);
>               ^
>   2 errors generated.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/math_emu/efp: Include module.h
      https://git.kernel.org/powerpc/c/cfe0d370e0788625ce0df3239aad07a2506c1796
[2/2] powerpc/math-emu: Remove -w build flag and fix warnings
      https://git.kernel.org/powerpc/c/7245fc5bb7a966852d5bd7779d1f5855530b461a

cheers
