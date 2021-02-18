Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579731EA1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 14:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhFF22jssz3cJp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 00:00:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O2I/EiTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O2I/EiTQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhFD85SKpz30MP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 23:59:51 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11ICXDAW021066; Thu, 18 Feb 2021 07:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=v+T4dp1ovGoJGWReuDO7bXfe7brYHaMZpOcuA/LiUzc=;
 b=O2I/EiTQKbd4xaIybCglbugZtjH3Jgz1UpNtc+BrtNTk81KUS6V58oALukOF74DSj0FJ
 q+A42tNHw+XWOpXiuAJbAEeZPKNoI0G0c8CkdQPKO5bD2/yEvGreX7GlKBAWio6Q5vdS
 XF/CjWN8DPZpqgctDLKnsgwyRT9KpzlQmK3CceKS0T37cRcOKIjI39ctpCJ1Y7HMpXB/
 hZac9sug3Wf2vzTAV5ODrXnD1AZYd8j6lXl3rnmT/zEYqDfbCj2Ob7nthskfLa8WjopT
 t1AN7OgDWlOEl4m9AsSdzVXSt8djpp44oSVsTiEG/oIaDr/KBUdpxK/jnnGQUQZ7y3Av NA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sqpkj46t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 07:59:48 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11ICw6N0027581;
 Thu, 18 Feb 2021 12:59:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 36p6d8jdkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 12:59:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11ICxWnJ38011220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 12:59:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 397844C04A;
 Thu, 18 Feb 2021 12:59:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 103D14C044;
 Thu, 18 Feb 2021 12:59:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.183.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Feb 2021 12:59:43 +0000 (GMT)
Subject: Re: [PATCH kernel] powerpc/iommu: Annotate nested lock for lockdep
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20210216032000.21642-1-aik@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <49b1f5cb-107c-296f-c339-13e627a73d6d@linux.ibm.com>
Date: Thu, 18 Feb 2021 13:59:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216032000.21642-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_05:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180110
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/02/2021 04:20, Alexey Kardashevskiy wrote:
> The IOMMU table is divided into pools for concurrent mappings and each
> pool has a separate spinlock. When taking the ownership of an IOMMU group
> to pass through a device to a VM, we lock these spinlocks which triggers
> a false negative warning in lockdep (below).
> 
> This fixes it by annotating the large pool's spinlock as a nest lock.
> 
> ===
> WARNING: possible recursive locking detected
> 5.11.0-le_syzkaller_a+fstn1 #100 Not tainted
> --------------------------------------------
> qemu-system-ppc/4129 is trying to acquire lock:
> c0000000119bddb0 (&(p->lock)/1){....}-{2:2}, at: iommu_take_ownership+0xac/0x1e0
> 
> but task is already holding lock:
> c0000000119bdd30 (&(p->lock)/1){....}-{2:2}, at: iommu_take_ownership+0xac/0x1e0
> 
> other info that might help us debug this:
>   Possible unsafe locking scenario:
> 
>         CPU0
>         ----
>    lock(&(p->lock)/1);
>    lock(&(p->lock)/1);
> ===
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   arch/powerpc/kernel/iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 557a09dd5b2f..2ee642a6731a 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1089,7 +1089,7 @@ int iommu_take_ownership(struct iommu_table *tbl)
>   
>   	spin_lock_irqsave(&tbl->large_pool.lock, flags);
>   	for (i = 0; i < tbl->nr_pools; i++)
> -		spin_lock(&tbl->pools[i].lock);
> +		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);


We have the same pattern and therefore should have the same problem in 
iommu_release_ownership().

But as I understand, we're hacking our way around lockdep here, since 
conceptually, those locks are independent. I was wondering why it seems 
to fix it by worrying only about the large pool lock. That loop can take 
many locks (up to 4 with current config). However, if the dma window is 
less than 1GB, we would only have one, so it would make sense for 
lockdep to stop complaining. Is it what happened? In which case, this 
patch doesn't really fix it. Or I'm missing something :-)

   Fred



>   	iommu_table_release_pages(tbl);
>   
> 
