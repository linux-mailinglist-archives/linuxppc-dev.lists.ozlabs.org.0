Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E215850A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvShq4MdMz3fxH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZ95L02z3c7D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ94Ltmz4x1c;
	Fri, 29 Jul 2022 23:10:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 01/13] selftests/powerpc: Ensure 16-byte stack pointer alignment
Message-Id: <165909973266.253830.4185512535499121399.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:12 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 00:02:27 +1000, Michael Ellerman wrote:
> The PUSH/POP_BASIC_STACK helpers in basic_asm.h do not ensure that the
> stack pointer is always 16-byte aligned, which is required per the ABI.
> 
> Fix the macros to do the alignment if the caller fails to.
> 
> Currently only one caller passes a non-aligned size, tm_signal_self(),
> which hasn't been caught in testing, presumably because it's a leaf
> function.
> 
> [...]

Applied to powerpc/next.

[01/13] selftests/powerpc: Ensure 16-byte stack pointer alignment
        https://git.kernel.org/powerpc/c/fd19a1f72aa7bf687609e0810e644fe5b3846342
[02/13] selftests/powerpc/ptrace: Set LOCAL_HDRS
        https://git.kernel.org/powerpc/c/cf4baafd7846b3def67057a09b7603a6b566417a
[03/13] selftests/powerpc/ptrace: Split CFLAGS better
        https://git.kernel.org/powerpc/c/3c20a1d07c377d7260ca853e216cc85bbd7857fa
[04/13] selftests/powerpc: Don't save CR by default in asm helpers
        https://git.kernel.org/powerpc/c/8f2e02394dc907f5e0140bfab80a9aa11e3449ed
[05/13] selftests/powerpc: Don't save TOC by default in asm helpers
        https://git.kernel.org/powerpc/c/cfbc0723d18f5aeab4308c66d7d1992317eed7c9
[06/13] selftests/powerpc: Add 32-bit support to asm helpers
        https://git.kernel.org/powerpc/c/bd4d3042e7570fc024b5ff15e895363e4bf5a78f
[07/13] selftests/powerpc/ptrace: Drop unused load_fpr_single_precision()
        https://git.kernel.org/powerpc/c/af9f3f31f6cc8e3f637f19189e83d99f3fdd96ad
[08/13] selftests/powerpc/ptrace: Convert to load/store doubles
        https://git.kernel.org/powerpc/c/53fa86e7ece54cbb1fae1443bd6b348088d8ce7e
[09/13] selftests/powerpc/ptrace: Build the ptrace-gpr test as 32-bit when possible
        https://git.kernel.org/powerpc/c/149a497d5fda3e996a00437260a4c170e43909c8
[10/13] selftests/powerpc/ptrace: Do more of ptrace-gpr in asm
        https://git.kernel.org/powerpc/c/611e385087efc2cc3a7033aedd3f84ad0cf2a703
[11/13] selftests/powerpc/ptrace: Make child errors more obvious
        https://git.kernel.org/powerpc/c/7b1513d02edf4a6334618070641f47abbbef0cef
[12/13] selftests/powerpc/ptrace: Use more interesting values
        https://git.kernel.org/powerpc/c/c5a814cc992002c36fa5b7db5fbd55efb7430386
[13/13] selftests/powerpc/ptrace: Add peek/poke of FPRs
        https://git.kernel.org/powerpc/c/6c9c7d8fbc3a2a0cfed0e7a5b39581847b632f0b

cheers
