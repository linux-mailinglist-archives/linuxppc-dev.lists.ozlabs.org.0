Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB335BA1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 08:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJdyf5fQZz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 16:25:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FunUbA/B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FunUbA/B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJdy25vwlz304T
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 16:24:57 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C649on134311; Mon, 12 Apr 2021 02:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=eQDF9ujJJY1Oib2WDryZnxZgAzRGulf0L4Jpj2/mffg=;
 b=FunUbA/BVdEqCWavf3QheCKwzK6NsedM3tdgVe3YutaQNrwfVqkSjJ1DO19ridOjhP6/
 j0TK0R8C50hqx/6NmpfYWbjY6KL+y6VTw9OfcyNcr0Guy5JWCKEzlajndGcq337xwYbL
 VPy6waYsD9aFH7us2E6BAnqifi9xVm9MXtQPesrmKz6oiyK78pcblGp4gS6H4l6xABiZ
 9c1xJif355leB3N+P9R9u7geiNjhfdnZK0vJDUz7g84BQ9ZchtKpMRq66cySI2iwzInu
 WW+YGxxXemdDfyD0IdqPlIJtdPYUnGk3Tv3hukZCRdQgQolsee6j5pLcbdsbdzNun/bj /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37us0ypnj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 02:24:45 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13C6JaRB041340;
 Mon, 12 Apr 2021 02:24:44 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37us0ypnhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 02:24:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13C69De7023086;
 Mon, 12 Apr 2021 06:24:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n89hfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 06:24:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13C6OdHL47055284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 06:24:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A07ECA405E;
 Mon, 12 Apr 2021 06:24:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2133A4055;
 Mon, 12 Apr 2021 06:24:36 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 12 Apr 2021 06:24:36 +0000 (GMT)
Date: Mon, 12 Apr 2021 11:54:36 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
Message-ID: <20210412062436.GB2633526@linux.vnet.ibm.com>
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -c-LAaG1u6T276gOvFfbJbWJAq4uSFoW
X-Proofpoint-ORIG-GUID: EhsRFdFm16QVdzrJrN4Lf8CqVbkQThNl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_03:2021-04-09,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 lowpriorityscore=0
 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=715 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104120040
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Parth Shah <parth@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2021-04-02 11:07:54]:

> 
> To remedy this, this patch proposes that the LLC be moved to the MC
> level which is a group of cores in one half of the chip.
> 
>       SMT (SMT4) --> MC (Hemisphere)[LLC] --> DIE
> 

I think marking Hemisphere as a LLC in a P10 scenario is a good idea.

> While there is no cache being shared at this level, this is still the
> level where some amount of cache-snooping takes place and it is
> relatively faster to access the data from the caches of the cores
> within this domain. With this change, we no longer see regressions on
> P10 for applications which require single threaded performance.

Peter, Valentin, Vincent, Mel, etal

On architectures where we have multiple levels of cache access latencies
within a DIE, (For example: one within the current LLC or SMT core and the
other at MC or Hemisphere, and finally across hemispheres), do you have any
suggestions on how we could handle the same in the core scheduler?

-- 
Thanks and Regards
Srikar Dronamraju
