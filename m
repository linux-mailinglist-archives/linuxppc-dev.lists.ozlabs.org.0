Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309F490357
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 09:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JckqV0yNjz305K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 19:00:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=km3F76Z9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=km3F76Z9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jckpm14Z2z2x9H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 19:00:15 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H7unur040957; 
 Mon, 17 Jan 2022 08:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SzMfjj8dKQEYb8+oDNN5G/wJdH7yUOjXvV9x+tZndyY=;
 b=km3F76Z9xwgyuKBs0WKy5hsluFCD2gBZatllVsSDD543NlDG1ESKK+j4Jz1iPSJtWebk
 tm7eX6MKNAJmlWXFL1UFHXzKs9Vp81GqkehbfpiuoU2Wh7Z1vqG6/B3fsgyyjnkGkJJn
 DQmWNeos8OsH3xVu+buM8LfelkKyZtqAyRucNm/jyPTbk9QJ3/VBn2SwlPG+mAZOYxuz
 b8xijTQCTvwVYQPDIYEYQiETonzUoOTdWApLxVDrI6ZqskSnr1OS5SwGHIrnoxjkgPqo
 rmONZF0g+eJgtFvM0SIb5aRXYS95+Qhfz8axvIIoPUMUpdoHSFldx432eMRfITRc0Kyo Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn4gxr1m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:00:07 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H807km010760;
 Mon, 17 Jan 2022 08:00:07 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn4gxr1jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:00:06 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H7qgjt018773;
 Mon, 17 Jan 2022 08:00:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3dknhhrq1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:00:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H8012c45875526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 08:00:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BB454C059;
 Mon, 17 Jan 2022 08:00:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49BD24C04A;
 Mon, 17 Jan 2022 07:59:57 +0000 (GMT)
Received: from [9.163.1.44] (unknown [9.163.1.44])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 07:59:56 +0000 (GMT)
Message-ID: <53a7254d-a2fa-928a-df78-d773a53bbf4b@linux.ibm.com>
Date: Mon, 17 Jan 2022 13:29:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] mm/cma: provide option to opt out from exposing
 pages on activation failure
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20220112193340.149020-1-hbathini@linux.ibm.com>
 <20220112193340.149020-2-hbathini@linux.ibm.com>
 <debd11c4-4a7a-e650-7bc6-965d58ef95cf@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <debd11c4-4a7a-e650-7bc6-965d58ef95cf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: whZIziROwfJ9tU89IJ1qT0F15u1QWt35
X-Proofpoint-ORIG-GUID: jbYsMs44m4Y8Qmy0Rnh0hdz0LRdcr-UV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170048
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
Cc: osalvador@suse.de, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 13/01/22 2:00 pm, David Hildenbrand wrote:
>> +{
>> +	if (!cma)
>> +		return;
> 
> Do we really need that check for NULL?

Probably not.

> 
>> +
>> +	cma->reserve_pages_on_error = true;
>> +}
>> +
>>   /**
>>    * cma_init_reserved_mem() - create custom contiguous area from reserved memory
>>    * @base: Base address of the reserved area
>> @@ -204,6 +214,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>>   	cma->base_pfn = PFN_DOWN(base);
>>   	cma->count = size >> PAGE_SHIFT;
>>   	cma->order_per_bit = order_per_bit;
>> +	cma->reserve_pages_on_error = false;
> 
> I think you can drop that; should already be initialized to 0.
> 
> 
> Apart from that
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

Thanks for the review, David.
Posted v3 with the changes suggested above.

- Hari
