Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0CF23DA95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 15:12:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpmj1NRQzDqrM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 23:12:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QUJyF20P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMpN218gJzDqq8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:54:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076Cm3kU143057; Thu, 6 Aug 2020 08:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=kLXKmSnVlmdtUZjHTj796ycXcVrQoTJVvUMMwy3L9uQ=;
 b=QUJyF20PNAG4Ka4uAR7bLNxR0pMVq3Z1fVJpqLDi83iBffcGSb7gFtX72O/tEvMITdFV
 Es5cXi44KlzbCrzbSb+ceiuskAjUSlk2EZyvorzfrB800X/Mkz1jHB0LkrhE4i/K2UAa
 6/7shZVjkrBDIG6yiAf3h7neuGDQlqbvvK2F9d6fv/5QE0/QXL6Jjc+aJLIinzalruX7
 0xIC3aLpBGJSOE+7MKp9tempq+kfGBcgT3o7B1N1srVeVZqOEK5Nc6NFWANVtL2ybgcT
 Gc1JGFIwSPC3sbzUUgnjJCjdWPglA2dfzDj5NWB4/I8GPyqUlOQ61fWi5ZltO/y/gKrs Fg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rgnf3335-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 08:53:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076CiKeN019063;
 Thu, 6 Aug 2020 12:53:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32n0185fhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 12:53:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 076CrmrX53412194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 12:53:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 719F7A4060;
 Thu,  6 Aug 2020 12:53:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 162FCA405B;
 Thu,  6 Aug 2020 12:53:46 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  6 Aug 2020 12:53:45 +0000 (GMT)
Date: Thu, 6 Aug 2020 18:23:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: peterz@infradead.org
Subject: Re: [PATCH 1/2] sched/topology: Allow archs to override cpu_smt_mask
Message-ID: <20200806125345.GB31068@linux.vnet.ibm.com>
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
 <20200804104520.GB2657@hirez.programming.kicks-ass.net>
 <20200804121007.GJ24375@linux.vnet.ibm.com>
 <20200804124755.GJ2674@hirez.programming.kicks-ass.net>
 <87ft90z6dy.fsf@mpe.ellerman.id.au>
 <20200806085429.GX2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200806085429.GX2674@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=1 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060091
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* peterz@infradead.org <peterz@infradead.org> [2020-08-06 10:54:29]:

> On Thu, Aug 06, 2020 at 03:32:25PM +1000, Michael Ellerman wrote:
> 
> > That brings with it a bunch of problems, such as existing software that
> > has been developed/configured for Power8 and expects to see SMT8.
> > 
> > We also allow LPARs to be live migrated from Power8 to Power9 (and back), so
> > maintaining the illusion of SMT8 is considered a requirement to make that work.
> 
> So how does that work if the kernel booted on P9 and demuxed the SMT8
> into 2xSMT4? If you migrate that state onto a P8 with actual SMT8 you're
> toast again.
> 

To add to what Michael already said, the reason we don't expose the demux of
SMT8 into 2xSMT4 to userspace, is to make the userspace believe they are on
a SMT8. When the kernel is live migrated from P8 to P9, till the time of reboot
they would only have the older P8 topology. After reboot the kernel topology
would change, but the userspace is made to believe that they are running on
SMT8 core by way of keeping the sibling_cpumask at SMT8 core level.

-- 
Thanks and Regards
Srikar Dronamraju
