Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B54B215B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 10:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw7Ky12Fpz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 20:17:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZdnaGKmW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZdnaGKmW; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw7K8646Vz3bY3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 20:16:28 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B8UOwr025927; 
 Fri, 11 Feb 2022 09:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FA9XmvA7fmm0E3gQSBUA97xTaxwnsm30iVooN/EWLh4=;
 b=ZdnaGKmWQtr673IZMlNNMyPNzLAVKwcBHWKJgqui4kmWkB/A9+mEiO5+h/jd3cpFy1BQ
 JJ+/9T8gpIybXTx+zceAPhMrc0qh+ft0jHocKQDLFChRQEwJ4A0mSa+89ZiN5e9UPjge
 L8gQFAC0xAEkJDqXZ82mjiBplMRs2VRb8OhQWyOrS4AFbcLfen/oTD7TqVEdPdQRrcBm
 bmvwVVFLCo7HgMLtaTNS+K6SYG2icOh78qepOM5NWaUajFW9TFmTb+kg2icfCjDDqMxF
 /t+DdMV492DtVd2WWjItaCGqF22/us9BdXlbJcqb1bsBL4k+dN7ke276AlJ+iTxbvja+ Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvmw22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 09:16:19 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21B9D9Bw002743;
 Fri, 11 Feb 2022 09:16:19 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvmw1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 09:16:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21B98PcR029431;
 Fri, 11 Feb 2022 09:16:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3e1gvawrbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 09:16:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21B9GElk15991096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 09:16:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF1F44C046;
 Fri, 11 Feb 2022 09:16:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 315044C050;
 Fri, 11 Feb 2022 09:16:13 +0000 (GMT)
Received: from [9.43.41.36] (unknown [9.43.41.36])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 09:16:12 +0000 (GMT)
Message-ID: <05d6615a-50c7-1b23-1bab-0e0b64dd4e81@linux.ibm.com>
Date: Fri, 11 Feb 2022 14:46:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
 <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VjDIKL68lFd33EOaq_4-f0VdPkH3-tHL
X-Proofpoint-GUID: JSOj8yNzm5qEWL4J6yghz9whcEDAd9BJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_03,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110051
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/22 14:00, David Hildenbrand wrote:
> On 11.02.22 07:52, Aneesh Kumar K.V wrote:
>> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
>> introduced pageblock_order which will be used to group pages better.
>> The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
>> should be set before we call set_pageblock_order.
>>
>> set_pageblock_order happens early in the boot and default hugetlb page size
>> should be initialized before that to compute the right pageblock_order value.
>>
>> Currently, default hugetlbe page size is set via arch_initcalls which happens
>> late in the boot as shown via the below callstack:
>>
>> [c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
>> [c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
>> [c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
>> [c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
>> [c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64
>>
>> and the pageblock_order initialization is done early during the boot.
>>
>> [c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
>> [c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
>> [c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
>> [c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
>> [c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
>> [c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98
>>
>> delaying default hugetlb page size initialization implies the kernel will
>> initialize pageblock_order to (MAX_ORDER - 1) which is not an optimal
>> value for mobility grouping. IIUC we always had this issue. But it was not
>> a problem for hash translation mode because (MAX_ORDER - 1) is the same as
>> HUGETLB_PAGE_ORDER (8) in the case of hash (16MB). With radix,
>> HUGETLB_PAGE_ORDER will be 5 (2M size) and hence pageblock_order should be
>> 5 instead of 8.
> 
> 
> A related question: Can we on ppc still have pageblock_order > MAX_ORDER
> - 1? We have some code for that and I am not so sure if we really need that.
> 

I also have been wondering about the same. On book3s64 I don't think we 
need that support for both 64K and 4K page size because with hash 
hugetlb size is MAX_ORDER -1. (16MB hugepage size)

I am not sure about the 256K page support. Christophe may be able to 
answer that.

For the gigantic hugepage support we depend on cma based allocation or
firmware reservation. So I am not sure why we ever considered pageblock 
 > MAX_ORDER -1 scenario. If you have pointers w.r.t why that was ever 
needed, I could double-check whether ppc64 is still dependent on that.

-aneesh
