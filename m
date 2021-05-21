Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759038CAFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 18:29:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmsX23QzDz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 02:29:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rBif/QQT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rBif/QQT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmsWX6kS1z2yWm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 02:29:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LGKkQr056179; Fri, 21 May 2021 12:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3aPqdUh7k6cI41nT0el/8npsI4WQUKG/CHjqZr5cUYg=;
 b=rBif/QQT8y1q++IwzwR9QkYCwU8ras/kO2yuL2JFnjeDHo0ZdVgbWj9df5CcZLi6Kh/q
 Cp5fQQ7zFDReEauYJNVPA2cfwYW4RjC2s1gEW/fNzp7R5Jwy4U4T9R341aHfn+dfHCtq
 ynZGh80kw6hfLtxVI2w0P+rXkH3FW/eaJJRJ5CNjCOU4gaylfCxHyb68oJveRiUImxbV
 Z88aSZkSOksMY/QXYgbF2zEjHgrqcRl0duX1x7lqRCIaiH3GSNaA4IS8Lrhyam7bmbXt
 +yX2Fgh9t0a0QHjZifQXcT0K0EWQXb7hSB1NFrGh4nCBEbrGhyDK+K56235kklc8bYoj 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pga5r5gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:29:12 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LGQT7P086760;
 Fri, 21 May 2021 12:29:11 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pga5r5fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:29:11 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LGSuxu021150;
 Fri, 21 May 2021 16:29:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 38j5x81tf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 16:29:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LGT75x33620372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 16:29:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0108EA404D;
 Fri, 21 May 2021 16:29:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA8B5A4040;
 Fri, 21 May 2021 16:29:04 +0000 (GMT)
Received: from [9.199.42.28] (unknown [9.199.42.28])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 16:29:04 +0000 (GMT)
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
 <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
 <874kewme7a.fsf@linux.ibm.com>
 <CAHk-=whUHnm1CQ3LC0Qz=BBkhBRZkNW6ZmQZvSac2vju7gfeVg@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6686eca2-e41e-1235-cb86-6e6f8d5bb8bf@linux.ibm.com>
Date: Fri, 21 May 2021 21:59:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=whUHnm1CQ3LC0Qz=BBkhBRZkNW6ZmQZvSac2vju7gfeVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FwGuZhTcPhmTUNzAhYDQmltUHYeQp4ZM
X-Proofpoint-ORIG-GUID: z_J8eyVjMLNW3nOcpDeqdCti-NLgmmKB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_07:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210084
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/21 9:33 PM, Linus Torvalds wrote:
> On Fri, May 21, 2021 at 3:04 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> We could do MOVE_PMD with something like below? A equivalent MOVE_PUD
>> will be costlier which makes me wonder whether we should even support that?
> 
> Well, without USE_SPLIT_PTE_PTLOCKS the pud case would be trivial too.
> But everybody uses split pte locks in practice.
> 

Ok I can get a patch series enabling MOVE_PUD only with 
SPLIT_PTE_PTLOCKS disabled.

> I get the feeling that the rmap code might have to use
> pud_lock/pmd_lock. I wonder how painful that would be.
> 

and work long term on that? The lock/unlocking can get complicated 
because the page_vma_walk now need to return all the held locks.


-aneesh
