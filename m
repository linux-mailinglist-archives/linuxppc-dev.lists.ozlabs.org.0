Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C82D5AC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:44:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsDBW0tWzzDqF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 23:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXX6bBnzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXX4f4xz9sX3; Thu, 10 Dec 2020 22:29:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e26ddc1d6f6aca739dd8d2b7c67351ead559b084.1602489664.git.christophe.leroy@csgroup.eu>
References: <e26ddc1d6f6aca739dd8d2b7c67351ead559b084.1602489664.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Remove useless #ifndef
 CPU_FTR_COHERENT_ICACHE in mem.c
Message-Id: <160756607046.1313423.10486808695253599894.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:48 +1100 (AEDT)
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

On Mon, 12 Oct 2020 08:02:30 +0000 (UTC), Christophe Leroy wrote:
> Since commit 10b35d9978ac ("[PATCH] powerpc: merged asm/cputable.h"),
> CPU_FTR_COHERENT_ICACHE has always been defined.
> 
> Remove the #ifndef CPU_FTR_COHERENT_ICACHE block.

Applied to powerpc/next.

[1/1] powerpc/mm: Remove useless #ifndef CPU_FTR_COHERENT_ICACHE in mem.c
      https://git.kernel.org/powerpc/c/1a1be322178ca8097abeee244262ce0da5b519a9

cheers
