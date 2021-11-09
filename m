Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8944A1D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 02:11:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp90Y6HK7z3c73
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 12:11:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r4UUyTsz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp8zy37cQz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 12:10:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=r4UUyTsz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hp8zy15kWz4xcM;
 Tue,  9 Nov 2021 12:10:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636420238;
 bh=dwMkpmwkn1OnwCTziIkJycYTtCFDHFcf9cyX+wheMbM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=r4UUyTsz1RjfgUre4cJ3yI5ZsW/2AqwhAww9im868qHeYyCExWkD08ZQuNykj6FBj
 ZJfrkWGHhutC4a65bdU5uQXUd+0L7PolaM6PcTExT0E//qPD3W3IqWuNOpkH6XSfqM
 EJTAhoOs+ayRxhvx8gKgWNTlFMfg2Hp+JjnwWDD+Z2wlfajdg8T8So0ffZIDDQi7dt
 gbE7yPBrnZqHvN04ODZj2dkQCnKJMfwhBWjFiJGqyFMB3Ea930qxbbPxTuFE1CVsuW
 vYjksc8SRQ/AUWWYTWelYEyVcsiYHkiFV8cu1YPaBZ+tlN9ZfYqGDnvT9ouNyWsFQ6
 Mfb+1w/bgCYuA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Fix numa FORM2 parsing fallback code
In-Reply-To: <1636379534.jahqi8gtfo.astroid@bobo.none>
References: <20211105132909.1582449-1-npiggin@gmail.com>
 <87sfw76x5a.fsf@mpe.ellerman.id.au>
 <1636379534.jahqi8gtfo.astroid@bobo.none>
Date: Tue, 09 Nov 2021 12:10:37 +1100
Message-ID: <87sfw6m8vm.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of November 8, 2021 3:20 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> In case the FORM2 distance table from firmware is not the expected size,
>>> there is fallback code that just populates the lookup table as local vs
>>> remote.
>>>
>>> However it then continues on to use the distance table. Fix.
>>>
>>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> Fixes: 1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/mm/numa.c | 29 +++++++++++++----------------
>>>  1 file changed, 13 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>> index 6f14c8fb6359..0789cde7f658 100644
>>> --- a/arch/powerpc/mm/numa.c
>>> +++ b/arch/powerpc/mm/numa.c
>>> @@ -380,6 +380,7 @@ static void initialize_form2_numa_distance_lookup_table(void)
>>>  	const __be32 *numa_lookup_index;
>>>  	int numa_dist_table_length;
>>>  	int max_numa_index, distance_index;
>>> +	bool good = true;
>> 
>> numa_dist_table is a pointer, so couldn't we just set it to NULL if the
>> info it's pointing at is invalid?
>
> Yeah probably could just do that.
>
>> 
>>>  
>>>  	if (firmware_has_feature(FW_FEATURE_OPAL))
>>>  		root = of_find_node_by_path("/ibm,opal");
>>> @@ -407,30 +408,26 @@ static void initialize_form2_numa_distance_lookup_table(void)
>>>  
>>>  	if (numa_dist_table_length != max_numa_index * max_numa_index) {
>>>  		WARN(1, "Wrong NUMA distance information\n");
>>> -		/* consider everybody else just remote. */
>>> -		for (i = 0;  i < max_numa_index; i++) {
>>> -			for (j = 0; j < max_numa_index; j++) {
>>> -				int nodeA = numa_id_index_table[i];
>>> -				int nodeB = numa_id_index_table[j];
>>> -
>>> -				if (nodeA == nodeB)
>>> -					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
>>> -				else
>>> -					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
>>> -			}
>>> -		}
>>> +		good = false;
>> 
>> ie.		numa_dist_table = NULL;
>> 
>>>  	}
>>> -
>>>  	distance_index = 0;
>>>  	for (i = 0;  i < max_numa_index; i++) {
>>>  		for (j = 0; j < max_numa_index; j++) {
>>>  			int nodeA = numa_id_index_table[i];
>>>  			int nodeB = numa_id_index_table[j];
>>> -
>>> -			numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index++];
>>> -			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
>>> +			int dist;
>>> +
>>> +			if (good)
>> 
>> 			if (numa_dist_table)
>> 
>>> +				dist = numa_dist_table[distance_index++];
>>> +			else if (nodeA == nodeB)
>>> +				dist = LOCAL_DISTANCE;
>>> +			else
>>> +				dist = REMOTE_DISTANCE;
>>> +			numa_distance_table[nodeA][nodeB] = dist;
>>> +			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, dist);
>>>  		}
>>>  	}
>>> +
>>>  	of_node_put(root);
>>>  }
>> 
>> 
>> But maybe before we do that we can rename it, because it is really easy
>> to confuse numa_dist_table and numa_distance_table if you don't look
>> closely.
>
> Maybe dt_form2_distances?

Or just "form2_distances", it's only a local so the fact that it's from
the dt is clear enough I think.

cheers
