Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E51EDA8D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 03:41:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cpQb1MZ7zDqP2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 11:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cpNF33VbzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 11:39:09 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0541VpXF090955; Wed, 3 Jun 2020 21:39:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ek5qxke4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 21:39:02 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0541W4pK092131;
 Wed, 3 Jun 2020 21:39:02 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ek5qxkdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 21:39:02 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0541UrdI023861;
 Thu, 4 Jun 2020 01:39:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 31bf48th4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 01:39:01 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0541d0LP10420562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 01:39:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B36BE056;
 Thu,  4 Jun 2020 01:39:00 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26D1ABE05A;
 Thu,  4 Jun 2020 01:39:00 +0000 (GMT)
Received: from localhost (unknown [9.160.98.233])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jun 2020 01:38:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/pseries: remove cede offline state for CPUs
In-Reply-To: <20200603103044.GB25460@in.ibm.com>
References: <20200602043140.397746-1-nathanl@linux.ibm.com>
 <20200602043140.397746-2-nathanl@linux.ibm.com>
 <20200603103044.GB25460@in.ibm.com>
Date: Wed, 03 Jun 2020 20:38:59 -0500
Message-ID: <87pnafsj7w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 cotscore=-2147483648 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040005
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
Cc: svaidy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gautham,

Gautham R Shenoy <ego@linux.vnet.ibm.com> writes:
> On Mon, Jun 01, 2020 at 11:31:39PM -0500, Nathan Lynch wrote:
>> This effectively reverts commit 3aa565f53c39 ("powerpc/pseries: Add
>> hooks to put the CPU into an appropriate offline state"), which added
>> an offline mode for CPUs which uses the H_CEDE hcall instead of the
>> architected stop-self RTAS function in order to facilitate "folding"
>> of dedicated mode processors on PowerVM platforms to achieve energy
>> savings. This has been the default offline mode since its
>> introduction.
>> 
>> There's nothing about stop-self that would prevent the hypervisor from
>> achieving the energy savings available via H_CEDE, so the original
>> premise of this change appears to be flawed.
>
>
> IIRC, back in 2009, when the Extended-CEDE was introduced, it couldn't
> be exposed via the cpuidle subsystem since this state needs an
> explicit H_PROD as opposed to the H_IPI which wakes up the regular
> CEDE call. So, the alterative was to use the CPU-Hotplug way by having
> a userspace daemon fold the cores which weren't needed currently and
> bring them back online when they were needed. Back then, Long Term
> CEDE was definitely faster compared to stop-self call (It is a pity
> that I didn't post the numbers when I wrote the patch) and the
> time-taken to unfold a core was definitely one of the concerns.
> (https://lkml.org/lkml/2009/9/23/522).

Thanks for the background. Ideally, we would understand what has changed
since then... certainly the offline path would have been slower when
pseries_cpu_die() slept for 200ms between issuing
query-cpu-stopped-state calls, but that was changed in 2008 in
b906cfa397fd ("powerpc/pseries: Fix cpu hotplug") so perhaps it wasn't a
factor in your measurements. Even less sure about what could have
made the online path more expensive.

(For the benefit of anybody else referring to the 2009 discussion that
you linked: that exchange is a bit strange to me because there seems to
be a conception that stop-self releases the processor to the platform in
a way that could prevent the OS from restarting it on demand. I don't
believe this has ever been the case. Processor deallocation is a related
but separate workflow involving different RTAS functions.)

> The patch looks good to me.
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

I appreciate the review, thanks!
