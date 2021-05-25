Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AEC38FD10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 10:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq71l6Dlnz306P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 18:44:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QiwqkbM4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QiwqkbM4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq71F4F6Xz2y88
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 18:44:32 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P8XUTN088268; Tue, 25 May 2021 04:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=eUev9Tuv4QzoT5jEjuvSv7y2xh5ahwKSkXZbd0VRzrY=;
 b=QiwqkbM4jqbX4UyAnyxDFqqyxrmUgwZ5G6U2n1Hb9z690KWKoK1DYSCV8+VWYwFXGWFn
 Ya/rcGTRZdsBZVugFF0weRrwjg+gmif4sh1xgypyrnIfvITESJwqv4YNzi+0If0noJce
 12t6HmExZvrh9qKPO2cWkdcn7iNKugNZSfg7A5LWbbtob5CCC6aIqWUHmTcmbgyxaeEE
 sZnzloY59DVXIjlVzo4yX0Pue4qrNk2j6GsLzw/IsGd4H7lcxDsFUhMDhxzokr4LNZ46
 9e+Y5oZ1AWlVoGsGADfrnZ4xvwN3TZ+uP8Ahilg8d1MRTxUwbOIcudfBEV/1dWCWNgoQ uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rws18en3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 04:44:18 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14P8XdUu089148;
 Tue, 25 May 2021 04:44:18 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rws18emq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 04:44:18 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14P8RRWE010414;
 Tue, 25 May 2021 08:44:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 38psk92ukj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 08:44:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14P8iGI530605612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 08:44:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 149C66A051;
 Tue, 25 May 2021 08:44:16 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7026D6A04D;
 Tue, 25 May 2021 08:44:12 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.69.234])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 08:44:12 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "A lneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v6 updated 9/11] mm/mremap: Fix race between mremap and
 pageout
In-Reply-To: <CAHk-=whtmtA0SC5pjoeJ5+nHeiroQen0bph1abMJyb6Ge1b_wQ@mail.gmail.com>
References: <20210524133818.84955-1-aneesh.kumar@linux.ibm.com>
 <CAHk-=whtmtA0SC5pjoeJ5+nHeiroQen0bph1abMJyb6Ge1b_wQ@mail.gmail.com>
Date: Tue, 25 May 2021 14:14:09 +0530
Message-ID: <87pmxf6w4m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nigwuyO_9yDuwnQg2ve-XwUdJFN1w_6t
X-Proofpoint-ORIG-GUID: QGAyXxJtck2pUhQMQtrBvxtbbEW7jPdQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_05:2021-05-24,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=905
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250059
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

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Mon, May 24, 2021 at 3:38 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Avoid the above race with MOVE_PMD by holding pte ptl in mremap and waiting for
>> parallel pagetable walk to finish operating on pte before updating new_pmd
>
> Ack on the concept.


Should we worry about the below race. The window would be small

CPU 1				CPU 2					CPU 3

mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one

mmap_write_lock_killable()

				addr = old_addr

lock(pmd_ptl)
pmd = *old_pmd
pmd_clear(old_pmd)
flush_tlb_range(old_addr)

lock(pte_ptl)
*new_pmd = pmd
unlock(pte_ptl)

unlock(pmd_ptl)
				lock(pte_ptl)
									*new_addr = 10; and fills
									TLB with new addr
									and old pfn

				ptep_clear_flush(old_addr)
				old pfn is free.
									Stale TLB entry



>
> However, not so much on the patch.
>
> Odd whitespace change:
>
>> @@ -254,6 +254,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>         if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
>>                 return false;
>>
>> +
>>         /*
>>          * We don't have to worry about the ordering of src and dst
>>          * ptlocks because exclusive mmap_lock prevents deadlock.
>
> And new optimization for empty pmd, which seems unrelated to the
> change and should presumably be separate:

That was added that we can safely do pte_lockptr() below

>
>> @@ -263,6 +264,10 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>         if (new_ptl != old_ptl)
>>                 spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>>
>> +       if (pmd_none(*old_pmd))
>> +               goto unlock_out;
>> +
>> +       pte_ptl = pte_lockptr(mm, old_pmd);
>>         /* Clear the pmd */
>>         pmd = *old_pmd;
>>         pmd_clear(old_pmd);
>
> And also, why does the above assign 'pte_ptl' without using it, when
> the actual use is ten lines further down?

So that we fetch the pte_ptl before we clear old_pmd. 


-aneesh
