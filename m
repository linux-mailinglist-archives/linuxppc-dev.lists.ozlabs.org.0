Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52696BDCC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:12:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46db452VnQzDqhs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:12:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dZwH6vDtzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:05:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46dZwH2cgLz9sPL; Wed, 25 Sep 2019 21:05:18 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a003365cab64b0f7988ac3ccb1da895ce0bece5e
In-Reply-To: <20190904045529.23002-3-gromero@linux.vnet.ibm.com>
To: gromero <gromero@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 3/3] powerpc/tm: Add tm-poison test
Message-Id: <46dZwH2cgLz9sPL@ozlabs.org>
Date: Wed, 25 Sep 2019 21:05:18 +1000 (AEST)
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
Cc: cyrilbur@gmail.com, gromero@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-04 at 04:55:29 UTC, gromero wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
> 
> Add TM selftest to check if FP or VEC register values from one process
> can leak into another process when both run on the same CPU.
> 
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/a003365cab64b0f7988ac3ccb1da895ce0bece5e

cheers
