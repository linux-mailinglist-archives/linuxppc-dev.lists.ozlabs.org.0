Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4D58509C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSdn2vnCz3fT1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZ05sXKz3bXn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ056Wpz4xG4;
	Fri, 29 Jul 2022 23:10:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/5] powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
Message-Id: <165909976455.253830.10900913181823665074.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:44 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jul 2022 16:19:29 +0200, Christophe Leroy wrote:
> Commit 0e00a8c9fd92 ("powerpc: Allow CPU selection also on PPC32")
> enlarged the CPU selection logic to PPC32 by removing depend to
> PPC64, and failed to restrict that depend to E5500_CPU and E6500_CPU.
> Fortunately that got unnoticed because -mcpu=8540 will override the
> -mcpu=e500mc64 or -mpcu=e6500 as they are ealier, but that's
> fragile and may no be right in the future.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
      https://git.kernel.org/powerpc/c/9be013b2a9ecb29b5168e4b9db0e48ed53acf37c
[2/5] powerpc/32: Don't always pass -mcpu=powerpc to the compiler
      https://git.kernel.org/powerpc/c/446cda1b21d9a6b3697fe399c6a3a00ff4a285f5
[3/5] powerpc/405: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
      https://git.kernel.org/powerpc/c/ff27d9200a98757efc7c2cdf198904fd79cf4ffd
[4/5] powerpc/44x: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
      https://git.kernel.org/powerpc/c/2255411d1d0f0661d1e5acd5f6edf4e6652a345a
[5/5] powerpc/64e: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
      https://git.kernel.org/powerpc/c/d6b551b8f90cc92c7d3c09cf38c748efe305ecb4

cheers
