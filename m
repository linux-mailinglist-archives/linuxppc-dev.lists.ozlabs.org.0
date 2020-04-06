Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B859419F71B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:38:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ws7S5s85zDr80
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrPv3xsvzDr6D
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrPk4QyJz9sSK; Mon,  6 Apr 2020 23:05:45 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d3883fa0784832bb65df019ae6a291a87d146fb1
In-Reply-To: <410cda9aa1a6e04434dfe1f9aa2103d0694f706c.1585340156.git.geoff@infradead.org>
To: Geoff Levand <geoff@infradead.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 6/9] powerpc/ps3: Set CONFIG_UEVENT_HELPER=y in
 ps3_defconfig
Message-Id: <48wrPk4QyJz9sSK@ozlabs.org>
Date: Mon,  6 Apr 2020 23:05:45 +1000 (AEST)
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-27 at 20:26:23 UTC, Geoff Levand wrote:
> Set CONFIG_UEVENT_HELPER=y in ps3_defconfig.
> 
> commit 1be01d4a57142ded23bdb9e0c8d9369e693b26cc (driver: base: Disable
> CONFIG_UEVENT_HELPER by default) disabled the CONFIG_UEVENT_HELPER option
> that is needed for hotplug and module loading by most older 32bit powerpc
> distributions that users typically install on the PS3.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d3883fa0784832bb65df019ae6a291a87d146fb1

cheers
