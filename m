Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D1745546
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb3B5ShHz3gqD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:04:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZpL1Nljz3c2m
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZpL09gZz4wxS;
	Mon,  3 Jul 2023 15:52:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230413061642.kqkor4wkt7lp2mhp@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de> <20230412150524.ojsvukh47hing6db@pengutronix.de> <87zg7cabf6.fsf@mpe.ellerman.id.au> <20230413061642.kqkor4wkt7lp2mhp@pengutronix.de>
Subject: Re: [PATCH] powerpc: Drop MPC5200 LocalPlus bus FIFO driver
Message-Id: <168836201881.50010.11228113359819926077.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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
Cc: Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 13 Apr 2023 08:16:42 +0200, Uwe Kleine-König wrote:
> While mpc5200b.dtsi contains a device that this driver can bind to, the
> only purpose of a bound device is to be used by the four exported functions
> mpc52xx_lpbfifo_submit(), mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll()
> and mpc52xx_lpbfifo_start_xfer(). However there are no callers to this
> function and so the driver is effectively superfluous and can be deleted.
> Also drop some defines and a struct from <asm/mpc52xx.h> that are unused
> now together with the declarations of the four mentioned functions.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Drop MPC5200 LocalPlus bus FIFO driver
      https://git.kernel.org/powerpc/c/7d3ee229ea51a17afc1e53272e2a8f377cc82ba2

cheers
