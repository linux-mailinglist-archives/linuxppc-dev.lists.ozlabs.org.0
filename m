Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC326C3D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 16:43:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs2s41lQJzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 00:43:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs2mT59fyzDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 00:39:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AtfXfD/6; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Bs2mT20Ycz8tQ0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 00:39:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Bs2mT1W4rz9sTs; Thu, 17 Sep 2020 00:39:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AtfXfD/6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Bs2mS4QKnz9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 17 Sep 2020 00:39:19 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GEYXQB135394; Wed, 16 Sep 2020 10:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=hjxy73Orbuu6BmusX9ubsdOZzPXpIL3ELdpttTwH05g=;
 b=AtfXfD/6rJi51SQuB/3Sl7Rid1q1h3BkEEGsyp24iYeDnUULcKCLmw8yAcn5wISIuxqo
 e9ID793yAzY8e8UTfyp8RR0E+RGEFJald+33nu6U6Fxm3/s4awxQsZL1lGxlF+dVbqD0
 rCXb4ljV0Whs2BFLOTtHrGbd9oXmw/osRfFgG2Zqgm+M5g4zrXL19tz0MiQk0kmwm1q3
 An3wNLC7wubaMLk5z0ulVTUugLIWXvaMQMdHot3TFsefDSTdtBW8PjicKty9Cqi9cuKv
 wsC9UMtLVv+Ltx+QyXivcgYBY/HNV6D2GgsNK6vdpljytaxdACCVt6Y2Y2I0Ca7biAUi fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kgc4927s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 10:39:16 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08GEYndc136724;
 Wed, 16 Sep 2020 10:39:16 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kgc4927k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 10:39:16 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GEaaOk010107;
 Wed, 16 Sep 2020 14:39:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 33k5v1ppwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 14:39:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GEdE0i46465402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 14:39:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60B027805E;
 Wed, 16 Sep 2020 14:39:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45DD178066;
 Wed, 16 Sep 2020 14:39:14 +0000 (GMT)
Received: from localhost (unknown [9.41.179.32])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 14:39:14 +0000 (GMT)
Date: Wed, 16 Sep 2020 09:39:13 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] pseries/hotplug-memory: hot-add: skip redundant LMB
 lookup
Message-ID: <20200916143913.o4o63mh4mums2qfm@rascal.austin.ibm.com>
References: <20200915194647.3334645-1-cheloha@linux.ibm.com>
 <5c6abee9-5ab1-d509-59ab-21ad1a7be14d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c6abee9-5ab1-d509-59ab-21ad1a7be14d@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_10:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=1
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009160106
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

On Wed, Sep 16, 2020 at 09:39:53AM +0200, David Hildenbrand wrote:
> On 15.09.20 21:46, Scott Cheloha wrote:
> > During memory hot-add, dlpar_add_lmb() calls memory_add_physaddr_to_nid()
> > to determine which node id (nid) to use when later calling __add_memory().
> > 
> > This is wasteful.  On pseries, memory_add_physaddr_to_nid() finds an
> > appropriate nid for a given address by looking up the LMB containing the
> > address and then passing that LMB to of_drconf_to_nid_single() to get the
> > nid.  In dlpar_add_lmb() we get this address from the LMB itself.
> > 
> > In short, we have a pointer to an LMB and then we are searching for
> > that LMB *again* in order to find its nid.
> > 
> > If we call of_drconf_to_nid_single() directly from dlpar_add_lmb() we
> > can skip the redundant lookup.  The only error handling we need to
> > duplicate from memory_add_physaddr_to_nid() is the fallback to the
> > default nid when drconf_to_nid_single() returns -1 (NUMA_NO_NODE) or
> > an invalid nid.
> > 
> > Skipping the extra lookup makes hot-add operations faster, especially
> > on machines with many LMBs.
> > 
> > Consider an LPAR with 126976 LMBs.  In one test, hot-adding 126000
> > LMBs on an upatched kernel took ~3.5 hours while a patched kernel
> > completed the same operation in ~2 hours:
> > 
> > Unpatched (12450 seconds):
> > Sep  9 04:06:31 ltc-brazos1 drmgr[810169]: drmgr: -c mem -a -q 126000
> > Sep  9 04:06:31 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
> > [...]
> > Sep  9 07:34:01 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added
> > 
> > Patched (7065 seconds):
> > Sep  8 21:49:57 ltc-brazos1 drmgr[877703]: drmgr: -c mem -a -q 126000
> > Sep  8 21:49:57 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
> > [...]
> > Sep  8 23:27:42 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added
> > 
> > It should be noted that the speedup grows more substantial when
> > hot-adding LMBs at the end of the drconf range.  This is because we
> > are skipping a linear LMB search.
> > 
> > To see the distinction, consider smaller hot-add test on the same
> > LPAR.  A perf-stat run with 10 iterations showed that hot-adding 4096
> > LMBs completed less than 1 second faster on a patched kernel:
> > 
> > Unpatched:
> >  Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):
> > 
> >         104,753.42 msec task-clock                #    0.992 CPUs utilized            ( +-  0.55% )
> >              4,708      context-switches          #    0.045 K/sec                    ( +-  0.69% )
> >              2,444      cpu-migrations            #    0.023 K/sec                    ( +-  1.25% )
> >                394      page-faults               #    0.004 K/sec                    ( +-  0.22% )
> >    445,902,503,057      cycles                    #    4.257 GHz                      ( +-  0.55% )  (66.67%)
> >      8,558,376,740      stalled-cycles-frontend   #    1.92% frontend cycles idle     ( +-  0.88% )  (49.99%)
> >    300,346,181,651      stalled-cycles-backend    #   67.36% backend cycles idle      ( +-  0.76% )  (50.01%)
> >    258,091,488,691      instructions              #    0.58  insn per cycle
> >                                                   #    1.16  stalled cycles per insn  ( +-  0.22% )  (66.67%)
> >     70,568,169,256      branches                  #  673.660 M/sec                    ( +-  0.17% )  (50.01%)
> >      3,100,725,426      branch-misses             #    4.39% of all branches          ( +-  0.20% )  (49.99%)
> > 
> >            105.583 +- 0.589 seconds time elapsed  ( +-  0.56% )
> > 
> > Patched:
> >  Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):
> > 
> >         104,055.69 msec task-clock                #    0.993 CPUs utilized            ( +-  0.32% )
> >              4,606      context-switches          #    0.044 K/sec                    ( +-  0.20% )
> >              2,463      cpu-migrations            #    0.024 K/sec                    ( +-  0.93% )
> >                394      page-faults               #    0.004 K/sec                    ( +-  0.25% )
> >    442,951,129,921      cycles                    #    4.257 GHz                      ( +-  0.32% )  (66.66%)
> >      8,710,413,329      stalled-cycles-frontend   #    1.97% frontend cycles idle     ( +-  0.47% )  (50.06%)
> >    299,656,905,836      stalled-cycles-backend    #   67.65% backend cycles idle      ( +-  0.39% )  (50.02%)
> >    252,731,168,193      instructions              #    0.57  insn per cycle
> >                                                   #    1.19  stalled cycles per insn  ( +-  0.20% )  (66.66%)
> >     68,902,851,121      branches                  #  662.173 M/sec                    ( +-  0.13% )  (49.94%)
> >      3,100,242,882      branch-misses             #    4.50% of all branches          ( +-  0.15% )  (49.98%)
> > 
> >            104.829 +- 0.325 seconds time elapsed  ( +-  0.31% )
> > 
> > This is consistent.  An add-by-count hot-add operation adds LMBs
> > greedily, so LMBs near the start of the drconf range are considered
> > first.  On an otherwise idle LPAR with so many LMBs we would expect to
> > find the LMBs we need near the start of the drconf range, hence the
> > smaller speedup.
> > 
> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> 
> 
> Hi Scott,
> 
> IIRC, ppc DLPAR does a single add_memory() [...]

Yes.

> [...] for each LMB (16 MB).

The block size is set by the hypervisor.  The default is 256MB.  In
this test I had a block size of 256MB.

On multi-terabyte machines I would effectively always expect a block
size of 256MB.  16MB blocks are supported, but it is not the default
setting so it is increasingly rare.

> With tons of LMBs, this will also make /proc/iomem explode in size (using a
> list-based tree), making traversal significantly slower e.g., on
> insertions and system ram walks.
> 
> I was wondering if you would get another performance boost under ppc
> when using MEMHP_MERGE_RESOURCE [1]. AFAIKs, the resource boundaries are
> not of interest. No guarantees, might be worth a try.

I'll give it a shot.

> Did you investigate what else makes memory hotplug that slow? (126000
> LMBs correspond to roughly 2TB, that shouldn't take 2 hours ...)

It was about ~31TB in 256MB blocks.  It's a worst-case test (add all
the memory), but I'm pretty happy with a 1.5 hour improvement :)

> Memory block devices might still be a slowdown (although we have an
> xarray in place now that takes care of most pain).

Memory block devices are no longer a hotspot.

Some of the slowdown is in the printk overhead.  We print a log for
every LMB.  It is very silly.  I intend to move those to a debug
priority, which should trivially speed things up.

Otherwise I need to do more profiling.
