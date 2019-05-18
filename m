Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779C22360
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 13:18:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455jMY5k0QzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 21:18:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455jHW5dPdzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 21:15:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 455jHW4zv1z9s9y; Sat, 18 May 2019 21:15:03 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 672eaf37db9f99fd794eed2c68a8b3b05d484081
X-Patchwork-Hint: ignore
In-Reply-To: <20190515090750.30647-1-tobin@kernel.org>
To: "Tobin C. Harding" <tobin@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Remove double free
Message-Id: <455jHW4zv1z9s9y@ozlabs.org>
Date: Sat, 18 May 2019 21:15:03 +1000 (AEST)
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, "Tobin C. Harding" <tobin@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-15 at 09:07:50 UTC, "Tobin C. Harding" wrote:
> kfree() after kobject_put().  Who ever wrote this was on crack.
> 
> Fixes: 7e8039795a80 ("powerpc/cacheinfo: Fix kobject memleak")
> Signed-off-by: Tobin C. Harding <tobin@kernel.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/672eaf37db9f99fd794eed2c68a8b3b0

cheers
