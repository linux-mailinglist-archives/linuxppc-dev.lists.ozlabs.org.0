Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFDA74F429
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 17:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O/YKEt6v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0ltP5Y6nz3btP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 01:59:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O/YKEt6v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0lsT2N6Gz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:58:37 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BFqwaq012051;
	Tue, 11 Jul 2023 15:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LcmA3JLh1BgvTDSDbbInK4Bmp4CqtP7aO3w7K1dDC6Q=;
 b=O/YKEt6vT1spDnO1w39WI/XZ4aMuRMzpEtvmIIr5h/HcN4jtNnHe2Iz60tCx5sI6wHX0
 /e8ZAY+/eZ1LC9W+kjYKiF+B/IXBBWNcgnduwSUzRRjwQH2euShRbeZWe59msxIhEQJT
 TpywAk+dzTVfl1G5SYgxv30Wc5rO2yVqllDNGOlALIl+yLRiCkcP+OayYPeB14XuI88M
 YSnw/iuvoKJZHSL7tWlVdviPfZ0wIQ2zQqF8KFhYtbzilDU40Grlrvw5pVq0qmyNNW+g
 DVdRWhdgM10Pz4mQ8eY6pqbD0tt0z8/vh5y9+b6zsbTAuFwuns04paRSbWoGJNcEgGCC 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rsa3u83mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 15:58:22 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36BFse8W017052;
	Tue, 11 Jul 2023 15:58:22 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rsa3u83km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 15:58:22 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36BEEfN7018517;
	Tue, 11 Jul 2023 15:58:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rqmu0r63e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 15:58:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36BFwIEg22413972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 15:58:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF70D20040;
	Tue, 11 Jul 2023 15:58:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C9E520043;
	Tue, 11 Jul 2023 15:58:16 +0000 (GMT)
Received: from [9.43.86.43] (unknown [9.43.86.43])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 15:58:15 +0000 (GMT)
Message-ID: <d6280b64-6ca3-6a0b-3be9-2338d3845bdc@linux.ibm.com>
Date: Tue, 11 Jul 2023 21:28:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/7] mm/hotplug: Allow memmap on memory hotplug request
 to fallback
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-3-aneesh.kumar@linux.ibm.com>
 <d6e9f0d3-7c53-944a-2e02-33cc35d5f340@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <d6e9f0d3-7c53-944a-2e02-33cc35d5f340@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Tpqy9uvOtIOlxsVDOiGagEHS0xR6q4qh
X-Proofpoint-GUID: ZaKC_XMOjMZUSCgndrdngcpLU7P2WrBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=848
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110139
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

On 7/11/23 3:53 PM, David Hildenbrand wrote:
>> -bool mhp_supports_memmap_on_memory(unsigned long size)
>> +static bool mhp_supports_memmap_on_memory(unsigned long size)
>>   {
>>       unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
>>       unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>> @@ -1339,13 +1339,12 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>        * Self hosted memmap array
>>        */
>>       if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
>> -        if (!mhp_supports_memmap_on_memory(size)) {
>> -            ret = -EINVAL;
>> -            goto error;
>> +        if (mhp_supports_memmap_on_memory(size)) {
>> +            mhp_altmap.free = PHYS_PFN(size);
>> +            mhp_altmap.base_pfn = PHYS_PFN(start);
>> +            params.altmap = &mhp_altmap;
>>           }
>> -        mhp_altmap.free = PHYS_PFN(size);
>> -        mhp_altmap.base_pfn = PHYS_PFN(start);
>> -        params.altmap = &mhp_altmap;
>> +        /* fallback to not using altmap  */
>>       }
>>         /* call arch's memory hotadd */
> 
> In general, LGTM, but please extend the documentation of the parameter in memory_hotplug.h, stating that this is just a hint and that the core can decide to no do that.
> 

will update

modified   include/linux/memory_hotplug.h
@@ -97,6 +97,8 @@ typedef int __bitwise mhp_t;
  * To do so, we will use the beginning of the hot-added range to build
  * the page tables for the memmap array that describes the entire range.
  * Only selected architectures support it with SPARSE_VMEMMAP.
+ * This is only a hint, core kernel can decide to not do this based on
+ * different alignment checks.
  */
 #define MHP_MEMMAP_ON_MEMORY   ((__force mhp_t)BIT(1))

