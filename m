Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B1A38BCF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 05:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmXCg3JQwz3btF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZMqfIB5M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZMqfIB5M; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmXC869MZz2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 13:29:08 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L332Ff086023; Thu, 20 May 2021 23:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=BDtIoiQUxTbyuOnUSSwWoQxRurIDpZufH5SHZlL8KTE=;
 b=ZMqfIB5M+8xgYXRKbOt3QMqPkC5PYovlRT/7/pRR5G8olB5YaaSnFt6zhn4pBEVryDcW
 W2VfftM1U0Ni9WsHl8Ye8Ir5vyTL34KAMGCx/4vfHPLXGXqZtP7ca1XiiDb10JJOV0AP
 /v5WSpYyDRTQM9M0XEPDufs9TGhsBMoaSvpsMM34RE0lc14f4FgsJVqsoKim7YhaaJ6d
 LGaRbkI53qx35r0MbkQFkj284L0AneZf71qukKXD54fbvaCtQHvhuqsK0xqjU43JOFQM
 TKrzL15YUvkNU9lzlhKJczl/JNiKybyW0n+2SUqKtIKFSyOlcInHzQ8vgPPXPSE6P4xK ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p2kujmbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:28:57 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L3Os1R159886;
 Thu, 20 May 2021 23:28:56 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p2kujmbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:28:56 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L3SUX4015605;
 Fri, 21 May 2021 03:28:56 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 38j5x9mqdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 03:28:56 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L3StHs31261138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 03:28:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBCE3AE063;
 Fri, 21 May 2021 03:28:55 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1A04AE068;
 Fri, 21 May 2021 03:28:52 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.42.28])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 03:28:52 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
In-Reply-To: <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
Date: Fri, 21 May 2021 08:58:50 +0530
Message-ID: <877djsn4st.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X-WFiMnOPC3rVK5TMEXJKbgXIMiaQPMS
X-Proofpoint-ORIG-GUID: jGoVescxMIQr_u6OvbdRbUNwbY03BzW7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_02:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210021
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 5/21/21 8:10 AM, Linus Torvalds wrote:
>> On Thu, May 20, 2021 at 6:57 AM Aneesh Kumar K.V
>> <aneesh.kumar@linux.ibm.com> wrote:
>>>
>>> Wondering whether this is correct considering we are holding mmap_sem in
>>> write mode in mremap.
>> 
>> Right. So *normally* the rule is to EITHER
>> 
>>   - hold the mmap_sem for writing
>> 
>> OR
>> 
>>   - hold the page table lock
>> 
>> and that the TLB flush needs to happen before you release that lock.
>> 
>> But as that commit message of commit eb66ae030829 ("mremap: properly
>> flush TLB before releasing the page") says, "mremap()" is a bit
>> special. It's special because mremap() didn't take ownership of the
>> page - it only moved it somewhere else. So now the page-out logic -
>> that relies on the page table lock - can free the page immediately
>> after we've released the page table lock.
>> 
>> So basically, in order to delay the TLB flush after releasing the page
>> table lock, it's not really sufficient to _just_ hold the mmap_sem for
>> writing. You also need to guarantee that the lifetime of the page
>> itself is held until after the TLB flush.
>> 
>> For normal operations like "munmap()", this happens naturally, because
>> we remove the page from the page table, and add it to the list of
>> pages to be freed after the TLB flush.
>> 
>> But mremap never did that "remove the page and add it to a list to be
>> free'd later". Instead, it just moved the page somewhere else. And
>> thus there is no guarantee that the page that got moved will continue
>> to exist until a TLB flush is done.
>> 
>> So mremap does need to flush the TLB before releasing the page table
>> lock, because that's the lifetime boundary for the page that got
>> moved.
>
> How will we avoid that happening with 
> c49dd340180260c6239e453263a9a244da9a7c85 / 
> 2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap 
> performance by moving level3/level2 page table entries. When doing so we 
> are not holding level 4 ptl lock (pte_lock()). But rather we are holding 
> pmd_lock or pud_lock(). So if we move pages around without holding the 
> pte lock, won't the above issue happen even if we do a tlb flush with 
> holding pmd lock/pud lock?

This should help? ie, we flush tlb before we move pagetables to the new
address? 

modified   mm/mremap.c
@@ -277,11 +277,14 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	/* Clear the pmd */
 	pmd = *old_pmd;
 	pmd_clear(old_pmd);
-
+	/*
+	 * flush the TLB before we move the page table entries.
+	 * TLB flush includes necessary barriers.
+	 */
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
 
-	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);


-aneesh
