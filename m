Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371E94472E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 10:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNBF1cbCz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 18:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZN9r068Fz3cXH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 18:56:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38CF5CE12D4;
	Thu,  1 Aug 2024 08:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E209C32786;
	Thu,  1 Aug 2024 08:56:26 +0000 (UTC)
Date: Thu, 1 Aug 2024 09:56:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v4 1/2] dma: improve DMA zone selection
Message-ID: <ZqtNtxKxBurIQEq0@arm.com>
References: <cover.1722499975.git.baruch@tkos.co.il>
 <f8f4da7ea3ead153ca21e628ca90e24fd0e7206e.1722499975.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8f4da7ea3ead153ca21e628ca90e24fd0e7206e.1722499975.git.baruch@tkos.co.il>
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
Cc: linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2024 at 11:25:06AM +0300, Baruch Siach wrote:
> When device DMA limit does not fit in DMA32 zone it should use DMA zone,
> even when DMA zone is stricter than needed.
> 
> Same goes for devices that can't allocate from the entire normal zone.
> Limit to DMA32 in that case.
> 
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

This looks fine to me now.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
