Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D338268
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 03:42:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KldZ5dBnzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 11:42:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=popple.id.au
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KlcC4hYZzDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 11:41:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x571cX1O121158
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 21:41:11 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sybtwwjyy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 21:41:10 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Fri, 7 Jun 2019 02:41:08 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 02:41:05 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x571f48049479734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 01:41:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91D6E11C050;
 Fri,  7 Jun 2019 01:41:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C06911C05B;
 Fri,  7 Jun 2019 01:41:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 01:41:04 +0000 (GMT)
Received: from townsend.localnet (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BACEFA00BD;
 Fri,  7 Jun 2019 11:41:02 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Oliver <oohall@gmail.com>
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
Date: Fri, 07 Jun 2019 11:41:02 +1000
User-Agent: KMail/5.2.3 (Linux/4.18.0-0.bpo.1-amd64; KDE/5.28.0; x86_64; ; )
In-Reply-To: <CAOSf1CEKwFHLHLC+CAiEiH=9v+hfRgTSuNUH3hXR4eDyQM1G9g@mail.gmail.com>
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <4003261.yxAxO8Uj8t@townsend>
 <CAOSf1CEKwFHLHLC+CAiEiH=9v+hfRgTSuNUH3hXR4eDyQM1G9g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 19060701-4275-0000-0000-000003401664
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060701-4276-0000-0000-000038501CC5
Message-Id: <2377993.PuYYC6lyoP@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=52 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070010
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Shawn Anastasio <shawn@anastas.io>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sam Bobroff <sbobroff@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, 6 June 2019 10:07:54 PM AEST Oliver wrote:
> On Thu, Jun 6, 2019 at 5:17 PM Alistair Popple <alistair@popple.id.au> 
wrote:
> > I have been hitting EEH address errors testing this with some network
> > cards which map/unmap DMA addresses more frequently. For example:
> > 
> > PHB4 PHB#5 Diag-data (Version: 1)
> > brdgCtl:    00000002
> > RootSts:    00060020 00402000 a0220008 00100107 00000800
> > PhbSts:     0000001c00000000 0000001c00000000
> > Lem:        0000000100000080 0000000000000000 0000000000000080
> > PhbErr:     0000028000000000 0000020000000000 2148000098000240
> > a008400000000000 RxeTceErr:  2000000000000000 2000000000000000
> > c000000000000000 0000000000000000 PblErr:     0000000000020000
> > 0000000000020000 0000000000000000 0000000000000000 RegbErr:   
> > 0000004000000000 0000004000000000 61000c4800000000 0000000000000000
> > PE[000] A/B: 8300b03800000000 8000000000000000
> > 
> > Interestingly the PE[000] A/B data is the same across different cards
> > and drivers.
> 
> TCE page fault due to permissions so odds are the DMA address was unmapped.
> 
> What cards did you get this with? I tried with one of the common
> BCM5719 NICs and generated network traffic by using rsync to copy a
> linux git tree to the system and it worked fine.

Personally I've seen it with the BCM5719 with the driver modified to set a DMA 
mask of 48 bits instead of 64 and using scp to copy a random 1GB file to the 
system repeatedly until it crashes. 

I have also had reports of someone hitting the same error using a Mellanox 
CX-5 adaptor with a similar driver modification.

- Alistair

