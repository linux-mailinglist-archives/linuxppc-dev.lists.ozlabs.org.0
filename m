Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7126DAC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:53:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsb2N1LY2zDqPR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:53:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSX1hQjzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSW73Czz9sVT; Thu, 17 Sep 2020 21:27:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <d31506ca9bac9def68cf7424eded63fdc4fb6660.1597643167.git.christophe.leroy@csgroup.eu>
References: <d31506ca9bac9def68cf7424eded63fdc4fb6660.1597643167.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1] powerpc/process: Replace an #ifdef
 CONFIG_PPC_BOOK3S_64 by IS_ENABLED()
Message-Id: <160034201489.3339803.3277112055562212653.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:23 +1000 (AEST)
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

On Mon, 17 Aug 2020 05:46:42 +0000 (UTC), Christophe Leroy wrote:
> This #ifdef CONFIG_PPC_BOOK3S_64 calls preload_new_slb_context()
> when radix is not enabled.
> 
> radix_enabled() is always defined, and the prototype for
> preload_new_slb_context() is always present, so the #ifdef
> is unneeded.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/process: Replace an #ifdef CONFIG_PPC_BOOK3S_64 by IS_ENABLED()
      https://git.kernel.org/powerpc/c/bfac2799301c19d81122af04a8a3ad5ecae3737e

cheers
