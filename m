Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F34A2A22E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 02:56:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459lDG4ClvzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 10:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459lBb6zpQzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 10:54:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 459lBb45HVz9sB8; Sat, 25 May 2019 10:54:47 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3202e35ec1c8fc19cea24253ff83edf702a60a02
X-Patchwork-Hint: ignore
In-Reply-To: <20190511024217.4013-2-ravi.bangoria@linux.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 jolsa@redhat.com, maddy@linux.vnet.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc/perf: Fix mmcra corruption by bhrb_filter
Message-Id: <459lBb45HVz9sB8@ozlabs.org>
Date: Sat, 25 May 2019 10:54:47 +1000 (AEST)
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, acme@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-05-11 at 02:42:17 UTC, Ravi Bangoria wrote:
> Consider a scenario where user creates two events:
> 
>   1st event:
>     attr.sample_type |= PERF_SAMPLE_BRANCH_STACK;
>     attr.branch_sample_type = PERF_SAMPLE_BRANCH_ANY;
>     fd = perf_event_open(attr, 0, 1, -1, 0);
> 
>   This sets cpuhw->bhrb_filter to 0 and returns valid fd.
> 
>   2nd event:
>     attr.sample_type |= PERF_SAMPLE_BRANCH_STACK;
>     attr.branch_sample_type = PERF_SAMPLE_BRANCH_CALL;
>     fd = perf_event_open(attr, 0, 1, -1, 0);
> 
>   It overrides cpuhw->bhrb_filter to -1 and returns with error.
> 
> Now if power_pmu_enable() gets called by any path other than
> power_pmu_add(), ppmu->config_bhrb(-1) will set mmcra to -1.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/3202e35ec1c8fc19cea24253ff83edf7

cheers
