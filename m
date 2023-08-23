Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FD785785
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:07:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4hf4cbnz3fGw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:07:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cd3ylnz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cd1y2Qz4x0W;
	Wed, 23 Aug 2023 22:03:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <c8253017e355638132737ff47936e290df8738d1.1692282432.git.christophe.leroy@csgroup.eu>
References: <c8253017e355638132737ff47936e290df8738d1.1692282432.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/4xx: Add missing includes to fix no previous prototype errors
Message-Id: <169279175576.797584.7773494113492179967.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Aug 2023 16:27:23 +0200, Christophe Leroy wrote:
> A W=1 build of ppc40x_defconfig throws the followings errors:
> 
>   CC      arch/powerpc/platforms/4xx/uic.o
> arch/powerpc/platforms/4xx/uic.c:274:13: warning: no previous prototype for 'uic_init_tree' [-Wmissing-prototypes]
>   274 | void __init uic_init_tree(void)
>       |             ^~~~~~~~~~~~~
> arch/powerpc/platforms/4xx/uic.c:319:14: warning: no previous prototype for 'uic_get_irq' [-Wmissing-prototypes]
>   319 | unsigned int uic_get_irq(void)
>       |              ^~~~~~~~~~~
>   CC      arch/powerpc/platforms/4xx/machine_check.o
>   CC      arch/powerpc/platforms/4xx/soc.o
> arch/powerpc/platforms/4xx/soc.c:193:6: warning: no previous prototype for 'ppc4xx_reset_system' [-Wmissing-prototypes]
>   193 | void ppc4xx_reset_system(char *cmd)
>       |      ^~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/4xx: Add missing includes to fix no previous prototype errors
      https://git.kernel.org/powerpc/c/7dac7cf1b407605c15d85ae885377ba0560ca4cd

cheers
