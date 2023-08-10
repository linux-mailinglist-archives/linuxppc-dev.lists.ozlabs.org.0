Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F0776FFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 08:07:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLxL10Xhjz3dTh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 16:07:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLxFM1n9Gz3cCr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 16:03:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RLxFL6Bldz4wyM;
	Thu, 10 Aug 2023 16:03:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230726081442.461026-1-u.kleine-koenig@pengutronix.de>
References: <20230726081442.461026-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] powerpc/ep8248e: Mark driver as non removable
Message-Id: <169164734546.180689.16319193371266679720.b4-ty@ellerman.id.au>
Date: Thu, 10 Aug 2023 16:02:25 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jul 2023 10:14:42 +0200, Uwe Kleine-König wrote:
> Instead of resorting to BUG() ensure that the driver isn't unbound by
> suppressing its bind and unbind sysfs attributes. As the driver is
> built-in there is no way to remove a device once bound.
> 
> As a nice side effect this allows to drop the remove function.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ep8248e: Mark driver as non removable
      https://git.kernel.org/powerpc/c/bbfa509d632946578d4f19aa2cedf1ca2f34565d

cheers
