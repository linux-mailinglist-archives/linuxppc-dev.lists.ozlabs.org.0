Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D25328DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:24:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sKT3Z3Sz3gQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7r5nfyz3cdp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7r1sC7z4yTC;
 Tue, 24 May 2022 21:15:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220511185001.3269404-1-nathan@kernel.org>
References: <20220511185001.3269404-1-nathan@kernel.org>
Subject: Re: [PATCH v2 0/2] Link the PowerPC vDSO with ld.lld
Message-Id: <165339051787.1718562.10503050450628067652.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:08:37 +1000
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 patches@lists.linux.dev, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 11:49:59 -0700, Nathan Chancellor wrote:
> This series is an alternative to the one proposed by Nick before the
> PowerPC vDSO unification in commit fd1feade75fb ("powerpc/vdso: Merge
> vdso64 and vdso32 into a single directory"):
> 
> https://lore.kernel.org/20200901222523.1941988-1-ndesaulniers@google.com/
> 
> Normally, we try to make compiling and linking two separate stages so
> that they can be done by $(CC) and $(LD) respectively, which is more in
> line with what the user expects, versus using the compiler as a linker
> driver and relying on the implicit default linker value. However, as
> shown in the above thread, getting this right for the PowerPC vDSO is a
> little tricky due to the linker emulation values.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/vdso: Remove unused ENTRY in linker scripts
      https://git.kernel.org/powerpc/c/e247172854a57d1a7213bb835ecb4a40ce9bb2b9
[2/2] powerpc/vdso: Link with ld.lld when requested
      https://git.kernel.org/powerpc/c/4406b12214f6592909b63dabdea86d69f1b5ba2e

cheers
