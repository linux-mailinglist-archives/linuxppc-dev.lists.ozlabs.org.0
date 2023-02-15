Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DAE697B96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGxsc4hyXz3f4n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:17:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGxs54gyRz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:16:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGxs53JdSz4x4r;
	Wed, 15 Feb 2023 23:16:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230206042240.92103-1-npiggin@gmail.com>
References: <20230206042240.92103-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch
Message-Id: <167646340295.1415779.14150035854128634916.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:16:42 +1100
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
Cc: Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Feb 2023 14:22:40 +1000, Nicholas Piggin wrote:
> The RFI and STF security mitigation options can flip the
> interrupt_exit_not_reentrant static branch condition concurrently with
> the interrupt exit code which tests that branch.
> 
> Interrupt exit tests this condition to set MSR[EE|RI] for exit, then
> again in the case a soft-masked interrupt is found pending, to recover
> the MSR so the interrupt can be replayed before attempting to exit
> again. If the condition changes between these two tests, the MSR and irq
> soft-mask state will become corrupted, leading to warnings and possible
> crashes. For example, if the branch is initially true then false,
> MSR[EE] will be 0 but PACA_IRQ_HARD_DIS clear and EE may not get
> enabled, leading to warnings in irq_64.c.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch
      https://git.kernel.org/powerpc/c/2ea31e2e62bbc4d11c411eeb36f1b02841dbcab1

cheers
