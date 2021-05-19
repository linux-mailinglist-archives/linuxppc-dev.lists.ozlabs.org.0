Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C3388D92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 14:09:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlWqv4k1Jz3fYr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 22:08:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RxAvtoI2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RxAvtoI2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlWnJ23Z3z3dpb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 22:06:43 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JC48i2038320; Wed, 19 May 2021 08:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=cP8c73zIy1dlU1vTZozqkzWOpPkiPQhyHGHl7LqR8Jw=;
 b=RxAvtoI22WV8oQ5I5hvE5S1ec2cGTAtMuq5HCD+Bd3Yf/xULHjaqZ/WI18WIxyyQgjaW
 iGIssqCsudUYFGdwo1qJbV2OUmm/dVqeK8BpoUBKQ6KpewKeqpfV7gbYSZo6C6qNvN5Q
 gb47M9u7Aa3u/CuTmjxRxfhtp6cfyCIXO9Wz/uz1D2RNxhPDceZW4R/P1/5Yfeu3ExlH
 93aFeCde/duHJOkEgHLaY/cTe7RX9oF6nD5jpFA2/vgljqOWDRtXQXKxAFiq5GK2icG0
 EzNl51MR4Z0/B9pImIRJj+eS6A/x++K49o6dsuu2VeYL8oC7K8XC8slM89V/kkX+BeVQ HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38n27dr9sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 08:06:04 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14JC63KV051559;
 Wed, 19 May 2021 08:06:03 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38n27dr9qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 08:06:03 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14JBnEEc022492;
 Wed, 19 May 2021 12:06:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh15e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 12:06:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14JC5UoD20840766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 12:05:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CDC252057;
 Wed, 19 May 2021 12:05:58 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id CBDD45204E;
 Wed, 19 May 2021 12:05:54 +0000 (GMT)
Date: Wed, 19 May 2021 17:35:54 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 5/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
Message-ID: <20210519120554.ukpllslfvm4l5cah@linux.vnet.ibm.com>
References: <20210513154909.6385-1-ricardo.neri-calderon@linux.intel.com>
 <20210513154909.6385-6-ricardo.neri-calderon@linux.intel.com>
 <YJ5HQR943rSFsLxw@hirez.programming.kicks-ass.net>
 <20210515021415.GB14212@ranerica-svr.sc.intel.com>
 <20210518190740.GA15251@ranerica-svr.sc.intel.com>
 <YKThlA2yZBT2KuvW@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YKThlA2yZBT2KuvW@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: weijgsleVHdTpP5qokV971lgItdMVC0g
X-Proofpoint-GUID: kn2AaYBKUeGykwFd0pbm3RtxF20CD6Jx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_04:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190077
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Tim Chen <tim.c.chen@linux.intel.com>, Len Brown <len.brown@intel.com>,
 Quentin Perret <qperret@google.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Aubrey Li <aubrey.li@linux.intel.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Ben Segall <bsegall@google.com>, Ingo Molnar <mingo@kernel.org>,
 Mel Gorman <mgorman@suse.de>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Aubrey Li <aubrey.li@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Peter Zijlstra <peterz@infradead.org> [2021-05-19 11:59:48]:

> On Tue, May 18, 2021 at 12:07:40PM -0700, Ricardo Neri wrote:
> > On Fri, May 14, 2021 at 07:14:15PM -0700, Ricardo Neri wrote:
> > > On Fri, May 14, 2021 at 11:47:45AM +0200, Peter Zijlstra wrote:
> 
> > > > So I'm thinking that this is a property of having ASYM_PACKING at a core
> > > > level, rather than some arch special. Wouldn't something like this be
> > > > more appropriate?
> 
> > > Thanks Peter for the quick review! This makes sense to me. The only
> > > reason we proposed arch_asym_check_smt_siblings() is because we were
> > > about breaking powerpc (I need to study how they set priorities for SMT,
> > > if applicable). If you think this is not an issue I can post a
> > > v4 with this update.
> > 
> > As far as I can see, priorities in powerpc are set by the CPU number.
> > However, I am not sure how CPUs are enumerated? If CPUs in brackets are
> > SMT sibling, Does an enumeration looks like A) [0, 1], [2, 3] or B) [0, 2],
> > [1, 3]? I guess B is the right answer. Otherwise, both SMT siblings of a
> > core would need to be busy before a new core is used.
> > 
> > Still, I think the issue described in the cover letter may be
> > reproducible in powerpc as well. If CPU3 is offlined, and [0, 2] pulled
> > tasks from [1, -] so that both CPU0 and CPU2 become busy, CPU1 would not be
> > able to help since CPU0 has the highest priority.
> > 
> > I am cc'ing the linuxppc list to get some feedback.
> 
> IIRC the concern with Power is that their Cores can go faster if the
> higher SMT siblings are unused.
> 
> That is, suppose you have an SMT4 Core with only a single active task,
> then if only SMT0 is used it can reach max performance, but if the
> active sibling is SMT1 it can not reach max performance, and if the only
> active sibling is SMT2 it goes slower still.
> 
> So they need to pack the tasks to the lowest SMT siblings, and have the
> highest SMT siblings idle (where possible) in order to increase
> performance.
> 
> 

If you are referring to SD_ASYM_PACKING, then packing tasks to lowest SMT
was needed in POWER7 timeframe. So if there was one thread running, then
running on the lowest sibling provided the best performance as if running in
single threaded mode.

However recent chips like POWER8/ POWER9 / POWER10 dont need SD_ASYM_PACKING
since the hardware itself does the switch. So even if task is place on a
higher sibling within the core, we dont need to switch the task to a lower
sibling for it to perform better. Now running only one thread running on any
sibling, its expected to run in single threaded mode.

-- 
Thanks and Regards
Srikar Dronamraju
