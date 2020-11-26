Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAC42C522A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:39:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChZ4W2s9WzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:39:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UVsWnc0/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChZ212Kn7zDr68
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:36:57 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQAYW00113945; Thu, 26 Nov 2020 05:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=m/0Ud+Y9sLKwSOBpriMdv68av39tHk6G9zrI6b0TQwI=;
 b=UVsWnc0/GCWj8DJqYzz8wcqxhOqUSsz8aWb1is/sFs2ko5HE1h9xVQwqiYayE9UxfyMG
 jRQbcmBkpWbsJyVCNy3OHt+dijZDXV+Yl2lFt0dAkzC0LzdGhSxKK/EJ5hdoxkHbKBJI
 50HSdmP1Ot654Tdlok760IjE6uzsb21uE1QXv0E7po5LzB1AeEuSNZPOsvL+ljV9je8E
 jkoTfogOna5h3fFrTL5ArGWGcRjfHWDT13+kGCQ5G6u5bVxKkHNc4Vl7UNfsE900jHED
 wKwZjdq5MrGdZa4JN4OAEsGO6tQbq8U0Z62tLHl0Qs3/Kt9anLtsIcryc7uI0cQdByR3 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3520xt5mfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 05:36:54 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AQAaPp6119384;
 Thu, 26 Nov 2020 05:36:54 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3520xt5mf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 05:36:54 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQARDc7021300;
 Thu, 26 Nov 2020 10:36:53 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 35133p6s1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 10:36:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQAariu63701398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 10:36:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F36828058;
 Thu, 26 Nov 2020 10:36:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 298FB28059;
 Thu, 26 Nov 2020 10:36:51 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.48.28])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 10:36:50 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/4] powerpc/64s: Fix for radix TLB invalidation bug
In-Reply-To: <20201126102530.691335-1-npiggin@gmail.com>
References: <20201126102530.691335-1-npiggin@gmail.com>
Date: Thu, 26 Nov 2020 16:06:47 +0530
Message-ID: <87360wqu9s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_03:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260063
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
Cc: Milton Miller <miltonm@us.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This fixes a tricky bug that was noticed by TLB multi-hits in a guest
> stress testing CPU hotplug, but TLB invalidation means any kind of
> data corruption is possible.
>
> Thanks,
> Nick
>
> Nicholas Piggin (4):
>   powerpc/64s: Fix hash ISA v3.0 TLBIEL instruction generation
>   powerpc/64s/pseries: Fix hash tlbiel_all_isa300 for guest kernels
>   kernel/cpu: add arch override for clear_tasks_mm_cpumask() mm handling
>   powerpc/64s: Trim offlined CPUs from mm_cpumasks
>
>  arch/powerpc/include/asm/book3s/64/mmu.h     | 12 ++++++++++
>  arch/powerpc/mm/book3s64/hash_native.c       | 23 +++++++++++++-------
>  arch/powerpc/mm/book3s64/mmu_context.c       | 20 +++++++++++++++++
>  arch/powerpc/platforms/powermac/smp.c        |  2 ++
>  arch/powerpc/platforms/powernv/smp.c         |  3 +++
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |  3 +++
>  kernel/cpu.c                                 |  6 ++++-
>  7 files changed, 60 insertions(+), 9 deletions(-)
>
You can add for the series

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

-aneesh
