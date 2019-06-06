Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE736D34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 09:19:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KH8c35gLzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 17:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KH773C4VzDqMt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 17:17:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x567HdkG142343
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 03:17:52 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sxv7edes6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 03:17:50 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Thu, 6 Jun 2019 08:17:43 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 08:17:41 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x567HepJ40108210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 07:17:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00BCD11C073;
 Thu,  6 Jun 2019 07:17:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A563C11C04A;
 Thu,  6 Jun 2019 07:17:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 07:17:39 +0000 (GMT)
Received: from townsend.localnet (unknown [9.192.255.90])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 50FE0A01BD;
 Thu,  6 Jun 2019 17:17:38 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
Date: Thu, 06 Jun 2019 17:17:38 +1000
User-Agent: KMail/5.2.3 (Linux/4.18.0-0.bpo.1-amd64; KDE/5.28.0; x86_64; ; )
In-Reply-To: <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 19060607-0008-0000-0000-000002F03659
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060607-0009-0000-0000-0000225D2129
Message-Id: <4003261.yxAxO8Uj8t@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=766 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060053
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Shawn Anastasio <shawn@anastas.io>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I have been hitting EEH address errors testing this with some network
cards which map/unmap DMA addresses more frequently. For example:

PHB4 PHB#5 Diag-data (Version: 1)                                                                                                                                      
brdgCtl:    00000002                                                                                                                                                   
RootSts:    00060020 00402000 a0220008 00100107 00000800                                                                                                               
PhbSts:     0000001c00000000 0000001c00000000                                                                                                                          
Lem:        0000000100000080 0000000000000000 0000000000000080                                                                                                         
PhbErr:     0000028000000000 0000020000000000 2148000098000240 a008400000000000                                                                                        
RxeTceErr:  2000000000000000 2000000000000000 c000000000000000 0000000000000000                                                                                        
PblErr:     0000000000020000 0000000000020000 0000000000000000 0000000000000000                                                                                        
RegbErr:    0000004000000000 0000004000000000 61000c4800000000 0000000000000000                                                                                        
PE[000] A/B: 8300b03800000000 8000000000000000                                                                                                                         

Interestingly the PE[000] A/B data is the same across different cards
and drivers.

- Alistair

On Wednesday, 5 June 2019 11:11:06 PM AEST Shawn Anastasio wrote:
> On 5/30/19 2:03 AM, Alexey Kardashevskiy wrote:
> > This is an attempt to allow DMA masks between 32..59 which are not large
> > enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
> > on the max order, up to 40 is usually available.
> > 
> > 
> > This is based on v5.2-rc2.
> > 
> > Please comment. Thanks.
> 
> I have tested this patch set with an AMD GPU that's limited to <64bit
> DMA (I believe it's 40 or 42 bit). It successfully allows the card to
> operate without falling back to 32-bit DMA mode as it does without
> the patches.
> 
> Relevant kernel log message:
> ```
> [    0.311211] pci 0033:01     : [PE# 00] Enabling 64-bit DMA bypass
> ```
> 
> Tested-by: Shawn Anastasio <shawn@anastas.io>


