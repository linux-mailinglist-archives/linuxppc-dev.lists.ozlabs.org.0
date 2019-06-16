Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD947478
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 14:29:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RYZ51Z5lzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 22:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RYRY1fkXzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 22:23:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45RYRW6mT5z9sNC; Sun, 16 Jun 2019 22:23:51 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 82f6e266f8123d7938713c0e10c03aa655b3e68a
X-Patchwork-Hint: ignore
In-Reply-To: <97664671a229a4240bfb22f69ec4743e837c2b83.1558600628.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: fix build failure on book3e with KVM
Message-Id: <45RYRW6mT5z9sNC@ozlabs.org>
Date: Sun, 16 Jun 2019 22:23:51 +1000 (AEST)
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

On Thu, 2019-05-23 at 08:39:27 UTC, Christophe Leroy wrote:
> Build failure was introduced by the commit identified below,
> due to missed macro expension leading to wrong called function's name.
> 
> arch/powerpc/kernel/head_fsl_booke.o: In function `SystemCall':
> arch/powerpc/kernel/head_fsl_booke.S:416: undefined reference to `kvmppc_handler_BOOKE_INTERRUPT_SYSCALL_SPRN_SRR1'
> Makefile:1052: recipe for target 'vmlinux' failed
> 
> The called function should be kvmppc_handler_8_0x01B(). This patch fixes it.
> 
> Reported-by: Paul Mackerras <paulus@ozlabs.org>
> Fixes: 1a4b739bbb4f ("powerpc/32: implement fast entry for syscalls on BOOKE")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/82f6e266f8123d7938713c0e10c03aa655b3e68a

cheers
