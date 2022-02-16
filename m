Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E994B87BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:33:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHS80pShz3fJd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:33:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNS0FTPz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNS2RPfz4xsk;
 Wed, 16 Feb 2022 23:30:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, masahiroy@kernel.org
In-Reply-To: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
References: <c2cbb8f046b7efc251053521dc39b752795e26b7.1642782130.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 1/5] powerpc/vdso: augment VDSO32 functions to support
 64 bits build
Message-Id: <164501435616.521186.14529386881092781914.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:56 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jan 2022 16:30:21 +0000, Christophe Leroy wrote:
> VDSO64 cacheflush.S datapage.S gettimeofday.S and vgettimeofday.c
> are very similar to their VDSO32 counterpart.
> 
> VDSO32 counterpart is already more complete than the VDSO64 version
> as it supports both PPC32 vdso and 32 bits VDSO for PPC64.
> 
> Use compat macros wherever necessary in PPC32 files
> so that they can also be used to build VDSO64.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/vdso: augment VDSO32 functions to support 64 bits build
      https://git.kernel.org/powerpc/c/f061fb03ee611c5657010ee4fa2a3fa64dfe3bd0
[2/5] powerpc/vdso: Rework VDSO32 makefile to add a prefix to object files
      https://git.kernel.org/powerpc/c/d88378d8d2c776154c6b606f2a423a81d7795f6f
[3/5] powerpc/vdso: Merge vdso64 and vdso32 into a single directory
      https://git.kernel.org/powerpc/c/fd1feade75fb1a9275c39d76c5ccdbbbe6b37aa3
[4/5] powerpc/vdso: Remove cvdso_call_time macro
      https://git.kernel.org/powerpc/c/9b97bea90072a075363a200dd7b54ad4a24e9491
[5/5] powerpc/vdso: Move cvdso_call macro into gettimeofday.S
      https://git.kernel.org/powerpc/c/692b21d78046851e75dc25bba773189c670b49c2

cheers
