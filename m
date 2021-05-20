Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AD389FC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 10:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm2tG4Zh7z3brt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 18:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLwql3Xp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sLwql3Xp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm2sn3ftmz2xvK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 18:27:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K84J4E004573; Thu, 20 May 2021 04:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YX41XFWu+zMPNKf6mrGnpPlK/sRCym1SIXpEM84+Hsk=;
 b=sLwql3XpLLfoiFxH9g6Mn6xOGcQ01FnLw5+SB+wIG7uZr0/L2m4Ygcz3vLdvq38hzyYi
 IDjmvJCAc2xPgyQPeqrmz04AaDoe38MlAYymobIVvQqjnnBV0NTWqula9oLwKNs8rdQi
 KQrByn18H2CkA2VnKd8rtsRdk9/9i3mm3XrK67/ZLvvbi1MgGC2ETOQiSxYnRSddLwZE
 IZtu2kM4vDczWgRfzoop4iw9c9vzE/Iie2BwlxT0JmYZPk+wnYmisF/tNcrOyGPcwWBV
 68a7qjOewCXNX4ZSwBd6TWHZiKYiFwjy1VNWVgD0GcT+s7jbuHcGGJy94qSs6Z7daxMr Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nksgrwhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 04:27:02 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14K84OiI005266;
 Thu, 20 May 2021 04:27:02 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nksgrwgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 04:27:02 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14K8NEtN013466;
 Thu, 20 May 2021 08:26:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh1d0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 08:26:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14K8Qvom28311864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 08:26:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40B51A4040;
 Thu, 20 May 2021 08:26:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41B94A4057;
 Thu, 20 May 2021 08:26:55 +0000 (GMT)
Received: from [9.85.101.109] (unknown [9.85.101.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 08:26:55 +0000 (GMT)
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
To: Peter Xu <peterx@redhat.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain> <87mtsrqqk0.fsf@linux.ibm.com>
 <YKXHA8/HmP6HXngO@t490s>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
Date: Thu, 20 May 2021 13:56:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKXHA8/HmP6HXngO@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ppsnSJx0qftr1M4U6zU4uGqR3s2-kcSm
X-Proofpoint-ORIG-GUID: s1cYGwc5XAE62YHudVR4gHmSPkDQaQ0C
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_01:2021-05-20,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200060
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
Cc: npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/21 7:48 AM, Peter Xu wrote:
> On Wed, May 19, 2021 at 10:16:07AM +0530, Aneesh Kumar K.V wrote:
>>> On Thu, Apr 22, 2021 at 11:13:17AM +0530, Aneesh Kumar K.V wrote:
>>>> pmd/pud_populate is the right interface to be used to set the respective
>>>> page table entries. Some architectures like ppc64 do assume that set_pmd/pud_at
>>>> can only be used to set a hugepage PTE. Since we are not setting up a hugepage
>>>> PTE here, use the pmd/pud_populate interface.
> 
> [1]
> 
>> Can you try this change?
>>
>> modified   mm/mremap.c
>> @@ -279,7 +279,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>   	pmd_clear(old_pmd);
>>   
>>   	VM_BUG_ON(!pmd_none(*new_pmd));
>> -	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
>> +	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
>>   
>>   	if (new_ptl != old_ptl)
>>   		spin_unlock(new_ptl);
> 
> I reported this issue today somewhere else:
> 
> https://lore.kernel.org/linux-mm/YKVemB5DuSqLFmmz@t490s/
> 
> And came to this same line after the bisection.
> 
> This seems to work at least for my userfaultfd test on shmem, however I don't
> fully understand the commit message [1] on: How do we guarantee we're not
> moving a thp pte?
> 

move_page_tables() checks for pmd_trans_huge() and ends up calling 
move_huge_pmd if it is a THP entry.

-aneesh
