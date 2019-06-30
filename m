Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54A5AF73
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:39:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c3p241pmzDqrZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:39:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lh0RsNzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3lg68Lrz9sBr; Sun, 30 Jun 2019 18:37:19 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9c4e4c90ec24652921e31e9551fcaedc26eec86d
X-Patchwork-Hint: ignore
In-Reply-To: <7b15f4a18ab2d9fb54559acbadf2cd83a7d147f7.1557469839.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Russell Currey <ruscur@russell.cc>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: mark start_here_multiplatform as __ref
Message-Id: <45c3lg68Lrz9sBr@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:19 +1000 (AEST)
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

On Fri, 2019-05-10 at 06:31:28 UTC, Christophe Leroy wrote:
> Otherwise, the following warning is encountered:
> 
> WARNING: vmlinux.o(.text+0x3dc6): Section mismatch in reference from the variable start_here_multiplatform to the function .init.text:.early_setup()
> The function start_here_multiplatform() references
> the function __init .early_setup().
> This is often because start_here_multiplatform lacks a __init
> annotation or the annotation of .early_setup is wrong.
> 
> Fixes: 56c46bba9bbf ("powerpc/64: Fix booting large kernels with STRICT_KERNEL_RWX")
> Cc: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9c4e4c90ec24652921e31e9551fcaedc26eec86d

cheers
