Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E09863F0534
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTlQ6QqPz3dsv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgq5LWKz3cT1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:57 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgg1gpFz9sVw; Wed, 18 Aug 2021 23:45:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210805075649.2086567-1-aik@ozlabs.ru>
References: <20210805075649.2086567-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] KVM: PPC: Use arch_get_random_seed_long instead
 of powernv variant
Message-Id: <162929392634.3619265.14874763094240884044.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:46 +1000
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
Cc: kvm-ppc@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Aug 2021 17:56:49 +1000, Alexey Kardashevskiy wrote:
> The powernv_get_random_long() does not work in nested KVM (which is
> pseries) and produces a crash when accessing in_be64(rng->regs) in
> powernv_get_random_long().
> 
> This replaces powernv_get_random_long with the ppc_md machine hook
> wrapper.

Applied to powerpc/next.

[1/1] KVM: PPC: Use arch_get_random_seed_long instead of powernv variant
      https://git.kernel.org/powerpc/c/2ac78e0c00184a9ba53d507be7549c69a3f566b6

cheers
