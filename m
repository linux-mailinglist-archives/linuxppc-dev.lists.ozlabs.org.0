Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A39641DB16E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:24:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rr490yftzDqQr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXQ0NmTzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:00:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49RqXP4RDQz9sTn; Wed, 20 May 2020 21:00:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXP2k73z9sVV; Wed, 20 May 2020 21:00:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200507121332.2233629-1-mpe@ellerman.id.au>
References: <20200507121332.2233629-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/4] powerpc/64s: Always has full regs,
 so remove remnant checks
Message-Id: <158997213788.943180.12394654787684502749.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 21:00:05 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 7 May 2020 22:13:29 +1000, Michael Ellerman wrote:
> 


Applied to powerpc/next.

[1/4] powerpc/64s: Always has full regs, so remove remnant checks
      https://git.kernel.org/powerpc/c/feb9df3462e688d073848d85c8bb132fe8fd9ae5
[2/4] powerpc: Use set_trap() and avoid open-coding trap masking
      https://git.kernel.org/powerpc/c/db30144b5c9cfb09c6b8b2fa7a9c351c94aa3433
[3/4] powerpc: trap_is_syscall() helper to hide syscall trap number
      https://git.kernel.org/powerpc/c/912237ea166428edcbf3c137adf12cb987c477f2
[4/4] powerpc: Use trap metadata to prevent double restart rather than zeroing trap
      https://git.kernel.org/powerpc/c/4e0e45b07d790253643ee05300784ab2156e2d5e

cheers
