Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D81323AA7F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 18:31:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BL3KX6190zDqRp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 02:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BL3HV20xqzDqCb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 02:29:09 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 073G6LBi162827; Mon, 3 Aug 2020 12:29:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pkeuna1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 12:29:04 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 073GOtbs026075;
 Mon, 3 Aug 2020 12:29:03 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pkeuna1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 12:29:03 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073GQxca021419;
 Mon, 3 Aug 2020 16:29:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 32mynh2cvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 16:29:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 073GSwVx22741438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 16:28:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F303AE055;
 Mon,  3 Aug 2020 16:28:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17263AE058;
 Mon,  3 Aug 2020 16:28:58 +0000 (GMT)
Received: from pomme.local (unknown [9.145.48.251])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 16:28:58 +0000 (GMT)
Subject: Re: [PATCHv4 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
 <1596116005-27511-2-git-send-email-kernelfans@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <951e4406-1172-09a3-a8db-6f0a92aea2ed@linux.ibm.com>
Date: Mon, 3 Aug 2020 18:28:57 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596116005-27511-2-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_14:2020-08-03,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030117
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>, kexec@lists.infradead.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 30/07/2020 à 15:33, Pingfan Liu a écrit :
> A bug is observed on pseries by taking the following steps on rhel:
> -1. drmgr -c mem -r -q 5
> -2. echo c > /proc/sysrq-trigger
> 
> And then, the failure looks like:
> kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
> kdump: saving vmcore-dmesg.txt
> kdump: saving vmcore-dmesg.txt complete
> kdump: saving vmcore
>   Checking for memory holes                         : [  0.0 %] /                   Checking for memory holes                         : [100.0 %] |                   Excluding unnecessary pages                       : [100.0 %] \                   Copying data                                      : [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing failure ! EA=0x7fffba400000 access=0x8000000000000004 current=makedumpfile
> [   44.337663] hash-mmu:     trap=0x300 vsid=0x13a109c ssize=1 base psize=2 psize 2 pte=0xc000000050000504
> [   44.337677] hash-mmu: mm: Hashing failure ! EA=0x7fffba400000 access=0x8000000000000004 current=makedumpfile
> [   44.337692] hash-mmu:     trap=0x300 vsid=0x13a109c ssize=1 base psize=2 psize 2 pte=0xc000000050000504
> [   44.337708] makedumpfile[469]: unhandled signal 7 at 00007fffba400000 nip 00007fffbbc4d7fc lr 000000011356ca3c code 2
> [   44.338548] Core dump to |/bin/false pipe failed
> /lib/kdump-lib-initramfs.sh: line 98:   469 Bus error               $CORE_COLLECTOR /proc/vmcore $_mp/$KDUMP_PATH/$HOST_IP-$DATEDIR/vmcore-incomplete
> kdump: saving vmcore failed
> 
> * Root cause *
>    After analyzing, it turns out that in the current implementation,
> when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt updating as
> the code __remove_memory() comes before drmem_update_dt().
> So in kdump kernel, when read_from_oldmem() resorts to
> pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due to
> non-exist pfn. And finally, low_hash_fault() raise SIGBUS to process, as it
> can be observed "Bus error"
> 
>  From a viewpoint of listener and publisher, the publisher notifies the
> listener before data is ready.  This introduces a problem where udev
> launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt before
> updating. And in capture kernel, makedumpfile will access the memory based
> on the stale dt info, and hit a SIGBUS error due to an un-existed lmb.
> 
> * Fix *
> This bug is introduced by commit 063b8b1251fd
> ("powerpc/pseries/memory-hotplug: Only update DT once per memory DLPAR
> request"), which tried to combine all the dt updating into one.
> 
> To fix this issue, meanwhile not to introduce a quadratic runtime
> complexity by the model:
>    dlpar_memory_add_by_count
>      for_each_drmem_lmb             <--
>        dlpar_add_lmb
>          drmem_update_dt(_v1|_v2)
>            for_each_drmem_lmb       <--
> The dt should still be only updated once, and just before the last memory
> online/offline event is ejected to user space. Achieve this by tracing the
> num of lmb added or removed.
> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org
> ---
> v3 -> v4: resolve a quadratic runtime complexity issue.
>            This series is applied on next-test branch
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 88 ++++++++++++++++++-------
>   1 file changed, 66 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 1a3ac3b..e07d5b1 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -350,13 +350,13 @@ static bool lmb_is_removable(struct drmem_lmb *lmb)
>   	return true;
>   }
>   
> -static int dlpar_add_lmb(struct drmem_lmb *);
> +static int dlpar_add_lmb(struct drmem_lmb *lmb, bool dt_update);
>   
> -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> +static int dlpar_remove_lmb(struct drmem_lmb *lmb, bool dt_update)
>   {
>   	unsigned long block_sz;
>   	phys_addr_t base_addr;
> -	int rc, nid;
> +	int rc, ret, nid;
>   
>   	if (!lmb_is_removable(lmb))
>   		return -EINVAL;
> @@ -372,6 +372,11 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>   	invalidate_lmb_associativity_index(lmb);
>   	lmb_clear_nid(lmb);
>   	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> +	if (dt_update) {
> +		ret = drmem_update_dt();
> +		if (ret)
> +			pr_warn("%s fail to update dt, but continue\n", __func__);
> +	}
>   
>   	__remove_memory(nid, base_addr, block_sz);
>   
> @@ -387,6 +392,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   	int lmbs_removed = 0;
>   	int lmbs_available = 0;
>   	int rc;
> +	bool dt_update = false;
>   
>   	pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
>   
> @@ -409,7 +415,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   	}
>   
>   	for_each_drmem_lmb(lmb) {
> -		rc = dlpar_remove_lmb(lmb);
> +		rc = dlpar_remove_lmb(lmb, dt_update);
>   		if (rc)
>   			continue;
>   
> @@ -421,16 +427,27 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   		lmbs_removed++;
>   		if (lmbs_removed == lmbs_to_remove)
>   			break;
> +		/* combine dt updating */
> +		else if (lmbs_removed == lmbs_to_remove - 1)
> +			dt_update = true;
>   	}
>   
>   	if (lmbs_removed != lmbs_to_remove) {
> +		bool rollback_dt_update = false;
> +
>   		pr_err("Memory hot-remove failed, adding LMB's back\n");
>   
>   		for_each_drmem_lmb(lmb) {
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
>   
> -			rc = dlpar_add_lmb(lmb);
> +			/*
> +			 * Even if dlpar_remove_lmb() fails to update dt, it is
> +			 * harmless to update dt here.
> +			 */
> +			if (--lmbs_removed == 0 && dt_update)
> +				rollback_dt_update = true;
> +			rc = dlpar_add_lmb(lmb, rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to add LMB back, drc index %x\n",
>   				       lmb->drc_index);
> @@ -468,7 +485,7 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
>   	for_each_drmem_lmb(lmb) {
>   		if (lmb->drc_index == drc_index) {
>   			lmb_found = 1;
> -			rc = dlpar_remove_lmb(lmb);
> +			rc = dlpar_remove_lmb(lmb, true);
>   			if (!rc)
>   				dlpar_release_drc(lmb->drc_index);
>   
> @@ -493,6 +510,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
>   	int lmbs_available = 0;
>   	int rc;
> +	bool dt_update = false;
>   
>   	pr_info("Attempting to hot-remove %u LMB(s) at %x\n",
>   		lmbs_to_remove, drc_index);
> @@ -519,7 +537,9 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>   			continue;
>   
> -		rc = dlpar_remove_lmb(lmb);
> +		if (lmb == end_lmb)
> +			dt_update = true;
> +		rc = dlpar_remove_lmb(lmb, dt_update);
>   		if (rc)
>   			break;
>   
> @@ -527,14 +547,17 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   	}
>   
>   	if (rc) {
> -		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
> +		bool rollback_dt_update = false;
>   
> +		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
>   
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
> -
> -			rc = dlpar_add_lmb(lmb);
> +			/* Since in removing path, dt is only updated if lmb == end_lmb */
> +			if (lmb == end_lmb)
> +				rollback_dt_update = true;
> +			rc = dlpar_add_lmb(lmb, rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to add LMB, drc index %x\n",
>   				       lmb->drc_index);
> @@ -572,7 +595,7 @@ static inline int dlpar_memory_remove(struct pseries_hp_errorlog *hp_elog)
>   {
>   	return -EOPNOTSUPP;
>   }
> -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> +static int dlpar_remove_lmb(struct drmem_lmb *lmb, bool dt_update)
>   {
>   	return -EOPNOTSUPP;
>   }
> @@ -591,10 +614,10 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   }
>   #endif /* CONFIG_MEMORY_HOTREMOVE */
>   
> -static int dlpar_add_lmb(struct drmem_lmb *lmb)
> +static int dlpar_add_lmb(struct drmem_lmb *lmb, bool dt_update)
>   {
>   	unsigned long block_sz;
> -	int rc;
> +	int rc, ret;
>   
>   	if (lmb->flags & DRCONF_MEM_ASSIGNED)
>   		return -EINVAL;
> @@ -607,6 +630,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   
>   	lmb_set_nid(lmb);
>   	lmb->flags |= DRCONF_MEM_ASSIGNED;
> +	if (dt_update) {
> +		ret = drmem_update_dt();
> +		if (ret)
> +			pr_warn("%s fail to update dt, but continue\n", __func__);
> +	}
>   
>   	block_sz = memory_block_size_bytes();

In the case the call to __add_memory is failing, the flag DRCONF_MEM_ASSIGNED 
should be cleared as I mentioned in your previous patch. In addition to this, 
the DT should be updated, or the caller should manage that but that will be hard 
since it doesn't know where the error happened in this function.

>   
> @@ -625,7 +653,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   		invalidate_lmb_associativity_index(lmb);
>   		lmb_clear_nid(lmb);
>   		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> -
> +		if (dt_update) {
> +			ret = drmem_update_dt();
> +			if (ret)
> +				pr_warn("%s fail to update dt during rollback, but continue\n", __func__);
> +		}
>   		__remove_memory(nid, base_addr, block_sz);
>   	}
>   
> @@ -638,6 +670,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   	int lmbs_available = 0;
>   	int lmbs_added = 0;
>   	int rc;
> +	bool dt_update = false;
>   
>   	pr_info("Attempting to hot-add %d LMB(s)\n", lmbs_to_add);
>   
> @@ -664,7 +697,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   		if (rc)
>   			continue;
>   
> -		rc = dlpar_add_lmb(lmb);
> +		rc = dlpar_add_lmb(lmb, dt_update);
>   		if (rc) {
>   			dlpar_release_drc(lmb->drc_index);
>   			continue;
> @@ -678,16 +711,23 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   		lmbs_added++;
>   		if (lmbs_added == lmbs_to_add)
>   			break;
> +		else if (lmbs_added == lmbs_to_add - 1)
> +			dt_update = true;

In the case the number of LMB to add is 1, dt_update is never set to true, and 
the device tree is never updated. You need to set dt_update to true earlier in 
the loop block.

>   	}
>   
>   	if (lmbs_added != lmbs_to_add) {
> +		bool rollback_dt_update = false;
> +
>   		pr_err("Memory hot-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb(lmb) {
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
>   
> -			rc = dlpar_remove_lmb(lmb);
> +			if (--lmbs_added == 0 && dt_update)
> +				rollback_dt_update = true;

That test may have to be review to deal with error during the last LMB addition, 
the DT may have been updated before __add_memory() is failing in 
dlpar_add_lmb(). In that case, lmbs_added == 0 and that branch is not covered. 
That's not an issue if dlpar_add_lmb() is handling that case (see my comment above).

> +
> +			rc = dlpar_remove_lmb(lmb, rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to remove LMB, drc index %x\n",
>   				       lmb->drc_index);
> @@ -725,7 +765,7 @@ static int dlpar_memory_add_by_index(u32 drc_index)
>   			lmb_found = 1;
>   			rc = dlpar_acquire_drc(lmb->drc_index);
>   			if (!rc) {
> -				rc = dlpar_add_lmb(lmb);
> +				rc = dlpar_add_lmb(lmb, true);
>   				if (rc)
>   					dlpar_release_drc(lmb->drc_index);
>   			}
> @@ -751,6 +791,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
>   	int lmbs_available = 0;
>   	int rc;
> +	bool dt_update = false;
>   
>   	pr_info("Attempting to hot-add %u LMB(s) at index %x\n",
>   		lmbs_to_add, drc_index);
> @@ -781,7 +822,9 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   		if (rc)
>   			break;
>   
> -		rc = dlpar_add_lmb(lmb);
> +		if (lmb == end_lmb)
> +			dt_update = true;
> +		rc = dlpar_add_lmb(lmb, dt_update);
>   		if (rc) {
>   			dlpar_release_drc(lmb->drc_index);
>   			break;
> @@ -794,10 +837,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> +			bool rollback_dt_update = false;
> +
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
>   
> -			rc = dlpar_remove_lmb(lmb);
> +			if (lmb == end_lmb)
> +				rollback_dt_update = true;
> +			rc = dlpar_remove_lmb(lmb, rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to remove LMB, drc index %x\n",
>   				       lmb->drc_index);
> @@ -877,9 +924,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
>   		break;
>   	}
>   
> -	if (!rc)
> -		rc = drmem_update_dt();
> -
>   	unlock_device_hotplug();
>   	return rc;
>   }
> 

