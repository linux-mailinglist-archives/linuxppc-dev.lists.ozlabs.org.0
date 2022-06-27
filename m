Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D71155B640
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 06:45:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWZsv4kxXz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 14:45:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FOPU3TmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FOPU3TmD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWZs84ynQz3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 14:44:59 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R3gNa0014372;
	Mon, 27 Jun 2022 04:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=w4+Y0pScPP4IDvo444L65Z2gYNeFFZStrTMknOlPyxY=;
 b=FOPU3TmD+yHht7jCYcl7bo/E7LjxtzYp579FpBi58o1nsbqsgaDdjAWN71+4GK9JYREG
 i1rtn7q2l9fe6XdRwFQ4rMHBVDQDz5+n8DOksyiHBrSF3dx+oguUyBO3I6beacNYOjAg
 kPnIi/pjWxQkkfTsneWHwR2NdAv6DSxSNINO3H6HN891nxbVsXULTaTf2vSnnLb9/hXk
 7tiG2HdhbuPHJbjUsbneQBsy81SgwajOn9kPLtE3yYAocfIdYL+np8WBzPE76cJ/rRW8
 lk5vZ6M3HHgDT/YV5AOYv8w8G9tCVZ51kbZZrT0p44403EUMxfueZm95SO5qKG9fDmCu xw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gy4vg92w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 04:44:44 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25R4ZrNH019389;
	Mon, 27 Jun 2022 04:44:42 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03wdc.us.ibm.com with ESMTP id 3gwt093kxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 04:44:42 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25R4igpJ32965010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 04:44:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44351124055;
	Mon, 27 Jun 2022 04:44:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D46C6124054;
	Mon, 27 Jun 2022 04:44:39 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.47.235])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 04:44:39 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
In-Reply-To: <87bkui6apn.fsf@mpe.ellerman.id.au>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
 <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
 <87bkui6apn.fsf@mpe.ellerman.id.au>
Date: Mon, 27 Jun 2022 10:14:37 +0530
Message-ID: <877d52zpe2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -8yoApmwsxdCKOwgYbxZIEtD6o9aJ37M
X-Proofpoint-ORIG-GUID: -8yoApmwsxdCKOwgYbxZIEtD6o9aJ37M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_02,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=757 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206270020
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Michal Hocko <mhocko@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Instead of high_memory use VMALLOC_START to validate that the address is
>> not in the vmalloc range.
>>
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> Isn't this really the fix for ffa0b64e3be5 ("powerpc: Fix
> virt_addr_valid() for 64-bit Book3E & 32-bit") ?

If we are looking for a simpler backport yet. But what commit ffa0b64e3be5 
does is correct. high_memory is suppose to be the top of direct mapped
address range. Hence checking for high_meory will also avoid vmalloc address.

If we take patch 1 then patch 3 is not really a fix. I would consider it
a cleanup to switch to a more familiar VMALLOC_START variable.

>
> cheers
>
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
>> index e5f75c70eda8..256cad69e42e 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -134,7 +134,7 @@ static inline bool pfn_valid(unsigned long pfn)
>>  
>>  #define virt_addr_valid(vaddr)	({					\
>>  	unsigned long _addr = (unsigned long)vaddr;			\
>> -	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
>> +	_addr >= PAGE_OFFSET && _addr < (unsigned long)VMALLOC_START &&	\
>>  	pfn_valid(virt_to_pfn(_addr));					\
>>  })
>>  
>> -- 
>> 2.36.1
