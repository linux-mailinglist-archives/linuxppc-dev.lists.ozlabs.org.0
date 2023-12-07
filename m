Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD180885D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDfP66zWz74qc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVt6yzYz3dK8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVt5l8Cz4xS0;
	Thu,  7 Dec 2023 23:44:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20231127-rtas-pci-rw-config-v1-1-385d29ace3df@linux.ibm.com>
References: <20231127-rtas-pci-rw-config-v1-1-385d29ace3df@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas_pci: rename and properly expose config access APIs
Message-Id: <170195271166.2310221.13174919656650959020.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: Anders Roxell <anders.roxell@linaro.org>, regressions@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <llvm@lists.linux.dev>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, Nathan Chancellor <nathan@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>, Linux Kernel Functional Testing <lkft@linaro.org>, linuxppc-dev@lists.ozlabs.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Nov 2023 18:40:09 -0600, Nathan Lynch wrote:
> The rtas_read_config() and rtas_write_config() functions in
> kernel/rtas_pci.c have external linkage and two users in arch/powerpc:
> the rtas_pci code itself and the pseries platform's "enhanced error
> handling" (EEH) support code.
> 
> The prototypes for these functions in asm/ppc-pci.h have until now
> been guarded by CONFIG_EEH since the only external caller is the
> pseries EEH code. However, this presumably has always generated
> warnings when built with !CONFIG_EEH and -Wmissing-prototypes:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/rtas_pci: rename and properly expose config access APIs
      https://git.kernel.org/powerpc/c/9be4feb768b86c25da336a6c0f3e3caefd16f1e4

cheers
