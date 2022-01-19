Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C084F49393D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 12:07:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf2tH4jJyz3cN1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 22:07:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf2rh1xPvz3bTD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 22:06:28 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jf2rh1B8Bz4y4g;
 Wed, 19 Jan 2022 22:06:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220117134403.2995059-1-npiggin@gmail.com>
References: <20220117134403.2995059-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Mask SRR0 before checking against the masked
 NIP
Message-Id: <164259036418.3588160.17517492423330990978.b4-ty@ellerman.id.au>
Date: Wed, 19 Jan 2022 22:06:04 +1100
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

On Mon, 17 Jan 2022 23:44:03 +1000, Nicholas Piggin wrote:
> Commit 314f6c23dd8d ("powerpc/64s: Mask NIP before checking against
> SRR0") masked off the low 2 bits of the NIP value in the interrupt
> stack frame in case they are non-zero and mis-compare against a SRR0
> register value of a CPU which always reads back 0 from the 2 low bits
> which are reserved.
> 
> This now causes the opposite problem that an implementation which does
> implement those bits in SRR0 will mis-compare against the masked NIP
> value in which they have been cleared. QEMU is one such implementation,
> and this is allowed by the architecture.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Mask SRR0 before checking against the masked NIP
      https://git.kernel.org/powerpc/c/aee101d7b95a03078945681dd7f7ea5e4a1e7686

cheers
