Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55485262F44
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:42:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmjrP1kbfzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:42:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjVt3TSgzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjVt10gLz9sTN; Wed,  9 Sep 2020 23:27:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <e0bcdabac45fcd26c02d7df273bd4a5827c6033d.1596716375.git.christophe.leroy@csgroup.eu>
References: <e0bcdabac45fcd26c02d7df273bd4a5827c6033d.1596716375.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/irq: Drop forward declaration of struct irqaction
Message-Id: <159965716629.808686.18358177011917781182.b4-ty@ellerman.id.au>
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

On Thu, 6 Aug 2020 12:19:46 +0000 (UTC), Christophe Leroy wrote:
> Since the commit identified below, the forward declaration of
> struct irqaction is useless. Drop it.

Applied to powerpc/next.

[1/1] powerpc/irq: Drop forward declaration of struct irqaction
      https://git.kernel.org/powerpc/c/b134cfc3e3276ccd5d29e39de5c848a45b08e410

cheers
