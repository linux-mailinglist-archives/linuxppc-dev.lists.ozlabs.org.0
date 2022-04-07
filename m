Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB84F74C1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 06:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYpPx6mnYz3brN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 14:32:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bMfG8rJh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bMfG8rJh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYpNq5D0xz2ynd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 14:31:23 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2373WoLV012544; 
 Thu, 7 Apr 2022 04:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=QSi5KF4EVpiVkn0nM4Tr/gK4hZ/Tb8VpB9Cb+HtikqM=;
 b=bMfG8rJho1OVEvqkGrnBkh6bWdufeazqM3l3svB6IsesIv3xuGIzEpZttLcCBamfeeU+
 WxBMLJMCibuYg7krlTELuv4GN+7uTl29v7hXaU/C9GkfI6zIApB1KjwghXU9p2nMeOzx
 PdWwEdU9+diea9jDhONgWB7p7BxZKDj/OzaL/BVy3Z0NmamMr0WTdOLEU1F0OhFVuo4S
 g6yQABbcm85fqs2bZXCe9qVyCoE5Ez51rPje2b1PFicpw5XDYoVkJKxbrJlu+nGJjsuE
 ku3tS1XeNjXeRl67o50bIEGF2wpGv2bmHVQpy8ej06LEtPLiIjNhxS5yHrArwhPlmVnR Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f977c5hvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 04:31:18 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2374RN7P029647;
 Thu, 7 Apr 2022 04:31:18 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f977c5hvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 04:31:18 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2374RY3X003085;
 Thu, 7 Apr 2022 04:31:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3f6e48qe72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 04:31:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2374VD2h36241770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 04:31:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE42FA405C;
 Thu,  7 Apr 2022 04:31:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51A7BA405F;
 Thu,  7 Apr 2022 04:31:08 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.112.159])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  7 Apr 2022 04:31:07 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 0/4] Fix perf bench numa, futex and epoll to work with
 machines having #CPUs > 1K
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fXRphB0gU6CxAuj9Fy40sbwub23RbLLo=5LEY=-_D=3+g@mail.gmail.com>
Date: Thu, 7 Apr 2022 10:01:07 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <CF7DB310-9E7C-4084-9A7C-317D4D4004EF@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXRphB0gU6CxAuj9Fy40sbwub23RbLLo=5LEY=-_D=3+g@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7En33JMFO49I6DpXScy3mtrcWslMh1Lr
X-Proofpoint-ORIG-GUID: 4oiGc0K7R0gZiaeBlwhzDjYKrYD72QSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070023
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
Cc: maddy@linux.vnet.ibm.com, Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Apr-2022, at 6:05 AM, Ian Rogers <irogers@google.com> wrote:
> 
> On Wed, Apr 6, 2022 at 10:51 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>> 
>> The perf benchmark for collections: numa, futex and epoll
>> hits failure in system configuration with CPU's more than 1024.
>> These benchmarks uses "sched_getaffinity" and "sched_setaffinity"
>> in the code to work with affinity.
>> 
>> Example snippet from numa benchmark:
>> <<>>
>> perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
>> Aborted (core dumped)
>> <<>>
>> 
>> bind_to_node function uses "sched_getaffinity" to save the cpumask.
>> This fails with EINVAL because the default mask size in glibc is 1024.
>> 
>> Similarly in futex and epoll benchmark, uses sched_setaffinity during
>> pthread_create with affinity. And since it returns EINVAL in such system
>> configuration, benchmark doesn't run.
>> 
>> To overcome this 1024 CPUs mask size limitation of cpu_set_t,
>> change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
>> allocate cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.
>> 
>> Fix all the relevant places in the code to use mask size which is large
>> enough to represent number of possible CPU's in the system.
>> 
>> Fix parse_setup_cpu_list function in numa bench to check if input CPU
>> is online before binding task to that CPU. This is to fix failures where,
>> though CPU number is within max CPU, it could happen that CPU is offline.
>> Here, sched_setaffinity will result in failure when using cpumask having
>> that cpu bit set in the mask.
>> 
>> Patch 1 and Patch 2 address fix for perf bench futex and perf bench
>> epoll benchmark. Patch 3 and Patch 4 address fix in perf bench numa
>> benchmark
>> 
>> Athira Rajeev (4):
>>  tools/perf: Fix perf bench futex to correct usage of affinity for
>>    machines with #CPUs > 1K
>>  tools/perf: Fix perf bench epoll to correct usage of affinity for
>>    machines with #CPUs > 1K
>>  tools/perf: Fix perf numa bench to fix usage of affinity for machines
>>    with #CPUs > 1K
>>  tools/perf: Fix perf bench numa testcase to check if CPU used to bind
>>    task is online
>> 
>> Changelog:
>> From v1 -> v2:
>> Addressed review comment from Ian Rogers to do
>> CPU_FREE in a cleaner way.
>> Added Tested-by from Disha Goel
> 
> 
> The whole set:
> Acked-by: Ian Rogers <irogers@google.com>

Thanks for checking Ian.

Athira.
> 
> Thanks,
> Ian
> 
>> tools/perf/bench/epoll-ctl.c           |  25 ++++--
>> tools/perf/bench/epoll-wait.c          |  25 ++++--
>> tools/perf/bench/futex-hash.c          |  26 ++++--
>> tools/perf/bench/futex-lock-pi.c       |  21 +++--
>> tools/perf/bench/futex-requeue.c       |  21 +++--
>> tools/perf/bench/futex-wake-parallel.c |  21 +++--
>> tools/perf/bench/futex-wake.c          |  22 ++++--
>> tools/perf/bench/numa.c                | 105 ++++++++++++++++++-------
>> tools/perf/util/header.c               |  43 ++++++++++
>> tools/perf/util/header.h               |   1 +
>> 10 files changed, 242 insertions(+), 68 deletions(-)
>> 
>> --
>> 2.35.1

