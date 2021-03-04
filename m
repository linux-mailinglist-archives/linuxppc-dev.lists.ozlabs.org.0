Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43632E5DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 11:11:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsNn24XhNz3dHx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 21:11:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGZksWnp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HGZksWnp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsNmb3nQZz2xy0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 21:11:11 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125A3T0l047666; Fri, 5 Mar 2021 05:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ClRGLi/Od3Oqr7Bgr+XqP2qVmOKiQNDanEfWOPC6YHY=;
 b=HGZksWnpEf7zBnRS+WPuTe4oHvGVOL3BxY6RFDc5VJcqxMGh75vrP+NdBnjNUyUfuFFo
 ROwDR2aDmeTNoyFWo1Ggg0Lu4fK8EBW4kxuX+ePPkx4Klr/8HDzaU2O6CXoZuinxtn4G
 dhjZ1ADc12Bk5BHq7tebuGLLGKFzpFePKDU+nXIC3WPT9OGACYwMY3VuAyphDPTjVDmy
 aXJu6W8NIaiQ8ttqVueqdCuu1nmPzqWH1D/gXCTLdj/LiFruU3sNvZaOWQWR/625LNgG
 eGBK3jz+nvF05ZCvmGqjh0mFjK22e6k/86j9mZrqvBWJmmD0+t1R9k1WnRadNWNAG0Iw yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373fqrnk91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 05:11:05 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 125A63ZY062057;
 Fri, 5 Mar 2021 05:11:04 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373fqrnk7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 05:11:04 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125A7M5m019700;
 Fri, 5 Mar 2021 10:11:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37293fsvva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 10:11:02 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125AAxKd38600976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 10:10:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 500B4AE04D;
 Fri,  5 Mar 2021 10:10:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC17DAE045;
 Fri,  5 Mar 2021 10:10:58 +0000 (GMT)
Received: from localhost (unknown [9.85.120.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 10:10:58 +0000 (GMT)
Date: Thu, 4 Mar 2021 06:36:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Message-ID: <20210304010620.GF1913@DESKTOP-TDPLP67.localdomain>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
 <20210203211732.GD30983@gate.crashing.org>
 <20210204082753.GI210@DESKTOP-TDPLP67.localdomain>
 <20210302023732.GH29191@gate.crashing.org>
 <20210303163127.GE1913@DESKTOP-TDPLP67.localdomain>
 <20210304154535.GS29191@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304154535.GS29191@gate.crashing.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_05:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050048
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

On 2021/03/04 09:45AM, Segher Boessenkool wrote:
> On Wed, Mar 03, 2021 at 10:01:27PM +0530, Naveen N. Rao wrote:
> > On 2021/03/01 08:37PM, Segher Boessenkool wrote:
> > > > And, r6 always ends up with 0xaea. It changes with the value I put into 
> > > > r6 though.
> > > 
> > > That is exactly the behaviour specified for p8.  0aaa+0040=0aea.
> > > 
> > > > Granted, this is all up in the air, but it does look like there is more 
> > > > going on and the value isn't the EA or the value at the address.
> > > 
> > > That *is* the EA.  The EA is the address the insn does the access at.
> > 
> > I'm probably missing something here. 0xaaa is the value I stored at an 
> > offset of 64 bytes from the stack pointer (r1 is copied into r6). In the 
> > ldu instruction above, the EA is 64(r6), which should translate to 
> > r1+64.  The data returned by the load would be 0xaaa, which should be 
> > discarded per the description you provided above. So, I would expect to 
> > see a 0xc0.. address in r6.
> 
> Yes, I misread your code it seems.
> 
> > In fact, this looks to be the behavior documented for P9:
> > 
> > > > Power9 does:
> > > >
> > > >   Load with Update Instructions (RA = 0)
> > > >     EA is placed into R0.
> > > >   Load with Update Instructions (RA = RT)
> > > >     The storage operand addressed by EA is accessed. The 
> > > >     displacement
> > > >     field is added to the data returned by the load and placed into 
> > > >     RT.
> 
> Yup.  So on what cpu did you test?

I tested this on two processors:
2.0 (pvr 004d 0200)
2.1 (pvr 004b 0201)

I guess the behavior changed some time during P8, but I don't have a P9 
to test this on.

In any case, this souldn't matter too much for us as you rightly point 
out:

> 
> Either way, the kernel should not emulate any particular cpu here, I'd
> say, esp. since recent cpus do different things for this invalid form.

Ack.


Thanks!
- Naveen
