Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7D40ABDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 12:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H80JK5tSdz2yJJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 20:41:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EGrBq3Kt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EGrBq3Kt; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H80Hb67Jpz2xt3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 20:40:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631616042;
 bh=PgQZCFTfY6IZcgN58w46zz5hDYowlMLp1ghqMp4Hbg4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EGrBq3KtE7FY3m14RhG6YIW5oblfrdOfbZhgOWEM5IeSyeUFIJ/avloWh8HYU8BZR
 qGyKeFE5BzeOYdOA91GJ1LyYSmusJ/TOmpQ/UoD/omsdookewViKftpBRcpdfsLpbY
 exiKjbh9JeJQg4kTbRhRvIp0aDJCYPZKjjicwvtmICoEXJv0K68ZHNbzdhNTbJMw28
 WvcQcT7a4jwDunE0OxcRi6S2CNSbtr2eR6EqOJYveDylZ0larAzxpFey4n1PDxGnK6
 wckS1WiwMl7tmNDJ46aTSixUN725HjtzMzygV8R2h3/QO4HT10SAF3onZXTjvdc3oQ
 7a8E1Gxc5VDoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H80HX53Zzz9sSn;
 Tue, 14 Sep 2021 20:40:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] perf: Add macros to specify onchip L2/L3 accesses
In-Reply-To: <YTob/xfn1gt901K4@hirez.programming.kicks-ass.net>
References: <20210904064932.307610-1-kjain@linux.ibm.com>
 <87ilzbmt7i.fsf@mpe.ellerman.id.au>
 <YTiBqbxe7ieqY2OE@hirez.programming.kicks-ass.net>
 <87czphnchp.fsf@mpe.ellerman.id.au>
 <YTob/xfn1gt901K4@hirez.programming.kicks-ass.net>
Date: Tue, 14 Sep 2021 20:40:38 +1000
Message-ID: <87k0jjl9sp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mark.rutland@arm.com, atrajeev@linux.vnet.ibm.com, ak@linux.intel.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, Kajol Jain <kjain@linux.ibm.com>,
 linux-kernel@vger.kernel.org, acme@kernel.org, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Thu, Sep 09, 2021 at 10:45:54PM +1000, Michael Ellerman wrote:
>
>> > The 'new' composite doesnt have a hops field because the hardware that
>> > nessecitated that change doesn't report it, but we could easily add a
>> > field there.
>> >
>> > Suppose we add, mem_hops:3 (would 6 hops be too small?) and the
>> > corresponding PERF_MEM_HOPS_{NA, 0..6}
>> 
>> It's really 7 if we use remote && hop = 0 to mean the first hop.
>
> I don't think we can do that, becaus of backward compat. Currently:
>
>   lvl_num=DRAM, remote=1
>
> denites: "Remote DRAM of any distance". Effectively it would have the new
> hops field filled with zeros though, so if you then decode with the hops
> field added it suddenly becomes:
>
>  lvl_num=DRAM, remote=1, hops=0
>
> and reads like: "Remote DRAM of 0 hops" which is quite daft. Therefore 0
> really must denote a 'N/A'.

Ah yeah, duh, it needs to be backward compatible.

>> If we're wanting to use some of the hop levels to represent
>> intra-chip/package hops then we could possibly use them all on a really
>> big system.
>> 
>> eg. you could imagine something like:
>> 
>>  L2 | 		        - local L2
>>  L2 | REMOTE | HOPS_0	- L2 of neighbour core
>>  L2 | REMOTE | HOPS_1	- L2 of near core on same chip (same 1/2 of chip)
>>  L2 | REMOTE | HOPS_2	- L2 of far core on same chip (other 1/2 of chip)
>>  L2 | REMOTE | HOPS_3	- L2 of sibling chip in same package
>>  L2 | REMOTE | HOPS_4	- L2 on separate package 1 hop away
>>  L2 | REMOTE | HOPS_5	- L2 on separate package 2 hops away
>>  L2 | REMOTE | HOPS_6	- L2 on separate package 3 hops away
>> 
>> 
>> Whether it's useful to represent all those levels I'm not sure, but it's
>> probably good if we have the ability.
>
> I'm thinking we ought to keep hops as steps along the NUMA fabric, with
> 0 hops being the local node. That only gets us:
>
>  L2, remote=0, hops=HOPS_0 -- our L2
>  L2, remote=1, hops=HOPS_0 -- L2 on the local node but not ours
>  L2, remote=1, hops!=HOPS_0 -- L2 on a remote node

Hmm. I'm not sure about tying it directly to NUMA hops. I worry we're
going to see more and more systems where there's a hierarchy within the
chip/package, in addition to the traditional NUMA hierarchy.

Although then I guess it becomes a question of what exactly is a NUMA
hop, maybe the answer is that on those future systems those
intra-chip/package hops should be represented as NUMA hops.

It's not like we have a hard definition of what a NUMA hop is?

>> I guess I'm 50/50 on whether that's enough levels, or whether we want
>> another bit to allow for future growth.
>
> Right, possibly safer to add one extra bit while we can.... I suppose.

Equally it's not _that_ hard to add another bit later (if there's still
one free), makes the API a little uglier to use, but not the end of the
world.

cheers
