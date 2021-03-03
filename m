Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20932D46D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 14:46:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drsb46DL1z3d8X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 00:46:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OLU2lqvp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OLU2lqvp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrsZd0qNzz30QY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 00:45:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124DXukx069316; Thu, 4 Mar 2021 08:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Knd8HPrhG/1SbUq/tdY+OGWTMydAB7ICAVIXt+YoV+E=;
 b=OLU2lqvpwmnft0gcDJ2PnbrPcdzltaglQZ7WeFLAlwFn8T2fbIQCFLpK4oZFAx7AAf8l
 lY9URPZ57yrO8wZmBKWJX9nH1Zm/47/1bnbfRo+gQqZem95KR7OkkUzsDBPkhiIVunwr
 oJ5Fza95Y/3ZvenfgDpCpJ+Y43fT3V9oCwHFalnBLr3AVRnCqVCJFmHAYUfMNeHQ/HKB
 ui3+uhFPhASdzkjg2ZKzKWwf0AIpjWHV6sehvoHHEkRqZf4/fsEFd1HJDzAHTRohJBmB
 0BaWp3hhoBpGrkecg7O9ElTOI/qYaTBrUMb5O6TZii2cSKOi9mTEgifLeH9exd3S6WjL kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3730ecgv3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 08:45:39 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 124DYCPX071176;
 Thu, 4 Mar 2021 08:45:39 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3730ecgv2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 08:45:39 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 124DhOYe031822;
 Thu, 4 Mar 2021 13:45:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 37150csdy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 13:45:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 124DjXUY45678994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 13:45:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6714042045;
 Thu,  4 Mar 2021 13:45:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E75AC42041;
 Thu,  4 Mar 2021 13:45:32 +0000 (GMT)
Received: from localhost (unknown [9.85.101.115])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 13:45:32 +0000 (GMT)
Date: Wed, 3 Mar 2021 22:01:27 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Message-ID: <20210303163127.GE1913@DESKTOP-TDPLP67.localdomain>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
 <20210203211732.GD30983@gate.crashing.org>
 <20210204082753.GI210@DESKTOP-TDPLP67.localdomain>
 <20210302023732.GH29191@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302023732.GH29191@gate.crashing.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_03:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040063
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

On 2021/03/01 08:37PM, Segher Boessenkool wrote:
> Hi!
> 
> I didn't see this until now, almost a month later, sorry about that :-)

No problem.

> 
> On Thu, Feb 04, 2021 at 01:57:53PM +0530, Naveen N. Rao wrote:
> > On 2021/02/03 03:17PM, Segher Boessenkool wrote:
> > > Power8 does:
> > > 
> > >   Load with Update Instructions (RA = 0)
> > >     EA is placed into R0.
> > >   Load with Update Instructions (RA = RT)
> > >     EA is placed into RT. The storage operand addressed by EA is
> > >     accessed, but the data returned by the load is discarded.
> > 
> > I'm actually not seeing that. This is what I am testing with:
> > 	li      8,0xaaa
> > 	mr      6,1
> > 	std     8,64(6)
> > 	#ldu    6,64(6)
> > 	.long	0xe8c60041
> > 
> > And, r6 always ends up with 0xaea. It changes with the value I put into 
> > r6 though.
> 
> That is exactly the behaviour specified for p8.  0aaa+0040=0aea.
> 
> > Granted, this is all up in the air, but it does look like there is more 
> > going on and the value isn't the EA or the value at the address.
> 
> That *is* the EA.  The EA is the address the insn does the access at.

I'm probably missing something here. 0xaaa is the value I stored at an 
offset of 64 bytes from the stack pointer (r1 is copied into r6). In the 
ldu instruction above, the EA is 64(r6), which should translate to 
r1+64.  The data returned by the load would be 0xaaa, which should be 
discarded per the description you provided above. So, I would expect to 
see a 0xc0.. address in r6.

In fact, this looks to be the behavior documented for P9:

> > Power9 does:
> >
> >   Load with Update Instructions (RA = 0)
> >     EA is placed into R0.
> >   Load with Update Instructions (RA = RT)
> >     The storage operand addressed by EA is accessed. The 
> >     displacement
> >     field is added to the data returned by the load and placed into 
> >     RT.

- Naveen
