Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6465850D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:23:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSs62wTmz3hVN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSlt1Tyjz3gZt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:19:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSls4lyXz4xG0;
	Fri, 29 Jul 2022 23:19:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anatolij Gustschin <agust@denx.de>, Michael Ellerman <mpe@ellerman.id.au>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
References: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] powerpc/52xx: Mark gpt driver as not removable
Message-Id: <165909971479.253830.16544264778618959955.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:01:54 +1000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 12 Jun 2022 23:34:00 +0200, Uwe Kleine-König wrote:
> Returning an error code (here -EBUSY) from a remove callback doesn't
> prevent the driver from being unloaded. The only effect is that an error
> message is emitted and the driver is removed anyhow.
> 
> So instead drop the remove function (which is equivalent to returning zero)
> and set the suppress_bind_attrs property to make it impossible to unload
> the driver via sysfs.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/52xx: Mark gpt driver as not removable
      https://git.kernel.org/powerpc/c/1978c48495171165453a7c90d1345c1d8d776d02

cheers
