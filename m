Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 273447D0CA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 12:05:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f83rYL0g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBgFF0FGVz3dWS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 21:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f83rYL0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBgDP34TBz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 21:04:37 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K9lnpR022006
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=P2P2GAvDL8wZhYWdew8Ez+UNu8O+zedfR1Occy4/SU8=;
 b=f83rYL0gxFndxozk6yI0STwvDnk2RsaErLYp3uQJIEvXhtpEjHGIG1WE4IsWz/B1CmcQ
 zCxVKA5MULhLJ/UAIWSy0Oj1yZruUw62TjPlYsYh7XhZaHRbfva+bxPArn0gcgFDUWf7
 nPIdkYn0IRTLESp4A2QLxnww6+w4zHSNYvBaYyBnepoQK5CFcB3yaPiGxgKuq3iAVA11
 MqVEYCcwSMcp8RkipiRnS0DJPBC3oxFnymmBLlOblyOTqN/cnE9uXglgLv5WFHokm2dp
 j4VXn2bzCw6a+V0uOFd1uqjAj7YIsSqH3PZPp3Q2IdgHmIY8txOzundbh1aocgGpwOiM UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tuq7y0my3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 10:04:34 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39K9mtNQ026052
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 10:04:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tuq7y0mxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 10:04:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39K91YTT024191;
	Fri, 20 Oct 2023 10:04:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tuc293tt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 10:04:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39KA4V4L43385370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 10:04:31 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 079392004F;
	Fri, 20 Oct 2023 10:04:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9588320065;
	Fri, 20 Oct 2023 10:04:30 +0000 (GMT)
Received: from localhost (unknown [9.195.39.224])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Oct 2023 10:04:30 +0000 (GMT)
Date: Fri, 20 Oct 2023 15:34:29 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] powerpc/qspinlock: Fix yield latency bug and other
Message-ID: <20231020100429.GB213288@li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6Fgn_HARMhf_xH7_B3n89qPsSAW5pjCe
X-Proofpoint-ORIG-GUID: Z8ZSA012x4S4WAzZ3cQFVi2NTt3M3JhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_08,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=353
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200083
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 10:42:59PM +1000, Nicholas Piggin wrote:
> This fixes a long-standing latency bug in the powerpc qspinlock
> implementation that quite a few people have reported and helped
> out with debugging.
> 
> The first patch is a minimal fix that avoids the problem. The
> other patches are streamlining and improvements after the fix.
> 
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
> -- 
> 2.42.0
> 
Just a minor comment regarding patch 2.

For the series:

Reviewed-by: Nysal Jan K.A <nysal@linux.ibm.com>
