Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C962626805A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 18:56:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqFxy24b7zDqdt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 02:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pdSamIuI; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqFty51w3zDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 02:53:46 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08DGWdsa008576; Sun, 13 Sep 2020 12:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=0Lhng2sbqsY5JmEA580Ged2Sijf07s/jdsuJDC4FmI4=;
 b=pdSamIuIeuCf8SgcMcJerdHXQKAUrBOC6Z2ges2HPQU7gOVog2qZR4jaeZjv33x9bD1G
 s+RFL6D/KUksp5XxY+gXmjEi+hGRg9nZW9R2EYMWtBb66fp/cK9e2B2uZH8iZOI+y2KF
 4zn8AphYSvCn3SrjcqKmSjjrLcBU4spMDss4Ahwli5FmZI7utpGSoFMKuA9zaShel35d
 0XJ6to7LFbWyYsSmoOi4W9xc5AJx0v6SryqVox3cdCSBJGzVFiXICOzbgw/w7VCpw8IW
 2ntDhODt7VEhnW2BMXWYXInxduuHmmzVnvG8NALu1INE0en/V7wFGKfEUkDfJ8CO+8++ bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hq1bg8jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 12:53:30 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08DGZstV015271;
 Sun, 13 Sep 2020 12:53:30 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hq1bg8jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 12:53:29 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08DGr5hp005666;
 Sun, 13 Sep 2020 16:53:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 33hkfag2jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 16:53:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08DGrPvS13107476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Sep 2020 16:53:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA320AE045;
 Sun, 13 Sep 2020 16:53:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0404AE04D;
 Sun, 13 Sep 2020 16:53:23 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun, 13 Sep 2020 16:53:23 +0000 (GMT)
Date: Sun, 13 Sep 2020 22:23:22 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200913165322.m24vbwvbw6ah2zzs@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
 <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
 <87y2lgr0ic.fsf@mpe.ellerman.id.au>
 <20200912044603.GA11808@linux.vnet.ibm.com>
 <87imciqwhq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87imciqwhq.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-13_05:2020-09-10,
 2020-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=1
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009130144
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2020-09-13 11:46:41]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > * Michael Ellerman <mpe@ellerman.id.au> [2020-09-11 21:55:23]:
> >
> >> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> >> > Current code assumes that cpumask of cpus sharing a l2-cache mask will
> >> > always be a superset of cpu_sibling_mask.
> >> >
> >> > Lets stop that assumption. cpu_l2_cache_mask is a superset of
> >> > cpu_sibling_mask if and only if shared_caches is set.
> >> 
> >> I'm seeing oopses with this:
> >> 
> 
> The patch fixes qemu, and I don't see the crash on mambo, but I still
> see:
>   [    0.010536] smp: Bringing up secondary CPUs ...
>   [    0.019189] smp: Brought up 2 nodes, 8 CPUs
>   [    0.019210] numa: Node 0 CPUs: 0-3
>   [    0.019235] numa: Node 1 CPUs: 4-7
>   [    0.024444]      the CACHE domain not a subset of the MC domain
>   [    0.024505] BUG: arch topology borken
>   [    0.024527]      the SMT domain not a subset of the CACHE domain
>   [    0.024563] BUG: arch topology borken
>   [    0.024584]      the CACHE domain not a subset of the MC domain
>   [    0.024645] BUG: arch topology borken
>   [    0.024666]      the SMT domain not a subset of the CACHE domain
>   [    0.024702] BUG: arch topology borken
>   [    0.024723]      the CACHE domain not a subset of the MC domain
> 
> That's the p9 mambo model, using skiboot.tcl from skiboot, with CPUS=2,
> THREADS=4 and MAMBO_NUMA=1.
> 

I was able to reproduce with
 qemu-system-ppc64 -nographic -vga none -M pseries -cpu POWER8 \
   -kernel build~/vmlinux \
   -m 2G,slots=2,maxmem=4G \
   -object memory-backend-ram,size=1G,id=m0 \
   -object memory-backend-ram,size=1G,id=m1 \
   -numa node,nodeid=0,memdev=m0 \
   -numa node,nodeid=1,memdev=m1 \
   -smp 8,threads=4,sockets=2,maxcpus=8  \


If the CPU doesn't have a l2-cache element, then CPU not only has to set
itself in the cpu_l2_cache but also the siblings. Otherwise it will so
happen that the Siblings will have 4 Cpus set, and the Cache domain will
have just one cpu set, leading to this BUG message.

Patch follows this mail.

> Node layout is:
> 
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x00000000ffffffff]
> [    0.000000]   node   1: [mem 0x0000200000000000-0x00002000ffffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000ffffffff]
> [    0.000000] On node 0 totalpages: 65536
> [    0.000000] Initmem setup node 1 [mem 0x0000200000000000-0x00002000ffffffff]
> [    0.000000] On node 1 totalpages: 65536
> 
> 
> There aren't any l2-cache properties in the device-tree under cpus.
> 
> I'll try and have a closer look tonight.
> 
> cheers

-- 
Thanks and Regards
Srikar Dronamraju
