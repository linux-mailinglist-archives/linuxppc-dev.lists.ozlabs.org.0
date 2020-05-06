Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3F1C661C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 04:58:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H1Vc5LwvzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 12:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H1Lf1x3czDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 12:51:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49H1Ld6Wwmz9sT5; Wed,  6 May 2020 12:51:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 43c8a496fa37187b54f7df71fb8262acc6bf6200
In-Reply-To: <1588154448-56759-1-git-send-email-wangxiongfeng2@huawei.com>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>, <geoff@infradead.org>,
 <benh@kernel.crashing.org>, <paulus@samba.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <wangxiongfeng2@huawei.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/ps3: Move static keyword to the front of
 declaration
Message-Id: <49H1Ld6Wwmz9sT5@ozlabs.org>
Date: Wed,  6 May 2020 12:51:05 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-29 at 10:00:48 UTC, Xiongfeng Wang wrote:
> Move the static keyword to the front of declaration of 'vuart_bus_priv',
> and resolve the following compiler warning that can be seen when
> building with warnings enabled (W=1):
> 
> drivers/ps3/ps3-vuart.c:867:1: warning: ‘static’ is not at beginning of declaration [-Wold-style-declaration]
>  } static vuart_bus_priv;
>  ^
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/43c8a496fa37187b54f7df71fb8262acc6bf6200

cheers
