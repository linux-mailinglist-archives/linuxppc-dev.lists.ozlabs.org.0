Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D453C4221
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 05:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNV2v2VPkz30GD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 13:42:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CDZD55B1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CDZD55B1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNV2N0jmBz2yMX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 13:42:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C3XpTO193291; Sun, 11 Jul 2021 23:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kHluxNBcjb4SxNSvJFBkNOcMcKkRn8PBcqRtneMkYuw=;
 b=CDZD55B1YS6iFiivbps2MNhQpVxp9gZF4rHUV2qQUCZXNeaKmPpF5J8bkhk0sS0luS3d
 QcjwJyTPa0/sOXs8z82pVBkhNPLswxBXuqMWZw1AX/eFlJerU4TDg7m+iq3uVSHpKbD+
 2+/7kbhcwQb80cZVQSFKJ8sBQKNBTsFTs+2ZRA+Axdh3yO5IAcpSR32ZAEyaHz59tXV6
 kFYV/GxBcNGpNLkLfZWhun4xYR0AgoXAjx2qGbswRM/Q18GCB8NeqOVbRNReTEavbj8e
 8X4l+Db+E5p8vyXzNhzW/BhqYNdGMnGK8959LtRGe+fqnw/O6uCvxyRmkfXIznLr0XRY uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrkvc3nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 23:42:14 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C3Ym4R195576;
 Sun, 11 Jul 2021 23:42:14 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrkvc3nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 23:42:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C3YY0i028523;
 Mon, 12 Jul 2021 03:42:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 39q3688hhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 03:42:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16C3g8QX18415992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 03:42:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC3A54C044;
 Mon, 12 Jul 2021 03:42:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C328F4C046;
 Mon, 12 Jul 2021 03:42:06 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.102.2.250])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 03:42:06 +0000 (GMT)
Subject: Re: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers
 to frozen/disabled when not in use
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-11-npiggin@gmail.com>
 <c607e40c-5334-e8b1-11ac-c1464332e01a@linux.ibm.com>
 <1625185125.n8jy7yqojr.astroid@bobo.none>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <0916fd08-f253-46ae-c4e9-8e910592e8b1@linux.ibm.com>
Date: Mon, 12 Jul 2021 09:12:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1625185125.n8jy7yqojr.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3T1-1lhrJjU6YQI6slD0YQXIop2GnKq_
X-Proofpoint-ORIG-GUID: Wq_f27AMCSGIosuVhC2R6IsFEktmn2d6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_02:2021-07-09,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120027
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/2/21 5:57 AM, Nicholas Piggin wrote:
> Excerpts from Madhavan Srinivasan's message of July 1, 2021 11:17 pm:
>> On 6/22/21 4:27 PM, Nicholas Piggin wrote:
>>> KVM PMU management code looks for particular frozen/disabled bits in
>>> the PMU registers so it knows whether it must clear them when coming
>>> out of a guest or not. Setting this up helps KVM make these optimisations
>>> without getting confused. Longer term the better approach might be to
>>> move guest/host PMU switching to the perf subsystem.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
>>>    arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
>>>    arch/powerpc/kvm/book3s_hv.c          | 5 +++++
>>>    arch/powerpc/perf/core-book3s.c       | 7 +++++++
>>>    4 files changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
>>> index a29dc8326622..3dc61e203f37 100644
>>> --- a/arch/powerpc/kernel/cpu_setup_power.c
>>> +++ b/arch/powerpc/kernel/cpu_setup_power.c
>>> @@ -109,7 +109,7 @@ static void init_PMU_HV_ISA207(void)
>>>    static void init_PMU(void)
>>>    {
>>>    	mtspr(SPRN_MMCRA, 0);
>>> -	mtspr(SPRN_MMCR0, 0);
>>> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>> Sticky point here is, currently if not frozen, pmc5/6 will
>> keep countering. And not freezing them at boot is quiet useful
>> sometime, like say when running in a simulation where we could calculate
>> approx CPIs for micro benchmarks without perf subsystem.

Sorry for a delayed response

> You even can't use the sysfs files in this sim environment? In that case

Yes it is possible. Just that we need to have additional patch to maintain
for the sim.
> what if we added a boot option that could set some things up? In that
> case possibly you could even gather some more types of events too.

Having a boot option will be a over-kill :). I guess we could have
this under config option?

>
> Thanks,
> Nick
