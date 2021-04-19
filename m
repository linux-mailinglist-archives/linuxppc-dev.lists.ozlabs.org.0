Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60E3639F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtYV4Xtbz3dtP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVR6dp2z3c0M
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:15 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVR03sGz9vGs; Mon, 19 Apr 2021 14:04:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 Qinglang Miao <miaoqinglang@huawei.com>, Bixuan Cui <cuibixuan@huawei.com>
In-Reply-To: <20210409063855.57347-1-cuibixuan@huawei.com>
References: <20210409063855.57347-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/powernv: make symbol 'mpipl_kobj' static
Message-Id: <161880479893.1398509.5196822029182381609.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 9 Apr 2021 14:38:55 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/platforms/powernv/opal-core.c:74:16: warning:
>  symbol 'mpipl_kobj' was not declared.
> 
> This symbol is not used outside of opal-core.c, so marks it static.

Applied to powerpc/next.

[1/1] powerpc/powernv: make symbol 'mpipl_kobj' static
      https://git.kernel.org/powerpc/c/ff0b4155ae9903539d1299a9a4c8717fb7eb6009

cheers
