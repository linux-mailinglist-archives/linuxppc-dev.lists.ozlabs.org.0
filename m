Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2D29E3A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:16:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMGvW6kcszDqZj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 18:16:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DoleYZ6c; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMGsT6QtvzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 18:14:37 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T714Jr075025; Thu, 29 Oct 2020 03:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=/G+h1YtJ3evJ2tYky/3ih8cerioaFKYOhPorLL+k/gs=;
 b=DoleYZ6cbC7cttEO9tnTjjoAVFhP8fTr1fny6gjSPaUlHeWOwkqq5MUUxVhRzMXOOKTv
 JVbh9zNWaTpFQ2s3IW3awavNAUCP8mTUTyvLmrqW3BROwwskLUvhx3/szDd0uvFw/N7N
 7L7olqpF/ysBBEmuG1ALx3iX+Pb/52oapY3RJ480tqX7vDtVfi/Tsc2uYRmIbVU/MUwm
 qfy679npJQkBvd4Gmpdvq5zhr7yQ7jOY3r+THIwvP8A7U7LszoTZQON43G1FmsX0+UT5
 YbKGaovNVxZuE7EgZQWGIPkXb/o7brwwapxZNC7uQnuk/8lMbB8xDXP4+GRupxAcNULZ rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34f6ug4ntn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 03:14:27 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09T71I09076216;
 Thu, 29 Oct 2020 03:14:27 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34f6ug4nsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 03:14:26 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T7D6PS027597;
 Thu, 29 Oct 2020 07:14:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 34cbw8aqhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 07:14:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09T7EMbM12911076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 07:14:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2DEC4C046;
 Thu, 29 Oct 2020 07:14:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABDE84C04A;
 Thu, 29 Oct 2020 07:14:20 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 29 Oct 2020 07:14:20 +0000 (GMT)
Date: Thu, 29 Oct 2020 12:44:20 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/4] Powerpc: Better preemption for shared processor
Message-ID: <20201029071420.GA528281@linux.vnet.ibm.com>
References: <20201028123512.871051-1-srikar@linux.vnet.ibm.com>
 <da67d6ce-f120-f61a-19ff-0ae4f1f5dac0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <da67d6ce-f120-f61a-19ff-0ae4f1f5dac0@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_01:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=1 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290046
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Phil Auld <pauld@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Waiman Long <longman@redhat.com> [2020-10-28 20:01:30]:

> > Srikar Dronamraju (4):
> >    powerpc: Refactor is_kvm_guest declaration to new header
> >    powerpc: Rename is_kvm_guest to check_kvm_guest
> >    powerpc: Reintroduce is_kvm_guest
> >    powerpc/paravirt: Use is_kvm_guest in vcpu_is_preempted
> > 
> >   arch/powerpc/include/asm/firmware.h  |  6 ------
> >   arch/powerpc/include/asm/kvm_guest.h | 25 +++++++++++++++++++++++++
> >   arch/powerpc/include/asm/kvm_para.h  |  2 +-
> >   arch/powerpc/include/asm/paravirt.h  | 18 ++++++++++++++++++
> >   arch/powerpc/kernel/firmware.c       |  5 ++++-
> >   arch/powerpc/platforms/pseries/smp.c |  3 ++-
> >   6 files changed, 50 insertions(+), 9 deletions(-)
> >   create mode 100644 arch/powerpc/include/asm/kvm_guest.h
> > 
> This patch series looks good to me and the performance is nice too.
> 
> Acked-by: Waiman Long <longman@redhat.com>

Thank you.

> 
> Just curious, is the performance mainly from the use of static_branch
> (patches 1 - 3) or from reducing call to yield_count_of().

Because of the reduced call to yield_count

> 
> Cheers,
> Longman
> 

-- 
Thanks and Regards
Srikar Dronamraju
