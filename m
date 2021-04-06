Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DE354BBF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 06:31:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDvjt3ggsz3br0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 14:31:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdndwRsa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OdndwRsa; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDvjP2Rnvz3027
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 14:31:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13644fiJ136567; Tue, 6 Apr 2021 00:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=x274D2ACujB49e309naQYHaHKCD+smXOhS4yv9ZCjZM=;
 b=OdndwRsa7Z1t6PquvdsILKCRj+BVBGffizMIcynQYGcb2vrO74w8gvce05mkSlsBD5+E
 TqhFhBXLRzPoxeNh1OznST/kAdKz9HYt39vblVxNF9Ui4L6CvhKyH63GG70YK37NtPiG
 o4lg9MEjLtata36YAXawI1zHh5tevVKXOy9/CzrEpjO3ie2JbYnFuBUUuxsZ6KRPFX86
 PYb0tEskaGBYhgmbZC0pHiiI0EJDuCnDgymuxM9R238n5FD6FjSKbrHtDC7uJ3MW3n4a
 XJFLXHYuftFCaTeLxBIeGKbMvenNIe/Lkw34k5UYYx59TSgApaIih/PDhjx0idXMzo9K qQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5x8f0vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 00:30:56 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1364RMGC006303;
 Tue, 6 Apr 2021 04:30:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 37q2nr8xjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 04:30:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1364UV2t35651946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 04:30:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D013A4060;
 Tue,  6 Apr 2021 04:30:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13243A405C;
 Tue,  6 Apr 2021 04:30:49 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.102.0.175])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  6 Apr 2021 04:30:48 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 06 Apr 2021 10:00:48 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Add cond_resched() while removing hpte
 mappings
In-Reply-To: <87im5zmkpm.fsf@mpe.ellerman.id.au>
References: <20210310075938.361656-1-vaibhav@linux.ibm.com>
 <87im5zmkpm.fsf@mpe.ellerman.id.au>
Date: Tue, 06 Apr 2021 10:00:47 +0530
Message-ID: <87zgyc11c8.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vJzeHr-6269xHY7UvVZK4my42_2Wo3-l
X-Proofpoint-GUID: vJzeHr-6269xHY7UvVZK4my42_2Wo3-l
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060024
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mpe,

Thanks for looking into this patch.

Michael Ellerman <mpe@ellerman.id.au> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> While removing large number of mappings from hash page tables for
>> large memory systems as soft-lockup is reported because of the time
>> spent inside htap_remove_mapping() like one below:
>>
>>  watchdog: BUG: soft lockup - CPU#8 stuck for 23s!
>>  <snip>
>>  NIP plpar_hcall+0x38/0x58
>>  LR  pSeries_lpar_hpte_invalidate+0x68/0xb0
>>  Call Trace:
>>   0x1fffffffffff000 (unreliable)
>>   pSeries_lpar_hpte_removebolted+0x9c/0x230
>>   hash__remove_section_mapping+0xec/0x1c0
>>   remove_section_mapping+0x28/0x3c
>>   arch_remove_memory+0xfc/0x150
>>   devm_memremap_pages_release+0x180/0x2f0
>>   devm_action_release+0x30/0x50
>>   release_nodes+0x28c/0x300
>>   device_release_driver_internal+0x16c/0x280
>>   unbind_store+0x124/0x170
>>   drv_attr_store+0x44/0x60
>>   sysfs_kf_write+0x64/0x90
>>   kernfs_fop_write+0x1b0/0x290
>>   __vfs_write+0x3c/0x70
>>   vfs_write+0xd4/0x270
>>   ksys_write+0xdc/0x130
>>   system_call+0x5c/0x70
>>
>> Fix this by adding a cond_resched() to the loop in
>> htap_remove_mapping() that issues hcall to remove hpte mapping. This
>> should prevent the soft-lockup from being reported.
>
> Can/should we also/instead be using H_BLOCK_REMOVE?
>
> cheers

Current mmp_ops implementation seems to use H_BULK_REMOVE for hugepages
so for removing mappings for regular pages I am looking into adding a
new mmu_op that can take a range to be unmapped and 
I did try implmenting a new mmu_op for this which can reduce the number
of hash_pte lookups needed to invalidate this range. But that would need
some more work so as a stop gap I have sent out a v2 with Christophe's
suggestion to add a cond_resched() every HZ interval.

-- 
Cheers
~ Vaibhav
