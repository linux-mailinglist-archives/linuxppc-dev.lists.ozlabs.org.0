Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D881AE9BCE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:50:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4737bV53TxzF4Kx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736nx43JGzF4BZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nw2fQ5z9sPw; Wed, 30 Oct 2019 23:14:27 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a9336ddf448b1cba3080195cec2287af3907236c
In-Reply-To: <1526868278-4204-1-git-send-email-debmc@linux.vnet.ibm.com>
To: Deb McLemore <debmc@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/powernv: Add queue mechanism for early messages
Message-Id: <4736nw2fQ5z9sPw@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:27 +1100 (AEDT)
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
Cc: Deb McLemore <debmc@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2018-05-21 at 02:04:38 UTC, Deb McLemore wrote:
> Problem being solved is when issuing a BMC soft poweroff during IPL,
> the poweroff was being lost so the machine would not poweroff.
> 
> Opal messages were being received before the opal-power code
> registered its notifiers.
> 
> Alternatives discussed (option #3 was chosen):
> 
> 1 - Have opal_message_init() explicitly call opal_power_control_init()
> before it dequeues any OPAL messages (i.e. before we register the
> opal-msg IRQ handler).
> 
> 2 - Introduce concept of critical message types and when we register
> handlers we track which message types have a registered handler,
> then defer the opal-msg IRQ registration until we have a handler
> registered for all the critical types.
> 
> 3 - Buffering messages, if we receive a message and do not yet
> have a handler for that type, store the message and replay when
> a handler for that type is registered.
> 
> Signed-off-by: Deb McLemore <debmc@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a9336ddf448b1cba3080195cec2287af3907236c

cheers
