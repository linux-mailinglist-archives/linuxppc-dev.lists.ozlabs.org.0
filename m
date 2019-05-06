Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4AB14B5D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 15:58:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yPT66qy4zDqHV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 23:58:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yPNY3k2DzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 23:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44yPNY0bjTz9s7T; Mon,  6 May 2019 23:54:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6be6a8de1b55e719e3f95894910743719065d6a1
X-Patchwork-Hint: ignore
In-Reply-To: <20190504070430.57008-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alastair D'Silva <alastair@d-silva.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
Message-Id: <44yPNY0bjTz9s7T@ozlabs.org>
Date: Mon,  6 May 2019 23:54:05 +1000 (AEST)
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-05-04 at 07:04:30 UTC, Wei Yongjun wrote:
> In case of error, the function eventfd_ctx_fdget() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Alastair D'Silva <alastair@d-silva.org>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6be6a8de1b55e719e3f9589491074371

cheers
