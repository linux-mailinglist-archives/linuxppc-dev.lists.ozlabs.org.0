Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512346BC9B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h5D36tQz3cTg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:30:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2P426yz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2N45kjz4xh0;
 Wed,  8 Dec 2021 00:28:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Steven Rostedt <rostedt@goodmis.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Message-Id: <163888361002.3690807.9338254360501011290.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:26:50 +1100
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Oct 2021 14:24:00 +0200, Christophe Leroy wrote:
> This series implements livepatch on PPC32.
> 
> This is largely copied from what's done on PPC64.
> 
> Christophe Leroy (5):
>   livepatch: Fix build failure on 32 bits processors
>   powerpc/ftrace: No need to read LR from stack in _mcount()
>   powerpc/ftrace: Add module_trampoline_target() for PPC32
>   powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32
>   powerpc/ftrace: Add support for livepatch to PPC32
> 
> [...]

Patches 2-4 applied to powerpc/next.

[2/5] powerpc/ftrace: No need to read LR from stack in _mcount()
      https://git.kernel.org/powerpc/c/88670fdb26800228606c078ba4a018e9522a75a8
[3/5] powerpc/ftrace: Add module_trampoline_target() for PPC32
      https://git.kernel.org/powerpc/c/c93d4f6ecf4b0699d0f2088f7bd9cd09af45d65a
[4/5] powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32
      https://git.kernel.org/powerpc/c/7dfbfb87c243cf08bc2b9cc23699ac207b726458

cheers
