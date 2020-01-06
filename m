Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A8131C8E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 00:52:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sC433d6YzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 10:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBdr2NMNzDqGc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 10:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47sBdq6cH3z9sSK; Tue,  7 Jan 2020 10:33:19 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3a9d970f17e05a7b26f782beb8f7f2118d1741ea
In-Reply-To: <20191219151602.1908411-1-bigeasy@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/85xx: Get twr_p102x to compile again
Message-Id: <47sBdq6cH3z9sSK@ozlabs.org>
Date: Tue,  7 Jan 2020 10:33:19 +1100 (AEDT)
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
Cc: Scott Wood <oss@buserror.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-12-19 at 15:16:02 UTC, Sebastian Andrzej Siewior wrote:
> With CONFIG_QUICC_ENGINE enabled and CONFIG_UCC_GETH + CONFIG_SERIAL_QE
> disabled we have an unused variable (np). The code won't compile with
> -Werror.
> 
> Move the np variable to the block where it is actually used.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3a9d970f17e05a7b26f782beb8f7f2118d1741ea

cheers
