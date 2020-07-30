Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF4233329
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:35:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWcV0F1BzDqGM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVd40TYWzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVd31wkwz9sTS; Thu, 30 Jul 2020 22:50:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Wei Yongjun <weiyongjun1@huawei.com>,
 Hulk Robot <hulkci@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20200727171112.2781-1-weiyongjun1@huawei.com>
References: <20200727171112.2781-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] powerpc/powernv/sriov: Remove unused but set
 variable 'phb'
Message-Id: <159611328042.1601380.2744826699786899081.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:30 +1000 (AEST)
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

On Tue, 28 Jul 2020 01:11:12 +0800, Wei Yongjun wrote:
> Gcc report warning as follows:
> 
> arch/powerpc/platforms/powernv/pci-sriov.c:602:25: warning:
>  variable 'phb' set but not used [-Wunused-but-set-variable]
>   602 |  struct pnv_phb        *phb;
>       |                         ^~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/sriov: Remove unused but set variable 'phb'
      https://git.kernel.org/powerpc/c/cf1ae052e073c7ef6cf1a783a6427f7228253bd3

cheers
