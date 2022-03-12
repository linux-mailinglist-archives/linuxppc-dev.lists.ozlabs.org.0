Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 173894D6E2E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzf107lcz3cgZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzbd1Z6mz30Cm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:30:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzbb1NRlz4xcl;
 Sat, 12 Mar 2022 21:30:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
References: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/4] powerpc: Cleanup asm-prototypes.c
Message-Id: <164708098372.827774.13045777419131446755.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:29:43 +1100
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

On Fri, 4 Mar 2022 18:04:02 +0100, Christophe Leroy wrote:
> Last call to sys_swapcontext() from ASM was removed by
> commit fbcee2ebe8ed ("powerpc/32: Always save non volatile GPRs at
> syscall entry")
> 
> sys_debug_setcontext() prototype not needed anymore since
> commit f3675644e172 ("powerpc/syscalls: signal_{32, 64} - switch
> to SYSCALL_DEFINE")
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: Cleanup asm-prototypes.c
      https://git.kernel.org/powerpc/c/e86debbbb5f89c2575110cfdce89d1820577aa94
[2/4] powerpc/smp: Declare current_set static
      https://git.kernel.org/powerpc/c/e15c703be48edc3b2f96b66d4f548dc88b44266c
[3/4] powerpc/kexec: Declare kexec_paca static
      https://git.kernel.org/powerpc/c/a4abd55a2490fd6407ddb6810e41f64ebd66d3af
[4/4] powerpc: Move C prototypes out of asm-prototypes.h
      https://git.kernel.org/powerpc/c/76222808fc253cb9ea66c3e0e8d1946933f25b70

cheers
