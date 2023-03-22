Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F526C4A7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 13:29:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhSTw0Kz5z3fdH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 23:29:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhSR473twz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 23:27:28 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PhSR374XHz4xFc;
	Wed, 22 Mar 2023 23:27:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20230118-ppc64-elfv2-llvm-v1-0-b9e2ec9da11d@kernel.org>
References: <20230118-ppc64-elfv2-llvm-v1-0-b9e2ec9da11d@kernel.org>
Subject: Re: [PATCH 0/3] Allow CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 with ld.lld 15+
Message-Id: <167948793442.559204.2964050663889516909.b4-ty@ellerman.id.au>
Date: Wed, 22 Mar 2023 23:25:34 +1100
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
Cc: erhard_f@mailbox.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, patches@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Feb 2023 11:41:14 -0700, Nathan Chancellor wrote:
> Currently, CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not selectable with
> ld.lld because of an explicit dependency on GNU ld, due to lack of
> testing with LLVM.
> 
> Erhard was kind enough to test this option on his hardware with LLVM 15,
> which ran without any issues. This should not be too surprising, as
> ld.lld does not have support for the ELFv1 ABI, only ELFv2, so it should
> have decent support. With this series, big endian kernels can be built
> with LLVM=1.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/boot: Only use '-mabi=elfv2' with CONFIG_PPC64_BOOT_WRAPPER
      https://git.kernel.org/powerpc/c/d1c5accacb234c3a9f1609a73b4b2eaa4ef07d1a
[2/3] powerpc: Fix use of '-mabi=elfv2' with clang
      https://git.kernel.org/powerpc/c/7c3bd8362b06cff0a4044a4975adb7d71db2dfba
[3/3] powerpc: Allow CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 with ld.lld 15+
      https://git.kernel.org/powerpc/c/a11334d8327b3fd7987cbfb38e956a44c722d88f

cheers
