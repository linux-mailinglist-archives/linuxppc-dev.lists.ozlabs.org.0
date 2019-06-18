Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F104A222
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 15:29:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sppr0jwTzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 23:29:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SpmV1W3HzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 23:27:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IDIhuZ127616
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 09:27:50 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6xs6e1b0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 09:27:50 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Tue, 18 Jun 2019 14:27:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 14:27:45 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5IDRiN537421188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 13:27:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE63E4203F;
 Tue, 18 Jun 2019 13:27:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBCAC42052;
 Tue, 18 Jun 2019 13:27:42 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.210.220])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jun 2019 13:27:42 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 18 Jun 2019 18:57:41 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Ensure Huge-page memory is free before
 allocation
In-Reply-To: <87v9x3p04l.fsf@concordia.ellerman.id.au>
References: <20190618044609.19997-1-vaibhav@linux.ibm.com>
 <87v9x3p04l.fsf@concordia.ellerman.id.au>
Date: Tue, 18 Jun 2019 18:57:41 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19061813-0028-0000-0000-0000037B5488
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061813-0029-0000-0000-0000243B5E35
Message-Id: <87zhmfrpki.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=696 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180109
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
Cc: Hari Bathini <hbathini@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> We recently discovered an bug where physical memory meant for
>> allocation of Huge-pages was inadvertently allocated by another component
>> during early boot.
>
> Can you give me some more detail on what that was? You're seemingly the
> only person who's ever hit this :)

The specific bug I investigated was in fadump which was trying to
reserve a large chunk of physically contiguous memory from memblock and
inadvertently stomped into a memory region that was reserved for
allocation of 16G hugepages. This happened because fadump reservation
happens much earlier in prom-init compared to hugepage reservation.

The bug manifested as a panic seen when trying to 'cat
/proc/pagetypeinfo' that dumps the buddy stats for each
zone/migrate-type.

Incidentally fadump after reserving this memory, would carve out a CMA
region that was then entered into the buddy-allocater. This would cause
pagetypeinfo_showfree_print() to fail when it tries to iterate over the
free list of this CMA migrate type as the corresponding memmap for these
pages was never initialized.

>
>> The behavior of memblock_reserve() where it wont
>> indicate whether an existing reserved block overlaps with the
>> requested reservation only makes such bugs hard to investigate.
>>
>> Hence this patch proposes adding a memblock reservation check in
>> htab_dt_scan_hugepage_blocks() just before call to memblock_reserve()
>> to ensure that the physical memory thats being reserved for is not
>> already reserved by someone else. In case this happens we panic the
>> the kernel to ensure that user of this huge-page doesn't accidentally
>> stomp on memory allocated to someone else.
>
> Do we really need to panic? Can't we just leave the block alone and not
> register it as huge page memory? With a big warning obviously.
Possibly yes, but Aneesh pointed out that this memory is supposed to be backed
only by 16G pages mapping due to limitation in phyp for hash page table size. 

>
> cheers
>
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>> index 28ced26f2a00..a05be3adb8c9 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -516,6 +516,11 @@ static int __init htab_dt_scan_hugepage_blocks(unsigned long node,
>>  	printk(KERN_INFO "Huge page(16GB) memory: "
>>  			"addr = 0x%lX size = 0x%lX pages = %d\n",
>>  			phys_addr, block_size, expected_pages);
>> +
>> +	/* Ensure no one else has reserved memory for huge pages before */
>> +	BUG_ON(memblock_is_region_reserved(phys_addr,
>> +					   block_size * expected_pages));
>> +
>>  	if (phys_addr + block_size * expected_pages <= memblock_end_of_DRAM()) {
>>  		memblock_reserve(phys_addr, block_size * expected_pages);
>>  		pseries_add_gpage(phys_addr, block_size, expected_pages);
>> -- 
>> 2.21.0
>

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

