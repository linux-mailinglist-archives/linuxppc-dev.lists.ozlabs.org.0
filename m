Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB1B415CAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 13:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFXhc1D8Tz2ywt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 21:18:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bWhQSk6S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bWhQSk6S; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFXgv1jrbz2yQ4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 21:17:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632395849;
 bh=wpMAXeUftY90EfwNTfhWfU/kwG7SCN6yvhEYWL11EqU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bWhQSk6Sggu/Onr7qRj/U1QMOlbV5qoC9O6hgBA1PCXTD8Wf9IVbuObQ0lTrmJ6mv
 +0PJ3MIwzBn5vMYPwTlHGdiooxIdZ1kUeM9YrYtuqzDffz1yV51pWjkfvOFSw1VTfW
 daSANsij4gtEAXgY15U+VA7kYSBWi8iuocweQJzSKU9x/wZhwWF30IHdxgAIR/PwZB
 fVpV03OF0yGBg57r4X8l6Q46m1D1/b0bW9JwFH2BDguZWv6MiwcMepGS/sE6Tboyur
 85huaE0jNYxoVTt7e6Pf0LW4Vdl9TUR7co6/yVmF/c8/U3o0R4oQqMDw77OosD+t5J
 +Ymu/x+wdr1UA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HFXgr3tvvz9sXk;
 Thu, 23 Sep 2021 21:17:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] powerpc/numa: Fill distance_lookup_table for
 offline nodes
In-Reply-To: <20210901102206.GO21942@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-4-srikar@linux.vnet.ibm.com>
 <875yvsba4q.fsf@mpe.ellerman.id.au>
 <20210901102206.GO21942@linux.vnet.ibm.com>
Date: Thu, 23 Sep 2021 21:17:25 +1000
Message-ID: <871r5fmth6.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2021-08-26 23:36:53]:
>
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > Scheduler expects unique number of node distances to be available at
>> > boot.
...
>
>> > Fake the offline node's distance_lookup_table entries so that all
>> > possible node distances are updated.
>> 
>> Does this work if we have a single node offline at boot?
>> 
>
> It should.
>
>> Say we start with:
>> 
>> node distances:
>> node   0   1
>>   0:  10  20
>>   1:  20  10
>> 
>> And node 2 is offline at boot. We can only initialise that nodes entries
>> in the distance_lookup_table:
>> 
>> 		while (i--)
>> 			distance_lookup_table[node][i] = node;
>> 
>> By filling them all with 2 that causes node_distance(2, X) to return the
>> maximum distance for all other nodes X, because we won't break out of
>> the loop in __node_distance():
>> 
>> 	for (i = 0; i < distance_ref_points_depth; i++) {
>> 		if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
>> 			break;
>> 
>> 		/* Double the distance for each NUMA level */
>> 		distance *= 2;
>> 	}
>> 
>> If distance_ref_points_depth was 4 we'd return 160.
>
> As you already know, distance 10, 20, .. are defined by Powerpc, form1
> affinity. PAPR doesn't define actual distances, it only provides us the
> associativity. If there are distance_ref_points_depth is 4,
> (distance_ref_points_depth doesn't take local distance into consideration)
> 10, 20, 40, 80, 160.
>
>> 
>> That'd leave us with 3 unique distances at boot, 10, 20, 160.
>> 
>
> So if there are unique distances, then the distances as per the current
> code has to be 10, 20, 40, 80.. I dont see a way in which we have a break in
> the series. like having 160 without 80.

I'm confused what you mean there.

If we have a node that's offline at boot then we get 160 for that node,
that's just the result of having no info for it, so we never break out
of the for loop.

So if we have two nodes, one hop apart, and then an offline node we get
10, 20, 160.

Or if you're using depth = 3 then it's 10, 20, 80.

>> But when node 2 comes online it might introduce more than 1 new distance
>> value, eg. it could be that the actual distances are:
>> 
>> node distances:
>> node   0   1   2
>>   0:  10  20  40
>>   1:  20  10  80
>>   2:  40  80  10
>> 
>> ie. we now have 4 distances, 10, 20, 40, 80.
>> 
>> What am I missing?
>
> As I said above, I am not sure how we can have a break in the series.
> If distance_ref_points_depth is 3, the distances has to be 10,20,40,80 as
> atleast for form1 affinity.

I agree for depth 3 we have to see 10, 20, 40, 80. But nothing
guarantees we see each value (other than 10).

We can have two nodes one hop apart, so we have 10 and 20, then a third
node is added 3 hops away, so we get 10, 20, 80.

The real problem is that the third node could be 3 hops from node 0
and 2 hops from node 1, and so the addition of the third node causes
two new distance values (40 & 80) to be required.

I think maybe what you're saying is that in practice we don't see setups
like that. But I don't know if I'm happy with a solution that doesn't
work in the general case, and relies on the particular properties of our
current set of systems.

Possibly we just need to detect that case and WARN about it. The only
problem is we won't know until the system is already up and running, ie.
we can't know at boot that the onlining of the third node will cause 2
new distance values to be added.

cheers
