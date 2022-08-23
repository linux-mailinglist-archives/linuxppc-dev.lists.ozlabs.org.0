Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869159CE0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 03:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBXJ91KlSz3cCh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 11:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DEgk+7Vn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBXHX0dPDz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 11:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DEgk+7Vn;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MBXHM47Kmz4xD1;
	Tue, 23 Aug 2022 11:50:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661219427;
	bh=z9iiwzy/0z+uHWfmksMPhESPFYy+Z3H5BGqkn1wngcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DEgk+7VnxcKnfnDWeJCx5DJOJqcojGvAPZL4dAHunxNoWM+bQtxuXvu9G4XsO7+Dp
	 byo6xtex7aE3A+qd5jFBwmC4y4P03SqzHVHn1GxZ/pW7DbZebqbbwxmr++8xqd5WPR
	 3aUl2DgUz23eKD7ZuL3zzcUSakJ4bhx2EwgrKz7lIMzN5QCWVB3JDxHuAE+VQRsYGE
	 DAErKd1XxhCAzheOcLlMR4+rh+FZCUZhQF7GiixrHkLrcVnxajupmwuShvTl46+5un
	 UcLe+/VlgYz3bjteY2HzpCD74ysI0kimN1qvLCx0h2OAWNRun0UZg0gl4/r68gW+nZ
	 mbZNJfdvFRtWA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arminder Singh <arminders208@outlook.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
Date: Tue, 23 Aug 2022 11:50:18 +1000
Message-ID: <87h723lodh.fsf@mpe.ellerman.id.au>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, Arminder Singh <arminders208@outlook.com>, Paul Mackerras <paulus@samba.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arminder Singh <arminders208@outlook.com> writes:
> This is the first time I'm interacting with the Linux mailing lists, so 
> please don't eviscerate me *too much* if I get the formatting wrong.
> Of course I'm always willing to take criticism and improve my formatting 
> in the future.
>
> This patch adds support for IRQs to the PASemi I2C controller driver.
> This will allow for faster performing I2C transactions on Apple Silicon
> hardware, as previously, the driver was forced to poll the SMSTA register
> for a set amount of time.
>
> With this patchset the driver on Apple silicon hardware will instead wait
> for an interrupt which will signal the completion of the I2C transaction.
> The timeout value for this completion will be the same as the current
> amount of time the I2C driver polls for.
>
> This will result in some performance improvement since the driver will be
> waiting for less time than it does right now on Apple Silicon hardware.
>
> The patch right now will only enable IRQs for Apple Silicon I2C chips,
> and only if it's able to successfully request the IRQ from the kernel.
>
> === Testing ===
>
> This patch has been tested on both the mainline Linux kernel tree and
> the Asahi branch (https://github.com/AsahiLinux/linux.git) on both an
> M1 and M2 MacBook Air, and it compiles successfully as both a module and
> built-in to the kernel itself. The patch in both trees successfully boots
> to userspace without any hitch.
>
> I do not have PASemi hardware on hand unfortunately, so I'm unable to test
> the impact of this patch on old PASemi hardware. This is also why I've
> elected to do the IRQ request and enablement on the Apple platform driver
> and not in the common file, as I'm not sure if PASemi hardware supports
> IRQs.

I've added Darren and Christian to Cc, they have helped with PASemi
development and testing in the past, and may be able to help test this
series on PASemi hardware.

cheers
