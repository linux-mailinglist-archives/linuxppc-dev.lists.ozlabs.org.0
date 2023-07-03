Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8D745542
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:03:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb2h1nN0z3gnD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:03:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZpK5NkJz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZpB6zmWz4wy9;
	Mon,  3 Jul 2023 15:52:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
References: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] macintosh: Switch i2c drivers back to use .probe()
Message-Id: <168836201889.50010.9813072875975366478.b4-ty@ellerman.id.au>
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
Cc: Corey Minyard <cminyard@mvista.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ajay Gupta <ajayg@nvidia.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Liang He <windhl@126.com>, Jean Delvare <jdelvare@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Adrien Grassein <adrien.grassein@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Colin Leroy <colin@colino.net>, Krzysztof Hałasa <khalasa@piap.pl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Petr Machata <petrm@nvidia.com>, Maximilian Luz <luzmaximilian@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 May 2023 21:50:53 +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh: Switch i2c drivers back to use .probe()
      https://git.kernel.org/powerpc/c/922db7c571f55b1eab2d2c5da14d150aff1d0252

cheers
