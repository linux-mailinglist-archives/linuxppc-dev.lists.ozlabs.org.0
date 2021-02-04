Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FA30EE47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:29:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWts60XPzDwq5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cUW2FK9o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWs62xpzzDrh9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:28:09 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1148BMia063578; Thu, 4 Feb 2021 03:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=H1pLSAYD4dYXzevGm1qtoEoTocKU2Ptjy7VrTemlkhQ=;
 b=cUW2FK9o/TxeK6uXQoln9ghvA+I2Qf5KN34LwatBiukkXMm4PwHrFg45TvoA/5N1PsdF
 Fg3yHpR6Qw83oqQmjfo0x+Z9KB4o/OBflsqV/UYfZEqRnTo0fNYHNFspsSizpZludDSL
 3KGueQN27ThJyXPHaoZeEHz6kZ+reSWLaFY0nfrxrNfmp7Efoqwfc6V4UVpWDbnciG76
 z+r01DJs695hGcmG2LakJMTJvui8Qga4+X2yzXanG0j5GsH49ivIrjBTQNAmCuW4BZiH
 iSrI+u2SVvNNNh5y0YIZ9peEAEgSW4nJvxv3NKqVdtQEYZ3QH/T6A1U+Qw6GWFEN8o6d og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcd0sjk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:28:00 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1148DdAj067811;
 Thu, 4 Feb 2021 03:28:00 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcd0sjjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:28:00 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1148QvNA014113;
 Thu, 4 Feb 2021 08:27:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 36cy38mp71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:27:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1148RtFX13828514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 08:27:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3550E52051;
 Thu,  4 Feb 2021 08:27:55 +0000 (GMT)
Received: from localhost (unknown [9.85.87.37])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AD9475204E;
 Thu,  4 Feb 2021 08:27:54 +0000 (GMT)
Date: Thu, 4 Feb 2021 13:57:53 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Message-ID: <20210204082753.GI210@DESKTOP-TDPLP67.localdomain>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
 <20210203211732.GD30983@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203211732.GD30983@gate.crashing.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040044
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, Sandipan Das <sandipan@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/02/03 03:17PM, Segher Boessenkool wrote:
> On Wed, Feb 03, 2021 at 03:19:09PM +0530, Naveen N. Rao wrote:
> > On 2021/02/03 12:08PM, Sandipan Das wrote:
> > > The Power ISA says that the fixed-point load and update
> > > instructions must neither use R0 for the base address (RA)
> > > nor have the destination (RT) and the base address (RA) as
> > > the same register. In these cases, the instruction is
> > > invalid.
> 
> > > However, the following behaviour is observed using some
> > > invalid opcodes where RA = RT.
> > > 
> > > An userspace program using an invalid instruction word like
> > > 0xe9ce0001, i.e. "ldu r14, 0(r14)", runs and exits without
> > > getting terminated abruptly. The instruction performs the
> > > load operation but does not write the effective address to
> > > the base address register. 
> > 
> > While the processor (p8 in my test) doesn't seem to be throwing an 
> > exception, I don't think it is necessarily loading the value. Qemu 
> > throws an exception though. It's probably best to term the behavior as 
> > being undefined.
> 
> Power8 does:
> 
>   Load with Update Instructions (RA = 0)
>     EA is placed into R0.
>   Load with Update Instructions (RA = RT)
>     EA is placed into RT. The storage operand addressed by EA is
>     accessed, but the data returned by the load is discarded.

I'm actually not seeing that. This is what I am testing with:
	li      8,0xaaa
	mr      6,1
	std     8,64(6)
	#ldu    6,64(6)
	.long	0xe8c60041

And, r6 always ends up with 0xaea. It changes with the value I put into 
r6 though.

Granted, this is all up in the air, but it does look like there is more 
going on and the value isn't the EA or the value at the address.

> 
> Power9 does:
> 
>   Load with Update Instructions (RA = 0)
>     EA is placed into R0.
>   Load with Update Instructions (RA = RT)
>     The storage operand addressed by EA is accessed. The displacement
>     field is added to the data returned by the load and placed into RT.
> 
> Both UMs also say
> 
>   Invalid Forms
>     In general, the POWER9 core handles invalid forms of instructions in
>     the manner that is most convenient for the particular case (within
>     the scope of meeting the boundedly-undefined definition described in
>     the Power ISA). This document specifies the behavior for these
>     cases.  However, it is not recommended that software or other system
>     facilities make use of the POWER9 behavior in these cases because
>     such behavior might be different in another processor that
>     implements the Power ISA.
> 
> (or POWER8 instead of POWER9 of course).  Always complaining about most
> invalid forms seems wise, certainly if not all recent CPUs behave the
> same :-)

Agreed.

- Naveen

