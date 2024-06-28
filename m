Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B291B77F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 09:03:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pNnAviyq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9RH43JD8z3cV9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 17:03:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pNnAviyq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9RGL3s8Dz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 17:02:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719558171;
	bh=yKAZtPM5GEr7CZjyMumaDPYIdeEdVpmcv/sFYuGOa9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pNnAviyq9uqhUftQyMYSIpMi22zRA/e2RLe2mk9dsbBulBptFighU+2xzZhq57gN4
	 W8OHDxJFhAozwDw9+r+KGMRvHmaBzqQ5wv/saWrhEZrSMY7vNOHytT29zPfM17nKsA
	 j/wF2y89PcCRCzBZeMvVvi6ofDNLtmKxmpFR9QR1yxuxnDNHXBIB2UU8+KumhVa1MG
	 zHu8Ww8Fm1TIpYRBTNoBEuHRTYf6MHs+VZveXwM/fsmdMgoL94c5+Wcqn6K3Mm/Zme
	 DRx6CypwoAKrLlnVrNXssY7rU/lzEcYngKoMJ7sauDbdNypraPrNybVkum3rD7EQtb
	 KXBRZe+7BCJXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9RGK5Rg0z4w2N;
	Fri, 28 Jun 2024 17:02:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jialong Yang <jialong.yang@shingroup.cn>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v1 1/2] powerpc/mmiotrace: Add MMIO Tracing tool for
 PowerPC
In-Reply-To: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
References: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
Date: Fri, 28 Jun 2024 17:02:48 +1000
Message-ID: <87h6ddlfc7.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: luming.yu@shingroup.cn, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Karol Herbst <karolherbst@gmail.com>, shenghui.qu@shingroup.cn, Pekka Paalanen <ppaalanen@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org, Jialong Yang <jialong.yang@shingroup.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jialong Yang <jialong.yang@shingroup.cn> writes:
> mmiotrace is a useful tool to trace MMIO accesses. Nowadays, it only
> supported on x86 and x86_64 platforms.

I've never used mmiotrace, and don't know it well.

I'm not necessarily opposed to merging it, but AFAIK it was mostly used
for reverse engineering proprietary drivers, where the driver itself
couldn't be easily instrumented. Is that what you're using it for?

For drivers where we have the source wouldn't it be easier to just use
tracepoints in the MMIO accessors?

Is it still in-use/maintained on the x86 side?

> Here is a support for powerpc.
> The manual is located at Documentation/trace/mmiotrace.rst which means
> I have not changed user API. People will be easy to use it.
> Almost all files are copied from x86/mm, there are only some
> differences from hardware and architectures software.
>
> LINK: https://lore.kernel.org/lkml/20080127195536.50809974@daedalus.pq.iki.fi/
>
> Signed-off-by: Jialong Yang <jialong.yang@shingroup.cn>
> ---
>  arch/powerpc/Kconfig.debug       |   3 +
>  arch/powerpc/mm/Makefile         |   1 +
>  arch/powerpc/mm/kmmio.c          | 649 +++++++++++++++++++++++++++++++
>  arch/powerpc/mm/mmio-mod.c       | 414 ++++++++++++++++++++
>  arch/powerpc/mm/mmiotrace_arch.c | 149 +++++++
>  arch/powerpc/mm/mmiotrace_arch.h |  25 ++
>  arch/powerpc/mm/pf_in.c          | 185 +++++++++
>  arch/powerpc/mm/pf_in.h          |  33 ++
>  8 files changed, 1459 insertions(+)
  
At a glance most of that code could be shared between arches. I don't
think I can merge that as-is, without some attempt to split the generic
parts out.

cheers
