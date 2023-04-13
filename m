Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C74436E030F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 02:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pxg4f5FwZz3fRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 10:12:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ng1uWfFh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxg3p0YKsz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 10:11:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ng1uWfFh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pxg3k1fL5z4xGK;
	Thu, 13 Apr 2023 10:11:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681344690;
	bh=ptjOI3AT2/hYtcYUPlZVEdbaAdsYtMWDcr1HU6xLHPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ng1uWfFhe4z23J4cjn0ubPm9lTEthaP4Cal102stJ7NcTcam2/rK+5b1ZjgZaU1VZ
	 avi9T+kduc9YFiK/0WtznbNCy6sld5Aus9ecCFuY+GwYdGZUkRe+f2V0I3A3W+WUX6
	 yFKVCJT2wHKkcVOvd2+YkEJEDuN6VlIh1/9mvtXS4q0k2PT0V8fubxvhJkhwzYZbpF
	 Ts9ckAEyyIjMH//NICrJmPsFWh14Z6qKQSzxgQ0DoKcVNtCpBI3wE0qgcdnJkR9+9e
	 pjWphtI59QX6GbQmYfzgPLwBCRhP9C4yUEHAN/IKfJE6dPcDYCl/vgy3QttAQTu3qC
	 afX5EwbzTu6MQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Anatolij Gustschin
 <agust@denx.de>
Subject: Re: [PATCH] powerpc/mpc52xx_lpbfifo: Drop unused functions
In-Reply-To: <20230412150524.ojsvukh47hing6db@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
 <20230412150524.ojsvukh47hing6db@pengutronix.de>
Date: Thu, 13 Apr 2023 10:11:25 +1000
Message-ID: <87zg7cabf6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> On Wed, Dec 28, 2022 at 03:51:29PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> The four exported functions mpc52xx_lpbfifo_submit(),
>> mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll(), and
>> mpc52xx_lpbfifo_start_xfer() are not used. So they can be dropped and the
>> definitions needed to call them can be moved into the driver file.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> I never got feedback about this driver and it has not appeared in next
> up to now. Did it fell through the cracks?

Yeah. I was hoping someone would explain what's going on with the
driver.

Presumably there are some out-of-tree drivers that use the routines
provided by this driver?

I think rather than merging this patch, which keeps the code but makes
it completely useless, do you mind sending a patch to remove the whole
driver? Maybe that will get someone's attention.

cheers
