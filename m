Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9E1B15D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 09:43:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452Xr63n7dzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 17:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="n521izPq"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452Xpc0mDNzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 17:42:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VwWaCvylTCaLHw+6DT0w79x97A1ZSuZWlJ92u/d8prU=; b=n521izPq4pQ3Y7jkOsXK8CRdn
 1GhBAsjjGQgimiJBd45a4dRCe0EOpqqyTHeSPBnrOqFeFqE/zXp59qkz0uzY1/JW387BuCe0cEDRm
 jjej8oETaIhc82OhaU5TiX0s2eSkyyI25iwbvMNrt2UUt3NfFP6ETjmvoo11WL2iQc7bSjxQ4wR3B
 WYmVHfiZqj45L9LsQysHaS/MpT0OzMXtAFYTPHmiHLo7W48anZ8puE0qKN1+9K/pqZ9H5Xmxw0Mgy
 wvB0ctU5RUk2ZiN7chAjXOQ3f/pAXjCyqxAjXvIB+YjUhbafdcIxwCL2SOG1RmfG7DrLlIP19HfUT
 rrOewEDHQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ5bE-00057c-47; Mon, 13 May 2019 07:42:16 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8AD0F2029F87A; Mon, 13 May 2019 09:42:13 +0200 (CEST)
Date: Mon, 13 May 2019 09:42:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 1/2] perf ioctl: Add check for the sample_period value
Message-ID: <20190513074213.GH2623@hirez.programming.kicks-ass.net>
References: <20190511024217.4013-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190511024217.4013-1-ravi.bangoria@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, acme@kernel.org, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 11, 2019 at 08:12:16AM +0530, Ravi Bangoria wrote:
> Add a check for sample_period value sent from userspace. Negative
> value does not make sense. And in powerpc arch code this could cause
> a recursive PMI leading to a hang (reported when running perf-fuzzer).
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  kernel/events/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index abbd4b3b96c2..e44c90378940 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -5005,6 +5005,9 @@ static int perf_event_period(struct perf_event *event, u64 __user *arg)
>  	if (perf_event_check_period(event, value))
>  		return -EINVAL;
>  
> +	if (!event->attr.freq && (value & (1ULL << 63)))
> +		return -EINVAL;

Well, perf_event_attr::sample_period is __u64. Would not be the site
using it as signed be the one in error?
