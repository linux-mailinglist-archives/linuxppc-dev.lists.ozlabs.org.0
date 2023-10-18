Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A76CC7CD598
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 09:42:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZ5TNe1X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9N9c44RRz3vYy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 18:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZ5TNe1X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9N8Z1F5cz3ccX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 18:41:49 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I7dU1M025676
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 07:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bqe+70hqb17EHfNG/wJ+AxKoDifhXw8nu9CXoiGZOG0=;
 b=oZ5TNe1X63J7VkAUgTmqlgEDqZrv8Zd6BrNgbkHnSLqHlRlB65Bom24JYF5mAadWwxC5
 kuvZ9yDdcNausryAdsXka77DURK/+FTv8J3r7knblE5Ci1O5EbcRvPzV4gTSNAeu4rTz
 FECU5onKVcFo/2MgIeBf1aGgrPTu+AvagcPW7+qrAgfKhC6MErZheuk+GkUoDSAOPP2l
 rTozeEYaqq2chiwLtdWGYKDYTQ7IX5sRpT6sHaDfCjaMWe/K1AlTUUWfib67+F1UhqA1
 pM7g1kVDh2nBVTRyzx8lsuBUxpiff5++CJDs1GxUjT5yA6+sj7vPyqlo+y5/mjz1xeag vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttb5rg2yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 07:41:47 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39I7fOmF032705
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 07:41:46 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttb5rg2yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 07:41:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39I7Ypcu012900;
	Wed, 18 Oct 2023 07:41:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pyesha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 07:41:46 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39I7fjLp6685380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 07:41:45 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D63B58056;
	Wed, 18 Oct 2023 07:41:45 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08CF158052;
	Wed, 18 Oct 2023 07:41:44 +0000 (GMT)
Received: from [9.171.59.102] (unknown [9.171.59.102])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 07:41:43 +0000 (GMT)
Message-ID: <f57e733e-fa18-484d-aca8-e67436b44ddc@linux.vnet.ibm.com>
Date: Wed, 18 Oct 2023 13:11:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] powerpc/qspinlock: Fix yield latency bug and other
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20231016124305.139923-1-npiggin@gmail.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FKRcjwH5pYSVV5YvGBVKOYllh5nfalVm
X-Proofpoint-GUID: 9esSMp_WzpQfgiiSG-cLX-LfwEKc37RF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_05,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=869
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180063
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/16/23 6:12 PM, Nicholas Piggin wrote:
> This fixes a long-standing latency bug in the powerpc qspinlock
> implementation that quite a few people have reported and helped
> out with debugging.
> 
> The first patch is a minimal fix that avoids the problem. The
> other patches are streamlining and improvements after the fix.
> 

Hi Nick, Thanks for the fix. This issue has been happening in various
scenarios when there was vCPU contention.

Tested this on Power10 Shared processor LPAR(SPLPAR) based on powerVM.
System has two SPLPARs. on LPAR1 trying various scenarios and
LPAR2 is running constant stress-ng threads consuming 100% its CPU.
LPAR1: 96VP, 64EC and LPAR2 is 32VP, 32EC.

lscpu of LPAR1:
Architecture:            ppc64le
  Byte Order:            Little Endian
CPU(s):                  768


  On-line CPU(s) list:   0-767


Model name:              POWER10 (architected), altivec supported
  Model:                 2.0 (pvr 0080 0200)
  Thread(s) per core:    8

Scenarios tried on LPAR1:
1. run ppc64_cpu --smt=1 and ppc64_cpu --smt=8 to switch between SMT=1
   and SMT=8
2. create a cgroup, assign 5% quota to it and run same number of
   stress-ng as number of CPUs within that cgroup.
3. Run a suite of microbenchmarks such as unixbench, schbench, hackbench
   stress-ng with perf enabled.

baseline was tip/master at 84ab57184ff4 (origin/master, origin/HEAD)
Merge branch into tip/master: 'x86/tdx'

Hard lockup was SEEN in each of the above scenario with baseline.
With this patch series applied hard lockup was NOT SEEN in each of
the above scenario.

So,
Tested-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>

> Thanks,
> Nick
> 
> Nicholas Piggin (6):
>   powerpc/qspinlock: Fix stale propagated yield_cpu
>   powerpc/qspinlock: stop queued waiters trying to set lock sleepy
>   powerpc/qspinlock: propagate owner preemptedness rather than CPU
>     number
>   powerpc/qspinlock: don't propagate the not-sleepy state
>   powerpc/qspinlock: Propagate sleepy if previous waiter is preempted
>   powerpc/qspinlock: Rename yield_propagate_owner tunable
> 
>  arch/powerpc/lib/qspinlock.c | 119 +++++++++++++++--------------------
>  1 file changed, 52 insertions(+), 67 deletions(-)
> 
