Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACF5328BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sDv5Ccdz3fdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7f5yBsz3cBq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7f5C5vz4xZ5;
 Tue, 24 May 2022 21:15:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <338e958c7ab8f3b266fa794a1f80f99b9671829e.camel@linux.ibm.com>
References: <338e958c7ab8f3b266fa794a1f80f99b9671829e.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/powernv/vas: Assign real address to rx_fifo in
 vas_rx_win_attr
Message-Id: <165339055791.1718562.3414682424017847137.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:17 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 09 Apr 2022 01:44:16 -0700, Haren Myneni wrote:
> In init_winctx_regs(), __pa() is called on winctx->rx_fifo and this
> function is called to initialize registers for receive and fault
> windows. But the real address is passed in winctx->rx_fifo for
> receive windows and the virtual address for fault windows which
> causes errors with DEBUG_VIRTUAL enabled. Fixes this issue by
> assigning only real address to rx_fifo in vas_rx_win_attr struct
> for both receive and fault windows.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/vas: Assign real address to rx_fifo in vas_rx_win_attr
      https://git.kernel.org/powerpc/c/c127d130f6d59fa81701f6b04023cf7cd1972fb3

cheers
