Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5C2C4066
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:42:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0sN0cdqzDqnK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:42:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzt55jsQzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsp6Xgnz9sVf; Wed, 25 Nov 2020 22:57:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Qinglang Miao <miaoqinglang@huawei.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <20201028091551.136400-1-miaoqinglang@huawei.com>
References: <20201028091551.136400-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH] powerpc: sysdev: add missing iounmap() on error in
 mpic_msgr_probe()
Message-Id: <160630540026.2174375.17196584614414099920.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:50 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 17:15:51 +0800, Qinglang Miao wrote:
> I noticed that iounmap() of msgr_block_addr before return from
> mpic_msgr_probe() in the error handling case is missing. So use
> devm_ioremap() instead of just ioremap() when remapping the message
> register block, so the mapping will be automatically released on
> probe failure.

Applied to powerpc/next.

[1/1] powerpc: sysdev: add missing iounmap() on error in mpic_msgr_probe()
      https://git.kernel.org/powerpc/c/ffa1797040c5da391859a9556be7b735acbe1242

cheers
