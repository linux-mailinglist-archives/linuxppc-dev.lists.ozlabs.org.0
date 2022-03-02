Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77DA4CA527
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:47:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v5M5lhVz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:47:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v4z175yz3bbG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v4x36H9z4xvB;
 Wed,  2 Mar 2022 23:46:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
References: <ff535e86d3a69376a6d89168511d4e403835f18b.1644949750.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/4] powerpc/ftrace: Also save r1 in ftrace_caller()
Message-Id: <164622488126.2052779.3499748574130781194.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:21 +1100
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Feb 2022 19:31:22 +0100, Christophe Leroy wrote:
> Also save r1 in ftrace_caller()
> 
> r1 is needed during unwinding when the function_graph tracer
> is active.
> 
> 

Applied to powerpc/next.

[1/4] powerpc/ftrace: Also save r1 in ftrace_caller()
      https://git.kernel.org/powerpc/c/34d8dac807f0ee3dc42ab45bdb284a3caf2b5ed1
[2/4] powerpc/ftrace: Add recursion protection in prepare_ftrace_return()
      https://git.kernel.org/powerpc/c/df45a55788286c541449d82ee09fef3ac5ff77a1
[3/4] powerpc/ftrace: Have arch_ftrace_get_regs() return NULL unless FL_SAVE_REGS is set
      https://git.kernel.org/powerpc/c/fc75f87337983229b7355d6b77f30fb6e7f359ee
[4/4] powerpc/ftrace: Style cleanup in ftrace_mprofile.S
      https://git.kernel.org/powerpc/c/76b372814b088aeb76f0f753d968c8aa6d297f2a

cheers
