Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E14051EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 14:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4zKG6RMdz2yp5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 22:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C2InCR5m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=C2InCR5m; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4zJY07FMz2xWT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 22:46:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631191563;
 bh=+HVI0XghzcJKkgiW87QzoZzI0ZQ7j9m77j9OMcB3aro=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=C2InCR5mGc1TG/bT5ZgNme4RPUeuOzrkaEQxsyWUaEs1qnzjuOFtd0L+biCl0slwl
 fIrDvqD6ZvXUBI/7MWk1eH7MO33l+QcFMeY/imehorEQe0RMrBl0IkItYV/bRIdvja
 GVkphSFtzmQrlncOXtLRqHnlmKJey4mKwHugBJ2q42Hi2VYxWNf4wQAFW2EXZhILUs
 qvBhYfMbBSGUVjI/hneDEjfdBjOqGFPUTTkNwjJCJUqExiii+CGSp+8l4b9dleVf0L
 o6ZzXTzstX+fyHxeC8wllyrRHvnstabNMve1/K22KImd4g1lMJk3kXBLIixoquxayT
 EOJFMf7wBCT6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H4zJS6KZGz9vDS;
 Thu,  9 Sep 2021 22:46:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] perf: Add macros to specify onchip L2/L3 accesses
In-Reply-To: <YTiBqbxe7ieqY2OE@hirez.programming.kicks-ass.net>
References: <20210904064932.307610-1-kjain@linux.ibm.com>
 <87ilzbmt7i.fsf@mpe.ellerman.id.au>
 <YTiBqbxe7ieqY2OE@hirez.programming.kicks-ass.net>
Date: Thu, 09 Sep 2021 22:45:54 +1000
Message-ID: <87czphnchp.fsf@mpe.ellerman.id.au>
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
> On Wed, Sep 08, 2021 at 05:17:53PM +1000, Michael Ellerman wrote:
>> Kajol Jain <kjain@linux.ibm.com> writes:
>
>> > diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
>> > index f92880a15645..030b3e990ac3 100644
>> > --- a/include/uapi/linux/perf_event.h
>> > +++ b/include/uapi/linux/perf_event.h
>> > @@ -1265,7 +1265,9 @@ union perf_mem_data_src {
>> >  #define PERF_MEM_LVLNUM_L2	0x02 /* L2 */
>> >  #define PERF_MEM_LVLNUM_L3	0x03 /* L3 */
>> >  #define PERF_MEM_LVLNUM_L4	0x04 /* L4 */
>> > -/* 5-0xa available */
>> > +#define PERF_MEM_LVLNUM_OC_L2	0x05 /* On Chip L2 */
>> > +#define PERF_MEM_LVLNUM_OC_L3	0x06 /* On Chip L3 */
>> 
>> The obvious use for 5 is for "L5" and so on.
>> 
>> I'm not sure adding new levels is the best idea, because these don't fit
>> neatly into the hierarchy, they are off to the side.
>> 
>> 
>> I wonder if we should use the remote field.
>> 
>> ie. for another core's L2 we set:
>> 
>>   mem_lvl = PERF_MEM_LVL_L2
>>   mem_remote = 1
>
> This mixes APIs (see below), IIUC the correct usage would be something
> like: lvl_num=L2 remote=1

Aha, I was wondering how lvl and lvl_num were supposed to interact.

>> Which would mean "remote L2", but not remote enough to be
>> lvl = PERF_MEM_LVL_REM_CCE1.
>> 
>> It would be printed by the existing tools/perf code as "Remote L2", vs
>> "Remote cache (1 hop)", which seems OK.
>> 
>> 
>> ie. we'd be able to express:
>> 
>>   Current core's L2: LVL_L2
>>   Other core's L2:   LVL_L2 | REMOTE
>>   Other chip's L2:   LVL_REM_CCE1 | REMOTE
>> 
>> And similarly for L3.
>> 
>> I think that makes sense? Unless people think remote should be reserved
>> to mean on another chip, though we already have REM_CCE1 for that.
>
> IIRC the PERF_MEM_LVL_* namespace is somewhat depricated in favour of
> the newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_} fields. Of
> course, ABIs being what they are, we get to support both :/ But I'm not
> sure mixing them is a great idea.

OK.

> Also, clearly this could use a comment...
>
> The 'new' composite doesnt have a hops field because the hardware that
> nessecitated that change doesn't report it, but we could easily add a
> field there.
>
> Suppose we add, mem_hops:3 (would 6 hops be too small?) and the
> corresponding PERF_MEM_HOPS_{NA, 0..6}

It's really 7 if we use remote && hop = 0 to mean the first hop.

If we're wanting to use some of the hop levels to represent
intra-chip/package hops then we could possibly use them all on a really
big system.

eg. you could imagine something like:

 L2 | 		        - local L2
 L2 | REMOTE | HOPS_0	- L2 of neighbour core
 L2 | REMOTE | HOPS_1	- L2 of near core on same chip (same 1/2 of chip)
 L2 | REMOTE | HOPS_2	- L2 of far core on same chip (other 1/2 of chip)
 L2 | REMOTE | HOPS_3	- L2 of sibling chip in same package
 L2 | REMOTE | HOPS_4	- L2 on separate package 1 hop away
 L2 | REMOTE | HOPS_5	- L2 on separate package 2 hops away
 L2 | REMOTE | HOPS_6	- L2 on separate package 3 hops away


Whether it's useful to represent all those levels I'm not sure, but it's
probably good if we have the ability.

I guess I'm 50/50 on whether that's enough levels, or whether we want
another bit to allow for future growth.

> Then I suppose you can encode things like:
> 
> 	L2			- local L2
> 	L2 | REMOTE		- remote L2 at an unspecified distance (NA)
> 	L2 | REMOTE | HOPS_0	- remote L2 on the same node
> 	L2 | REMOTE | HOPS_1	- remote L2 on a node 1 removed
> 
> Would that work?

Yeah that looks good to me.

cheers
