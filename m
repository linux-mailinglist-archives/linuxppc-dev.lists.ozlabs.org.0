Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C62B5D5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 11:56:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb2tX3yh1zDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 21:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb2pH67cBzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 21:52:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cb2pH1df1z9sVD; Tue, 17 Nov 2020 21:52:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20201114114743.3306283-1-npiggin@gmail.com>
References: <20201114114743.3306283-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix KVM system reset handling when
 CONFIG_PPC_PSERIES=y
Message-Id: <160560828658.349300.3072141668391665689.b4-ty@ellerman.id.au>
Date: Tue, 17 Nov 2020 21:52:39 +1100 (AEDT)
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

On Sat, 14 Nov 2020 21:47:43 +1000, Nicholas Piggin wrote:
> pseries guest kernels have a FWNMI handler for SRESET and MCE NMIs,
> which is basically the same as the regular handlers for those
> interrupts.
> 
> The system reset FWNMI handler did not have a KVM guest test in it,
> although it probably should have because the guest can itself run
> guests.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix KVM system reset handling when CONFIG_PPC_PSERIES=y
      https://git.kernel.org/powerpc/c/575cba20c421ecb6b563ae352e4e0468e4ca8b3c

cheers
