Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5403F0538
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:49:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTls0hj3z3clt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:49:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgq5Y04z3cTM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:57 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgl0rVwz9sRf; Wed, 18 Aug 2021 23:45:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <e9d501da0c59f60ca767b1b3ea4603fce6d02b9e.1625486440.git.christophe.leroy@csgroup.eu>
References: <e9d501da0c59f60ca767b1b3ea4603fce6d02b9e.1625486440.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/non-smp: Inconditionaly call smp_mb() on switch_mm
Message-Id: <162929391862.3619265.13703317304945129576.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:38 +1000
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

On Mon, 5 Jul 2021 12:00:50 +0000 (UTC), Christophe Leroy wrote:
> Commit 3ccfebedd8cf ("powerpc, membarrier: Skip memory barrier in
> switch_mm()") added some logic to skip the smp_mb() in
> switch_mm_irqs_off() before the call to switch_mmu_context().
> 
> However, on non SMP smp_mb() is just a compiler barrier and doing
> it inconditionaly is simpler than the logic used to check
> whether the barrier is needed or not.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/non-smp: Inconditionaly call smp_mb() on switch_mm
      https://git.kernel.org/powerpc/c/c8a6d91005343dea0d53be0ff0620c66934dcd44

cheers
