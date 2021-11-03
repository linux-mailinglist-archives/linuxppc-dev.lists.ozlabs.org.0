Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E818444A19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 22:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkzxF1W7rz2ynd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 08:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NZpJvgc7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NZpJvgc7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkzwS5Fdbz2xDS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 08:11:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3KLjVA014414; 
 Wed, 3 Nov 2021 21:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UeOjkghZeTL5LQO027QPCoWwwvT3GuNVIzmHTUROg3M=;
 b=NZpJvgc7cuBuzUGVLgPMXJGqx3wR2mO3YEbcTl9w3EiOx9FrIYOPR0o8d0UpFBm6GV40
 gEzSgeuyNnX7DT+UKasArffKUD6ibdrSkbEziLSXog0SroKoVDqYtASjMSXkKTL9NEFM
 qiZTbZeO3bTvBxb0Jvaa93r1zZu3DXXmapCIWZnWz4D3+kP47b8wx0Bvup6Nvnt3fozT
 kR2CitJtascmA08FGMH7gotj0xUYQGATVbOmsxLUkmD7Wf1RfrH25pxTb53yG6ikFxb5
 g9SCk6Eq8jk3OOcVKJHuPb2ycY/q9PFqO8NcxG9/YZj/Zwa3Se+yoA9Qd6RSlfX+BeLz Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c41cwruu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 21:11:27 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A3L2R8o017118;
 Wed, 3 Nov 2021 21:11:26 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c41cwrutv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 21:11:26 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A3L42dq027056;
 Wed, 3 Nov 2021 21:11:26 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3c0wpc624u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 21:11:25 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A3LBOE532244056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Nov 2021 21:11:24 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E36D178064;
 Wed,  3 Nov 2021 21:11:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6B2278067;
 Wed,  3 Nov 2021 21:11:23 +0000 (GMT)
Received: from localhost (unknown [9.211.106.3])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  3 Nov 2021 21:11:23 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
In-Reply-To: <1635852231.aebe6lt6u4.astroid@bobo.none>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none>
 <87sfwk7z0m.fsf@mpe.ellerman.id.au>
 <1635852231.aebe6lt6u4.astroid@bobo.none>
Date: Wed, 03 Nov 2021 16:11:23 -0500
Message-ID: <8735odx7us.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KXmz2PP-ogIRu1UvPd_oRiZs1LBxoAoO
X-Proofpoint-ORIG-GUID: 2VK4g3CQObNEnPkmeH7YNZiZcw1BAsql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_06,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030109
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of October 29, 2021 11:15 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
>>>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> +	/* Disable PMU before suspend */
>>>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>>>
>>> Why was this moved out of stop machine and to an IPI?
>>>
>>> My concern would be, what are the other CPUs doing at this time? Is it 
>>> possible they could take interrupts and schedule? Could that mess up the
>>> perf state here?
>> 
>> pseries_migrate_partition() is called directly from migration_store(),
>> which is the sysfs store function, which can be called concurrently by
>> different CPUs.
>> 
>> It's also potentially called from rtas_syscall_dispatch_ibm_suspend_me(),
>> from sys_rtas(), again with no locking.
>> 
>> So we could have two CPUs calling into here at the same time, which
>> might not crash, but is unlikely to work well.
>> 
>> I think the lack of locking might have been OK in the past because only
>> one CPU will successfully get the other CPUs to call do_join() in
>> pseries_suspend(). But I could be wrong.
>> 
>> Anyway, now that we're mutating the PMU state before suspending we need
>> to be more careful. So I think we need a lock around the whole
>> sequence.

Regardless of the outcome here, generally agreed that some serialization
should be imposed in this path. The way the platform works (and some
extra measures by the drmgr utility) make it so that this code isn't
entered concurrently in usual operation, but it's possible to make it
happen if you are root.

A file-static mutex should be OK.

> My concern is still that we wouldn't necessarily have the other CPUs 
> under control at that point even if we serialize the migrate path.
> They could take interrupts, possibly call into perf subsystem after
> the mobility_pmu_disable (e.g., via syscall or context switch) which 
> might mess things up.
>
> I think the stop machine is a reasonable place for the code in this 
> case. It's a low level disabling of hardware facility and saving off 
> registers.

That makes sense, but I can't help feeling concerned still. For this to
be safe, power_pmu_enable() and power_pmu_disable() must never sleep or
re-enable interrupts or send IPIs. I don't see anything obviously unsafe
right now, but is that already part of their contract? Is there much
risk they could change in the future to violate those constraints?

That aside, the proposed change seems like we would be hacking around a
more generic perf/pmu limitation in a powerpc-specific way. I see the
same behavior on x86 across suspend/resume.

# perf stat -a -e cache-misses -I 1000 & sleep 2 ; systemctl suspend ; sleep 20 ; kill $(jobs -p)
[1] 189806
#           time             counts unit events
     1.000501710          9,983,649      cache-misses
     2.002620321         14,131,072      cache-misses
     3.004579071         23,010,971      cache-misses
     9.971854783 140,737,491,680,853      cache-misses
    10.982669250                  0      cache-misses
    11.984660498                  0      cache-misses
    12.986648392                  0      cache-misses
    13.988561766                  0      cache-misses
    14.992670615                  0      cache-misses
    15.994938111                  0      cache-misses
    16.996703952                  0      cache-misses
    17.999092812                  0      cache-misses
    19.000602677                  0      cache-misses
    20.003272216                  0      cache-misses
    21.004770295                  0      cache-misses
# uname -r
5.13.19-100.fc33.x86_64


