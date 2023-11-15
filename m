Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C907EBCF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 07:17:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q973J3jA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVXyH3WW8z3cTm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 17:17:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q973J3jA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVXxN2PRRz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 17:16:39 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF5u5M2029714;
	Wed, 15 Nov 2023 06:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=xFVnnJMTMBmVSpnPgUmA2cq4J7my1IiGxMtUahWzQjA=;
 b=q973J3jAC/FlW0IHRY9FPaESMMaj8QfkvWXO/2W4CqWzN25dUEKS/9Bfev484Yv0xC60
 YlKjrqiG8VaWHakLrw1mSr1Er6EmA4DRiKJq84k8WZoB65unIIMQhl6oiHK4o8amUS0Z
 qd4dTY7ccp8lOQZVUmwdI1PRZB5VoNU6/MbgGRkFCC3Otv5ZtHE5ToDVbo0SYxcrF1pi
 Z7FBPFCyJupdBlNDsiWesNt2mC5cqpCLKSBMKI9CfmBUTeFhHJRl2kCalBFqDfzjZsA+
 H1jCwziNlLaFAXknfLwEPzl2RoJlFBadwXnBk6QqH30V+0TA0bS3sIlQsqRh/u6bPxDA hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucr0hgsw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 06:16:23 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AF5u9jx030159;
	Wed, 15 Nov 2023 06:16:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucr0hgsvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 06:16:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF4Yu5K015498;
	Wed, 15 Nov 2023 06:16:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxswnhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 06:16:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AF6GIIE66584852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 06:16:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9D3F2004D;
	Wed, 15 Nov 2023 06:16:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE6BF20043;
	Wed, 15 Nov 2023 06:16:16 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 15 Nov 2023 06:16:16 +0000 (GMT)
Date: Wed, 15 Nov 2023 11:46:16 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 0/5] powerpc/smp: Topology and shared processor
 optimizations
Message-ID: <20231115061616.dp5id27xip5j3ovl@linux.vnet.ibm.com>
References: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
 <87v8a3zhl8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87v8a3zhl8.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DSSAV-iQ-3SVHXm6L-w9TZNu66cVgEyZ
X-Proofpoint-ORIG-GUID: z_IZwuVAVLgHDS3lQOTvEUUGU-0vSFZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_04,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=968 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150046
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2023-11-15 11:24:59]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> 
> > PowerVM systems configured in shared processors mode have some unique
> > challenges. Some device-tree properties will be missing on a shared
> > processor. Hence some sched domains may not make sense for shared processor
> > systems.
> >
> > Most shared processor systems are over-provisioned. Underlying PowerVM
> > Hypervisor would schedule at a Big Core granularity. The most recent power
> > processors support two almost independent cores. In a lightly loaded
> > condition, it helps the overall system performance if we pack to lesser
> > number of Big Cores.
> >
> 
> Is this good to do if the systems are not over-provisioned? What will be
> the performance impact in that case with and without the change?
> 

We are consolidating 1 thread per thread group (aka SMT domain).
Since each thread-group is suppose to be independent including having a
private L1/L2/L3 cache, we expect minimal impact in non over provisioned
scenario.

In Over utilization scenario, the changes in this patchset will not even kick in.

-- 
Thanks and Regards
Srikar Dronamraju
