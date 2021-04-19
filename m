Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F33639F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:06:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtXq3r6vz3dhn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVP514Zz3byr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:13 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVP1HGSz9vGp; Mon, 19 Apr 2021 14:04:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Bixuan Cui <cuibixuan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Kajol Jain <kjain@linux.ibm.com>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
In-Reply-To: <20210409090124.59492-1-cuibixuan@huawei.com>
References: <20210409090124.59492-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/perf/hv-24x7: Make some symbols static
Message-Id: <161880479840.1398509.5195313938984929332.b4-ty@ellerman.id.au>
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

On Fri, 9 Apr 2021 17:01:24 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/perf/hv-24x7.c:229:1: warning:
>  symbol '__pcpu_scope_hv_24x7_txn_flags' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:230:1: warning:
>  symbol '__pcpu_scope_hv_24x7_txn_err' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:236:1: warning:
>  symbol '__pcpu_scope_hv_24x7_hw' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:244:1: warning:
>  symbol '__pcpu_scope_hv_24x7_reqb' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:245:1: warning:
>  symbol '__pcpu_scope_hv_24x7_resb' was not declared. Should it be static?
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf/hv-24x7: Make some symbols static
      https://git.kernel.org/powerpc/c/cc331eee03eadd750af1fb957d020b3f24e5e056

cheers
