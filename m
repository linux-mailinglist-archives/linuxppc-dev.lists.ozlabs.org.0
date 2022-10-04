Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8C5F44F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfSy3tHRz3hXV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:59:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1q1k6hz3dsc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1q0Yxcz4xHh;
	Wed,  5 Oct 2022 00:39:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220926034057.2360083-1-npiggin@gmail.com>
References: <20220926034057.2360083-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/5] powerpc/64: avoid GOT addressing, don't put data in TOC
Message-Id: <166488994441.779920.15001354435966049513.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:44 +1100
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 13:40:52 +1000, Nicholas Piggin wrote:
> This is a cleaned up set of the initial prep patches from the pcrel
> series, dealing with regularising addressing variables from asm
> and using helper macros more consistently.
> 
> Changes since v1:
> - Use "REGS" stack frame marker for 64-bit, leaving 32-bit unchanged.
> - Fix PPC64 32-bit boot wrapper compile.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/64: use 32-bit immediate for STACK_FRAME_REGS_MARKER
      https://git.kernel.org/powerpc/c/17773afdcd1589c5925a984f512330410cb2ba4f
[2/5] powerpc/64: asm use consistent global variable declaration and access
      https://git.kernel.org/powerpc/c/dab3b8f4fd09c22e8dbb2d9608194c7d52252f33
[3/5] powerpc/64: switch asm helpers from GOT to TOC relative addressing
      https://git.kernel.org/powerpc/c/754f611774e4b9357a944f5b703dd291c85161cf
[4/5] powerpc/64: provide a helper macro to load r2 with the kernel TOC
      https://git.kernel.org/powerpc/c/8e93fb33c84f68db20c0bc2821334a4c54c3e251
[5/5] powerpc/64e: provide an addressing macro for use with TOC in alternate register
      https://git.kernel.org/powerpc/c/3569d84bb26f6f07d426446da3d2c836180f1565

cheers
