Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D909BB7821
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 13:06:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YvDQ6D5DzF51q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 21:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKk0c0KzF4Xs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:26:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKj1yP9z9sQw; Thu, 19 Sep 2019 20:26:00 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6ccb4ac2bf8a35c694ead92f8ac5530a16e8f2c8
In-Reply-To: <156821713818.1985334.14123187368108582810.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/xive: Fix bogus error code returned by OPAL
Message-Id: <46YtKj1yP9z9sQw@ozlabs.org>
Date: Thu, 19 Sep 2019 20:26:00 +1000 (AEST)
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
Cc: David Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-11 at 15:52:18 UTC, Greg Kurz wrote:
> There's a bug in skiboot that causes the OPAL_XIVE_ALLOCATE_IRQ call
> to return the 32-bit value 0xffffffff when OPAL has run out of IRQs.
> Unfortunatelty, OPAL return values are signed 64-bit entities and
> errors are supposed to be negative. If that happens, the linux code
> confusingly treats 0xffffffff as a valid IRQ number and panics at some
> point.
> 
> A fix was recently merged in skiboot:
> 
> e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")
> 
> but we need a workaround anyway to support older skiboots already
> in the field.
> 
> Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
> returned upon resource exhaustion.
> 
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6ccb4ac2bf8a35c694ead92f8ac5530a16e8f2c8

cheers
