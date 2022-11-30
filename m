Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A642D63D240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ5M4GDNz3fKQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqx4BgLz3bh8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqx2sTKz4xmp;
	Wed, 30 Nov 2022 20:31:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: (subset) [PATCH 0/5] powerpc/kprobes: preempt related changes and cleanups
Message-Id: <166980025104.3017288.582464543238999463.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:11 +1100
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Oct 2022 22:58:56 +0530, Naveen N. Rao wrote:
> This series attempts to address some of the concerns raised in
> https://github.com/linuxppc/issues/issues/440
> 
> The last two patches are minor cleanups in related kprobes code.
> 
> - Naveen
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/kprobes: Remove preempt disable around call to get_kprobe() in arch_prepare_kprobe()
      https://git.kernel.org/powerpc/c/2fa9482334b0593b7edc371a13c0cca81daaa89e
[2/5] powerpc/kprobes: Have optimized_callback() use preempt_enable()
      https://git.kernel.org/powerpc/c/04ec5d5782fb346c291a05a2efe59483d8ada4c4
[3/5] powerpc/kprobes: Use preempt_enable() rather than the no_resched variant
      https://git.kernel.org/powerpc/c/266b1991a433cd55bb86a933216b3f6762737d47

cheers
