Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7F8D7A28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 04:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vsyn02W3fz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 12:47:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsylQ4fKHz3cLQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 12:45:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsylP5N6Nz4x12;
	Mon,  3 Jun 2024 12:45:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240529162852.1209-1-samuel.holland@sifive.com>
References: <20240529162852.1209-1-samuel.holland@sifive.com>
Subject: Re: [PATCH] powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64
Message-Id: <171738271138.1517513.7328136672025419201.b4-ty@ellerman.id.au>
Date: Mon, 03 Jun 2024 12:45:11 +1000
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Christian König <christian.koenig@amd.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 May 2024 09:28:50 -0700, Samuel Holland wrote:
> When building a 32-bit kernel, some toolchains do not allow mixing soft
> float and hard float object files:
> 
>     LD      vmlinux.o
>   powerpc64le-unknown-linux-musl-ld: lib/test_fpu_impl.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
>   powerpc64le-unknown-linux-musl-ld: failed to merge target specific data of file lib/test_fpu_impl.o
>   make[2]: *** [scripts/Makefile.vmlinux_o:62: vmlinux.o] Error 1
>   make[1]: *** [Makefile:1152: vmlinux_o] Error 2
>   make: *** [Makefile:240: __sub-make] Error 2
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64
      https://git.kernel.org/powerpc/c/be2fc65d66e0406cc9d39d40becaecdf4ee765f3

cheers
