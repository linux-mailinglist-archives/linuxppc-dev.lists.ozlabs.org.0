Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452736EBD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:03:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHKF1NMWz30Gp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHHy4KRcz302c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:22 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHHs1hNRz9sXL; Fri, 30 Apr 2021 00:02:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210216033307.69863-1-aik@ozlabs.ru>
References: <20210216033307.69863-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/2] powerpc/iommu: Stop crashing the host when VM
 is terminated
Message-Id: <161970488532.4033873.2132452477310887918.b4-ty@ellerman.id.au>
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Feb 2021 14:33:05 +1100, Alexey Kardashevskiy wrote:
> Killing a VM on a host under memory pressure kills a host which is
> annoying. 1/2 reduces the chances, 2/2 eliminates panic() on
> ioda2.
> 
> 
> This is based on sha1
> f40ddce88593 Linus Torvalds "Linux 5.11".
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/iommu: Allocate it_map by vmalloc
      https://git.kernel.org/powerpc/c/7f1fa82d79947dfabb4046e1d787da9db2bc1c20
[2/2] powerpc/iommu: Do not immediately panic when failed IOMMU table allocation
      https://git.kernel.org/powerpc/c/4be518d838809e21354f32087aa9c26efc50b410

cheers
