Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9747F925
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZPh4kLfz3cTq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:56:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLw2kQrz305P
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:54:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLw1pRFz4xmy;
 Mon, 27 Dec 2021 08:54:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211221135101.2085547-1-mpe@ellerman.id.au>
References: <20211221135101.2085547-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc/64s: Mask NIP before checking against SRR0
Message-Id: <164055556397.3187272.15095835229382770382.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:43 +1100
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
Cc: sachinp@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Dec 2021 00:50:59 +1100, Michael Ellerman wrote:
> When CONFIG_PPC_RFI_SRR_DEBUG=y we check that NIP and SRR0 match when
> returning from interrupts. This can trigger falsely if NIP has either of
> its two low bits set via sigreturn or ptrace, while SRR0 has its low two
> bits masked in hardware.
> 
> As a quick fix make sure to mask the low bits before doing the check.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/64s: Mask NIP before checking against SRR0
      https://git.kernel.org/powerpc/c/314f6c23dd8d417281eb9e8a516dd98036f2e7b3
[2/3] powerpc/64s: Use EMIT_WARN_ENTRY for SRR debug warnings
      https://git.kernel.org/powerpc/c/fd1eaaaaa6864b5fb8f99880fcefb49760b8fe4e
[3/3] selftests/powerpc: Add a test of sigreturning to an unaligned address
      https://git.kernel.org/powerpc/c/beeac538c366cd2828092adecd1edab28326c55b

cheers
