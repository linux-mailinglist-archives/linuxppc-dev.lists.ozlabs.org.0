Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372AB32FCB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 14:37:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HZMk1wDczDqSw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 22:37:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HZFs1kltzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 22:32:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45HZFr6FK1z9sNC; Mon,  3 Jun 2019 22:32:48 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 00b0cdbbc87fb4b531a0d75f4004ed3d89999b80
X-Patchwork-Hint: ignore
Content-Type: text/plain; charset="utf-8";
In-Reply-To: <20190504102720.42220-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, <fbarrat@linux.ibm.com>,
 <ajd@linux.ibm.com>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH -next] misc: ocxl: Make ocxl_remove static
Message-Id: <45HZFr6FK1z9sNC@ozlabs.org>
Date: Mon,  3 Jun 2019 22:32:48 +1000 (AEST)
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

On Sat, 2019-05-04 at 10:27:20 UTC, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/misc/ocxl/pci.c:44:6: warning:
>  symbol 'ocxl_remove' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/00b0cdbbc87fb4b531a0d75f4004ed3d

cheers
