Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2436196C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 07:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM4w50rwkz3c17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 15:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jNdpefSj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jNdpefSj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM4vd5hrvz2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 15:46:20 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G5XSMH159195; Fri, 16 Apr 2021 01:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=cZatpJz7r9Pb3lIJ8lyqZnJ3pVY3CBNB9PbPfGG9/3k=;
 b=jNdpefSjb62MsaszcX+WhifLlZxwSXujsEqUR+cgRfzSXoS7/Epjfl5c8vhRjkBVeTTX
 zqRvPythyPrqz/KyAbQGW87AnT7Sp6OaXMsA+DSXgpOOavD5Mmj9hR0M0Izf661WgNzv
 i5JaPzzwJQks0cL4cGBBDJcdk4/vqWK55nwKZ9b1DVOGLdwmNxffjCoXYfgo+kkQaM/i
 DWhoC6OKPPO8RXYUKNxyT4ClOH2wwf92LO+tADd84kpqhw0NZDIgJjcHWcUZDfIH31V9
 3hK5Tk7Vff1GWaoqoxNs4xpZdHWctHhpTZATl9fB1rn4U0OoAwfc3hlMT6IBFo3/pGL2 vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xy1c6df4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 01:45:58 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13G5YTvk162308;
 Fri, 16 Apr 2021 01:45:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xy1c6ded-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 01:45:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G5gvi4012516;
 Fri, 16 Apr 2021 05:45:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37u3n8v8tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 05:45:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13G5jULf37683532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 05:45:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF928A405B;
 Fri, 16 Apr 2021 05:45:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EFA6A405C;
 Fri, 16 Apr 2021 05:45:50 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 16 Apr 2021 05:45:50 +0000 (GMT)
Date: Fri, 16 Apr 2021 11:15:49 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/3] powerpc/smp: Reintroduce cpu_core_mask
Message-ID: <20210416054549.GF2633526@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
 <YHkCvuNfZLQRxjU8@yekko.fritz.box>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YHkCvuNfZLQRxjU8@yekko.fritz.box>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oZrRZo_7HoGuaCKqzKeSIkxq8YaAz2uU
X-Proofpoint-ORIG-GUID: 0-KTm44YceOFQe_GEKMnBGvMdn0-G6Rq
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 suspectscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160042
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 hegdevasant@linux.vnet.ibm.com, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* David Gibson <david@gibson.dropbear.id.au> [2021-04-16 13:21:34]:

Thanks for having a look at the patches.

> On Thu, Apr 15, 2021 at 05:39:32PM +0530, Srikar Dronamraju wrote:
> > Daniel reported that with Commit 4ca234a9cbd7 ("powerpc/smp: Stop
> > updating cpu_core_mask") QEMU was unable to set single NUMA node SMP
> > topologies such as:
> >  -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
> >  i.e he expected 2 sockets in one NUMA node.
> 
> Well, strictly speaking, you can still set that toplogy in qemu but a
> PAPR guest with that commit will show as having 1 socket in lscpu and
> similar things.
> 

Right, I did mention the o/p of lscpu in QEMU with the said commit and
with the new patches in the cover letter. Somehow I goofed up the cc
list for the cover letter.

Reference for the cover letter:
https://lore.kernel.org/linuxppc-dev/20210415120934.232271-1-srikar@linux.vnet.ibm.com/t/#u

> Basically, this is because PAPR has no meaningful distinction between
> cores and sockets.  So it's kind of a cosmetic problem, but it is a
> user-unexpected behaviour that it would be nice to avoid if it's not
> excessively difficult.
> 
> > The above commit helped to reduce boot time on Large Systems for
> > example 4096 vCPU single socket QEMU instance. PAPR is silent on
> > having more than one socket within a NUMA node.
> > 
> > cpu_core_mask and cpu_cpu_mask for any CPU would be same unless the
> > number of sockets is different from the number of NUMA nodes.
> 
> Number of sockets being different from number of NUMA nodes is routine
> in qemu, and I don't think it's something we should enforce.
> 
> > One option is to reintroduce cpu_core_mask but use a slightly
> > different method to arrive at the cpu_core_mask. Previously each CPU's
> > chip-id would be compared with all other CPU's chip-id to verify if
> > both the CPUs were related at the chip level. Now if a CPU 'A' is
> > found related / (unrelated) to another CPU 'B', all the thread
> > siblings of 'A' and thread siblings of 'B' are automatically marked as
> > related / (unrelated).
> > 
> > Also if a platform doesn't support ibm,chip-id property, i.e its
> > cpu_to_chip_id returns -1, cpu_core_map holds a copy of
> > cpu_cpu_mask().
> 
> Yeah, the other weirdness here is that ibm,chip-id isn't a PAPR
> property at all - it was added for powernv.  We then added it to qemu
> for PAPR guests because that was the way at the time to get the guest
> to advertise the expected number of sockets.  It therefore basically
> *only* exists on PAPR/qemu for that purpose, so if it's not serving it
> we need to come up with something else.
> 

Do you have ideas on what that something could be like? So if that's
more beneficial then we could move over to that scheme. Also apart
from ibm,chip-id being not a PAPR property, do you have any other
concerns with it.


-- 
Thanks and Regards
Srikar Dronamraju
