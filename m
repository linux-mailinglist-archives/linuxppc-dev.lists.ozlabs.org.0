Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E83753C89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 16:06:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s0NpAPF3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2YFF3RQjz3bWj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 00:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s0NpAPF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2YDJ5fT3z3bYg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 00:06:08 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EDYJa6009617;
	Fri, 14 Jul 2023 14:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=OgvjnZ8avXEPxtyWiUEFAkSoofnQeAwIwzZDOFC0bOQ=;
 b=s0NpAPF3SV0VqvGabKpL4V1wEhvPpRAkZwuV8a3sr95WbcuhZOu3IELyf7fP18eSZlGv
 oGCt+WDzoDkyv53um/qp/1za4RSi6nGVsEtmykKWcWXUdV4L/LY5BwlFQ/DXaqATkbY6
 douA2khQ05i5kpbTV49+xkZJ9n5vRzawDtZ1eBMhpU1pIkgQWMZoLKJQiXdb+nvZEJNF
 mMaMdhCfBn9RVu2yFqfZo1oG/ZkOAxId/8VxZsgA/KGwt0q2aA37ITmDs6rl3/ZtXTf0
 RgI1jrFHAYUObHjUDLGdNgNhYG4DSLjuOKiKS6XvdUpoCHy92Pcjn/uZ8BWGD9+6/qDI 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru76d1baa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 14:05:10 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36EDwwkP017345;
	Fri, 14 Jul 2023 14:05:05 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru76d1axq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 14:05:05 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36ECfrGh026073;
	Fri, 14 Jul 2023 14:04:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rtq50rajc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 14:04:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36EE4n0s43516522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jul 2023 14:04:49 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEF9120040;
	Fri, 14 Jul 2023 14:04:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D81602004B;
	Fri, 14 Jul 2023 14:04:47 +0000 (GMT)
Received: from osiris (unknown [9.171.26.130])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 14 Jul 2023 14:04:47 +0000 (GMT)
Date: Fri, 14 Jul 2023 16:04:46 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
Message-ID: <ZLFV/g1VrPBdfCAK@osiris>
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hsJgymubNMFej3kgStwR_Y9DqO95gNd3
X-Proofpoint-ORIG-GUID: mUuVvLqoODAZJ6UD82Lagm5osWAzAXJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140128
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
Cc: juri.lelli@redhat.com, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vschneid@redhat.com, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, dietmar.eggemann@arm.com, bristot@redhat.com, linux-kernel@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 12, 2023 at 04:10:56PM +0200, Peter Zijlstra wrote:
> Hi
> 
> Thomas just tripped over the x86 topology setup creating a 'DIE' domain
> for the package mask :-)
> 
> Since these names are SCHED_DEBUG only, rename them.
> I don't think anybody *should* be relying on this, but who knows.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/powerpc/kernel/smp.c   | 2 +-
>  arch/s390/kernel/topology.c | 2 +-
>  arch/x86/kernel/smpboot.c   | 2 +-
>  kernel/sched/topology.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
