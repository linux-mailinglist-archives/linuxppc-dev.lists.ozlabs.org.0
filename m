Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A985262F3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:37:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmjkT6y8gzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjVs71TSzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjVs2XLBz9sVR; Wed,  9 Sep 2020 23:27:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <fbe58d27cf128d5fe581e4510ded8701858f268e.1596716328.git.christophe.leroy@csgroup.eu>
References: <fbe58d27cf128d5fe581e4510ded8701858f268e.1596716328.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/hwirq: Remove stale forward irq_chip declaration
Message-Id: <159965716610.808686.6255095510129044770.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:33 +1000 (AEST)
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

On Thu, 6 Aug 2020 12:19:06 +0000 (UTC), Christophe Leroy wrote:
> Since commit identified below, the forward declaration of
> struct irq_chip is useless (was struct hw_interrupt_type at that time)
> 
> Remove it, together with the associated comment.

Applied to powerpc/next.

[1/1] powerpc/hwirq: Remove stale forward irq_chip declaration
      https://git.kernel.org/powerpc/c/169b9afee572853522901b7cbf34842c0494a887

cheers
