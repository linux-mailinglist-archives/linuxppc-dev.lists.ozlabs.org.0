Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E66DD14D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 07:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwYYx0bvZz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 15:00:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WAWFcrpE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WAWFcrpE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwYY51S0Vz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 14:59:36 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33B2PDKq017265;
	Tue, 11 Apr 2023 04:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=2gpbBAd0M/MqCf+Pbm/MQfvkVnmSgUR9efr7GxB9VeA=;
 b=WAWFcrpEF2QCHx/GyB+sx+UKBknRPh9ITKGCQFb+K2X/al5XpR9UhuJjBSylLKT7nbTh
 TqR5a4wWpVTd5cN2yXBy95cbruz5GTYrZcrNUv4LqHdvmXMY+L2xTSmwrgKpQ1QnnT6y
 r/Fx66sKsmQLPrUL5h1KcOq9Miv0X6DamY/fnj2OXoLRDPoxjWEejdhFr83QXSBIc1VH
 MZXUcIA/NDgZtCeBC9R3V7dZ+5IY/AR8qWMmvu8wflPitnUdcVZi2Jfje9xq6BSZ3aSb
 IzMDdaHdCcsRKYO8zb/Nm4yfOJODUmRP0L8+067JHLnRAXMXazxh6AfYTFbJjqdLeYZN vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pvr78bxhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 04:59:25 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33B4lL7t027599;
	Tue, 11 Apr 2023 04:59:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pvr78bxgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 04:59:24 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33ANUvQq029945;
	Tue, 11 Apr 2023 04:59:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pu0m21egw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 04:59:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33B4xKPn53805348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Apr 2023 04:59:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D3F52004B;
	Tue, 11 Apr 2023 04:59:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1E1E20043;
	Tue, 11 Apr 2023 04:59:15 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.76.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 11 Apr 2023 04:59:15 +0000 (GMT)
Date: Tue, 11 Apr 2023 10:29:06 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: PPC: BOOK3S: book3s_hv_nested.c: improve branch
 prediction for k.alloc
Message-ID: <ZDTpGsT15s0iOrTJ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230407093147.3646597-1-kconsul@linux.vnet.ibm.com>
 <ZDAeuL2fz1aEW6rz@debian.me>
 <ZDA+WdiqB2931xHB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDA+WdiqB2931xHB@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GEJGaPIwa8_Xc3ACgks7q0lmRWZj7mxi
X-Proofpoint-ORIG-GUID: rdhtw1J9ftrrFevA9ilDvYDcFt9GbHdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_01,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=841 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110041
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Chao Peng <chao.p.peng@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-04-07 09:01:29, Sean Christopherson wrote:
> On Fri, Apr 07, 2023, Bagas Sanjaya wrote:
> > On Fri, Apr 07, 2023 at 05:31:47AM -0400, Kautuk Consul wrote:
> > > I used the unlikely() macro on the return values of the k.alloc
> > > calls and found that it changes the code generation a bit.
> > > Optimize all return paths of k.alloc calls by improving
> > > branch prediction on return value of k.alloc.
> 
> Nit, this is improving code generation, not branch prediction.
Sorry my mistake.
> 
> > What about below?
> > 
> > "Improve branch prediction on kmalloc() and kzalloc() call by using
> > unlikely() macro to optimize their return paths."
> 
> Another nit, using unlikely() doesn't necessarily provide a measurable optimization.
> As above, it does often improve code generation for the happy path, but that doesn't
> always equate to improved performance, e.g. if the CPU can easily predict the branch
> and/or there is no impact on the cache footprint.
I see. I will submit a v2 of the patch with a better and more accurate
description. Does anyone else have any comments before I do so ?
