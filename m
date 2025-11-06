Return-Path: <linuxppc-dev+bounces-13831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826DBC3926D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 06:23:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d29b46mWpz30hN;
	Thu,  6 Nov 2025 16:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762406624;
	cv=none; b=J8fYOguDBcRqzeygySWVdaHDa4CXuMc1ODTyitUDyTcLKq3fxoDSm7mWtQ2t6jHR/P8dtM+E0ZR09PVfXtO1Lnk3RMVkky4tFKKz/bSxi6lo05X2ZJobo4ly8b9mM0oO/alfreXdOYgxyK+uDsYc/uQKsNmNKyQgRZK4UCX59MIEbeEgYjN8CHkG9koKbpsnDthteQtVpFR45UGdsOBTjcbOOc4C/acoo57NpK8EjZq0sQF0xY3+Pbm3DGLd4eY7MS+NE3YVE6SNGysWnsHlSCPGcguArzsfVi2SwMM51NyGDCOscuvABmm5hJVWNfLaE1zA8Ztie2W3gFPbnA0RKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762406624; c=relaxed/relaxed;
	bh=DwFr0QPGzWPA7dGMA5XNg8uF8VQKtoIZfo6/J2pXpkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMKJZAR69JMhnbZh16oz0x+fs9HNZ/TCxPIWtIrh12aokSR5QUS4jQCFI1j6GcOQoyI4ye7qX5kxgksNErRAw1ZSbIFy2M8lwrhesKzuXx22Mb0ZDsnUGDY1fOltFRJSuFZ93YCnJ8Chvqfbf4oXwMUQkWnoIMeuf+2n7iE1DNMxfzYIKZTssqhBDxFC/TNKxtZofpNb4oF3/Nb1DA00G3b3U1cnn0oxpfowbtkzzTFBCE0+SNFQglr1G1x3F5J47QjdYAb5RemFyxl3Wu8rAP883VnppiGLf1sD5LAiPZdorgF+9hXwR2GrXVpOOpwOJml1lVaocSptFShc11TL8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iomqPyju; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iomqPyju;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d29b412Nnz2yrq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 16:23:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5H972X024607;
	Thu, 6 Nov 2025 05:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=DwFr0QPGzWPA7dGMA5XNg
	8uF8VQKtoIZfo6/J2pXpkw=; b=iomqPyju4sQaqTd59jzsltum4F6BC6nGn4n0/
	3XB6PWnmnU8ciBE0SEmAdIsNihOpfMsrNSAb7KzQtCOFFX+UPn7WRJBRmfy0xn2c
	vAFyAQm+Xsk7iJEg/R1UpOJNivCKq+6nIAYccL1CR7w+0vD079n9Rl7Kv3Dtmquv
	YbuDCBHHGlU90cps6B88AKyQxbtHXe9EPf+Lv+uLtVDR1WekR4/050nD64KuZ1ZL
	w+s1VcC8hvJKAxd54gopMtyALlhisqBtKSJxKI1kPrjClh/6JmfDFP7m2CafwC8h
	t5TxYKR5wwccmpgTXWKoPqIACCb+6VEvwXnbsb65vigIMFSAQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc579c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:22:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A65M7SJ030258;
	Thu, 6 Nov 2025 05:22:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc579a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:22:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A64VArD012845;
	Thu, 6 Nov 2025 05:22:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y823jjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:22:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A65Mhoa23921014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 05:22:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 083DB20040;
	Thu,  6 Nov 2025 05:22:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2889A2004B;
	Thu,  6 Nov 2025 05:22:40 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu,  6 Nov 2025 05:22:39 +0000 (GMT)
Date: Thu, 6 Nov 2025 10:52:39 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v2 2/2] powerpc/smp: Disable steal from updating CPU
 capacity
Message-ID: <aQwwn4Z2aYDJlH9T@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20251029060757.2007601-1-srikar@linux.ibm.com>
 <20251029060757.2007601-2-srikar@linux.ibm.com>
 <CAKfTPtDW9rApEm+4qSrEpRDMA+68BnVOgegKUZUa5S-gKnR--A@mail.gmail.com>
 <aQHQ7UyaK849BKV8@linux.ibm.com>
 <CAKfTPtDtfy7=rb6rPVMAk1+Bq4w=+opiWuo_Y+3dy3me--6KsA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAKfTPtDtfy7=rb6rPVMAk1+Bq4w=+opiWuo_Y+3dy3me--6KsA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX8RzAKz0zt7hU
 nvsOiHA5qi8syQEbUHc5X5vsi9VgDKiwpssWbOYZgpttDbKVCTjBk1z2Yrcs6KP6i0ySqOb9HgE
 IbQW0wtHu/sokHVOL2T0aMeS44D0Tzzpyd5+ivoWkhhw4vApDFReTTzl+ju9KJ0IWpqNhsZW1Zl
 nc0JM+xS997VPi7pt4fbsH9y9+c64ey2icOumTrsqdgffwUEOtkXddPkwrXHTw0c3U8nYZk7u2j
 w0wHIE7LlcR47RtiXbhPqO2yy0KX5B+kwHUXe9vjobKaVNHuwi9QG2nqzLtubFMl/X4gMkDassf
 cXB4K5RNfIKpe/QeX7FROtJMB+36+bH4eSGKd4TMkxzK6FsX2bnqXh+Uu/IkUFFdtyyqNmbaKWC
 3AcRDEj5iusqT9ioPmN3w61Id6f/Lg==
X-Proofpoint-GUID: BQ3SxI7gMELqP_m7BLHpYl_f7YIqTGee
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690c30a8 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VnNF1IyMAAAA:8 a=hhWULnE4hpjtW6xssYsA:9 a=wPNLvfGTeEIA:10
 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: cutUNPXXEn1xwmBen4s7VexxGr3P5PqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Vincent Guittot <vincent.guittot@linaro.org> [2025-11-03 09:46:26]:

> On Wed, 29 Oct 2025 at 09:32, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> > * Vincent Guittot <vincent.guittot@linaro.org> [2025-10-29 08:43:34]:
> > > On Wed, 29 Oct 2025 at 07:09, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> > > >
> > > IIUC, the migration is triggered by the reduced capacity case when
> > > there is 1 task on the CPU
> >
> > Thanks Vincent for taking a look at the change.
> >
> > Yes, Lets assume we have 3 threads running on 6 vCPUs backed by 2 Physical
> > cores. So only 3 vCPUs (0,1,2) would be busy and other 3 (3,4,5) will be
> > idle. The vCPUs that are busy will start seeing steal time of around 33%
> > because they cant run completely on the Physical CPU. Without the change,
> > they will start seeing their capacity decrease. While the idle vCPUs(3,4,5)
> > ones will have their capacity intact. So when the scheduler switches the 3
> > tasks to the idle vCPUs, the newer busy vCPUs (3,4,5) will start seeing steal
> > and hence see their CPU capacity drops while the newer idle vCPUs (0,1,2)
> > will see their capacity increase since their steal time reduces. Hence the
> > tasks will be migrated again.
> 
> Thanks for the details
> This is probably even more visible when vcpu are not pinned to separate cpu

If workload runs on vCPUs pinned to CPUs belonging to the same core, then
yes, steal may be less visible. However if workload were to run unpinned or
were to run on vCPUs pinned to CPUs belonging to different cores, then its
more visible.

> > >
> > > > can repeat continuously, resulting in ping-pong behavior between SMT
> > > > siblings.
> > >
> > > Does it mean that the vCPU generates its own steal time or is it
> > > because other vcpus are already running on the other CPU and they
> > > starts to steal time on the sibling vCPU
> >
> > There are other vCPUs running and sharing the same Physical CPU, and hence
> > these vCPUs are seeing steal time.
> >
> > >
> > > >
> > > > To avoid migrations solely triggered by steal time, disable steal from
> > > > updating CPU capacity when running in shared processor mode.
> > >
> > > You are disabling the steal time accounting only for your arch. Does
> > > it mean that only powerpc are impacted by this effect ?
> >
> > On PowerVM, the hypervisor schedules at a core granularity. So in the above
> > scenario, if we assume SMT to be 2, then we have 3 vCores and 1 Physical
> > core. So even if 2 threads are running, they would be scheduled on 2 vCores
> > and hence we would start seeing 50% steal. So this steal accounting is more
> > predominant on Shared LPARs running on PowerVM.
> >
> > However we can use this same mechanism on other architectures too since the
> > framework is arch independent.
> >
> > Does this clarify?
> 
> yes, thanks
> I see 2 problems in your use case, the idle cpu doesn't have steal
> time even if the host cpu on which it will run, is already busy with
> other things
> and with not pinned vcpu, we can't estimate what will be the steal
> time on the target host
> And I don't see a simple way other than disabling steal time
> 

Yes, neither we can have steal time for an idle sibling nor can we estimate
the steal time for the target CPU. Thanks for acknowledging the problem.

-- 
Thanks and Regards
Srikar Dronamraju

