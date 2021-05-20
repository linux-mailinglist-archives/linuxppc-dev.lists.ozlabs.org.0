Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2A38B339
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmD9z14bBz3018
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 01:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZuMa1+FE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZuMa1+FE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmD9V1m83z2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 01:26:37 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KF4K1l169214; Thu, 20 May 2021 11:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0h7SIH0YpicBu8TJ6uWxSZ8sVVPtHkg3LhknVS84Ogs=;
 b=ZuMa1+FEb315892Y+iV7/KXBLWcU17dEBDd8ZakEHR4CllgLPaBDWS4+ilsy6gciFuV/
 JHFlyteWLuhm5Tn/m3LhKuvGVyRrH+4fy3szbY/WKTP4liePhdmOUIU/tUkmPLxnLCO5
 Hw4/HNjL2ikrmSRZRnWl0ijCt4twU8RGDtthR9HxOv3eozP4XspqGKillN4nP4SACkmf
 /Wzfyv2+ZuvWUfIRsvYY73/+HAdlsGOQhyOJeQ1Gq0nO7lnkU8IWwg1WpsfPdLse57td
 2FSc0dGpEUowIcHqRChE+cN/ol4Qwqmo9ZecxdwVwIeOvB/U4tvJTr+rvte6hUPsCpM+ Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nt1h0xcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 11:26:20 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14KF4UwK172913;
 Thu, 20 May 2021 11:26:19 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nt1h0xby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 11:26:19 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KF2gd9005495;
 Thu, 20 May 2021 15:26:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 38m19srvx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 15:26:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KFQE1312648798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 15:26:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 801F9A405F;
 Thu, 20 May 2021 15:26:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A32DA404D;
 Thu, 20 May 2021 15:26:13 +0000 (GMT)
Received: from [9.85.101.109] (unknown [9.85.101.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 15:26:12 +0000 (GMT)
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: linux-mm@kvack.org, akpm@linux-foundation.org
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
Date: Thu, 20 May 2021 20:56:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LOmGsye5-UYUcG1HZlTEM11dNI9EMeNM
X-Proofpoint-ORIG-GUID: yLYNBbnTKgl0QAWbSUevFAIdGJl5qDaJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200103
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
Cc: npiggin@gmail.com, kaleshsingh@google.com, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/22/21 11:13 AM, Aneesh Kumar K.V wrote:
> Move TLB flush outside page table lock so that kernel does
> less with page table lock held. Releasing the ptl with old
> TLB contents still valid will behave such that such access
> happened before the level3 or level2 entry update.
> 


Ok this break the page lifetime rule

commit: eb66ae030829 ("mremap: properly flush TLB before releasing the 
page")

I will respin dropping this change and add a comment around explaining 
why we need to do tlb flush before dropping ptl.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/mremap.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 109560977944..9effca76bf17 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -258,7 +258,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>   	 * We don't have to worry about the ordering of src and dst
>   	 * ptlocks because exclusive mmap_lock prevents deadlock.
>   	 */
> -	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
> +	old_ptl = pmd_lock(mm, old_pmd);
>   	new_ptl = pmd_lockptr(mm, new_pmd);
>   	if (new_ptl != old_ptl)
>   		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> @@ -270,11 +270,11 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>   	VM_BUG_ON(!pmd_none(*new_pmd));
>   	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
>   
> -	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
>   	if (new_ptl != old_ptl)
>   		spin_unlock(new_ptl);
>   	spin_unlock(old_ptl);
>   
> +	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
>   	return true;
>   }
>   #else
> @@ -305,7 +305,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>   	 * We don't have to worry about the ordering of src and dst
>   	 * ptlocks because exclusive mmap_lock prevents deadlock.
>   	 */
> -	old_ptl = pud_lock(vma->vm_mm, old_pud);
> +	old_ptl = pud_lock(mm, old_pud);
>   	new_ptl = pud_lockptr(mm, new_pud);
>   	if (new_ptl != old_ptl)
>   		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> @@ -317,11 +317,11 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>   	VM_BUG_ON(!pud_none(*new_pud));
>   
>   	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
> -	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE);
>   	if (new_ptl != old_ptl)
>   		spin_unlock(new_ptl);
>   	spin_unlock(old_ptl);
>   
> +	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE);
>   	return true;
>   }
>   #else
> 

