Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C75E3BF7AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 11:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLB8L6jJgz3bk2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 19:39:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VXYuFR2H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VXYuFR2H; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLB7s3cnZz3095
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 19:39:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1689WrNv188072; Thu, 8 Jul 2021 05:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=B+hqNbCEg+qcV5NGNFXNr74GNqbLu4ZImEFvXIIYLe4=;
 b=VXYuFR2HohZKTkbtfIz9vFCLSoUu7ulqot5aM2vyIaJmuo+hOd7DrKkE3JbmOoZ6+3Nd
 re+1eqP8VELwwVTqigZOqMFCiMIdtwMcDlx0e+6cOrEFzuEIqx8UFhJdBnq/8Hjkn90a
 34TVummAAHhg1mxDpLLuEC3t9tyn9YzuGeLLGTagz39j0rmlURJVgpDCPQDtaJdhXWt5
 soPBQf7gxXrypH/yBqDtBUBqc6XsyWbDrBeUANT2elWbDFU92QZmBHaWkZ3VdkzESphP
 cELT20vzSp/2kgOr5GYW4pMSgBiDs2An15whXLDnBYQdwea55oPtEW1G1z5OJn8194NT +Q== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mm67au23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 05:38:44 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1689cgD0027933;
 Thu, 8 Jul 2021 09:38:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 39jf5hh55w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 09:38:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1689ceuQ34931086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 09:38:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B6CD42049;
 Thu,  8 Jul 2021 09:38:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A0AC42047;
 Thu,  8 Jul 2021 09:38:38 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.82.66])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 09:38:37 +0000 (GMT)
Date: Thu, 8 Jul 2021 15:08:32 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH] powerpc: preempt: Don't touch the idle task's
 preempt_count during hotplug
Message-ID: <YObHmEzAPZLx5O6B@in.ibm.com>
References: <20210707183831.2106509-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707183831.2106509-1-valentin.schneider@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l2p7f7ohThQcgL4L_j4bGfUEvKWHiNCQ
X-Proofpoint-ORIG-GUID: l2p7f7ohThQcgL4L_j4bGfUEvKWHiNCQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_04:2021-07-06,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107080052
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
Reply-To: bharata@linux.ibm.com
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 07, 2021 at 07:38:31PM +0100, Valentin Schneider wrote:
> Powerpc currently resets a CPU's idle task preempt_count to 0 before said
> task starts executing the secondary startup routine (and becomes an idle
> task proper).
> 
> This conflicts with commit
> 
>   f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
> 
> which initializes all of the idle tasks' preempt_count to PREEMPT_DISABLED
> during smp_init(). Note that this was superfluous before said commit, as
> back then the hotplug machinery would invoke init_idle() via
> idle_thread_get(), which would have already reset the CPU's idle task's
> preempt_count to PREEMPT_ENABLED.
> 
> Get rid of this preempt_count write.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Fixes: f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
> Reported-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> ---
>  arch/powerpc/platforms/cell/smp.c    | 3 ---
>  arch/powerpc/platforms/pseries/smp.c | 5 +----
>  2 files changed, 1 insertion(+), 7 deletions(-)

The messages like "BUG: scheduling while atomic: swapper/1/0/0x00000000"
for each secondary CPU are no longer seen after this patch on powerpc.

Tested-by: Bharata B Rao <bharata@linux.ibm.com>
