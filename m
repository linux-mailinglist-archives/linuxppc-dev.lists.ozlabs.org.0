Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBEFC26C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:16:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DG7Z74M2zF2PY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:16:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxQ4YzLzF4ln
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxP5npwz9sPF; Thu, 14 Nov 2019 20:07:37 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: bc75e5438488edef80d952d1146701f872092750
In-Reply-To: <20190702131733.44100-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <robh@kernel.org>, <gregkh@linuxfoundation.org>,
 <tglx@linutronix.de>, <allison@lohutok.net>, <groug@kaod.org>,
 <shilpa.bhat@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH -next] powerpc/powernv: Make some sysbols static
Message-Id: <47DFxP5npwz9sPF@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:37 +1100 (AEDT)
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

On Tue, 2019-07-02 at 13:17:33 UTC, YueHaibing wrote:
> Fix sparse warnings:
> 
> arch/powerpc/platforms/powernv/opal-psr.c:20:1:
>  warning: symbol 'psr_mutex' was not declared. Should it be static?
> arch/powerpc/platforms/powernv/opal-psr.c:27:3:
>  warning: symbol 'psr_attrs' was not declared. Should it be static?
> arch/powerpc/platforms/powernv/opal-powercap.c:20:1:
>  warning: symbol 'powercap_mutex' was not declared. Should it be static?
> arch/powerpc/platforms/powernv/opal-sensor-groups.c:20:1:
>  warning: symbol 'sg_mutex' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/bc75e5438488edef80d952d1146701f872092750

cheers
