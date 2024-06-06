Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC978FDE7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 08:07:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iwKwqsfj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvv4g6kx8z3cbR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 16:07:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iwKwqsfj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=chengming.zhou@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 608 seconds by postgrey-1.37 at boromir; Thu, 06 Jun 2024 16:06:52 AEST
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvv3w3tL1z3cWm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 16:06:50 +1000 (AEST)
X-Envelope-To: senozhatsky@chromium.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717653378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8Z5XmpUE3zx1Y8cy7cbU/CoYCfPRTM2B2i5o3MFz18=;
	b=iwKwqsfjoGXVgQe/po1O8i4bOhN+NhoK5vwBxCPBRqhvuJO6LC62WtY9E5l6kKozckGXAN
	ENQD0kw1r5cy9frpP4esDYHVVJkYEgPMeRbsQqoP8S+NpNI4S+mRQgCBad5qPF4uRF7Akg
	A+vmKupx/CjWu2gH98ucZkabpnMTcQs=
X-Envelope-To: yosryahmed@google.com
X-Envelope-To: erhard_f@mailbox.org
X-Envelope-To: yuzhao@google.com
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: hannes@cmpxchg.org
X-Envelope-To: nphamcs@gmail.com
X-Envelope-To: minchan@kernel.org
X-Envelope-To: vbabka@kernel.org
Message-ID: <f92e6d70-32e3-4f45-8fe8-0b7af7a14bc6@linux.dev>
Date: Thu, 6 Jun 2024 13:55:50 +0800
MIME-Version: 1.0
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>
References: <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea>
 <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea>
 <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <e68bcc6a-25b1-42aa-83b3-5d457b254cbe@linux.dev>
 <20240606043156.GC11718@google.com>
 <6335c05d-9493-4b03-85a7-f2dd91db9451@linux.dev>
 <20240606054334.GD11718@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20240606054334.GD11718@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024/6/6 13:43, Sergey Senozhatsky wrote:
> On (24/06/06 12:46), Chengming Zhou wrote:
>>>> Agree, I think we should try to improve locking scalability of zsmalloc.
>>>> I have some thoughts to share, no code or test data yet:
>>>>
>>>> 1. First, we can change the pool global lock to per-class lock, which
>>>>    is more fine-grained.
>>>
>>> Commit c0547d0b6a4b6 "zsmalloc: consolidate zs_pool's migrate_lock
>>> and size_class's locks" [1] claimed no significant difference
>>> between class->lock and pool->lock.
>>
>> Ok, I haven't looked into the history much, that seems preparation of trying
>> to introduce reclaim in the zsmalloc? Not sure. But now with the reclaim code
>> in zsmalloc has gone, should we change back to the per-class lock? Which is
> 
> Well, the point that commit made was that Nhat (and Johannes?) were
> unable to detect any impact of pool->lock on a variety of cases.  So
> we went on with code simplification.

Right, the code is simpler.

> 
>> obviously more fine-grained than the pool lock. Actually, I have just done it,
>> will test to get some data later.
> 
> Thanks, we'll need data on this.  I'm happy to take the patch, but
> jumping back and forth between class->lock and pool->lock merely
> "for obvious reasons" is not what I'm extremely excited about.

Yeah, agree, we need test data.
