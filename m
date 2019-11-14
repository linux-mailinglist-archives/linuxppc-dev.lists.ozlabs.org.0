Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA3FC263
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:14:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DG593TTbzF5yW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:14:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxP118NzF4ln;
 Thu, 14 Nov 2019 20:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxN5pWqz9sP6; Thu, 14 Nov 2019 20:07:36 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 93a1544ad4ec4bd9147992e57b4f834ceb2cc159
In-Reply-To: <20190612071901.21736-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, <linux@armlinux.org.uk>, <fw@strlen.de>,
 <steffen.klassert@secunet.com>, <davem@davemloft.net>, <ralf@linux-mips.org>,
 <paul.burton@mips.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH net-next] defconfigs: remove obsolete
 CONFIG_INET_XFRM_MODE_* and CONFIG_INET6_XFRM_MODE_*
Message-Id: <47DFxN5pWqz9sP6@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:36 +1100 (AEDT)
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
Cc: linux-s390@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-sh@vger.kernel.org, netdev@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 07:19:01 UTC, YueHaibing wrote:
> These Kconfig options has been removed in
> commit 4c145dce2601 ("xfrm: make xfrm modes builtin")
> So there is no point to keep it in defconfigs any longer.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/93a1544ad4ec4bd9147992e57b4f834ceb2cc159

cheers
