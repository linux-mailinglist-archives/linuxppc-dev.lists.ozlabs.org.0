Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72674FD9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:19:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dPaY6sZo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R12yg07Rkz3c4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 13:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dPaY6sZo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R12xk6LlJz30fk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 13:18:18 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36C36TVv006134;
	Wed, 12 Jul 2023 03:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uz+vI2zlLMPqwhCHwBBm3a6AUVXD869bgFIxa5qoXhY=;
 b=dPaY6sZofJ1TzrGm4S1P2ZVYr6BBoGU32ZnvfJ74J7s1feKPJTuzzQBaPp6i03VFejsx
 K1O+Nd6CEXjFNua7PYzjprEV4JpKkML6/Okb2zW78DEBuehkhchxxBn1X6G+C9oNBMUP
 vbYDFmK6dSTITEIGSxUpOrbE+HuAZWRCSKyTtETTsLBqFyx6JyoFALgrYN6F/Uql+9QH
 u/nILkfWEhaSliIrI939etq2vvhFmwfbp6/6JoR98n9/PgVaSDdibqRRX+ahhJjSNdmI
 I+GIK92bzLToG58ry7lMyT8DK46NYg7EQ23mBedWq9KXcLdjdwkuM5ajp3ojPV72zFvU /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rskpp8fsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 03:18:03 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36C36WVv006467;
	Wed, 12 Jul 2023 03:18:02 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rskpp8fqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 03:18:02 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36C2sxVN025393;
	Wed, 12 Jul 2023 03:16:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3rpye59r00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 03:16:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36C3Gvb454591752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 03:16:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4916020049;
	Wed, 12 Jul 2023 03:16:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9934620040;
	Wed, 12 Jul 2023 03:16:54 +0000 (GMT)
Received: from [9.43.19.28] (unknown [9.43.19.28])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jul 2023 03:16:54 +0000 (GMT)
Message-ID: <ccda3be5-1e44-145e-7b46-2e420935b1d6@linux.ibm.com>
Date: Wed, 12 Jul 2023 08:46:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
 <b44ce7ab-7fcf-3f1b-4bca-3d5d12838812@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <b44ce7ab-7fcf-3f1b-4bca-3d5d12838812@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PlV2REpOD43DliAbdNhE8ampXrKu_A3q
X-Proofpoint-GUID: UyW1V1lCTRxaFCT6siDIkjXKWpktBoJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=769 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120025
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/11/23 10:49 PM, David Hildenbrand wrote:
> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>> Add a new kconfig option that can be selected if we want to allow
>> pageblock alignment by reserving pages in the vmemmap altmap area.
>> This implies we will be reserving some pages for every memoryblock
>> This also allows the memmap on memory feature to be widely useful
>> with different memory block size values.
> 
> "reserving pages" is a nice way of saying "wasting memory". :) Let's spell that out.
> 
> I think we have to find a better name for this, and I think we should have a toggle similar to memory_hotplug.memmap_on_memory. This should be an admin decision, not some kernel config option.
> 
> 
> memory_hotplug.force_memmap_on_memory
> 
> "Enable the memmap on memory feature even if it could result in memory waste due to memmap size limitations. For example, if the memmap for a memory block requires 1 MiB, but the pageblock size is 2 MiB, 1 MiB
> of hotplugged memory will be wasted. Note that there are still cases where the feature cannot be enforced: for example, if the memmap is smaller than a single page, or if the architecture does not support the forced mode in all configurations."
> 
> Thoughts?
> 

With module parameter, do we still need the Kconfig option? 

-aneesh

