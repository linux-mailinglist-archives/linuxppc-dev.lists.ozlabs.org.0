Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D252745547
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb3k0Jntz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZpL4fvnz3bwY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZpL3Z1mz4wxW;
	Mon,  3 Jul 2023 15:52:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Scott Wood <oss@buserror.net>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230525205622.734093-1-u.kleine-koenig@pengutronix.de>
References: <20230525205622.734093-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] powerpc: Switch i2c drivers back to use .probe()
Message-Id: <168836201890.50010.14888301181182861501.b4-ty@ellerman.id.au>
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
Cc: Marek Behún <kabel@kernel.org>, Rob Herring <robh@kernel.org>, Crt Mori <cmo@melexis.com>, Liang He <windhl@126.com>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 May 2023 22:56:22 +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Switch i2c drivers back to use .probe()
      https://git.kernel.org/powerpc/c/48f2444eb4dc0f3de9146f7278e859fa6b5e568b

cheers
