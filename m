Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34647B5ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 00:56:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ysNq2tT9zDqYP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 08:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ysFy5qlLzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 08:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45ysFx6CKcz9sDQ; Wed, 31 Jul 2019 08:50:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45ysFx2Nxqz9sMr; Wed, 31 Jul 2019 08:50:12 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: cee3536d24a1d5db66b9f68c3ece0af128187ab4
In-Reply-To: <20190724140259.23554-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Wire up clone3 syscall
Message-Id: <45ysFx2Nxqz9sMr@ozlabs.org>
Date: Wed, 31 Jul 2019 08:50:12 +1000 (AEST)
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
Cc: asolokha@kb.kras.ru, linux-kernel@vger.kernel.org, christian@brauner.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-24 at 14:02:59 UTC, Michael Ellerman wrote:
> Wire up the new clone3 syscall added in commit 7f192e3cd316 ("fork:
> add clone3").
> 
> This requires a ppc_clone3 wrapper, in order to save the non-volatile
> GPRs before calling into the generic syscall code. Otherwise we hit
> the BUG_ON in CHECK_FULL_REGS in copy_thread().
> 
> Lightly tested using Christian's test code on a Power8 LE VM.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc fixes.

https://git.kernel.org/powerpc/c/cee3536d24a1d5db66b9f68c3ece0af128187ab4

cheers
