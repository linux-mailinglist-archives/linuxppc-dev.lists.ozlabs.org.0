Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418597408FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:39:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZbyAsDdt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrS4F193sz30dq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 13:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZbyAsDdt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrS3M61kgz30K1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 13:38:23 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35S3Hss5012192;
	Wed, 28 Jun 2023 03:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=77UZQesTawc4k7Bd6XPb+SbH0pG/naMm0tB85GTBGFQ=;
 b=ZbyAsDdtyW7xuPvzOVn6oSBsNKKuTdQQTf0lWp9MuKtjW2Wt6S/cxkn1ZEDxphVti5sQ
 AK7emwuFJTI/EPKu6Rl5LXVLZ3hGsqCpENDKmU+D38TDrRZa7BLhRL+l7mHd8lx6BFKA
 SOKBW/QHWBPX3XqqAxCD0+5c+JdLWQpymxRuG7KfWKXEQpN953vh0LiklBzCnXsGvgoJ
 CL6a/siteGWJeGsQzlzp3ln9Kux/qJUJVZ1iuldmwVX7fxkgi8WKOXOLRR2pOJJBQHrz
 HAPfF/aGHVGirgvwPMySn+qpxsmRG/gWqLvWr6dD7Yb1k31HONrFmHjAUt0jnI/J8I8K 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgctv8bxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:37:45 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35S3Lfpr023546;
	Wed, 28 Jun 2023 03:37:44 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgctv8bwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:37:44 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35RKNAdU004916;
	Wed, 28 Jun 2023 03:37:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3rdr451rwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:37:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35S3beUh25756290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 03:37:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42D3020040;
	Wed, 28 Jun 2023 03:37:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2126F2004B;
	Wed, 28 Jun 2023 03:37:37 +0000 (GMT)
Received: from [9.43.54.216] (unknown [9.43.54.216])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Jun 2023 03:37:36 +0000 (GMT)
Message-ID: <4c6486bb-b81e-b9ac-7728-e8e040b3163f@linux.ibm.com>
Date: Wed, 28 Jun 2023 09:07:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/16] powerpc/book3s64/vmemmap: Switch radix to use a
 different vmemmap handling function
Content-Language: en-US
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <87r0pwnzg0.fsf@doe.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87r0pwnzg0.fsf@doe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zobyVYQKTA3NHdQ6St1DJuOnz0nQlR7O
X-Proofpoint-ORIG-GUID: RVibon_LSDc02gnXSltDxNi1oiyhXM-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_16,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280032
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/28/23 7:03 AM, Ritesh Harjani (IBM) wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

....

>> +int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
>> +				unsigned long addr, unsigned long next)
>> +{
>> +	int large = pmd_large(*pmd);
>> +
>> +	if (pmd_large(*pmd))
> 
> we already got the value of pmd_large into "large" variable.
> we can use just if (large) right?
> 
>> +		vmemmap_verify((pte_t *)pmd, node, addr, next);
> 
> maybe we can use pmdp_ptep() function here which we used in the 1st patch?
> also shouldn't this be pmdp in the function argument instead of pmd?
> 

updated

>> +
>> +	return large;
>> +}
>> +
>> +void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
>> +			       unsigned long addr, unsigned long next)
>> +{
>> +	pte_t entry;
>> +	pte_t *ptep = pmdp_ptep(pmdp);
>> +
>> +	VM_BUG_ON(!IS_ALIGNED(addr, PMD_SIZE));
>> +	entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
>> +	set_pte_at(&init_mm, addr, ptep, entry);
>> +	asm volatile("ptesync": : :"memory");
>> +
>> +	vmemmap_verify(ptep, node, addr, next);
>> +}
>> +
>> +static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
>> +						     struct vmem_altmap *altmap,
>> +						     struct page *reuse)
>> +{
>> +	pte_t *pte = pte_offset_kernel(pmd, addr);
>> +
>> +	if (pte_none(*pte)) {
>> +		pte_t entry;
>> +		void *p;
>> +
>> +		if (!reuse) {
>> +			/*
>> +			 * make sure we don't create altmap mappings
>> +			 * covering things outside the device.
>> +			 */
>> +			if (altmap && altmap_cross_boundary(altmap, addr, PAGE_SIZE))
>> +				altmap = NULL;
>> +
>> +			p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
>> +			if (!p) {
>> +				if (altmap)
>> +					p = vmemmap_alloc_block_buf(PAGE_SIZE, node, NULL);
>> +				if (!p)
>> +					return NULL;
>> +			}
> 
> Above if conditions are quite confusing when looking for the 1st time?
> Can we do this? Did I get it right?
> 
>                 if (!p && altmap)
>                   p = vmemmap_alloc_block_buf(PAGE_SIZE, node, NULL);
> 
>                 if (!p)
>                   return NULL;
> 

updated


-aneesh
