Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C81861B4CBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 20:36:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496pzk02zrzDqs1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 04:36:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496pxK6FGHzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 04:34:13 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MIWnnj022893; Wed, 22 Apr 2020 14:34:05 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmvjecjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:34:05 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03MIUNlF018251;
 Wed, 22 Apr 2020 18:34:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 30fs66kgra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 18:34:04 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03MIY37Z27918638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 18:34:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62507136059;
 Wed, 22 Apr 2020 18:34:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A6AF13604F;
 Wed, 22 Apr 2020 18:34:01 +0000 (GMT)
Received: from Harens-MacBook-Pro.local (unknown [9.160.75.2])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Apr 2020 18:34:01 +0000 (GMT)
Subject: Re: linux-next: build failure after merge of the akpm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20200422163935.5aa93ba5@canb.auug.org.au>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <abc8fced-8f7a-4dfc-b426-4a0f0ea30ec7@linux.ibm.com>
Date: Wed, 22 Apr 2020 11:33:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422163935.5aa93ba5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_06:2020-04-22,
 2020-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004220135
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Thanks for fixing. Tested with this patch and 7fe021a3f1c9 ("kernel: better document the use_mm/unuse_mm API contract"). 

Acked-by: Haren Myneni <haren@linux.ibm.com>

On 4/21/20 11:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/powernv/vas-fault.c: In function 'update_csb':
> arch/powerpc/platforms/powernv/vas-fault.c:130:2: error: implicit declaration of function 'use_mm' [-Werror=implicit-function-declaration]
>   130 |  use_mm(window->mm);
>       |  ^~~~~~
> arch/powerpc/platforms/powernv/vas-fault.c:142:2: error: implicit declaration of function 'unuse_mm' [-Werror=implicit-function-declaration]
>   142 |  unuse_mm(window->mm);
>       |  ^~~~~~~~
> 
> Caused by commit
> 
>   7fe021a3f1c9 ("kernel: better document the use_mm/unuse_mm API contract")
> 
> interacting with commit
> 
>   c96c4436aba4 ("powerpc/vas: Update CSB and notify process for fault CRBs")
> 
> from the powerpc tree.
> 
> I added the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 22 Apr 2020 16:35:23 +1000
> Subject: [PATCH] powerpc/vas: fix up for {un}use_mm() rename
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> index 25db70be4c9c..266a6ca5e15e 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -127,7 +127,7 @@ static void update_csb(struct vas_window *window,
>  		return;
>  	}
>  
> -	use_mm(window->mm);
> +	kthread_use_mm(window->mm);
>  	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
>  	/*
>  	 * User space polls on csb.flags (first byte). So add barrier
> @@ -139,7 +139,7 @@ static void update_csb(struct vas_window *window,
>  		smp_mb();
>  		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
>  	}
> -	unuse_mm(window->mm);
> +	kthread_unuse_mm(window->mm);
>  	put_task_struct(tsk);
>  
>  	/* Success */
> 
