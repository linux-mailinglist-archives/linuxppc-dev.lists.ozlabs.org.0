Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 449643A7795
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zqq6Y0Vz3byq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NFc8dJy8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NFc8dJy8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zqJ138Pz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:05:31 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F74WNr128494; Tue, 15 Jun 2021 03:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DrrT7FWgomZ6otr3U1nRF0nxqD5bLOhKfKjc0EtI1GQ=;
 b=NFc8dJy8WvJZeqyHk5PTmRuKBGB5uRqMYx6obfOkw6i+KqSphz3Y1wqjsTC52TE5oQCG
 g9+M8w5DY8iY33a/i1rM4Pqu30fmiD61IyO9xhkx7kMtGvBoGDeKDZLsf1LbS5qDMY76
 QMX1Dpd4wvYMzgBYp3+0IjVTbQ2DVTfUhDCirRu5wEo8WWAQsAG0ZDMqk8WAHR/TtINQ
 maIAJHhgeCS3id2DxDR4JN0FGF9HgLpYHOeqG/QtT2fUlpZ2/8BdqFV+yGUl6sh5lopP
 x6NpMXmyXVK+G+q4mQ/Jm6Wluew9bTJjHzFrkLyv2ZfgQ96VgGqexHujP+uNOA+wZLqy ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396qf382g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:05:23 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F74cJZ129172;
 Tue, 15 Jun 2021 03:05:23 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396qf382fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:05:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F725mY029375;
 Tue, 15 Jun 2021 07:05:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 394mj9jykt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:05:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F75L6R12583652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:05:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17E0FBE056;
 Tue, 15 Jun 2021 07:05:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DB70BE05A;
 Tue, 15 Jun 2021 07:05:19 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.54.82])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:05:18 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
In-Reply-To: <YMhKEJ9WSlapuSE6@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
 <YMhKEJ9WSlapuSE6@yekko>
Date: Tue, 15 Jun 2021 12:35:17 +0530
Message-ID: <87a6nrobf6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u9c3SxL6PpoLhfl5w5BE-8h6V3dv-ioF
X-Proofpoint-GUID: LgQjpI9Xbw2a2_Gf2KgVPQnm2AIAUYMj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150042
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

> On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>> 
>> > On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
>> >> FORM2 introduce a concept of secondary domain which is identical to the
>> >> conceept of FORM1 primary domain. Use secondary domain as the numa node
>> >> when using persistent memory device. For DAX kmem use the logical domain
>> >> id introduced in FORM2. This new numa node
>> >> 
>> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> >> ---
>> >>  arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>> >>  arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>> >>  arch/powerpc/platforms/pseries/pseries.h  |  1 +
>> >>  3 files changed, 45 insertions(+), 10 deletions(-)
>> >> 
>> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> >> index 86cd2af014f7..b9ac6d02e944 100644
>> >> --- a/arch/powerpc/mm/numa.c
>> >> +++ b/arch/powerpc/mm/numa.c
>> >> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associativity)
>> >>  	return nid;
>> >>  }
>> >>  
>> >> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary)
>> >> +{
>> >> +	int secondary_index;
>> >> +	const __be32 *associativity;
>> >> +
>> >> +	if (!numa_enabled) {
>> >> +		*primary = NUMA_NO_NODE;
>> >> +		*secondary = NUMA_NO_NODE;
>> >> +		return 0;
>> >> +	}
>> >> +
>> >> +	associativity = of_get_associativity(node);
>> >> +	if (!associativity)
>> >> +		return -ENODEV;
>> >> +
>> >> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>> >> +		*primary = of_read_number(&associativity[primary_domain_index], 1);
>> >> +		secondary_index = of_read_number(&distance_ref_points[1], 1);
>> >
>> > Secondary ID is always the second reference point, but primary depends
>> > on the length of resources?  That seems very weird.
>> 
>> primary_domain_index is distance_ref_point[0]. With Form2 we would find
>> both primary and secondary domain ID same for all resources other than
>> persistent memory device. The usage w.r.t. persistent memory is
>> explained in patch 7.
>
> Right, I misunderstood
>
>> 
>> With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
>> the kernel should use when using persistent memory devices.
>
> This seems kind of bogus.  With Form1, the primary/secondary ID are a
> sort of heirarchy of distance (things with same primary ID are very
> close, things with same secondary are kinda-close, etc.).  With Form2,
> it's referring to their effective node for different purposes.
>
> Using the same terms for different meanings seems unnecessarily
> confusing.

They are essentially domainIDs. The interpretation of them are different
between Form1 and Form2. Hence I kept referring to them as primary and
secondary domainID. Any suggestion on what to name them with Form2?

>
>> Persistent memory devices
>> can also be used as regular memory using DAX KMEM driver and primary domainID indicates
>> the numa node number OS should use when using these devices as regular memory. Secondary
>> domainID is the numa node number that should be used when using this device as
>> persistent memory.
>
> It's weird to me that you'd want to consider them in different nodes
> for those different purposes.


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
 

For a topology like the above application running of ProcA wants to find out
persistent memory mount local to its NUMA node. Hence when using it as
pmem fsdax mount or devdax device we want PMEMB to have associativity
of NUMA node0 and PMEMD to have associativity of NUMA node 1. But when
we want to use it as memory using dax kmem driver, we want both PMEMB
and PMEMD to appear as memory only NUMA node at a distance that is
derived based on the latency of the media. 

>
>> In the later case, we are interested in the locality of the
>> device to an established numa node. In the above example, if the last row represents a
>> persistent memory device/resource, NUMA node number 40 will be used when using the device
>> as regular memory and NUMA node number 0 will be the device numa node when using it as
>> a persistent memory device.
>
> I don't really get what you mean by "locality of the device to an
> established numa node".  Or at least how that's different from
> anything else we're handling here.


-aneesh
