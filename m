Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A621B4368E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZvMR1LDzz3bW9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 04:18:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=axdRnVPL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=axdRnVPL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZvLf1Kcsz2yfn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 04:17:45 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LFqcEB002911; 
 Thu, 21 Oct 2021 13:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=yY/A/WafEwBloKbkLagqOI0EKepKbWz6djMsFmCOwEg=;
 b=axdRnVPLPm5px7ymFnztz0Psr1mGuny8W8CWkpJ4heawdMxFutdD4VOuXwC/MxwLSPkx
 +18CBbKNnx+3d54YA/iVh+o3sa0vmHwK0+dP1VuxvGfeeVWlRRYrKYwnhddIMdDz/Ted
 g28D26Cnx+wNKxpO+YN4dzz6GMMs9OUZnb5qt7vIY340h7lN20eUwHweNvUezHkA12KT
 oe3vqc8a3x11txZ0pESZUWNA6yLmFCywGXmCGmeb6LbndVvTxD2gjd8RG2jffrkb68Bn
 vWQPq2thzDShNxPMiMvLZJ9rNZzzarXFpDYif92DwcXchrY1UHsDQvQ4nDdF2h2wn6Hb zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bub81a1kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:17:40 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19LGb0Jl011712;
 Thu, 21 Oct 2021 13:17:40 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bub81a1kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 13:17:40 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LHHUdt018877;
 Thu, 21 Oct 2021 17:17:38 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3bqpccjeg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 17:17:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LHHbnF53608772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 17:17:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A9566A058;
 Thu, 21 Oct 2021 17:17:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B6916A054;
 Thu, 21 Oct 2021 17:17:36 +0000 (GMT)
Received: from localhost (unknown [9.211.157.242])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 17:17:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
In-Reply-To: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Thu, 21 Oct 2021 12:17:36 -0500
Message-ID: <87lf2mxpov.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JIvqQidhRq7IHAWV6f6oFdNR6Wc6v6d2
X-Proofpoint-GUID: 0iWfAD41Ej5ggcO95iLeuXn46dLGMMvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210085
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
Cc: maddy@linux.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> During Live Partition Migration (LPM), it is observed that perf
> counter values reports zero post migration completion. However
> 'perf stat' with workload continues to show counts post migration
> since PMU gets disabled/enabled during sched switches. But incase
> of system/cpu wide monitoring, zero counts were reported with 'perf
> stat' after migration completion.
>
> Example:
>  ./perf stat -e r1001e -I 1000
>            time             counts unit events
>      1.001010437         22,137,414      r1001e
>      2.002495447         15,455,821      r1001e
> <<>> As seen in next below logs, the counter values shows zero
>         after migration is completed.
> <<>>
>     86.142535370    129,392,333,440      r1001e
>     87.144714617                  0      r1001e
>     88.146526636                  0      r1001e
>     89.148085029                  0      r1001e

Confirmed in my environment:

    51.099987985            300,338      cache-misses
    52.101839374            296,586      cache-misses
    53.116089796            263,150      cache-misses
    54.117949249            232,290      cache-misses
    55.602029375     68,700,421,711      cache-misses
    56.610073969                  0      cache-misses
    57.614732000                  0      cache-misses

I wonder what it means that there is a very unlikely huge value before
the counter stops working -- I believe your example has this phenomenon
too.


> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index e83e089..ff7a77c 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -476,6 +476,8 @@ static int do_join(void *arg)
>  retry:
>  	/* Must ensure MSR.EE off for H_JOIN. */
>  	hard_irq_disable();
> +	/* Disable PMU before suspend */
> +	mobility_pmu_disable();
>  	hvrc = plpar_hcall_norets(H_JOIN);
>  
>  	switch (hvrc) {
> @@ -530,6 +532,8 @@ static int do_join(void *arg)
>  	 * reset the watchdog.
>  	 */
>  	touch_nmi_watchdog();
> +	/* Enable PMU after resuming */
> +	mobility_pmu_enable();
>  	return ret;
>  }

We should minimize calls into other subsystems from this context (the
callback function we've passed to stop_machine); it's fairly sensitive.
Can this be moved out to pseries_migrate_partition() or similar?
