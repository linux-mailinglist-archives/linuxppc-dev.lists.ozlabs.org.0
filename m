Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73063AB542
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 15:56:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5NrK2ghCz3bsQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 23:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cwzXXFn8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cwzXXFn8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Nqn0MxJz302f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 23:55:48 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HDXg56121111; Thu, 17 Jun 2021 09:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/vNl0a7VIHJvRMSv2WHon1AHWtvZixdSnSJBjOOrCD4=;
 b=cwzXXFn8n+ai715Q3ki2/AOWQ/qGuxm6yRAjwYFwanEV8XqS9LwDKde3ZfLUEHS60FCV
 VIMLaMf9XjWvr+REEbQ5rOM9MSK0ht9UBRcxHC+Gw6rVsjFWlSW0lMBH8tKQ3F7T27Xo
 jJbh9EV2yI1x0Hftx+9AV5pPM8V1nJad5DhlmNxRrnnWEANv/e2tSMwNHWcnvAlNQhdt
 lEWVLuG/QtUNVZgJIws09ryKUNJT18Dn9ybOLya+6mAAhFKBFOAok90kBj8Xv+6l21H5
 YItIij4/HcVhPqb/V6mcDpNa/ShIcRQUNZoIxCwApdl8kIBBFPmHHVPp5qXvjZ2c+Tsa 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3987b80xu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 09:55:41 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HDXgxY121100;
 Thu, 17 Jun 2021 09:55:40 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3987b80xtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 09:55:40 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HDqO39008581;
 Thu, 17 Jun 2021 13:55:40 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 394mjabf0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 13:55:39 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HDtc8n29032868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:55:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE8FCC6063;
 Thu, 17 Jun 2021 13:55:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A32DC605D;
 Thu, 17 Jun 2021 13:55:37 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.31.110])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 13:55:36 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
In-Reply-To: <YMr92K2gaidDHeqC@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
 <YMhKEJ9WSlapuSE6@yekko> <87a6nrobf6.fsf@linux.ibm.com>
 <YMr92K2gaidDHeqC@yekko>
Date: Thu, 17 Jun 2021 19:25:34 +0530
Message-ID: <87o8c4mw89.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NJwL-v73YXJ-JTxTHrL4dFn_IzJGX-1P
X-Proofpoint-GUID: Z7pTPIpMJ0A2mF0JyDjcNMoRHtVwP1ld
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_10:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170087
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

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>> 
>> > On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>> >> David Gibson <david@gibson.dropbear.id.au> writes:
>> >> 
>> >> > On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
.....

> I'm still not understanding why the latency we care about is different
> in the two cases.  Can you give an example of when this would result
> in different actual node assignments for the two different cases?

How about the below update?

With Form2 "ibm,associativity" for resources is listed as below:

"ibm,associativity" property for resources in node 0, 8 and 40
{ 3, 6, 7, 0 }
{ 3, 6, 9, 8 }
{ 4, 6, 7, 0, 40}

With "ibm,associativity-reference-points"  { 0x3, 0x2 }

Form2 adds additional property which can be used with devices like persistence
memory devices which would also like to be presented as memory-only NUMA nodes.

"ibm,associativity-memory-node-reference-point" property contains a number
representing the domainID index to be used to find the domainID that should be used
when using the resource as memory only NUMA node. The NUMA distance information
w.r.t this domainID will take into consideration the latency of the media. A
high latency memory device will have a large NUMA distance value assigned w.r.t
the domainID found at at "ibm,associativity-memory-node-reference-point" domainID index.

prop-encoded-array: An integer encoded as with encode-int specifying the domainID index

In the above example:
"ibm,associativity-memory-node-reference-point"  { 0x4 }

ex:

   --------------------------------------
  |                            NUMA node0 |
  |    ProcA -----> MEMA                  |
  |     |                                 |
  |	|                                 |
  |	-------------------> PMEMB        |
  |                                       |
   ---------------------------------------

   ---------------------------------------
  |                            NUMA node1 |
  |                                       |
  |    ProcB -------> MEMC                |
  |	|                                 |
  |	-------------------> PMEMD        |
  |                                       |
  |                                       |
   ---------------------------------------

 --------------------------------------------------------------------------------
|                                                      domainID 20               |
|   ---------------------------------------                                      |
|  |                            NUMA node0 |                                     |
|  |                                       |            --------------------     |
|  |    ProcA -------> MEMA                |           |        NUMA node40 |    |
|  |	|                                  |           |                    |    |
|  |	---------------------------------- |-------->  |  PMEMB             |    |
|  |                                       |            --------------------     |
|  |                                       |                                     |
|   ---------------------------------------                                      |
|                                                                                |
|   ---------------------------------------                                      |
|  |                            NUMA node1 |                                     |
|  |                                       |                                     |
|  |    ProcB -------> MEMC                |           -------------------       |
|  |	|                                  |          |       NUMA node41 |      |
|  |	--------------------------------------------> | PMEMD             |      |
|  |                                       |           -------------------       |
|  |                                       |                                     |
|   ---------------------------------------                                      |
|                                                                                |
 --------------------------------------------------------------------------------

For a topology like the above application running of ProcA wants to find out
persistent memory mount local to its NUMA node. Hence when using it as
pmem fsdax mount or devdax device we want PMEMB to have associativity
of NUMA node0 and PMEMD to have associativity of NUMA node1. But when
we want to use it as memory using dax kmem driver, we want both PMEMB
and PMEMD to appear as memory only NUMA node at a distance that is
derived based on the latency of the media.

"ibm,associativity":
PROCA/MEMA -> { 2, 20, 0 } 
PROCB/MEMC -> { 2, 20, 1 } 
PMEMB      -> { 3, 20, 0, 40}
PMEMB      -> { 3, 20, 1, 41}

"ibm,associativity-reference-points" -> { 2, 1 }
"ibm,associativity-memory-node-reference-points" -> { 3 }

-aneesh
