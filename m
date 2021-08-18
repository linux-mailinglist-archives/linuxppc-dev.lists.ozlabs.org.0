Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B93F06B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 16:30:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqVg91h5qz3cWL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 00:30:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gsgk19ZL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Gsgk19ZL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqVfM6mmPz2yNq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 00:29:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IE37jK193324; Wed, 18 Aug 2021 10:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : reply-to : from : message-id : date : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=Eok6nfABs/GW4LwJnSOnJIQQ3BoJhQppHM4vzw95H84=;
 b=Gsgk19ZLdzkW7zmnowB0ChsSWDNt4R3thZ6KBMRXxBkV616ID30etdDPGXxvfAxw0Kdm
 B80Ah2JYnnI412h+gVd9BzbjBRv4WGtx/vNODC/rfS6JaIb4731eFa/P8BxUxOB5vABd
 SijTKB8KPekFW+KJ/ziOqQrYHv2/+LgqcUilMYUC1EhGXo/TOBBmxoB3Klx0QgMtou5d
 tBOWHrUVShNWCH9dgANZatWge0/cn4v6vTczrw1Y8f37MjDGdDZnywcOX3AwPnTLd+s0
 sWW3SHU1+CUg1Cvjb8uOHlDafATEc5iE87tX+cXiJl+WxFXy8SxOCDg/4WTsflkROfG0 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ag7bsxk6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 10:29:40 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17IE39Ti193532;
 Wed, 18 Aug 2021 10:29:40 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ag7bsxk6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 10:29:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IECwSY018562;
 Wed, 18 Aug 2021 14:29:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3ae5fdrvb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 14:29:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IETciB41288174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 14:29:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5268D78064;
 Wed, 18 Aug 2021 14:29:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DE1578063;
 Wed, 18 Aug 2021 14:29:36 +0000 (GMT)
Received: from kermit.br.ibm.com (unknown [9.65.249.77])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Aug 2021 14:29:35 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/mm: Fix set_memory_*() against concurrent
 accesses
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210818120518.3603172-1-mpe@ellerman.id.au>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
Message-ID: <cec2bc79-9b51-83a9-8ad7-5e2939094e02@linux.ibm.com>
Date: Wed, 18 Aug 2021 11:29:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210818120518.3603172-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8B8ix0NlAz8LtO_ur6mF4CSGHrjai-AY
X-Proofpoint-GUID: p9nYzqksE946O0A4dRl_D4IAgoGYHnLR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_04:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108180089
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
Reply-To: muriloo@linux.ibm.com
Cc: lvivier@redhat.com, jniethe5@gmail.com, aneesh.kumar@linux.ibm.com,
 npiggin@gmail.com, farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/18/21 9:05 AM, Michael Ellerman wrote:
> Laurent reported that STRICT_MODULE_RWX was causing intermittent crashes
> on one of his systems:
> 
>    kernel tried to execute exec-protected page (c008000004073278) - exploit attempt? (uid: 0)
>    BUG: Unable to handle kernel instruction fetch
>    Faulting instruction address: 0xc008000004073278
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>    Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks ...
>    CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
>    Workqueue: events control_work_handler [virtio_console]
>    NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
>    REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
>    MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822 XER: 200400cf
>    ...
>    NIP fill_queue+0xf0/0x210 [virtio_console]
>    LR  fill_queue+0xf0/0x210 [virtio_console]
>    Call Trace:
>      fill_queue+0xb4/0x210 [virtio_console] (unreliable)
>      add_port+0x1a8/0x470 [virtio_console]
>      control_work_handler+0xbc/0x1e8 [virtio_console]
>      process_one_work+0x290/0x590
>      worker_thread+0x88/0x620
>      kthread+0x194/0x1a0
>      ret_from_kernel_thread+0x5c/0x64
> 
> Jordan, Fabiano & Murilo were able to reproduce and identify that the
> problem is caused by the call to module_enable_ro() in do_init_module(),
> which happens after the module's init function has already been called.
> 
> Our current implementation of change_page_attr() is not safe against
> concurrent accesses, because it invalidates the PTE before flushing the
> TLB and then installing the new PTE. That leaves a window in time where
> there is no valid PTE for the page, if another CPU tries to access the
> page at that time we see something like the fault above.
> 
> We can't simply switch to set_pte_at()/flush TLB, because our hash MMU
> code doesn't handle a set_pte_at() of a valid PTE. See [1].
> 
> But we do have pte_update(), which replaces the old PTE with the new,
> meaning there's no window where the PTE is invalid. And the hash MMU
> version hash__pte_update() deals with synchronising the hash page table
> correctly.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/
> 
> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Murilo Opsfelder Araújo <muriloo@linux.ibm.com>

> ---
>   arch/powerpc/mm/pageattr.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> v2: Use pte_update(..., ~0, pte_val(pte), ...) as suggested by Fabiano,
>      and ptep_get() as suggested by Christophe.
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 0876216ceee6..edea388e9d3f 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -18,16 +18,12 @@
>   /*
>    * Updates the attributes of a page in three steps:
>    *
> - * 1. invalidate the page table entry
> - * 2. flush the TLB
> - * 3. install the new entry with the updated attributes
> - *
> - * Invalidating the pte means there are situations where this will not work
> - * when in theory it should.
> - * For example:
> - * - removing write from page whilst it is being executed
> - * - setting a page read-only whilst it is being read by another CPU
> + * 1. take the page_table_lock
> + * 2. install the new entry with the updated attributes
> + * 3. flush the TLB
>    *
> + * This sequence is safe against concurrent updates, and also allows updating the
> + * attributes of a page currently being executed or accessed.
>    */
>   static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   {
> @@ -36,9 +32,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   
>   	spin_lock(&init_mm.page_table_lock);
>   
> -	/* invalidate the PTE so it's safe to modify */
> -	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	pte = ptep_get(ptep);
>   
>   	/* modify the PTE bits as desired, then apply */
>   	switch (action) {
> @@ -59,11 +53,14 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   		break;
>   	}
>   
> -	set_pte_at(&init_mm, addr, ptep, pte);
> +	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);
>   
>   	/* See ptesync comment in radix__set_pte_at() */
>   	if (radix_enabled())
>   		asm volatile("ptesync": : :"memory");
> +
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
>   	spin_unlock(&init_mm.page_table_lock);
>   
>   	return 0;
> 
> base-commit: cbc06f051c524dcfe52ef0d1f30647828e226d30
> 


-- 
Murilo
