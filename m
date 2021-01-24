Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F9301BA4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 12:58:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNs303xStzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 22:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNryV0yktzDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 22:54:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DNryT38gTz9sWD; Sun, 24 Jan 2021 22:54:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210111062408.287092-1-npiggin@gmail.com>
References: <20210111062408.287092-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: fix scv entry fallback flush vs interrupt
Message-Id: <161148923376.8122.3145462254935340052.b4-ty@ellerman.id.au>
Date: Sun, 24 Jan 2021 22:54:41 +1100 (AEDT)
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jan 2021 16:24:08 +1000, Nicholas Piggin wrote:
> The L1D flush fallback functions are not recoverable vs interrupts,
> yet the scv entry flush runs with MSR[EE]=1. This can result in a
> timer (soft-NMI) or MCE or SRESET interrupt hitting here and overwriting
> the EXRFI save area, which ends up corrupting userspace registers for
> scv return.
> 
> Fix this by disabling RI and EE for the scv entry fallback flush.

Applied to powerpc/fixes.

[1/1] powerpc/64s: fix scv entry fallback flush vs interrupt
      https://git.kernel.org/powerpc/c/08685be7761d69914f08c3d6211c543a385a5b9c

cheers
