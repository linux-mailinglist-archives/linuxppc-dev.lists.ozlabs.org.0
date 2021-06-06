Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653A39CED3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb6H4yrQz3dY9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:14:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3G0LR1z308Q
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:10 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3F1W5dz9sXM; Sun,  6 Jun 2021 22:12:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <594fa3cc0df11e21644fd6a584851ae4f164b2bf.1620367249.git.christophe.leroy@csgroup.eu>
References: <594fa3cc0df11e21644fd6a584851ae4f164b2bf.1620367249.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mmu: Remove leftover CONFIG_E200
Message-Id: <162298131664.2353459.10281899511487269108.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:36 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 7 May 2021 06:00:58 +0000 (UTC), Christophe Leroy wrote:
> Commit 39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
> removed CONFIG_E200.
> Commit f9158d58a4e1 ("powerpc/mm: Add mask of always present MMU
> features") was merged in the same cycle and added a new use of
> CONFIG_E200.
> 
> Remove that use.

Applied to powerpc/next.

[1/1] powerpc/mmu: Remove leftover CONFIG_E200
      https://git.kernel.org/powerpc/c/0441729e16379649ea0f393a5be68a19ba384d94

cheers
