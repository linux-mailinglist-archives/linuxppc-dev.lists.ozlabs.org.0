Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B401E3B3C5A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 07:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB5c522JVz3c0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 15:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lcigLJMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lcigLJMA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB5bc07B0z302B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 15:46:35 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15P5ihlx117234; Fri, 25 Jun 2021 01:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Hnp9sEc1Zv51a6wVxJRQy5Y96XTuyf8F08yDG+Cs3LE=;
 b=lcigLJMAr7dZx/RLIWptyaB0QQCN8r7lzUHtwsO2u2/3snR5Uz6Z8GO2ze/py7cSI8sG
 S2zsDZ6gC7PHlBsW0m4neAkamGq2na4CUxP479vBZch+srlcZ5/LFdPWqaypKZCWAA9J
 sizV+fyNelyjZ2XLjoM36QjZ1JRcOHBk1wgbVgp56YHJcX9YSLjTifXIfUh8hzHS5Kha
 FuRme/lsjQqP74MHa8zjT15TUzXzGp2q4nfeiLemTzfVcAuN4khwWBD6DX/R99vy7Ur3
 Fl5HhukZ0z3J/0TaoKIoRlSYhi0AZ+PuJNKS9w9fa3M6x7Pp3Zm+ZgFV1WlsiWHtdLqc Eg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39d98s815w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 01:46:16 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15P5dP3m006730;
 Fri, 25 Jun 2021 05:46:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3997uhhk9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 05:46:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15P5kBWk24904124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 05:46:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FF8952050;
 Fri, 25 Jun 2021 05:46:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 82E5C52059;
 Fri, 25 Jun 2021 05:46:09 +0000 (GMT)
Date: Fri, 25 Jun 2021 11:16:08 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: PowerPC guest getting "BUG: scheduling while atomic" on
 linux-next-20210623 during secondary CPUs bringup
Message-ID: <20210625054608.fmwt7lxuhp7inkjx@linux.vnet.ibm.com>
References: <YNSq3UQTjm6HWELA@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YNSq3UQTjm6HWELA@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0Xidfmp9vCkq_Tn5j92Sq7EKuh_HE11t
X-Proofpoint-GUID: 0Xidfmp9vCkq_Tn5j92Sq7EKuh_HE11t
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-25_01:2021-06-24,
 2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106250030
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
Cc: Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Bharata B Rao <bharata@linux.ibm.com> [2021-06-24 21:25:09]:

> A PowerPC KVM guest gets the following BUG message when booting
> linux-next-20210623:
> 
> smp: Bringing up secondary CPUs ...
> BUG: scheduling while atomic: swapper/1/0/0x00000000
> no locks held by swapper/1/0.
> Modules linked in:
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.13.0-rc7-next-20210623
> Call Trace:
> [c00000000ae5bc20] [c000000000badc64] dump_stack_lvl+0x98/0xe0 (unreliable)
> [c00000000ae5bc60] [c000000000210200] __schedule_bug+0xb0/0xe0
> [c00000000ae5bcd0] [c000000001609e28] __schedule+0x1788/0x1c70
> [c00000000ae5be20] [c00000000160a8cc] schedule_idle+0x3c/0x70
> [c00000000ae5be50] [c00000000022984c] do_idle+0x2bc/0x420
> [c00000000ae5bf00] [c000000000229d88] cpu_startup_entry+0x38/0x40
> [c00000000ae5bf30] [c0000000000666c0] start_secondary+0x290/0x2a0
> [c00000000ae5bf90] [c00000000000be54] start_secondary_prolog+0x10/0x14
> 
> <The above repeats for all the secondary CPUs>
> 
> smp: Brought up 2 nodes, 16 CPUs
> numa: Node 0 CPUs: 0-7
> numa: Node 1 CPUs: 8-15
> 
> This seems to have started from next-20210521 and isn't seen on
> next-20210511.
> 

Bharata,

I think the regression is due to Commit f1a0a376ca0c ("sched/core:
Initialize the idle task with preemption disabled")

Can you please try with the above commit reverted?

-- 
Thanks and Regards
Srikar Dronamraju
