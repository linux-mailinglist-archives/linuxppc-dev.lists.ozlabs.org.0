Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FEA28D8F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 05:17:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9yJR67zZzDqjc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 14:17:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jw0DQPOu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9yGf0Pw5zDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 14:15:37 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E368u0102590; Tue, 13 Oct 2020 23:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uRbdft4E/x66olBsVlimkn+3LAw3JOugsBuDc/lI+3U=;
 b=jw0DQPOugFfgJETWlSXgyPhAd7mPVPo2GM9ZBCtvux2wi68H4y1u72dU4iDNKI8YD4JH
 57PxL1UhZ/uLJgTZb7XNF6CMsBJ+W27smqr13Hod5OMAzVS3MBRwqSkB3ofyABUlvW6K
 4zOwLXOAKnhiO7Cy7J/KpzLIiCGRE17xOKwpdAo9hoXdKCATESM4J9fqUEHoECUpdXNi
 VIy/YrS6eJTcDt5xNynxlTzwkUwsJ01CfMtndmsjSEBa5mRunS048dXSNEV/jMruIYPW
 rVE44qAu29L8SbQvg8ehs8D3Z/dj/aIESQ+q+Ia6eLwqAzORPoGbFOA4cpDBLrhfaTcr mQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345rc29chq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 23:15:23 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E3Edul003244;
 Wed, 14 Oct 2020 03:15:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 344558s95j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 03:15:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09E3FJf128770720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 03:15:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25EE911C04A;
 Wed, 14 Oct 2020 03:15:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37D911C04C;
 Wed, 14 Oct 2020 03:15:17 +0000 (GMT)
Received: from [9.85.69.185] (unknown [9.85.69.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Oct 2020 03:15:17 +0000 (GMT)
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20201013135858.f4a7f0c5f3b0a69a2a304cfe@linux-foundation.org>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <034db663-a5bd-fd5e-b7f6-3ec31310e8e5@linux.ibm.com>
Date: Wed, 14 Oct 2020 08:45:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013135858.f4a7f0c5f3b0a69a2a304cfe@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_02:2020-10-13,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=870 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140021
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
Cc: linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/14/20 2:28 AM, Andrew Morton wrote:
> On Wed,  2 Sep 2020 17:12:09 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> 
>> This patch series includes fixes for debug_vm_pgtable test code so that
>> they follow page table updates rules correctly. The first two patches introduce
>> changes w.r.t ppc64. The patches are included in this series for completeness. We can
>> merge them via ppc64 tree if required.
> 
> Do you think this series is ready to be merged?

Hopefully, except for the Riscv crash.

> 
> Possibly-unresolved issues which I have recorded are
> 
> Against
> mm-debug_vm_pgtable-locks-move-non-page-table-modifying-test-together.patch:
> 
> https://lkml.kernel.org/r/56830efb-887e-0000-a46e-ae015e5854cd@arm.com

I guess the full series do boot fine on arm.

> https://lkml.kernel.org/r/20200910075752.GC26874@shao2-debian

This should be fixed by

https://ozlabs.org/~akpm/mmots/broken-out/mm-debug_vm_pgtable-avoid-doing-memory-allocation-with-pgtable_t-mapped.patch

> 
> Against mm-debug_vm_pgtable-avoid-none-pte-in-pte_clear_test.patch:
> 
> https://lkml.kernel.org/r/87zh5wx51b.fsf@linux.ibm.com


yes this one we should get fixed. I was hoping someone familiar with 
Riscv pte updates rules would pitch in. IIUC we need to update 
RANDON_ORVALUE similar to how we updated it for s390 and ppc64.


  Alternatively we can do this

modified   mm/debug_vm_pgtable.c
@@ -548,7 +548,7 @@ static void __init pte_clear_tests(struct mm_struct 
*mm, pte_t *ptep,
  	pte_t pte = pfn_pte(pfn, prot);

  	pr_debug("Validating PTE clear\n");
-	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
+//	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
  	set_pte_at(mm, vaddr, ptep, pte);
  	barrier();
  	pte_clear(mm, vaddr, ptep);

till we get that feedback from RiscV team?

> https://lkml.kernel.org/r/37a9facc-ca36-290f-3748-16c4a7a778fa@arm.com

same as the above.

> https://lkml.kernel.org/r/20201011200258.GA91021@roeck-us.net
> 

same as the above.

-aneesh
