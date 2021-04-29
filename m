Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3FF36EBF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHMg0WCQz3btx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJ90QYWz30KH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:33 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJ70nrLz9t1D; Fri, 30 Apr 2021 00:02:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Leonardo Bras <leobras.c@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <20210318174414.684630-1-leobras.c@gmail.com>
References: <20210318174414.684630-1-leobras.c@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs
Message-Id: <161970488591.4033873.12136899463811308450.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:25 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Mar 2021 14:44:14 -0300, Leonardo Bras wrote:
> Currently both iommu_alloc_coherent() and iommu_free_coherent() align the
> desired allocation size to PAGE_SIZE, and gets system pages and IOMMU
> mappings (TCEs) for that value.
> 
> When IOMMU_PAGE_SIZE < PAGE_SIZE, this behavior may cause unnecessary
> TCEs to be created for mapping the whole system page.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs
      https://git.kernel.org/powerpc/c/3c0468d4451eb6b4f6604370639f163f9637a479

cheers
