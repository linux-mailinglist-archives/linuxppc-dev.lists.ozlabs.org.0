Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E9108CCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 12:18:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M4Kn4lzlzDqJq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 22:18:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M3dD5QyCzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:47:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47M3dD2Kjlz9sRY; Mon, 25 Nov 2019 21:47:11 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8795a739e5c72abeec51caf36b6df2b37e5720c5
In-Reply-To: <bf930402613b41b42d0441b784e0cc43fc18d1fb.1572529632.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/sysdev: drop simple gpio
Message-Id: <47M3dD2Kjlz9sRY@ozlabs.org>
Date: Mon, 25 Nov 2019 21:47:11 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-31 at 13:47:30 UTC, Christophe Leroy wrote:
> There is a config item CONFIG_SIMPLE_GPIO which
> provides simple memory mapped GPIOs specific to powerpc.
> 
> However, the only platform which selects this option is
> mpc5200, and this platform doesn't use it.
> 
> There are three boards calling simple_gpiochip_init(), but
> as they don't select CONFIG_SIMPLE_GPIO, this is just a nop.
> 
> Simple_gpio is just redundant with the generic MMIO GPIO
> driver which can be found in driver/gpio/ and selected via
> CONFIG_GPIO_GENERIC_PLATFORM, so drop simple_gpio driver.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8795a739e5c72abeec51caf36b6df2b37e5720c5

cheers
