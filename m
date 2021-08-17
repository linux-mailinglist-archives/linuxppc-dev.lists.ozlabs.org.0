Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94D3EEE64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:22:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GptXw4pVCz3cHn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 00:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5jwiLcy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C5jwiLcy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GptX65T5Mz306d
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 00:22:14 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17HE4TKN012069; Tue, 17 Aug 2021 10:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=n01CmTOwN0Cb1mdM9jFy7rQGYKyRhz3+pHJaNa8YVs4=;
 b=C5jwiLcyo+bKmK1hp9oQn7c2FXQJckD0ySEmG0DVkxS6yj01lV/x8Yrvymss3JQ/+PmS
 jUR6EwyU8UzWIk3hJls5E0AzFotEndXkYraQwvVwHd2VyU+TNiN0dOrQ7a6Q31OGGbkI
 jz2/k9aJGC7uO2orSYF/JamVe2J8k/7e09ywuXkWyymxSQoeCIfJEeloaBOW3rcZQcRj
 qefELUlWM26texyoh2sF8X6+idGT1GNsctHKz/CtEu+ywqNWvR64Rr6pjyimMVycQWhS
 LXUu1PvMk4DVVUoOzhWyXERsSLvSfrdaBmPhezVsvTS0rSvqv5kJ2TtB6mmUhZ/7RM7X Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetr7b6a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 10:22:03 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17HE5JAd015081;
 Tue, 17 Aug 2021 10:22:02 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetr7b69f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 10:22:02 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17HEI3rA011946;
 Tue, 17 Aug 2021 14:22:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3ae5fc9ds1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 14:22:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17HEM0Ev44040596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 14:22:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B104CAE05F;
 Tue, 17 Aug 2021 14:22:00 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB701AE05C;
 Tue, 17 Aug 2021 14:21:59 +0000 (GMT)
Received: from localhost (unknown [9.211.107.102])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Aug 2021 14:21:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Fix set_memory_*() against concurrent accesses
In-Reply-To: <20210817132552.3375738-1-mpe@ellerman.id.au>
References: <20210817132552.3375738-1-mpe@ellerman.id.au>
Date: Tue, 17 Aug 2021 11:21:56 -0300
Message-ID: <87sfz8tam3.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BGmtHnpAHNW6iz2jE7TYUH7syzT6jU3v
X-Proofpoint-ORIG-GUID: IIR09Qr-vNCTcFtiMJxCTq23FBgLY1s_
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_04:2021-08-17,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170086
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
Cc: lvivier@redhat.com, jniethe5@gmail.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

Hi, I already mentioned these things in private, but I'll post here so
everyone can see:

> Because pte_update() takes the set of PTE bits to set and clear we can't
> use our existing helpers, eg. pte_wrprotect() etc. and instead have to
> open code the set of flags. We will clean that up somehow in a future
> commit.

I tested the following on P9 and it seems to work fine. Not sure if it
works for CONFIG_PPC_8xx, though.


 static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 {
 	long action = (long)data;
 	pte_t pte;
 
 	spin_lock(&init_mm.page_table_lock);
-
-	/* invalidate the PTE so it's safe to modify */
-	pte = ptep_get_and_clear(&init_mm, addr, ptep);
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	pte = *ptep;
 
 	/* modify the PTE bits as desired, then apply */
 	switch (action) {
@@ -59,11 +42,9 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 		break;
 	}
 
-	set_pte_at(&init_mm, addr, ptep, pte);
+	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 
-	/* See ptesync comment in radix__set_pte_at() */
-	if (radix_enabled())
-		asm volatile("ptesync": : :"memory");
 	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;
---

For reference, the full patch is here:
https://github.com/farosas/linux/commit/923c95c84d7081d7be9503bf5b276dd93bd17036.patch

>
> [1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/
>
> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

...

> -	set_pte_at(&init_mm, addr, ptep, pte);
> +	pte_update(&init_mm, addr, ptep, clear, set, 0);
>  
>  	/* See ptesync comment in radix__set_pte_at() */
>  	if (radix_enabled())
>  		asm volatile("ptesync": : :"memory");
> +
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);

I think there's an optimization possible here, when relaxing access, to
skip the TLB flush. Would still need the ptesync though. Similar to what
Nick did in e5f7cb58c2b7 ("powerpc/64s/radix: do not flush TLB when
relaxing access"). It is out of scope for this patch but maybe worth
thinking about.

> +
>  	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
>
> base-commit: cbc06f051c524dcfe52ef0d1f30647828e226d30
