Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E23BCAFB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 12:53:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJztV45wxz3bm6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 20:53:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJzss3p8mz2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:52:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GJzsk2R2hz9sWl; Tue,  6 Jul 2021 20:52:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <024bb05105050f704743a0083fe3548702be5706.1625138205.git.christophe.leroy@csgroup.eu>
References: <024bb05105050f704743a0083fe3548702be5706.1625138205.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Fix lockup on kernel exec fault
Message-Id: <162556873360.460578.10834762081536677498.b4-ty@ellerman.id.au>
Date: Tue, 06 Jul 2021 20:52:13 +1000
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

On Thu, 1 Jul 2021 11:17:08 +0000 (UTC), Christophe Leroy wrote:
> The powerpc kernel is not prepared to handle exec faults from kernel.
> Especially, the function is_exec_fault() will return 'false' when an
> exec fault is taken by kernel, because the check is based on reading
> current->thread.regs->trap which contains the trap from user.
> 
> For instance, when provoking a LKDTM EXEC_USERSPACE test,
> current->thread.regs->trap is set to SYSCALL trap (0xc00), and
> the fault taken by the kernel is not seen as an exec fault by
> set_access_flags_filter().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Fix lockup on kernel exec fault
      https://git.kernel.org/powerpc/c/cd5d5e602f502895e47e18cd46804d6d7014e65c

cheers
