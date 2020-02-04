Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB48151A57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:10:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Bk745jkFzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BjwG2FQlzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:01:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48BjwG0NkZzB3wq; Tue,  4 Feb 2020 23:01:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48BjwF4V2NzB3wt; Tue,  4 Feb 2020 23:01:33 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 76e4bd93369b87d97c2b1bcd6e754a89f422235b
In-Reply-To: <20200121043000.16212-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 01/10] powerpc/configs: Drop CONFIG_QLGE which moved to
 staging
Message-Id: <48BjwF4V2NzB3wt@ozlabs.org>
Date: Tue,  4 Feb 2020 23:01:33 +1100 (AEDT)
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
Cc: oohall@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-21 at 04:29:51 UTC, Michael Ellerman wrote:
> The QLGE driver moved to staging in commit 955315b0dc8c ("qlge: Move
> drivers/net/ethernet/qlogic/qlge/ to drivers/staging/qlge/"), meaning
> our defconfigs that enable it have no effect as we don't enable
> CONFIG_STAGING.
> 
> It sounds like the device is obsolete, so drop the driver.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Patches 1-9 applied to powerpc next.

https://git.kernel.org/powerpc/c/76e4bd93369b87d97c2b1bcd6e754a89f422235b

cheers
