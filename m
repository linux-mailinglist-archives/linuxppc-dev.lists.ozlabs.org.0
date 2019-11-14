Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F97FC302
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:50:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGtL5JBvzF7P1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxp74FszF5ZD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxp4XN4z9sSK; Thu, 14 Nov 2019 20:07:58 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d273fa919c39223a1edd968e82ea88501b63d21a
In-Reply-To: <20191023134838.21280-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <mahesh@linux.vnet.ibm.com>, <ganeshgr@linux.ibm.com>,
 <yuehaibing@huawei.com>, <gregkh@linuxfoundation.org>, <npiggin@gmail.com>,
 <tglx@linutronix.de>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [RESEND][PATCH] powerpc/pseries: Use correct event modifier in
 rtas_parse_epow_errlog()
Message-Id: <47DFxp4XN4z9sSK@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:58 +1100 (AEDT)
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

On Wed, 2019-10-23 at 13:48:38 UTC, YueHaibing wrote:
> rtas_parse_epow_errlog() should pass 'modifier' to
> handle_system_shutdown, because event modifier only use
> bottom 4 bits.
> 
> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d273fa919c39223a1edd968e82ea88501b63d21a

cheers
