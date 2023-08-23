Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43717785798
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:10:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4mH1SM5z3dlW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:10:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cl2Hw7z3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cl0cM6z4x2M;
	Wed, 23 Aug 2023 22:03:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <603e1facb32608f88f40b7d7b9094adc50e7b2dc.1692349125.git.christophe.leroy@csgroup.eu>
References: <603e1facb32608f88f40b7d7b9094adc50e7b2dc.1692349125.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/perf: Convert fsl_emb notifier to state machine callbacks
Message-Id: <169279175579.797584.17166365496490472312.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Aug 2023 10:59:44 +0200, Christophe Leroy wrote:
>   CC      arch/powerpc/perf/core-fsl-emb.o
> arch/powerpc/perf/core-fsl-emb.c:675:6: error: no previous prototype for 'hw_perf_event_setup' [-Werror=missing-prototypes]
>   675 | void hw_perf_event_setup(int cpu)
>       |      ^~~~~~~~~~~~~~~~~~~
> 
> Looks like fsl_emb was completely missed by commit 3f6da3905398 ("perf:
> Rework and fix the arch CPU-hotplug hooks")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Convert fsl_emb notifier to state machine callbacks
      https://git.kernel.org/powerpc/c/34daf445f82bd3a4df852bb5f1dffd792ac830a0

cheers
