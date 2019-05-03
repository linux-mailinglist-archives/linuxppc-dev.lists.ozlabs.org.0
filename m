Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C001289F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:20:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wNpC20Z6zDqWC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:20:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKK1YlKzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKF4yxqz9sB8; Fri,  3 May 2019 16:59:13 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 32eeb5614d3bf166e84fe69bb5f3a51a48cac7a1
X-Patchwork-Hint: ignore
In-Reply-To: <20190329154456.27152-1-yuehaibing@huawei.com>
To: Yue Haibing <yuehaibing@huawei.com>, <fbarrat@linux.ibm.com>,
 <andrew.donnellan@au1.ibm.com>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH -next] ocxl: remove set but not used variables 'tid' and
 'lpid'
Message-Id: <44wNKF4yxqz9sB8@ozlabs.org>
Date: Fri,  3 May 2019 16:59:13 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-03-29 at 15:44:56 UTC, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/misc/ocxl/link.c: In function 'xsl_fault_handler':
> drivers/misc/ocxl/link.c:187:17: warning: variable 'tid' set but not used [-Wunused-but-set-variable]
> drivers/misc/ocxl/link.c:187:6: warning: variable 'lpid' set but not used [-Wunused-but-set-variable]
> 
> They are never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
> Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/32eeb5614d3bf166e84fe69bb5f3a51a

cheers
