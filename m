Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37B544FB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 16:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJn3335njz3chm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 00:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJn2G1vtxz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 00:45:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJn2G1Cncz4xZ4;
	Fri, 10 Jun 2022 00:45:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220525032639.1947280-1-mpe@ellerman.id.au>
References: <20220525032639.1947280-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-Id: <165478587253.589231.16242247816940188081.b4-ty@ellerman.id.au>
Date: Fri, 10 Jun 2022 00:44:32 +1000
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 May 2022 13:26:39 +1000, Michael Ellerman wrote:
> The HAVE_IRQ_EXIT_ON_IRQ_STACK option tells generic code that irq_exit()
> is called while still running on the hard irq stack (hardirq_ctx[] in
> the powerpc code).
> 
> Selecting the option means the generic code will *not* switch to the
> softirq stack before running softirqs, because the code is already
> running on the (mostly empty) hard irq stack.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
      https://git.kernel.org/powerpc/c/1346d00e1bdfd4067f92bc14e8a6131a01de4190

cheers
