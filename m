Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1FB442D27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7W33Ymdz3gPX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7G35PMWz30Hr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7G25rsnz4xcC;
 Tue,  2 Nov 2021 22:38:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211028133043.4159501-1-npiggin@gmail.com>
References: <20211028133043.4159501-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/32e: Ignore ESR in instruction storage interrupt
 handler
Message-Id: <163584793031.1845480.858134667431474805.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:12:10 +1100
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
Cc: Jacques de Laval <jacques.delaval@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Oct 2021 23:30:43 +1000, Nicholas Piggin wrote:
> A e5500 machine running a 32-bit kernel sometimes hangs at boot,
> seemingly going into an infinite loop of instruction storage interrupts.
> The ESR SPR has a value of 0x800000 (store) when this happens, which is
> likely set by a previous store. An instruction TLB miss interrupt would
> then leave ESR unchanged, and if no PTE exists it calls directly to the
> instruction storage interrupt handler without changing ESR.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32e: Ignore ESR in instruction storage interrupt handler
      https://git.kernel.org/powerpc/c/81291383ffde08b23bce75e7d6b2575ce9d3475c

cheers
