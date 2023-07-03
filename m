Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 738E4745522
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:55:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZsB2c36z3ccN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZp12RjDz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZp11Bbcz4wxm;
	Mon,  3 Jul 2023 15:52:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230606093832.199712-1-npiggin@gmail.com>
References: <20230606093832.199712-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/64: ELFv2 conversion
Message-Id: <168836201884.50010.9097537373815726465.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 06 Jun 2023 19:38:28 +1000, Nicholas Piggin wrote:
> This is a follow on from the series here
> 
> https://lore.kernel.org/linuxppc-dev/20230505071850.228734-1-npiggin@gmail.com/
> 
> With feedback addressed and Christophe's -mprofile-kernel for BE added,
> 
> https://lore.kernel.org/linuxppc-dev/20230506011814.8766-1-npiggin@gmail.com/
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/64: Force ELFv2 when building with LLVM linker
      https://git.kernel.org/powerpc/c/9d90161ca5c7234e80e14e563d198f322ca0c1d0
[2/4] powerpc/64: Make ELFv2 the default for big-endian builds
      https://git.kernel.org/powerpc/c/8c5fa3b5c4df3d071dab42b04b971df370d99354
[3/4] powerpc/64: Use -mprofile-kernel for big endian ELFv2 kernels
      https://git.kernel.org/powerpc/c/aec0ba7472a7b0c1c293932e7978197f1489a332
[4/4] powerpc/64s: Remove support for ELFv1 little endian userspace
      https://git.kernel.org/powerpc/c/606787fed7268feb256957872586370b56af697a

cheers
