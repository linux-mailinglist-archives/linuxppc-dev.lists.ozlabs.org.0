Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9128735A2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 12:32:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S3N9L1m9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqVf74Ljbz3vXC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 22:32:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S3N9L1m9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqVdN3dfrz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 22:31:51 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 426BRuw6003931;
	Wed, 6 Mar 2024 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=nP8e8WQAM79G2ow6PcA0nvmRxu4/vNk9UzJLeTOvxm8=;
 b=S3N9L1m9xACV+eE9RwI0PRtIUMOyEoJH7iNdOm7O6mcj6VoPP1nJH78A/+ZatI05P1UW
 B7iZX2KR4aQAIlzU2QRQyVXqIuiMnTFHHmzPN74BUaLhCH0yaFNmZKk88S2RucFq4wN8
 Y7PVj7sDiWG6hpIph3b49CoV6w2pRn6QD5R1NOz6u/EeE1s0KzZmx3Kz8FDwAx4FFfkR
 bBFrVD7GDVT4MRXkM4PT7JgWiZQ/7Uy1oARk6bgPNMJFBYrhwIpZPpkA1/1ZxgtfufHt
 j99OsGvm3i22NZXAc8MpqTWU51ddTWzBhB88+eDbX/FcT0Kqf0F6HfCpkFvFTeOJNB/n Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wpqmt08r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 11:31:39 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 426BSB7K004795;
	Wed, 6 Mar 2024 11:31:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wpqmt08pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 11:31:38 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 426AGoOR026228;
	Wed, 6 Mar 2024 11:31:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wmfenxaae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 11:31:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 426BVXHL42336704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Mar 2024 11:31:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EC5E20040;
	Wed,  6 Mar 2024 11:31:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 376BF20043;
	Wed,  6 Mar 2024 11:31:33 +0000 (GMT)
Received: from DESKTOP-2CCOB1S. (unknown [9.171.196.149])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  6 Mar 2024 11:31:33 +0000 (GMT)
Date: Wed, 6 Mar 2024 12:31:31 +0100
From: Tobias Huschle <huschle@linux.ibm.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
Message-ID: <ZehUE9un8oIlwBKX@DESKTOP-2CCOB1S.>
References: <20240228161018.14253-1-huschle@linux.ibm.com>
 <fe8462ae-9144-6925-1679-a5079e5b0556@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8462ae-9144-6925-1679-a5079e5b0556@amd.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _kwtHa3WcAKyP48c5JEQgdSQ0Z3EvEo7
X-Proofpoint-ORIG-GUID: uzfJOcYhXSlP10TssDu9opckAfb7pCfk
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_06,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=839
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403060092
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, xuewen.yan94@gmail.com, mgorman@suse.de, ke.wang@unisoc.com, Xuewen Yan <xuewen.yan@unisoc.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 09:06:16AM +0530, K Prateek Nayak wrote:
> (+ Xuewen Yan, Ke Wang)
> 
> Hello Tobias,
> 
<...>
> > 
> > Questions:
> > 1. The kworker getting its negative lag occurs in the following scenario
> >    - kworker and a cgroup are supposed to execute on the same CPU
> >    - one task within the cgroup is executing and wakes up the kworker
> >    - kworker with 0 lag, gets picked immediately and finishes its
> >      execution within ~5000ns
> >    - on dequeue, kworker gets assigned a negative lag
> >    Is this expected behavior? With this short execution time, I would
> >    expect the kworker to be fine.
> >    For a more detailed discussion on this symptom, please see:
> >    https://lore.kernel.org/netdev/ZWbapeL34Z8AMR5f@DESKTOP-2CCOB1S./T/
> 
> Does the lag clamping path from Xuewen Yan [1] work for the vhost case
> mentioned in the thread? Instead of placing the task just behind the
> 0-lag point, clamping the lag seems to be more principled approach since
> EEVDF already does it in update_entity_lag().
> 
> If the lag is still too large, maybe the above coupled with Peter's
> delayed dequeue patch can help [2] (Note: tree is prone to force
> updates)
> 
> [1] https://lore.kernel.org/lkml/20240130080643.1828-1-xuewen.yan@unisoc.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/eevdf&id=e62ef63a888c97188a977daddb72b61548da8417

I tried Peter's patches a while ago. Unfortunately, reducing the lag
is not sufficient in this particular case. The calling entity expects
the woken up kworker to run instantly.

In order to have a chance that the woken up kworker is scheduled right
away, the kworker must not have any negative lag. To guarantee it being 
scheduled it should even have a positive lag which allows it to pass
all other entities on the queue.

Therefore I proposed to just wipe the negative lag in these cases, 
which seems to map to strategy #2 of the underlying paper.

The other way to think about this would be:
The assumption, that woken up tasks get a high probability to run
is no longer valid. In that case, the entity triggering the wake
up has to explicitly give up the CPU. If there are no other tasks,
apart from the 2 involved so far, has good chances of being 
scheduled. If the runqueue is busy, other tasks might intervene.

I keep playing around with these options, but potential side effects
are worrying me.

> 
<...>
