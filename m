Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198F1DB1B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:29:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rr9l1fhJzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:28:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXS07zYzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:00:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXR5Gtjz9sTd; Wed, 20 May 2020 21:00:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
Subject: Re: [PATCH v4 00/16] powerpc: machine check and system reset fixes
Message-Id: <158997214479.943180.8893829859108952216.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 21:00:07 +1000 (AEST)
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

On Fri, 8 May 2020 14:33:52 +1000, Nicholas Piggin wrote:
> Since v3, I fixed a compile error and returned the generic machine check
> exception handler to be NMI on 32 and 64e, as caught by Christophe's
> review.
> 
> Also added the last patch, just found it by looking at the code, a
> review for 32s would be good.
> 
> [...]

Patches 1-15 applied to powerpc/next.

[01/16] powerpc/64s/exception: Fix machine check no-loss idle wakeup
        https://git.kernel.org/powerpc/c/8a5054d8cbbe03c68dcb0957c291c942132e4101
[02/16] powerpc/64s/exceptions: Fix in_mce accounting in unrecoverable path
        https://git.kernel.org/powerpc/c/ac2a2a1417391180ef12f908a2864692d6d76d40
[03/16] powerpc/64s/exceptions: Change irq reconcile for NMIs from reusing _DAR to RESULT
        https://git.kernel.org/powerpc/c/16754d25bd7d4e53a52b311d99cc7a8fba875d81
[04/16] powerpc/64s/exceptions: Machine check reconcile irq state
        https://git.kernel.org/powerpc/c/f0fd9dd3c213c947dfb5bc2cad3ef5e30d3258ec
[05/16] powerpc/pseries/ras: Avoid calling rtas_token() in NMI paths
        https://git.kernel.org/powerpc/c/7368b38b21bfa39df637701a480262c15ab1a49e
[06/16] powerpc/pseries/ras: Fix FWNMI_VALID off by one
        https://git.kernel.org/powerpc/c/deb70f7a35a22dffa55b2c3aac71bc6fb0f486ce
[07/16] powerpc/pseries/ras: fwnmi avoid modifying r3 in error case
        https://git.kernel.org/powerpc/c/dff681e95a23f28b3c688a8bd5535f78bd726bc8
[08/16] powerpc/pseries/ras: fwnmi sreset should not interlock
        https://git.kernel.org/powerpc/c/d7b14c5c042865070a1411078ab49ea17bad0b41
[09/16] powerpc/pseries: Limit machine check stack to 4GB
        https://git.kernel.org/powerpc/c/d2cbbd45d433b96e41711a293e59cff259143694
[10/16] powerpc/pseries: Machine check use rtas_call_unlocked() with args on stack
        https://git.kernel.org/powerpc/c/2576f5f9169620bf329cf1e91086e6041b98e4b2
[11/16] powerpc/64s: machine check interrupt update NMI accounting
        https://git.kernel.org/powerpc/c/116ac378bb3ff844df333e7609e7604651a0db9d
[12/16] powerpc: Implement ftrace_enabled() helpers
        https://git.kernel.org/powerpc/c/f2d7f62e4abdb03de3f4267361d96c417312d05c
[13/16] powerpc/64s: machine check do not trace real-mode handler
        https://git.kernel.org/powerpc/c/abd106fb437ad1cd8c8df8ccabd0fa941ef6342a
[14/16] powerpc/traps: Do not trace system reset
        https://git.kernel.org/powerpc/c/bbbc8032b00f8ef287894425fbdb691049e28d39
[15/16] powerpc/traps: Make unrecoverable NMIs die instead of panic
        https://git.kernel.org/powerpc/c/265d6e588d87194c2fe2d6c240247f0264e0c19b

cheers
