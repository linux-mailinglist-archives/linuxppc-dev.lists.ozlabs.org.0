Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC82277114
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 14:33:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxvbM4G2MzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 22:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4BxvSl71hczDqKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:27:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvSl3nDrz9sTg; Thu, 24 Sep 2020 22:27:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20200914211007.2285999-1-clg@kaod.org>
References: <20200914211007.2285999-1-clg@kaod.org>
Subject: Re: [PATCH v2 0/7] powerpc: Fix a few W=1 compile warnings
Message-Id: <160095000528.26280.8205412136712284462.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:27:34 +1000 (AEST)
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Sep 2020 23:10:00 +0200, Cédric Le Goater wrote:
> Here is a small contribution improving compile with W=1.
> 
> Thanks,
> 
> C.
> 
> Changes in v2:
> 
> [...]

Patches 1, 3, 4 and 7 applied to powerpc/next.

[1/7] powerpc/sysfs: Remove unused 'err' variable in sysfs_create_dscr_default()
      https://git.kernel.org/powerpc/c/7b2aab5f22f0f7cc9e2f8672c9e65e2e88d30102
[3/7] powerpc/sstep: Remove empty if statement checking for invalid form
      https://git.kernel.org/powerpc/c/5ab187e01a5310e1f9cd2f6b192b2343b8bd14cb
[4/7] powerpc/xive: Make debug routines static
      https://git.kernel.org/powerpc/c/2228f19cf90ef796c8d84f54f3a5db2dcc85c83f
[7/7] powerpc/32: Declare stack_overflow_exception() prototype
      https://git.kernel.org/powerpc/c/ebbfeef0d8093a06ff39c60105b6650be3344cbe

cheers
