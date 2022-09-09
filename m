Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA95B3C67
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 17:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLBT5yBJz3bkb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 01:53:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OhgNZ53e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OhgNZ53e;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPL9j5d67z3bST
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 01:52:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289Fbkha007028;
	Fri, 9 Sep 2022 15:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gSLBzyKhtDUleDi+2zZbofxAWJWV3pJKKJGx8hz+Wxw=;
 b=OhgNZ53eIuRBD3pTshFdpD72B+MppcLrF4IufO74pnOCqOdOlFH6sKp3F0GQ+xbk3mnW
 vKEyCE7ulzQDyBCJKUt55QLatOCA2++IJCZbJkX5Hd9R8Z+bOu8HroPgIHcql6wv3Qkx
 2+VcITPTUAfNeFRmWRwUTH22LlV9GdmAt5ESWk5Pqo8isb95r203Qrsc6Yj6Y08rUUIr
 JLnLKklcnc/SGkP1N8pQJtgahkh1oSxhD6m0SXDR5GsRShz+EY1TTyi0QrBC7JF0gGeV
 w5semVuMEmpYXqbrOIoQUjixT116EBOtLc3Ea6wY+RnyaLsWHkfWfsKWE7tb19MdNX0S +w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg5expa6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 15:52:38 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289FcSiF015996;
	Fri, 9 Sep 2022 15:52:37 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg5expa59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 15:52:37 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289FptTB006264;
	Fri, 9 Sep 2022 15:52:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3jbxj8x2ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 15:52:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289FqVwo38666666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 15:52:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A07D142045;
	Fri,  9 Sep 2022 15:52:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9260642041;
	Fri,  9 Sep 2022 15:52:30 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 15:52:30 +0000 (GMT)
Message-ID: <3faf8347-5062-4d8d-0360-c23ac5c525b3@linux.ibm.com>
Date: Fri, 9 Sep 2022 17:52:30 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 10/28] mm/mmap: mark VMAs as locked in
 vma_adjust
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-11-surenb@google.com>
 <bb5e3ab8-9c47-7d01-cdaa-1b4231312f67@linux.ibm.com>
 <CAJuCfpFm8irJyhzn-22QR+_4BmU+yDZM97T4S8pPKotxZUmjBg@mail.gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <CAJuCfpFm8irJyhzn-22QR+_4BmU+yDZM97T4S8pPKotxZUmjBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QU2aFChMZ9AW1ufXcuAp-eIscAqw7cgU
X-Proofpoint-GUID: v12foQNTuLemdBTiVpKKMlysJUowRIJ3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209090054
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 09/09/2022 à 02:51, Suren Baghdasaryan a écrit :
> On Tue, Sep 6, 2022 at 8:35 AM Laurent Dufour <ldufour@linux.ibm.com> wrote:
>>
>> Le 01/09/2022 à 19:34, Suren Baghdasaryan a écrit :
>>> vma_adjust modifies a VMA and possibly its neighbors. Mark them as locked
>>> before making the modifications.
>>>
>>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>>> ---
>>>  mm/mmap.c | 11 ++++++++++-
>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index f89c9b058105..ed58cf0689b2 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>>> @@ -710,6 +710,10 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
>>>       long adjust_next = 0;
>>>       int remove_next = 0;
>>>
>>> +     vma_mark_locked(vma);
>>> +     if (next)
>>> +             vma_mark_locked(next);
>>> +
>>
>> I was wondering if the VMAs insert and expand should be locked too.
>>
>> For expand, I can't see any valid reason, but for insert, I'm puzzled.
>> I would think that it is better to lock the VMA to be inserted but I can't
>> really justify that.
>>
>> It may be nice to detail why this is not need to lock insert and expand here.
> 
> 'expand' is always locked before it's passed to __vma_adjust() by
> vma_merge(). It has to be locked before we decide "Can it merge with
> the predecessor?" here
> https://elixir.bootlin.com/linux/latest/source/mm/mmap.c#L1201 because
> a change in VMA can affect that decision. I spent many hours tracking
> the issue caused by not locking the VMA before making this decision.
> It might be good to add a comment about this...
> 
> AFAIKT 'insert' is only used by __split_vma() and it's always a brand
> new VMA which is not yet linked into mm->mmap. Any reason
> __vma_adjust() should lock it?

No, I think that's good this way.

> 
>>
>>>       if (next && !insert) {
>>>               struct vm_area_struct *exporter = NULL, *importer = NULL;
>>>
>>> @@ -754,8 +758,11 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
>>>                        * If next doesn't have anon_vma, import from vma after
>>>                        * next, if the vma overlaps with it.
>>>                        */
>>> -                     if (remove_next == 2 && !next->anon_vma)
>>> +                     if (remove_next == 2 && !next->anon_vma) {
>>>                               exporter = next->vm_next;
>>> +                             if (exporter)
>>> +                                     vma_mark_locked(exporter);
>>> +                     }
>>>
>>>               } else if (end > next->vm_start) {
>>>                       /*
>>> @@ -931,6 +938,8 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
>>>                        * "vma->vm_next" gap must be updated.
>>>                        */
>>>                       next = vma->vm_next;
>>> +                     if (next)
>>> +                             vma_mark_locked(next);
>>>               } else {
>>>                       /*
>>>                        * For the scope of the comment "next" and
>>
>> --
>> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>>

