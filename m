Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F88BFF0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGYX0cJKz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXJ5fn5z3cVs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGX96D7qz4x1T;
	Wed,  8 May 2024 23:41:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v1 0/9] Add dynamic DEXCR support
Message-Id: <171517558545.165093.7575784203897952795.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Apr 2024 21:23:16 +1000, Benjamin Gray wrote:
> Adds support for a process to change its DEXCR value. The implementation is
> somewhat conservative; SBHE (speculative branch hint enable) is not exposed
> as an editable aspect because its effects can bleed over to other threads.
> 
> As explained in the third patch, this series changes the reset/inherit
> behaviour on exec. Previously there was a bitmask that tracked which aspects
> to copy from the current state vs resetting to a fixed default. This
> allows unprivileged processes to disable ROP protection for setuid binaries
> though, and is generally a weird interface to work with. The actual intent
> (and new implementation) tracks the exec value as an independent value that
> doesn't use the parent's DEXCR at all. The parent can control this reset value
> separately to its own DEXCR value.
> 
> [...]

Applied to powerpc/next.

[1/9] selftests/powerpc/dexcr: Add -no-pie to hashchk tests
      https://git.kernel.org/powerpc/c/d7228a58d9438d6f219dc7f33eab0d1980b3bd2f
[2/9] powerpc/dexcr: Track the DEXCR per-process
      https://git.kernel.org/powerpc/c/75171f06c4507c3b6b5a69d793879fb20d108bb1
[3/9] powerpc/dexcr: Reset DEXCR value across exec
      https://git.kernel.org/powerpc/c/bbd99922d0f4518518282217159666c679c6a0d1
[4/9] powerpc/dexcr: Add DEXCR prctl interface
      https://git.kernel.org/powerpc/c/628d701f2de5b9a16d1dd82bea68fd895f56f1a1
[5/9] selftests/powerpc/dexcr: Add DEXCR prctl interface test
      https://git.kernel.org/powerpc/c/5bfa66bf86d792bbcc76bc09cf99a2ae9d6e0eec
[6/9] selftests/powerpc/dexcr: Attempt to enable NPHIE in hashchk selftest
      https://git.kernel.org/powerpc/c/9930fba02a1c587849aea1e6c5688168013c065f
[7/9] selftests/powerpc/dexcr: Add DEXCR config details to lsdexcr
      https://git.kernel.org/powerpc/c/9c4866b209ad31cae7c832d45c6137ce6a993ca0
[8/9] selftests/powerpc/dexcr: Add chdexcr utility
      https://git.kernel.org/powerpc/c/f88723a609787254f7645eb6ac261b8363e8a5bc
[9/9] Documentation: Document PowerPC kernel dynamic DEXCR interface
      https://git.kernel.org/powerpc/c/9248edf31ab28723fb00900ecb8bacdb05eeefff

cheers
