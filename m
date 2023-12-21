Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374E81B42A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnDK611Dz3wJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:46:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn5g0yBGz3cVm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:40:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5f4TZjz4xPc;
	Thu, 21 Dec 2023 21:40:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <cover.1702045299.git.naveen@kernel.org>
References: <cover.1702045299.git.naveen@kernel.org>
Subject: Re: (subset) [RFC PATCH 0/9] powerpc: ftrace updates
Message-Id: <170315510015.2192823.8374732857134504654.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 08 Dec 2023 22:00:39 +0530, Naveen N Rao wrote:
> Early RFC.
> 
> This series attempts to address couple of issues with the existing
> support for ftrace on powerpc, with a view towards improving performance
> when ftrace is not enabled. See patch 6 for more details.
> 
> Patches 7 and 8 implement support for ftrace direct calls, through
> adding support for DYNAMIC_FTRACE_WITH_CALL_OPS.
> 
> [...]

Patches 1, 3 and 4 applied to powerpc/next.

[1/9] powerpc/ftrace: Fix indentation in ftrace.h
      https://git.kernel.org/powerpc/c/2ec36570c3581285d15de672eaed10ce7e9218cd
[3/9] powerpc/ftrace: Remove nops after the call to ftrace_stub
      https://git.kernel.org/powerpc/c/ae24db43b3b427eb290b58d55179c32f0a7539d1
[4/9] powerpc/Kconfig: Select FUNCTION_ALIGNMENT_4B
      https://git.kernel.org/powerpc/c/b20f98e8b3deb50247603f0242ee2d1e38726635

cheers
