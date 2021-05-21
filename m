Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3AB38BCD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 05:04:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmWfK2Mv9z3bs5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:04:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGATY2K3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jGATY2K3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmWdn2gJYz2xYZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 13:03:40 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L2YFgX154582; Thu, 20 May 2021 23:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SIG3DoVhyg4NfycSekxMh7FUwk9LlJvdxTjRz3oAnls=;
 b=jGATY2K3qfQdMBMY0lBNWz0eMjMKM/CIrKtGgMSlMnLzoYY9mpF+eQKcOwPwQ+cCId8y
 Enu+NLrizsXdw2X9aFXaw+/CBYHAvCQO0DzP2K+pGnelI2wgzTn1zonb2vkOw+U2M7iG
 kyoXxXDxMmET/wkyO7YKIV9ddA42oTCBimJ1x43w2TsE+4IydvET96Onz+iJmUGftVU3
 wXrfHboVqtcrpa4ekAuN+L8sgllm63D5OZV3EB0Sux5JEPrRnEXS/NeIYBjn112l2dJa
 7ZXWnPxT1uJePjiAkzruNmA5e8oajJy9btfPeB4zHuhfcGN67qwtriqK4y+vNynpUKl9 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p3qw8yfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:03:26 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L2sRRJ022869;
 Thu, 20 May 2021 23:03:26 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p3qw8yfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:03:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L32sNN030534;
 Fri, 21 May 2021 03:03:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7twt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 03:03:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L33Lwv32375188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 03:03:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4555A405D;
 Fri, 21 May 2021 03:03:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E3AA4040;
 Fri, 21 May 2021 03:03:19 +0000 (GMT)
Received: from [9.199.42.28] (unknown [9.199.42.28])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 03:03:19 +0000 (GMT)
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
Date: Fri, 21 May 2021 08:33:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CtbZw9yZeIfR3tC_YJKAUKsOZxG6TAYc
X-Proofpoint-GUID: Q3njyghhvDJ2nk78Eas2cS_52Qof6U6P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_02:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210017
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

On 5/21/21 8:10 AM, Linus Torvalds wrote:
> On Thu, May 20, 2021 at 6:57 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Wondering whether this is correct considering we are holding mmap_sem in
>> write mode in mremap.
> 
> Right. So *normally* the rule is to EITHER
> 
>   - hold the mmap_sem for writing
> 
> OR
> 
>   - hold the page table lock
> 
> and that the TLB flush needs to happen before you release that lock.
> 
> But as that commit message of commit eb66ae030829 ("mremap: properly
> flush TLB before releasing the page") says, "mremap()" is a bit
> special. It's special because mremap() didn't take ownership of the
> page - it only moved it somewhere else. So now the page-out logic -
> that relies on the page table lock - can free the page immediately
> after we've released the page table lock.
> 
> So basically, in order to delay the TLB flush after releasing the page
> table lock, it's not really sufficient to _just_ hold the mmap_sem for
> writing. You also need to guarantee that the lifetime of the page
> itself is held until after the TLB flush.
> 
> For normal operations like "munmap()", this happens naturally, because
> we remove the page from the page table, and add it to the list of
> pages to be freed after the TLB flush.
> 
> But mremap never did that "remove the page and add it to a list to be
> free'd later". Instead, it just moved the page somewhere else. And
> thus there is no guarantee that the page that got moved will continue
> to exist until a TLB flush is done.
> 
> So mremap does need to flush the TLB before releasing the page table
> lock, because that's the lifetime boundary for the page that got
> moved.

How will we avoid that happening with 
c49dd340180260c6239e453263a9a244da9a7c85 / 
2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap 
performance by moving level3/level2 page table entries. When doing so we 
are not holding level 4 ptl lock (pte_lock()). But rather we are holding 
pmd_lock or pud_lock(). So if we move pages around without holding the 
pte lock, won't the above issue happen even if we do a tlb flush with 
holding pmd lock/pud lock?

-aneesh
