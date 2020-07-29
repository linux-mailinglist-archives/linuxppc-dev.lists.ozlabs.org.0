Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F98B232791
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 00:23:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH7P35K7RzDqtt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 08:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGyGK4TXjzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 01:32:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGyGJ3WQwz8tDK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 01:32:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGyGJ1NSCz9sRX; Thu, 30 Jul 2020 01:32:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGyGH2vnvz9sRN;
 Thu, 30 Jul 2020 01:32:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TF31AV134791; Wed, 29 Jul 2020 11:32:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw2khem4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:32:19 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TF3OwR137642;
 Wed, 29 Jul 2020 11:32:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw2khejk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:32:18 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TFVCi5012656;
 Wed, 29 Jul 2020 15:32:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4n7cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 15:32:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TFWDYI47448300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 15:32:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96A4A52052;
 Wed, 29 Jul 2020 15:32:13 +0000 (GMT)
Received: from pomme.local (unknown [9.145.147.213])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3EB805204E;
 Wed, 29 Jul 2020 15:32:13 +0000 (GMT)
Subject: Re: [PATCH v2] pseries/drmem: don't cache node id in drmem_lmb struct
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20200728165339.3031126-1-cheloha@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Message-ID: <424d34c1-fd13-b810-583a-53356d1b868b@linux.vnet.ibm.com>
Date: Wed, 29 Jul 2020 17:32:13 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728165339.3031126-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_10:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290103
X-Mailman-Approved-At: Thu, 30 Jul 2020 08:22:32 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Le 28/07/2020 à 18:53, Scott Cheloha a écrit :
> At memory hot-remove time we can retrieve an LMB's nid from its
> corresponding memory_block.  There is no need to store the nid
> in multiple locations.
> 
> Note that lmb_to_memblock() uses find_memory_block() to get the
> corresponding memory_block.  As find_memory_block() runs in sub-linear
> time this approach is negligibly slower than what we do at present.
> 
> In exchange for this lookup at hot-remove time we no longer need to
> call memory_add_physaddr_to_nid() during drmem_init() for each LMB.
> On powerpc, memory_add_physaddr_to_nid() is a linear search, so this
> spares us an O(n^2) initialization during boot.
> 
> On systems with many LMBs that initialization overhead is palpable and
> disruptive.  For example, on a box with 249854 LMBs we're seeing
> drmem_init() take upwards of 30 seconds to complete:
> 
> [   53.721639] drmem: initializing drmem v2
> [   80.604346] watchdog: BUG: soft lockup - CPU#65 stuck for 23s! [swapper/0:1]
> [   80.604377] Modules linked in:
> [   80.604389] CPU: 65 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #4
> [   80.604397] NIP:  c0000000000a4980 LR: c0000000000a4940 CTR: 0000000000000000
> [   80.604407] REGS: c0002dbff8493830 TRAP: 0901   Not tainted  (5.6.0-rc2+)
> [   80.604412] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000248  XER: 0000000d
> [   80.604431] CFAR: c0000000000a4a38 IRQMASK: 0
> [   80.604431] GPR00: c0000000000a4940 c0002dbff8493ac0 c000000001904400 c0003cfffffede30
> [   80.604431] GPR04: 0000000000000000 c000000000f4095a 000000000000002f 0000000010000000
> [   80.604431] GPR08: c0000bf7ecdb7fb8 c0000bf7ecc2d3c8 0000000000000008 c00c0002fdfb2001
> [   80.604431] GPR12: 0000000000000000 c00000001e8ec200
> [   80.604477] NIP [c0000000000a4980] hot_add_scn_to_nid+0xa0/0x3e0
> [   80.604486] LR [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0
> [   80.604492] Call Trace:
> [   80.604498] [c0002dbff8493ac0] [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0 (unreliable)
> [   80.604509] [c0002dbff8493b20] [c000000000087c10] memory_add_physaddr_to_nid+0x20/0x60
> [   80.604521] [c0002dbff8493b40] [c0000000010d4880] drmem_init+0x25c/0x2f0
> [   80.604530] [c0002dbff8493c10] [c000000000010154] do_one_initcall+0x64/0x2c0
> [   80.604540] [c0002dbff8493ce0] [c0000000010c4aa0] kernel_init_freeable+0x2d8/0x3a0
> [   80.604550] [c0002dbff8493db0] [c000000000010824] kernel_init+0x2c/0x148
> [   80.604560] [c0002dbff8493e20] [c00000000000b648] ret_from_kernel_thread+0x5c/0x74
> [   80.604567] Instruction dump:
> [   80.604574] 392918e8 e9490000 e90a000a e92a0000 80ea000c 1d080018 3908ffe8 7d094214
> [   80.604586] 7fa94040 419d00dc e9490010 714a0088 <2faa0008> 409e00ac e9490000 7fbe5040
> [   89.047390] drmem: 249854 LMB(s)
> 
> With a patched kernel on the same machine we're no longer seeing the
> soft lockup.  drmem_init() now completes in negligible time, even when
> the LMB count is large.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/drmem.h              | 21 -------------------
>   arch/powerpc/mm/drmem.c                       |  6 +-----
>   .../platforms/pseries/hotplug-memory.c        | 19 ++++++++++-------
>   3 files changed, 13 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 414d209f45bb..34e4e9b257f5 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -13,9 +13,6 @@ struct drmem_lmb {
>   	u32     drc_index;
>   	u32     aa_index;
>   	u32     flags;
> -#ifdef CONFIG_MEMORY_HOTPLUG
> -	int	nid;
> -#endif
>   };
> 
>   struct drmem_lmb_info {
> @@ -104,22 +101,4 @@ static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
>   	lmb->aa_index = 0xffffffff;
>   }
> 
> -#ifdef CONFIG_MEMORY_HOTPLUG
> -static inline void lmb_set_nid(struct drmem_lmb *lmb)
> -{
> -	lmb->nid = memory_add_physaddr_to_nid(lmb->base_addr);
> -}
> -static inline void lmb_clear_nid(struct drmem_lmb *lmb)
> -{
> -	lmb->nid = -1;
> -}
> -#else
> -static inline void lmb_set_nid(struct drmem_lmb *lmb)
> -{
> -}
> -static inline void lmb_clear_nid(struct drmem_lmb *lmb)
> -{
> -}
> -#endif
> -
>   #endif /* _ASM_POWERPC_LMB_H */
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index 59327cefbc6a..873fcfc7b875 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -362,10 +362,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
>   	if (!drmem_info->lmbs)
>   		return;
> 
> -	for_each_drmem_lmb(lmb) {
> +	for_each_drmem_lmb(lmb)
>   		read_drconf_v1_cell(lmb, &prop);
> -		lmb_set_nid(lmb);
> -	}
>   }
> 
>   static void __init init_drmem_v2_lmbs(const __be32 *prop)
> @@ -410,8 +408,6 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
> 
>   			lmb->aa_index = dr_cell.aa_index;
>   			lmb->flags = dr_cell.flags;
> -
> -			lmb_set_nid(lmb);
>   		}
>   	}
>   }
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 5ace2f9a277e..7bf66fdcf916 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -356,25 +356,29 @@ static int dlpar_add_lmb(struct drmem_lmb *);
> 
>   static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>   {
> +	struct memory_block *mem_block;
>   	unsigned long block_sz;
>   	int rc;
> 
>   	if (!lmb_is_removable(lmb))
>   		return -EINVAL;
> 
> +	mem_block = lmb_to_memblock(lmb);
> +	if (mem_block == NULL)
> +		return -EINVAL;
> +

lmb_to_memblock is 'getting' the memblock's device, so you should call 
put_device(mem_block->device) to reverse that operation.

Something like:

--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -367,7 +367,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)

  	rc = dlpar_offline_lmb(lmb);
  	if (rc)
-		return rc;
+		goto out;

  	block_sz = pseries_memory_block_size();

@@ -379,7 +379,9 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
  	invalidate_lmb_associativity_index(lmb);
  	lmb->flags &= ~DRCONF_MEM_ASSIGNED;

-	return 0;
+out:
+	put_device(&mem_block->dev);
+	return rc;
  }

  static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)



>   	rc = dlpar_offline_lmb(lmb);
>   	if (rc)
>   		return rc;
> 
>   	block_sz = pseries_memory_block_size();
> 
> -	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
> +	__remove_memory(mem_block->nid, lmb->base_addr, block_sz);
> 
>   	/* Update memory regions for memory remove */
>   	memblock_remove(lmb->base_addr, block_sz);
> 
>   	invalidate_lmb_associativity_index(lmb);
> -	lmb_clear_nid(lmb);
>   	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> 
>   	return 0;
> @@ -631,7 +635,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   {
>   	unsigned long block_sz;
> -	int rc;
> +	int nid, rc;
> 
>   	if (lmb->flags & DRCONF_MEM_ASSIGNED)
>   		return -EINVAL;
> @@ -642,11 +646,13 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   		return rc;
>   	}
> 
> -	lmb_set_nid(lmb);
>   	block_sz = memory_block_size_bytes();
> 
> +	/* Find the node id for this address. */
> +	nid = memory_add_physaddr_to_nid(lmb->base_addr);

This function is calling hot_add_drconf_scn_to_nid() which is walking all the 
LMBs linearly, so we may spend a lot of time here.

I think it be nice to take some breath in the caller's loop in 
dlpar_memory_add_by_count() to avoid soft lockup to be raised there when adding 
a large number of LMBs, isn't it?

Nathan sent a patch to add such a breath in for_each_drmem_lmb_in_range() may be 
it would be nice to add one in dlpar_memory_add_by_count() through that patch.

> +
>   	/* Add the memory */
> -	rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
> +	rc = __add_memory(nid, lmb->base_addr, block_sz);
>   	if (rc) {
>   		invalidate_lmb_associativity_index(lmb);
>   		return rc;
> @@ -654,9 +660,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> 
>   	rc = dlpar_online_lmb(lmb);
>   	if (rc) {
> -		__remove_memory(lmb->nid, lmb->base_addr, block_sz);
> +		__remove_memory(nid, lmb->base_addr, block_sz);
>   		invalidate_lmb_associativity_index(lmb);
> -		lmb_clear_nid(lmb);
>   	} else {
>   		lmb->flags |= DRCONF_MEM_ASSIGNED;
>   	}
> 

