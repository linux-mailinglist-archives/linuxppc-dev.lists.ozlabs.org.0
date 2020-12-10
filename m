Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B10EA2D5A83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:28:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsCrQ2j8FzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 23:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXS36rdzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXS1KWSz9sWt; Thu, 10 Dec 2020 22:29:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <18b357d68c4cde149f75c7a1031c850925cd8128.1605981539.git.christophe.leroy@csgroup.eu>
References: <18b357d68c4cde149f75c7a1031c850925cd8128.1605981539.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: inline iomap accessors
Message-Id: <160756604708.1313423.2512500774127488232.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:43 +1100 (AEDT)
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

On Sat, 21 Nov 2020 17:59:19 +0000 (UTC), Christophe Leroy wrote:
> ioreadXX()/ioreadXXbe() accessors are equivalent to ppc
> in_leXX()/in_be16() accessors but they are not inlined.
> 
> Since commit 0eb573682872 ("powerpc/kerenl: Enable EEH for IO
> accessors"), the 'le' versions are equivalent to the ones
> defined in asm-generic/io.h, allthough the ones there are inlined.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: inline iomap accessors
      https://git.kernel.org/powerpc/c/894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e

cheers
