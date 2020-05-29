Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B11E74ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 06:37:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YBd16p5szDqNw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:37:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YBSK3xHGzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 14:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49YBSH2hhCz9sSx; Fri, 29 May 2020 14:30:07 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b1f9be9392f090f08e4ad9e2c68963aeff03bd67
In-Reply-To: <20200220081506.31209-1-clg@kaod.org>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xive: Enforce load-after-store ordering when
 StoreEOI is active
Message-Id: <49YBSH2hhCz9sSx@ozlabs.org>
Date: Fri, 29 May 2020 14:30:07 +1000 (AEST)
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-02-20 at 08:15:06 UTC, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= wrote:
> When an interrupt has been handled, the OS notifies the interrupt
> controller with a EOI sequence. On a POWER9 system using the XIVE
> interrupt controller, this can be done with a load or a store
> operation on the ESB interrupt management page of the interrupt. The
> StoreEOI operation has less latency and improves interrupt handling
> performance but it was deactivated during the POWER9 DD2.0 timeframe
> because of ordering issues. We use the LoadEOI today but we plan to
> reactivate StoreEOI in future architectures.
> 
> There is usually no need to enforce ordering between ESB load and
> store operations as they should lead to the same result. E.g. a store
> trigger and a load EOI can be executed in any order. Assuming the
> interrupt state is PQ=10, a store trigger followed by a load EOI will
> return a Q bit. In the reverse order, it will create a new interrupt
> trigger from HW. In both cases, the handler processing interrupts is
> notified.
> 
> In some cases, the XIVE_ESB_SET_PQ_10 load operation is used to
> disable temporarily the interrupt source (mask/unmask). When the
> source is reenabled, the OS can detect if interrupts were received
> while the source was disabled and reinject them. This process needs
> special care when StoreEOI is activated. The ESB load and store
> operations should be correctly ordered because a XIVE_ESB_STORE_EOI
> operation could leave the source enabled if it has not completed
> before the loads.
> 
> For those cases, we enforce Load-after-Store ordering with a special
> load operation offset. To avoid performance impact, this ordering is
> only enforced when really needed, that is when interrupt sources are
> temporarily disabled with the XIVE_ESB_SET_PQ_10 load. It should not
> be needed for other loads.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/b1f9be9392f090f08e4ad9e2c68963aeff03bd67

cheers
