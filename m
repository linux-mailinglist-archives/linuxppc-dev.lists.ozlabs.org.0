Return-Path: <linuxppc-dev+bounces-14660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8DCA8F31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 19:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNLHx3bVyz2y7b;
	Sat, 06 Dec 2025 05:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764961117;
	cv=none; b=Mgb3EcVHowPMpGDIthqesVZYBauqEpn1w+TckQJ1XS3So5PZXKPpwjgVjWEeXD8TaBvN99CNa+sKbUACiziyqIX2MlR6L1Vgaq4bkeSHwL5hq537/M4j23orIJI/MGrxbeqsvql9p+Cr4u/KKIRZY4qn7H8thAlh36i5nJTaCcHePxDL2vC5coO9qab2fCLQaR1j7k0d6dDkuy7TTDY0YQn9RbjmT89jJX1GMIUPvoUabCYdX2t5PRymRb23N30akL4ksKgNLmKSSPem0NK5WnVbIEY+SYl/L+sPEBT245wSYa+28u+/I5KSsZGU7WDSiAPE4N/CzSZcq42pLSZpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764961117; c=relaxed/relaxed;
	bh=9oUMt31tFn8DjFX4qRKjTFTcsx0BuU9CQIV45NtX3Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxeEvx2tA4XsQ26b8rT6bCeZCBd59BQCaJ9sMj0Ibfu09XM9z22rxRsY1P+M2DAu6xi+hlA9uCjXPHxrA1h4RpHmKpTavIMxmx2/vkkKUFtpdDwt83V/kXsu4CV83ORVuWAIJ6qDOSuI3qmOmBk8uLDElRjtVkzbxrf615lM9qAyoolyiUFelQXliUVDbPVfES85L6UKYNSKGi2PdZuNdZpzhTjJon/O96YhuLHKTwCMlGc74ZTAqec1iq13K+IgTKeNlmd6X+bhFzOCDAaFmXksEPHBlSYdFn5gsVjsUTqH6zoP3YA+f/EEueGs4kOkQbdYpGKFz1APX9gWHMVb3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PIjobXfM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PIjobXfM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNLHw3fpQz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 05:58:36 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5D9Xsa017680;
	Fri, 5 Dec 2025 18:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=9oUMt31tFn8DjFX4qRKjT
	FTcsx0BuU9CQIV45NtX3Yg=; b=PIjobXfMexLZlOUAgfUyRgMwC0tFSa0B+nMa9
	FeQ1WfXGTHH9t1SuPr59j5Yx/lBFCdQv3qhm/uNl0m+C5sf0ju5DoILT/uECmKu/
	k5Rhr9frGi6QYci57VPLlRtl486z9vNZhhWWGgyH1isMdZ0CsUAPb/YEstJIPfd9
	BEptC/NFMHOyKulx/CEz8Uvxk8fFCtkuepii+inltYWSYMba/hxexLwr9c/IfXk4
	r3gYxIdusH/6clSIYa9x4nL6YUk5Z8iUdakF2L8km3eL3eYEtStdZdEzz+TU78Uo
	HUfBI6Yju+giOY8vi5dSS9xzpm2V+BoiKKyQT75niDYxko+FA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7fesb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 18:58:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5Iu38U002483;
	Fri, 5 Dec 2025 18:58:07 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7fes6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 18:58:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5H9aoA024071;
	Fri, 5 Dec 2025 18:58:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5sy1t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 18:58:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5Iw2vA24511080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 18:58:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 186CC20043;
	Fri,  5 Dec 2025 18:58:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 326EF20040;
	Fri,  5 Dec 2025 18:57:58 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  5 Dec 2025 18:57:58 +0000 (GMT)
Date: Sat, 6 Dec 2025 00:27:57 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 08/17] sched/core: Implement CPU soft offline/online
Message-ID: <aTMrNXJmkzdW3CB5@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
 <20251204175405.1511340-9-srikar@linux.ibm.com>
 <20251205160723.GG2528459@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20251205160723.GG2528459@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=69332b3f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=w-QnvMon_CLLnCPMzYQA:9 a=wPNLvfGTeEIA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: OHs6pqoDEWGUHvMLMBZqBpHEszSpD-HS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX6AL0wVQkVrx9
 9eDheMNN0BsckWBCiGrzjgk1H3CPdBlfk6fR91nrVvfRdVGJTT8BH39qQ/MhLiljKbWH3YW9TZ7
 lnkS7496AXkzHHn0Hoy88Gpiv9rzA//Nkxx+s8B+CBMaqAtd4ju/rQHZhRiGLTkdjJv4Kot/tar
 X77FEAPHtOcUster9srcLvDZNqLeXxqH/f3I9kL3wfjItTcuOXYxf4U8NV0j7Lcm/XqBlCD71Iw
 vQ6rxFd3/mLI/v1SW3Xa150bFmGErcHLsD7ScbbNEl9IF2+Rk9RQs04Sgd2b3XzuBxl2KkDVgUh
 zvefHIFKFHqgaqS46xVJkbHwXPCpaaGykdgogC6fY8meQvInsE6lIXvblokU7YAYy1aowt3bRJS
 bv3acAybwnmgKuaOM3XQpG7VUqsFVA==
X-Proofpoint-ORIG-GUID: zz7UTINgXEyfX4_z4g-uyFwkgmaLD54A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Peter Zijlstra <peterz@infradead.org> [2025-12-05 17:07:23]:

> On Thu, Dec 04, 2025 at 11:23:56PM +0530, Srikar Dronamraju wrote:
> > Scheduler already supports CPU online/offline. However for cases where
> > scheduler has to offline a CPU temporarily, the online/offline cost is
> > too high. Hence here is an attempt to come-up with soft-offline that
> > almost looks similar to offline without actually having to do the
> > full-offline. Since CPUs are not to be used temporarily for a short
> > duration, they will continue to be part of the CPU topology.
> > 
> > In the soft-offline, CPU will be marked as inactive, i.e removed from
> > the cpu_active_mask, CPUs capacity would be reduced and non-pinned tasks
> > would be migrated out of the CPU's runqueue.
> > 
> > Similarly when onlined, CPU will be remarked as active, i.e. added to
> > cpu_active_mask, CPUs capacity would be restored.
> > 
> > Soft-offline is almost similar as 1st step of offline except rebuilding
> > the sched-domains. Since the other steps are not done including
> > rebuilding the sched-domain, the overhead of soft-offline would be less
> > compared to regular offline. A new cpumask is used to indicate
> > soft-offline is in progress and hence skips rebuilding the
> > sched-domains.
> 
> Note that your thing still very much includes the synchronize_rcu() that
> a lot of the previous 'hotplug is too slow' crowd have complained about.
> 
> So I'm taking it that your steal time thing really isn't that 'fast'.

Yes, it does have synchronize_rcu()
> 
> It might be good to mention the frequency at which you expect cores to
> come and go with your setup.

We are expecting the cores to keep changing at a 1 second to 2second
frequency.

-- 
Thanks and Regards
Srikar Dronamraju

