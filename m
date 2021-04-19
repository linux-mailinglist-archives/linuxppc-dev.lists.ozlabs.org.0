Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092F3639FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtZB75FCz3f39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVT3kz2z3cFX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:17 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVS6yCjz9vH2; Mon, 19 Apr 2021 14:04:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bixuan Cui <cuibixuan@huawei.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
In-Reply-To: <20210409090114.59396-1-cuibixuan@huawei.com>
References: <20210409090114.59396-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/pseries/pmem: Make symbol 'drc_pmem_match'
 static
Message-Id: <161880479788.1398509.10114956156127750502.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:57 +1000
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

On Fri, 9 Apr 2021 17:01:14 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/platforms/pseries/pmem.c:142:27: warning:
>  symbol 'drc_pmem_match' was not declared. Should it be static?
> 
> This symbol is not used outside of pmem.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] powerpc/pseries/pmem: Make symbol 'drc_pmem_match' static
      https://git.kernel.org/powerpc/c/2235dea17d56238642121a8085b71d68598534bb

cheers
