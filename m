Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCFB61907
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:53:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hpPb44HXzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:53:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hng23gGGzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hng16MfYz9sNx; Mon,  8 Jul 2019 11:19:41 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3ab3a0689e74e6aa5b41360bc18861040ddef5b1
In-Reply-To: <20190615152313.26288-1-chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/4xx/uic: clear pending interrupt after irq
 type/pol change
Message-Id: <45hng16MfYz9sNx@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:41 +1000 (AEST)
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-06-15 at 15:23:13 UTC, Christian Lamparter wrote:
> When testing out gpio-keys with a button, a spurious
> interrupt (and therefore a key press or release event)
> gets triggered as soon as the driver enables the irq
> line for the first time.
> 
> This patch clears any potential bogus generated interrupt
> that was caused by the switching of the associated irq's
> type and polarity.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3ab3a0689e74e6aa5b41360bc18861040ddef5b1

cheers
