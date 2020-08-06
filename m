Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9E23DB50
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 17:20:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMscH26LszDqs6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 01:19:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMsY311WtzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 01:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BZxrTWh3; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMsY23shyz8sWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 01:17:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMsY22mR6z9sTM; Fri,  7 Aug 2020 01:17:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BZxrTWh3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMsY167VZz9sSG;
 Fri,  7 Aug 2020 01:17:09 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076F3aTf017464; Thu, 6 Aug 2020 11:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=qPmXld4Ke04dydgA8tu+gDibMhgtyNOUctYgq5sdLeI=;
 b=BZxrTWh38buhtmW8yyP32VxeaNzy6Edx5yy8R6qMXD5ce110raXVaO+XSnejGLKrQpNh
 w3kISDOvYHg8crN116o3x3gBy22MvVANSslTlgLga4X6FB32sYk5s5X1vxEgoZTxairB
 uS8U6W/0qxZgDwqPUMuA3XBLE5xvlppL2k1Qlyb1Z2DdfKarfNGWK2VYQxDjLx3XBLtD
 CEvVBfLhpHVn2J1Kd+m/FQKYyzAkbKLSZHX0QsBUPerKaB5OR8IlH+1f2IWl69p/00IL
 fpNS6ZQ2Ys+ojbG+oI6W78uYnsQX6Tii3TM8cEE5FqsvO4A8ril/EL259G9WSQ+cRt2z eg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32raves5hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 11:17:06 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076FA1SY028296;
 Thu, 6 Aug 2020 15:17:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 32nxe515cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 15:17:05 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076FH5F752101476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 15:17:05 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E10B2064;
 Thu,  6 Aug 2020 15:17:05 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9620B2065;
 Thu,  6 Aug 2020 15:17:04 +0000 (GMT)
Received: from localhost (unknown [9.65.243.213])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 15:17:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
In-Reply-To: <871rkkymd5.fsf@mpe.ellerman.id.au>
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
 <20200727184605.2945095-2-cheloha@linux.ibm.com>
 <bc9858c9-7d55-88c0-1f85-157af48e1d8c@linux.ibm.com>
 <871rkkymd5.fsf@mpe.ellerman.id.au>
Date: Thu, 06 Aug 2020 10:17:04 -0500
Message-ID: <87y2mrztvz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_09:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060104
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 7/27/20 11:46 AM, Scott Cheloha wrote:
>>> The H_GetPerformanceCounterInfo (GPCI) PHYP hypercall has a subcall,
>>> Affinity_Domain_Info_By_Partition, which returns, among other things,
>>> a "partition affinity score" for a given LPAR.  This score, a value on
>>> [0-100], represents the processor-memory affinity for the LPAR in
>>> question.  A score of 0 indicates the worst possible affinity while a
>>> score of 100 indicates perfect affinity.  The score can be used to
>>> reason about performance.
>>> 
>>> This patch adds the score for the local LPAR to the lparcfg procfile
>>> under a new 'partition_affinity_score' key.
>>> 
>>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>>
>> I was hoping Michael would chime in the first time around on this patch series
>> about adding another key/value pair to lparcfg.
>
> That guy is so unreliable.
>
> I don't love adding new stuff in lparcfg, but given the file already
> exists and there's no prospect of removing it, it's probably not worth
> the effort to put the new field anywhere else.
>
> My other query with this was how on earth anyone is meant to interpret
> the metric. ie. if my metric is 50, what does that mean? If it's 90
> should I worry?

Here's some more background.

This interface is just passing up what the platform provides, and it's
identical to the partition affinity score described in the documentation
for the management console's lsmemopt command:

https://www.ibm.com/support/knowledgecenter/POWER9/p9edm/lsmemopt.html

The score is 0-100, higher values are better. To illustrate: I believe a
partition's score will be 100 (or very close to it) if all of its CPUs
and memory reside within one node. It will be lower than that when a
partition has some memory without local CPUs, and lower still when there
is no CPU-memory affinity within the partition. Beyond that I don't have
more specific information and the algorithm and scale are set by the
platform.

The intent is for this to be a metric to gather during problem
determination e.g. via sosreport or similar, but as far as Linux is
concerned this should be treated as an opaque value.
