Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 477074E1FC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 06:07:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMN0k1xpVz30KV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 16:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMMzY6lPhz3081
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 16:06:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KMMzV0D5Hz4xbs;
 Mon, 21 Mar 2022 16:06:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220311024733.48926-1-npiggin@gmail.com>
References: <20220311024733.48926-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/tm: Fix more userspace r13 corruption
Message-Id: <164783915231.1783931.13421325090840249852.b4-ty@ellerman.id.au>
Date: Mon, 21 Mar 2022 16:05:52 +1100
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
Cc: Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Mar 2022 12:47:33 +1000, Nicholas Piggin wrote:
> Commit cf13435b730a ("powerpc/tm: Fix userspace r13 corruption") fixes
> a problem in treclaim where a SLB miss can occur on the
> thread_struct->ckpt_regs while SCRATCH0 is live with the saved user r13
> value, clobbering it with the kernel r13 and ultimately resulting in
> kernel r13 being stored in ckpt_regs.
> 
> There is an equivalent problem in trechkpt where the user r13 value is
> loaded into r13 from chkpt_regs to be recheckpointed, but a SLB miss
> could occur on ckpt_regs accesses after that, which will result in r13
> being clobbered with a kernel value and that will get recheckpointed and
> then restored to user registers.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/tm: Fix more userspace r13 corruption
      https://git.kernel.org/powerpc/c/9d71165d3934e607070c4e48458c0cf161b1baea

cheers
