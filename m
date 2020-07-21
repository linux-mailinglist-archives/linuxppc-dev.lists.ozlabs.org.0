Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1D72277B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 06:45:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9mGy5PwkzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 14:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9mDd3RlKzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 14:42:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L4Wrip011245; Tue, 21 Jul 2020 00:42:51 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dn6x600c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 00:42:50 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L4ftkb021142;
 Tue, 21 Jul 2020 04:42:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh3d50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 04:42:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06L4gjVC20185562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 04:42:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E8085205A;
 Tue, 21 Jul 2020 04:42:45 +0000 (GMT)
Received: from [9.85.116.40] (unknown [9.85.116.40])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D4B6A5204F;
 Tue, 21 Jul 2020 04:42:43 +0000 (GMT)
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <0f79bf71-132e-6f3b-9b51-fb893b0dd451@linux.ibm.com>
Date: Tue, 21 Jul 2020 10:12:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87tuy1sksv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_01:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210031
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
Cc: linuxppc-dev@lists.ozlabs.org, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/21/20 7:15 AM, Michael Ellerman wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> This is the next version of the fixes for memory unplug on radix.
>>> The issues and the fix are described in the actual patches.
>>
>> I guess this isn't actually causing problems at runtime right now, but I
>> notice calls to resize_hpt_for_hotplug() from arch_add_memory() and
>> arch_remove_memory(), which ought to be mmu-agnostic:
>>
>> int __ref arch_add_memory(int nid, u64 start, u64 size,
>> 			  struct mhp_params *params)
>> {
>> 	unsigned long start_pfn = start >> PAGE_SHIFT;
>> 	unsigned long nr_pages = size >> PAGE_SHIFT;
>> 	int rc;
>>
>> 	resize_hpt_for_hotplug(memblock_phys_mem_size());
>>
>> 	start = (unsigned long)__va(start);
>> 	rc = create_section_mapping(start, start + size, nid,
>> 				    params->pgprot);
>> ...
> 
> Hmm well spotted.
> 
> That does return early if the ops are not setup:
> 
> int resize_hpt_for_hotplug(unsigned long new_mem_size)
> {
> 	unsigned target_hpt_shift;
> 
> 	if (!mmu_hash_ops.resize_hpt)
> 		return 0;
> 
> 
> And:
> 
> void __init hpte_init_pseries(void)
> {
> 	...
> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
> 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
> 
> And that comes in via ibm,hypertas-functions:
> 
> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
> 
> 
> But firmware is not necessarily going to add/remove that call based on
> whether we're using hash/radix.
> 


We are good there because hpte_init_pseries is only called for hash 
translation.

early_init_mmu()
-> hash__early_init_mmu
    -> hpte_init_pseries
       -> mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;

> So I think a follow-up patch is needed to make this more robust.
> 
> Aneesh/Bharata what platform did you test this series on? I'm curious
> how this didn't break.

All the changes are tested with kvm.

-aneesh

