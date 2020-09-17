Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2CD26DE6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 16:39:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsfkF63P2zDq72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 00:39:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsfck1nXjzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 00:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mcq8EvZa; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Bsfcg6dXnz8tDb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 00:34:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Bsfcg39B0z9sTQ; Fri, 18 Sep 2020 00:34:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mcq8EvZa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Bsfcf4Rwxz9sSC
 for <linuxppc-dev@ozlabs.org>; Fri, 18 Sep 2020 00:34:42 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HEVCIF070270; Thu, 17 Sep 2020 10:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5PweI626aVqvd04/PHyDOiFrDPfBB35SaFBtl0ALKFE=;
 b=mcq8EvZa5m2sFZgP6KTUVP7wShssiI3O/Ap67JjaZdsTDtpFyV6lih6LYhEHEEetKfXp
 ZMXX7buWFDMZHigr2Dc4+gOwPRFXUSLOkij4ORO2i+yHmcGahyytY6kiSNFuuyDo/8Bv
 Q8EHtYJhNg9sR9rFCOYjMMnc9uNFF1c5NYM2BNr2WuLqBG8QAQshBIzJI6CC3BmXy00D
 LuUVQ4HZi3jKihmgUSiKqXR9E8v0c0/Qf/UqSXpDc31x/ekMnY4+6ncSWzh1f5YusXOO
 GdI2VaZUjTB8Qwlld4v0AHsjEWM3sg3YBpOfdzI0Sb5/roW4Nn/yWfNWcgQI1i/IAJVl QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m7kb4xmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 10:34:39 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HEW5qx073866;
 Thu, 17 Sep 2020 10:34:38 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m7kb4xkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 10:34:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HEXtE2022046;
 Thu, 17 Sep 2020 14:34:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 33k6esj70f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 14:34:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HEYXXK22872544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 14:34:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEF81A405F;
 Thu, 17 Sep 2020 14:34:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90F36A405B;
 Thu, 17 Sep 2020 14:34:33 +0000 (GMT)
Received: from pomme.local (unknown [9.145.31.89])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 14:34:33 +0000 (GMT)
Subject: Re: [PATCH v4] pseries/hotplug-memory: hot-add: skip redundant LMB
 lookup
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20200916145122.3408129-1-cheloha@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <992d87d2-1505-aab6-c6f7-c11a56d45235@linux.ibm.com>
Date: Thu, 17 Sep 2020 16:34:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916145122.3408129-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170109
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 16/09/2020 à 16:51, Scott Cheloha a écrit :
> During memory hot-add, dlpar_add_lmb() calls memory_add_physaddr_to_nid()
> to determine which node id (nid) to use when later calling __add_memory().
> 
> This is wasteful.  On pseries, memory_add_physaddr_to_nid() finds an
> appropriate nid for a given address by looking up the LMB containing the
> address and then passing that LMB to of_drconf_to_nid_single() to get the
> nid.  In dlpar_add_lmb() we get this address from the LMB itself.
> 
> In short, we have a pointer to an LMB and then we are searching for
> that LMB *again* in order to find its nid.
> 
> If we call of_drconf_to_nid_single() directly from dlpar_add_lmb() we
> can skip the redundant lookup.  The only error handling we need to
> duplicate from memory_add_physaddr_to_nid() is the fallback to the
> default nid when drconf_to_nid_single() returns -1 (NUMA_NO_NODE) or
> an invalid nid.
> 
> Skipping the extra lookup makes hot-add operations faster, especially
> on machines with many LMBs.
> 
> Consider an LPAR with 126976 LMBs.  In one test, hot-adding 126000
> LMBs on an upatched kernel took ~3.5 hours while a patched kernel
> completed the same operation in ~2 hours:
> 
> Unpatched (12450 seconds):
> Sep  9 04:06:31 ltc-brazos1 drmgr[810169]: drmgr: -c mem -a -q 126000
> Sep  9 04:06:31 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
> [...]
> Sep  9 07:34:01 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added
> 
> Patched (7065 seconds):
> Sep  8 21:49:57 ltc-brazos1 drmgr[877703]: drmgr: -c mem -a -q 126000
> Sep  8 21:49:57 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
> [...]
> Sep  8 23:27:42 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added
> 
> It should be noted that the speedup grows more substantial when
> hot-adding LMBs at the end of the drconf range.  This is because we
> are skipping a linear LMB search.
> 
> To see the distinction, consider smaller hot-add test on the same
> LPAR.  A perf-stat run with 10 iterations showed that hot-adding 4096
> LMBs completed less than 1 second faster on a patched kernel:
> 
> Unpatched:
>   Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):
> 
>          104,753.42 msec task-clock                #    0.992 CPUs utilized            ( +-  0.55% )
>               4,708      context-switches          #    0.045 K/sec                    ( +-  0.69% )
>               2,444      cpu-migrations            #    0.023 K/sec                    ( +-  1.25% )
>                 394      page-faults               #    0.004 K/sec                    ( +-  0.22% )
>     445,902,503,057      cycles                    #    4.257 GHz                      ( +-  0.55% )  (66.67%)
>       8,558,376,740      stalled-cycles-frontend   #    1.92% frontend cycles idle     ( +-  0.88% )  (49.99%)
>     300,346,181,651      stalled-cycles-backend    #   67.36% backend cycles idle      ( +-  0.76% )  (50.01%)
>     258,091,488,691      instructions              #    0.58  insn per cycle
>                                                    #    1.16  stalled cycles per insn  ( +-  0.22% )  (66.67%)
>      70,568,169,256      branches                  #  673.660 M/sec                    ( +-  0.17% )  (50.01%)
>       3,100,725,426      branch-misses             #    4.39% of all branches          ( +-  0.20% )  (49.99%)
> 
>             105.583 +- 0.589 seconds time elapsed  ( +-  0.56% )
> 
> Patched:
>   Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):
> 
>          104,055.69 msec task-clock                #    0.993 CPUs utilized            ( +-  0.32% )
>               4,606      context-switches          #    0.044 K/sec                    ( +-  0.20% )
>               2,463      cpu-migrations            #    0.024 K/sec                    ( +-  0.93% )
>                 394      page-faults               #    0.004 K/sec                    ( +-  0.25% )
>     442,951,129,921      cycles                    #    4.257 GHz                      ( +-  0.32% )  (66.66%)
>       8,710,413,329      stalled-cycles-frontend   #    1.97% frontend cycles idle     ( +-  0.47% )  (50.06%)
>     299,656,905,836      stalled-cycles-backend    #   67.65% backend cycles idle      ( +-  0.39% )  (50.02%)
>     252,731,168,193      instructions              #    0.57  insn per cycle
>                                                    #    1.19  stalled cycles per insn  ( +-  0.20% )  (66.66%)
>      68,902,851,121      branches                  #  662.173 M/sec                    ( +-  0.13% )  (49.94%)
>       3,100,242,882      branch-misses             #    4.50% of all branches          ( +-  0.15% )  (49.98%)
> 
>             104.829 +- 0.325 seconds time elapsed  ( +-  0.31% )
> 
> This is consistent.  An add-by-count hot-add operation adds LMBs
> greedily, so LMBs near the start of the drconf range are considered
> first.  On an otherwise idle LPAR with so many LMBs we would expect to
> find the LMBs we need near the start of the drconf range, hence the
> smaller speedup.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
> Changelog:
> 
> v1: https://lore.kernel.org/linuxppc-dev/20200910175637.2865160-1-cheloha@linux.ibm.com/
> 
> v2:
> - Move prototype for of_drconf_to_nid_single() to topology.h.
>    Requested by Michael Ellerman.
> 
> v3:
> - Send the right patch.  v2 is from the wrong branch, my mistake.
> 
> v4:
> - Fix checkpatch.pl warnings.  Reported by Laurent Dufour.
> 
>   arch/powerpc/include/asm/topology.h             | 3 +++
>   arch/powerpc/mm/numa.c                          | 2 +-
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 6 ++++--
>   3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index f0b6300e7dd3..ae19b19f9d44 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -86,6 +86,9 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> 
>   #endif /* CONFIG_NUMA */
> 
> +struct drmem_lmb;
> +int of_drconf_to_nid_single(struct drmem_lmb *lmb);
> +
>   #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
>   extern int find_and_online_cpu_nid(int cpu);
>   #else
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 1f61fa2148b5..63507b47164d 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -430,7 +430,7 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
>    * This is like of_node_to_nid_single() for memory represented in the
>    * ibm,dynamic-reconfiguration-memory node.
>    */
> -static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> +int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>   {
>   	struct assoc_arrays aa = { .arrays = NULL };
>   	int default_nid = NUMA_NO_NODE;
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 0ea976d1cac4..9a533acf8ad0 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -611,8 +611,10 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> 
>   	block_sz = memory_block_size_bytes();
> 
> -	/* Find the node id for this address. */
> -	nid = memory_add_physaddr_to_nid(lmb->base_addr);
> +	/* Find the node id for this LMB.  Fake one if necessary. */
> +	nid = of_drconf_to_nid_single(lmb);
> +	if (nid < 0 || !node_possible(nid))
> +		nid = first_online_node;
> 
>   	/* Add the memory */
>   	rc = __add_memory(nid, lmb->base_addr, block_sz);
> 

