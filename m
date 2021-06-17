Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF33AB558
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:04:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5P2D1BHpz3c3b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 00:04:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i679M5fy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i679M5fy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5P1k3Jq4z30Ff
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 00:04:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HE3iRH046666; Thu, 17 Jun 2021 10:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dXTXnplc00qB5Dca0qa/HKf1xVLsyujOQH57FnMLRow=;
 b=i679M5fyDGMvY+UsnrUsTrTQwc2erNJfWlKpItDNGntpFDX4NiVNsT0RNpDHg2x7t9fC
 0BuxJrKMhQ8BQ8ZhTirmYHirhEgBwSRHhsSaiEJki3NpQTni7C1gZDILOrJW4tusIU6X
 Sm0smO4RG8eywymPWLZ5sn3y6To6FWAQ4G6ND+bVqfnCQ1XH0vcstugyIWkjvA//DZ0x
 LTnzLwNokZLbSlI/o4inT6Aj4684WhKfI2zn2bWM5udyOhhX9NMpdRbQ0A82yhImc6bn
 OBtulJlx6MREfo1LQQUF/H93DYFgY5Tip7YiS0JTeLCedGpQd8AkU2iTqyRhLUeY2Vl+ 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39867ubhnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 10:04:16 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HE47Wl049033;
 Thu, 17 Jun 2021 10:04:15 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39867ubhnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 10:04:15 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HE0kTH021239;
 Thu, 17 Jun 2021 14:04:15 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 394mja1cfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 14:04:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HE4Ep835520780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 14:04:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C44E312405A;
 Thu, 17 Jun 2021 14:04:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63901124054;
 Thu, 17 Jun 2021 14:04:13 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.31.110])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 14:04:13 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
In-Reply-To: <87o8c4mw89.fsf@linux.ibm.com>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
 <YMhKEJ9WSlapuSE6@yekko> <87a6nrobf6.fsf@linux.ibm.com>
 <YMr92K2gaidDHeqC@yekko> <87o8c4mw89.fsf@linux.ibm.com>
Date: Thu, 17 Jun 2021 19:34:11 +0530
Message-ID: <87lf78mvtw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: abZ7mKHfUcpGHaDtz3vT4Y-0UGxwDiSJ
X-Proofpoint-GUID: 6PAjqmT-a0gQP2QOSHgT1alWFQEgO7AT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_10:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170090
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:

> David Gibson <david@gibson.dropbear.id.au> writes:
>
>> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>> 
>>> > On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>>> >> David Gibson <david@gibson.dropbear.id.au> writes:
>>> >> 
>>> >> > On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
> .....
>
>> I'm still not understanding why the latency we care about is different
>> in the two cases.  Can you give an example of when this would result
>> in different actual node assignments for the two different cases?
>
> How about the below update?
>
> With Form2 "ibm,associativity" for resources is listed as below:
>
> "ibm,associativity" property for resources in node 0, 8 and 40
> { 3, 6, 7, 0 }
> { 3, 6, 9, 8 }
> { 4, 6, 7, 0, 40}
>
> With "ibm,associativity-reference-points"  { 0x3, 0x2 }
>
> Form2 adds additional property which can be used with devices like persistence
> memory devices which would also like to be presented as memory-only NUMA nodes.
>
> "ibm,associativity-memory-node-reference-point" property contains a number
> representing the domainID index to be used to find the domainID that should be used
> when using the resource as memory only NUMA node. The NUMA distance information
> w.r.t this domainID will take into consideration the latency of the media. A
> high latency memory device will have a large NUMA distance value assigned w.r.t
> the domainID found at at "ibm,associativity-memory-node-reference-point" domainID index.
>
> prop-encoded-array: An integer encoded as with encode-int specifying the domainID index
>
> In the above example:
> "ibm,associativity-memory-node-reference-point"  { 0x4 }
>
> ex:
>
>    --------------------------------------
>   |                            NUMA node0 |
>   |    ProcA -----> MEMA                  |
>   |     |                                 |
>   |	|                                 |
>   |	-------------------> PMEMB        |
>   |                                       |
>    ---------------------------------------
>
>    ---------------------------------------
>   |                            NUMA node1 |
>   |                                       |
>   |    ProcB -------> MEMC                |
>   |	|                                 |
>   |	-------------------> PMEMD        |
>   |                                       |
>   |                                       |
>    ---------------------------------------
>
>  --------------------------------------------------------------------------------
> |                                                      domainID 20               |
> |   ---------------------------------------                                      |
> |  |                            NUMA node0 |                                     |
> |  |                                       |            --------------------     |
> |  |    ProcA -------> MEMA                |           |        NUMA node40 |    |
> |  |	|                                  |           |                    |    |
> |  |	---------------------------------- |-------->  |  PMEMB             |    |
> |  |                                       |            --------------------     |
> |  |                                       |                                     |
> |   ---------------------------------------                                      |
> |                                                                                |
> |   ---------------------------------------                                      |
> |  |                            NUMA node1 |                                     |
> |  |                                       |                                     |
> |  |    ProcB -------> MEMC                |           -------------------       |
> |  |	|                                  |          |       NUMA node41 |      |
> |  |	--------------------------------------------> | PMEMD             |      |
> |  |                                       |           -------------------       |
> |  |                                       |                                     |
> |   ---------------------------------------                                      |
> |                                                                                |
>  --------------------------------------------------------------------------------
>
> For a topology like the above application running of ProcA wants to find out
> persistent memory mount local to its NUMA node. Hence when using it as
> pmem fsdax mount or devdax device we want PMEMB to have associativity
> of NUMA node0 and PMEMD to have associativity of NUMA node1. But when
> we want to use it as memory using dax kmem driver, we want both PMEMB
> and PMEMD to appear as memory only NUMA node at a distance that is
> derived based on the latency of the media.
>
> "ibm,associativity":
> PROCA/MEMA -> { 2, 20, 0 } 
> PROCB/MEMC -> { 2, 20, 1 } 
> PMEMB      -> { 3, 20, 0, 40}
> PMEMB      -> { 3, 20, 1, 41}
>
> "ibm,associativity-reference-points" -> { 2, 1 }
> "ibm,associativity-memory-node-reference-points" -> { 3 }

Another option is to make sure that numa-distance-value is populated
such that PMEMB distance indicates it is closer to node0 when compared
to node1. ie, node_distance[40][0] < node_distance[40][1]. One could
possibly infer the grouping based on the distance value and not deepend
on ibm,associativity for that purpose.

-aneesh
