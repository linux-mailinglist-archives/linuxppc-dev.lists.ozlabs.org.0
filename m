Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C21644B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 13:56:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MyQz1tDQzDqHj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 23:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48My3j3bdnzDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 23:40:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48My3h6S2Rz9sSd; Wed, 19 Feb 2020 23:40:00 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 477f3488a94e35380c82a7498d46f10fa5f3edd2
In-Reply-To: <7bce32ccbab3ba3e3e0f27da6961bf6313df97ed.1581663140.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Larry Finger <Larry.Finger@lwfinger.net>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/6xx: Fix power_save_ppc32_restore() with
 CONFIG_VMAP_STACK
Message-Id: <48My3h6S2Rz9sSd@ozlabs.org>
Date: Wed, 19 Feb 2020 23:40:00 +1100 (AEDT)
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

On Fri, 2020-02-14 at 06:53:00 UTC, Christophe Leroy wrote:
> power_save_ppc32_restore() is called during exception entry, before
> re-enabling the MMU. It substracts KERNELBASE from the address
> of nap_save_msscr0 to access it.
> 
> With CONFIG_VMAP_STACK enabled, data MMU translation has already been
> re-enabled, so power_save_ppc32_restore() has to access
> nap_save_msscr0 by its virtual address.
> 
> Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
> Tested-by: Larry Finger <Larry.Finger@lwfinger.net>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/477f3488a94e35380c82a7498d46f10fa5f3edd2

cheers
