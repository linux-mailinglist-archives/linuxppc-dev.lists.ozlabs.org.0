Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5326C3DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 16:50:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs3194RrwzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 00:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs2wL5Hy5zDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 00:46:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Pext4kvV; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Bs2wL17wZz8tFl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 00:46:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Bs2wK72svz9sR4; Thu, 17 Sep 2020 00:46:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Pext4kvV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Bs2wK2CN1z9sPB
 for <linuxppc-dev@ozlabs.org>; Thu, 17 Sep 2020 00:46:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600267564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BydVq8rqiV72enkO+EEPiTxsqPuV5JWLGloyl1T11ok=;
 b=Pext4kvVAnsp44zOL7hqSo/dt2Hrg6upqSfhHEWKsP7pvTHf3P5lRSPg5U0Ds/dJ1x6XFR
 iihA+OQ/l991XjIUpb/RY7mqZ0+1Lt2hTkrDcpMjFk0nmXux7laID+oGfNEgVpkV3zWZWw
 OnmBc+nownY0/+2CZ+Im3OayjXSGXrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-1Mur5hhoPyqbSPQPZBaxfA-1; Wed, 16 Sep 2020 10:46:01 -0400
X-MC-Unique: 1Mur5hhoPyqbSPQPZBaxfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D844D8015C6;
 Wed, 16 Sep 2020 14:45:59 +0000 (UTC)
Received: from [10.36.113.190] (ovpn-113-190.ams2.redhat.com [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 488DE1C4;
 Wed, 16 Sep 2020 14:45:58 +0000 (UTC)
Subject: Re: [PATCH v3] pseries/hotplug-memory: hot-add: skip redundant LMB
 lookup
To: Scott Cheloha <cheloha@linux.ibm.com>
References: <20200915194647.3334645-1-cheloha@linux.ibm.com>
 <5c6abee9-5ab1-d509-59ab-21ad1a7be14d@redhat.com>
 <20200916143913.o4o63mh4mums2qfm@rascal.austin.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <954f530d-99fb-64a1-0733-772d3a9e98ff@redhat.com>
Date: Wed, 16 Sep 2020 16:45:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916143913.o4o63mh4mums2qfm@rascal.austin.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Michal Suchanek <msuchanek@suse.de>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.09.20 16:39, Scott Cheloha wrote:
> On Wed, Sep 16, 2020 at 09:39:53AM +0200, David Hildenbrand wrote:
>> On 15.09.20 21:46, Scott Cheloha wrote:
>>> During memory hot-add, dlpar_add_lmb() calls memory_add_physaddr_to_nid()
>>> to determine which node id (nid) to use when later calling __add_memory().
>>>
>>> This is wasteful.  On pseries, memory_add_physaddr_to_nid() finds an
>>> appropriate nid for a given address by looking up the LMB containing the
>>> address and then passing that LMB to of_drconf_to_nid_single() to get the
>>> nid.  In dlpar_add_lmb() we get this address from the LMB itself.
>>>
>>> In short, we have a pointer to an LMB and then we are searching for
>>> that LMB *again* in order to find its nid.
>>>
>>> If we call of_drconf_to_nid_single() directly from dlpar_add_lmb() we
>>> can skip the redundant lookup.  The only error handling we need to
>>> duplicate from memory_add_physaddr_to_nid() is the fallback to the
>>> default nid when drconf_to_nid_single() returns -1 (NUMA_NO_NODE) or
>>> an invalid nid.
>>>
>>> Skipping the extra lookup makes hot-add operations faster, especially
>>> on machines with many LMBs.
>>>
>>> Consider an LPAR with 126976 LMBs.  In one test, hot-adding 126000
>>> LMBs on an upatched kernel took ~3.5 hours while a patched kernel
>>> completed the same operation in ~2 hours:
>>>
>>> Unpatched (12450 seconds):
>>> Sep  9 04:06:31 ltc-brazos1 drmgr[810169]: drmgr: -c mem -a -q 126000
>>> Sep  9 04:06:31 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
>>> [...]
>>> Sep  9 07:34:01 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added
>>>
>>> Patched (7065 seconds):
>>> Sep  8 21:49:57 ltc-brazos1 drmgr[877703]: drmgr: -c mem -a -q 126000
>>> Sep  8 21:49:57 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
>>> [...]
>>> Sep  8 23:27:42 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added
>>>
>>> It should be noted that the speedup grows more substantial when
>>> hot-adding LMBs at the end of the drconf range.  This is because we
>>> are skipping a linear LMB search.
>>>
>>> To see the distinction, consider smaller hot-add test on the same
>>> LPAR.  A perf-stat run with 10 iterations showed that hot-adding 4096
>>> LMBs completed less than 1 second faster on a patched kernel:
>>>
>>> Unpatched:
>>>  Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):
>>>
>>>         104,753.42 msec task-clock                #    0.992 CPUs utilized            ( +-  0.55% )
>>>              4,708      context-switches          #    0.045 K/sec                    ( +-  0.69% )
>>>              2,444      cpu-migrations            #    0.023 K/sec                    ( +-  1.25% )
>>>                394      page-faults               #    0.004 K/sec                    ( +-  0.22% )
>>>    445,902,503,057      cycles                    #    4.257 GHz                      ( +-  0.55% )  (66.67%)
>>>      8,558,376,740      stalled-cycles-frontend   #    1.92% frontend cycles idle     ( +-  0.88% )  (49.99%)
>>>    300,346,181,651      stalled-cycles-backend    #   67.36% backend cycles idle      ( +-  0.76% )  (50.01%)
>>>    258,091,488,691      instructions              #    0.58  insn per cycle
>>>                                                   #    1.16  stalled cycles per insn  ( +-  0.22% )  (66.67%)
>>>     70,568,169,256      branches                  #  673.660 M/sec                    ( +-  0.17% )  (50.01%)
>>>      3,100,725,426      branch-misses             #    4.39% of all branches          ( +-  0.20% )  (49.99%)
>>>
>>>            105.583 +- 0.589 seconds time elapsed  ( +-  0.56% )
>>>
>>> Patched:
>>>  Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):
>>>
>>>         104,055.69 msec task-clock                #    0.993 CPUs utilized            ( +-  0.32% )
>>>              4,606      context-switches          #    0.044 K/sec                    ( +-  0.20% )
>>>              2,463      cpu-migrations            #    0.024 K/sec                    ( +-  0.93% )
>>>                394      page-faults               #    0.004 K/sec                    ( +-  0.25% )
>>>    442,951,129,921      cycles                    #    4.257 GHz                      ( +-  0.32% )  (66.66%)
>>>      8,710,413,329      stalled-cycles-frontend   #    1.97% frontend cycles idle     ( +-  0.47% )  (50.06%)
>>>    299,656,905,836      stalled-cycles-backend    #   67.65% backend cycles idle      ( +-  0.39% )  (50.02%)
>>>    252,731,168,193      instructions              #    0.57  insn per cycle
>>>                                                   #    1.19  stalled cycles per insn  ( +-  0.20% )  (66.66%)
>>>     68,902,851,121      branches                  #  662.173 M/sec                    ( +-  0.13% )  (49.94%)
>>>      3,100,242,882      branch-misses             #    4.50% of all branches          ( +-  0.15% )  (49.98%)
>>>
>>>            104.829 +- 0.325 seconds time elapsed  ( +-  0.31% )
>>>
>>> This is consistent.  An add-by-count hot-add operation adds LMBs
>>> greedily, so LMBs near the start of the drconf range are considered
>>> first.  On an otherwise idle LPAR with so many LMBs we would expect to
>>> find the LMBs we need near the start of the drconf range, hence the
>>> smaller speedup.
>>>
>>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>>
>>
>> Hi Scott,
>>
>> IIRC, ppc DLPAR does a single add_memory() [...]
> 
> Yes.
> 
>> [...] for each LMB (16 MB).
> 
> The block size is set by the hypervisor.  The default is 256MB.  In
> this test I had a block size of 256MB.

Oh, I wasn't aware that it's configurable, thanks for pointing that out
(missed the custom memory_block_size_bytes() implementation).

I wonder how it works with pseries_remove_memblock(), that uses
MIN_MEMORY_BLOCK_SIZE with __remove_memory() - that will always BUG_ON
in try_remove_memory() with BUG_ON(check_hotplug_memory_range(start,
size)) in case the size is < memory_block_size_bytes().

Maybe that's not called on such machines ...

> 
> On multi-terabyte machines I would effectively always expect a block
> size of 256MB.  16MB blocks are supported, but it is not the default
> setting so it is increasingly rare.>
>> With tons of LMBs, this will also make /proc/iomem explode in size (using a
>> list-based tree), making traversal significantly slower e.g., on
>> insertions and system ram walks.
>>
>> I was wondering if you would get another performance boost under ppc
>> when using MEMHP_MERGE_RESOURCE [1]. AFAIKs, the resource boundaries are
>> not of interest. No guarantees, might be worth a try.
> 
> I'll give it a shot.
> 
>> Did you investigate what else makes memory hotplug that slow? (126000
>> LMBs correspond to roughly 2TB, that shouldn't take 2 hours ...)
> 
> It was about ~31TB in 256MB blocks.  It's a worst-case test (add all
> the memory), but I'm pretty happy with a 1.5 hour improvement :)

Yeah, definitely :)


-- 
Thanks,

David / dhildenb

