Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E08FC14E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:31:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X6SZkmnf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv90X6vyJz3fnM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X6SZkmnf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vbabka@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv3006rtZz3cY1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 07:00:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 723F2614E1;
	Tue,  4 Jun 2024 21:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02085C2BBFC;
	Tue,  4 Jun 2024 21:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717534831;
	bh=y2QXvMKu+toawTwirI1umsvW2EK6ZKNHpsp7PVAKxNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X6SZkmnfZNgOG3Y3weWs3ETi/VO+/8FSLGaEoUwWuqLXTY+QWWASCFl7GDG8ZuDYY
	 WUGo/nq/1yyD6/1E9RZwQ0gQNaw7wvYTOxdctLnUUvGc8e8UBk70GAHvtAtllUogFZ
	 8w8QyXtLYb6/U3wSGLRWhHL6h6bXtvRpsKtHn6uAZTsmwIBmjp3dJqYF0ntVRjq5OP
	 Q0PXMqPXX4Bm3KwVcHMW9SIf4aL+HFzr/sMZIy0N4mn43ZTCOpKn8j3qdcbmOH25eJ
	 QfIKgwYun7772uIhfxPV5HsYtwifcSZ6P8JqKO8hMiS6sGhhFnQkOGCJ0uDa0U8ZJJ
	 UdLaDsEIykCJg==
Message-ID: <f1f527d6-2866-4a64-8018-453c468c88ab@kernel.org>
Date: Tue, 4 Jun 2024 23:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Content-Language: en-US
To: Yosry Ahmed <yosryahmed@google.com>, Yu Zhao <yuzhao@google.com>
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
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Jun 2024 11:28:46 +1000
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/4/24 8:01 PM, Yosry Ahmed wrote:
> On Tue, Jun 4, 2024 at 10:54 AM Yu Zhao <yuzhao@google.com> wrote:
>> There was a lot of user memory in the DMA zone. So at a point the
>> highmem zone was full and allocation fallback happened.
>>
>> The problem with zone fallback is that recent allocations go into
>> lower zones, meaning they are further back on the LRU list. This
>> applies to both user memory and zsmalloc memory -- the latter has a
>> writeback LRU. On top of this, neither the zswap shrinker nor the
>> zsmalloc shrinker (compaction) is zone aware. So page reclaim might
>> have trouble hitting the right target zone.
> 
> I see what you mean. In this case, yeah I think the internal
> fragmentation in the zsmalloc pools may be the reason behind the
> problem.
> 
> How many CPUs does this machine have? I am wondering if 32 can be an
> overkill for small machines, perhaps the number of pools should be
> max(nr_cpus, 32)?
> 
> Alternatively, the number of pools should scale with the memory size
> in some way, such that we only increase fragmentation when it's
> tolerable.

Sounds like a good idea to me, maybe a combination of both. No point in
trying to scale if there's no benefit and only downside of more memory
consumption.
