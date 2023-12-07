Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D16808891
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:55:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDlX4GqRz3wGF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:55:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDgQ1ftlz753s
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:52:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDgQ0RYXz4xGP;
	Thu,  7 Dec 2023 23:52:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20231130065947.2188860-1-naveen@kernel.org>
References: <20231130065947.2188860-1-naveen@kernel.org>
Subject: Re: [PATCH] powerpc/ftrace: Fix stack teardown in ftrace_no_trace
Message-Id: <170195350072.2318049.5836008710043445095.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:51:40 +1100
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Nov 2023 12:29:47 +0530, Naveen N Rao wrote:
> Commit 41a506ef71eb ("powerpc/ftrace: Create a dummy stackframe to fix
> stack unwind") added use of a new stack frame on ftrace entry to fix
> stack unwind. However, the commit missed updating the offset used while
> tearing down the ftrace stack when ftrace is disabled. Fix the same.
> 
> In addition, the commit missed saving the correct stack pointer in
> pt_regs. Update the same.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/ftrace: Fix stack teardown in ftrace_no_trace
      https://git.kernel.org/powerpc/c/4b3338aaa74d7d4ec5b6734dc298f0db94ec83d2

cheers
