Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594BE8FF307
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 18:54:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DSQS1HFl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw9R634Jzz3fpc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 02:54:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DSQS1HFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=vbabka@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw9QN31tVz3fnW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 02:53:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46A2FCE1BFC;
	Thu,  6 Jun 2024 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0919AC2BD10;
	Thu,  6 Jun 2024 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717692822;
	bh=UfPRa8N1NpQXy0hUsyfCoV9/IzKPawQ3WxpkEv4gwoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DSQS1HFlpBRZ83O1xKUSI5diJtuOlVYBr2LgczQEvleXWNd6HpjbexSOBzjkR5WbY
	 BSqiVya+7Z5Bxpd4p20MoH6QOAgx/Yz2qeT8KVm2+c702w87lV+lvfZKQtx/IHYQBm
	 9SXDanaV5WWdi9qzuEQcE+lIZWxbw3xOX44VoXmhi7nWvpqr+DTOSjMf7gkEHSIHGR
	 KTWPQ+OvIoPA48E78fLk923VjkKy2Oi09ajoH1Hs9dRIYbCMCpdyOhVxh7Bbkx9rWV
	 dcJHbFamIVno+gXC6hCG/CPK3BIgvvhxAsmR4o9jYW5ToB/sh5wGsfDcMSSReJG8FP
	 +54Rq6Ik/+LXg==
Message-ID: <e1b78d49-72ef-4c9e-be1c-919a72940b1b@kernel.org>
Date: Thu, 6 Jun 2024 18:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Content-Language: en-US
To: Erhard Furtner <erhard_f@mailbox.org>
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea>
 <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea>
 <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea>
 <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <fd7fafb9-09be-48b1-ba52-57e52c6d973a@kernel.org>
 <20240606153210.18ef5299@yea>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20240606153210.18ef5299@yea>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/6/24 3:32 PM, Erhard Furtner wrote:
> On Thu, 6 Jun 2024 09:24:56 +0200
> "Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:
> 
>> Besides the zpool commit which might have just pushed the machine over the
>> edge, but it was probably close to it already. I've noticed a more general
>> problem that there are GFP_KERNEL allocations failing from kswapd. Those
>> could probably use be __GFP_NOMEMALLOC (or scoped variant, is there one?)
>> since it's the case of "allocating memory to free memory". Or use mempools
>> if the progress (success will lead to freeing memory) is really guaranteed.
>> 
>> Another interesting data point could be to see if traditional reclaim
>> behaves any better on this machine than MGLRU. I saw in the config:
>> 
>> CONFIG_LRU_GEN=y
>> CONFIG_LRU_GEN_ENABLED=y
>> 
>> So disabling at least the second one would revert to the traditional reclaim
>> and we could see if it handles such a constrained system better or not.
> 
> I set RANDOM_KMALLOC_CACHES=n and LRU_GEN_ENABLED=n but still hit the issue.
> 
> dmesg looks a bit different (unpatched v6.10-rc2).

What caught my eye, but it's also in some of the previous dmesg with MGRLU,
is that in one case there's:

DMA free:0kB

That means many allocations went through that are allowed to just ignore all
reserves, and depleted everything. That would mean __GFP_MEMALLOC or
PF_MEMALLOC, which I suggested earlier for the GFP_KERNEL failure, is being
used somewhere, but not leading to the expected memory freeing.

> Regards,
> Erhard

