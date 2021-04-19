Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF23639F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtY85q3Wz3dnp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVQ4Mtdz3cDv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:14 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVQ0MPcz9vG3; Mon, 19 Apr 2021 14:04:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Bixuan Cui <cuibixuan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210409090119.59444-1-cuibixuan@huawei.com>
References: <20210409090119.59444-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/perf: Make symbol 'isa207_pmu_format_attr'
 static
Message-Id: <161880479814.1398509.6067179315782910479.b4-ty@ellerman.id.au>
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

On Fri, 9 Apr 2021 17:01:19 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/perf/isa207-common.c:24:18: warning:
>  symbol 'isa207_pmu_format_attr' was not declared. Should it be static?
> 
> This symbol is not used outside of isa207-common.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] powerpc/perf: Make symbol 'isa207_pmu_format_attr' static
      https://git.kernel.org/powerpc/c/107dadb046178173dea18e0a78ff8ea3cc27c213

cheers
