Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEC109782
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 02:17:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MQx82TYlzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 12:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MQrd4kH5zDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 12:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47MQrd1PSrz9sPZ; Tue, 26 Nov 2019 12:13:21 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 465bfd9c44dea6b55962b5788a23ac87a467c923
In-Reply-To: <20191119045712.39633-2-natechancellor@gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v5 1/3] powerpc: Don't add -mabi= flags when building with
 Clang
Message-Id: <47MQrd1PSrz9sPZ@ozlabs.org>
Date: Tue, 26 Nov 2019 12:13:21 +1100 (AEDT)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-11-19 at 04:57:10 UTC, Nathan Chancellor wrote:
> When building pseries_defconfig, building vdso32 errors out:
> 
>   error: unknown target ABI 'elfv1'
> 
> This happens because -m32 in clang changes the target to 32-bit,
> which does not allow the ABI to be changed, as the setABI virtual
> function is not overridden:
> 
> https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/include/clang/Basic/TargetInfo.h#L1073-L1078
> 
> https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/lib/Basic/Targets/PPC.h#L327-L365
> 
> Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
> powerpc64le toolchain") added these flags to fix building big endian
> kernels with a little endian GCC.
> 
> Clang doesn't need -mabi because the target triple controls the default
> value. -mlittle-endian and -mbig-endian manipulate the triple into
> either powerpc64-* or powerpc64le-*, which properly sets the default
> ABI:
> 
> https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/lib/Driver/Driver.cpp#L450-L463
> 
> https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/llvm/lib/Support/Triple.cpp#L1432-L1516
> 
> https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/lib/Basic/Targets/PPC.h#L377-L383
> 
> Adding a debug print out in the PPC64TargetInfo constructor after line
> 383 above shows this:
> 
> $ echo | ./clang -E --target=powerpc64-linux -mbig-endian -o /dev/null -
> Default ABI: elfv1
> 
> $ echo | ./clang -E --target=powerpc64-linux -mlittle-endian -o /dev/null -
> Default ABI: elfv2
> 
> $ echo | ./clang -E --target=powerpc64le-linux -mbig-endian -o /dev/null -
> Default ABI: elfv1
> 
> $ echo | ./clang -E --target=powerpc64le-linux -mlittle-endian -o /dev/null -
> Default ABI: elfv2
> 
> Don't specify -mabi when building with clang to avoid the build error
> with -m32 and not change any code generation.
> 
> -mcall-aixdesc is not an implemented flag in clang so it can be
> safely excluded as well, see commit 238abecde8ad ("powerpc: Don't
> use gcc specific options on clang").
> 
> pseries_defconfig successfully builds after this patch and
> powernv_defconfig and ppc44x_defconfig don't regress.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/240
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/465bfd9c44dea6b55962b5788a23ac87a467c923

cheers
