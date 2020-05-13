Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E871D1353
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 14:55:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MZR43DqkzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 22:55:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MZ9C6tVKzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 22:43:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49MZ9C5QFJz9sRK; Wed, 13 May 2020 22:43:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49MZ9C4YG8z9sSg; Wed, 13 May 2020 22:43:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200502143316.929341-1-mpe@ellerman.id.au>
References: <20200502143316.929341-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix unrecoverable SLB crashes due to
 preemption check
Message-Id: <158937375729.3526905.5583250630457226854.b4-ty@ellerman.id.au>
Date: Wed, 13 May 2020 22:43:43 +1000 (AEST)
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
Cc: hughd@google.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 3 May 2020 00:33:16 +1000, Michael Ellerman wrote:
> Hugh reported that his trusty G5 crashed after a few hours under load
> with an "Unrecoverable exception 380".
> 
> The crash is in interrupt_return() where we check lazy_irq_pending(),
> which calls get_paca() and with CONFIG_DEBUG_PREEMPT=y that goes to
> check_preemption_disabled() via debug_smp_processor_id().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix unrecoverable SLB crashes due to preemption check
      https://git.kernel.org/powerpc/c/0094368e3bb97a710ce163f9c06d290c1c308621

cheers
