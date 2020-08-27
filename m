Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A5254065
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:12:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcb7M6dr7zDqbC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:12:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NsaiHtkv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZjm55RFzDqfV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:53:48 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R7WTkh133270; Thu, 27 Aug 2020 03:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=21eBlCN8elTy3z+u3mCdf/1DbaJzVEMbTsqAxNvuJSw=;
 b=NsaiHtkvuEpE7FJWm0gj9pWzfxwCyLSeQuCtCQL6ABcARJF5BxMfgQrRvCLYtld/1Th1
 M+baSee+JgYrgkj3WAyAGaO3eyIvWz+D2aAeKPLTERbB0xnuSGfb9Wfg2/uu/N8gpPtF
 9Znik7IUg2M//X7BrNioJq0c+hOPQ1KPOSPzhdNDjaro1fea86M8UN9Fxf5TI12z6hTU
 J4tU9UFSaH+BzN+GyFvKHs/AjoPlMwLmy8diO5mdxVD9Wk7kXfuGMQrT3d6f8nRSGkoT
 jlssa10LBqe22A15ATzaMvJdFtiFD/JVczko07KWqMh9PG9+g3Jl3RbCWj9AA57m2nGb fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3366qjbnvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 03:53:39 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07R7WWDc133581;
 Thu, 27 Aug 2020 03:53:39 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3366qjbnup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 03:53:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R7qlSK032531;
 Thu, 27 Aug 2020 07:53:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 332uk6ddys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 07:53:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R7rXA627263334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 07:53:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C36245204F;
 Thu, 27 Aug 2020 07:53:33 +0000 (GMT)
Received: from pomme.local (unknown [9.145.76.83])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 719535204E;
 Thu, 27 Aug 2020 07:53:33 +0000 (GMT)
Subject: Re: [PATCHv5 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
 <1597049570-19536-2-git-send-email-kernelfans@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <17369122-3e37-1360-0f68-827a8104cd35@linux.ibm.com>
Date: Thu, 27 Aug 2020 09:53:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597049570-19536-2-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270053
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kexec@lists.infradead.org,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 10/08/2020 à 10:52, Pingfan Liu a écrit :
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
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> ---
> v4 -> v5: change dlpar_add_lmb()/dlpar_remove_lmb() prototype to report
>            whether dt is updated successfully.
>            Fix a condition boundary check bug
> v3 -> v4: resolve a quadratic runtime complexity issue.
>            This series is applied on next-test branch
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 102 +++++++++++++++++++-----
>   1 file changed, 80 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 46cbcd1..1567d9f 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -350,13 +350,22 @@ static bool lmb_is_removable(struct drmem_lmb *lmb)
>   	return true;
>   }
>   
> -static int dlpar_add_lmb(struct drmem_lmb *);
> +enum dt_update_status {
> +	DT_NOUPDATE,
> +	DT_TOUPDATE,
> +	DT_UPDATED,
> +};
> +
> +/* "*dt_update" returns DT_UPDATED if updated */
> +static int dlpar_add_lmb(struct drmem_lmb *lmb,
> +		enum dt_update_status *dt_update);
>   
> -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> +static int dlpar_remove_lmb(struct drmem_lmb *lmb,
> +		enum dt_update_status *dt_update)
>   {
>   	unsigned long block_sz;
>   	phys_addr_t base_addr;
> -	int rc, nid;
> +	int rc, ret, nid;
>   
>   	if (!lmb_is_removable(lmb))
>   		return -EINVAL;
> @@ -372,6 +381,13 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>   	invalidate_lmb_associativity_index(lmb);
>   	lmb_clear_nid(lmb);
>   	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> +	if (*dt_update) {

That test is wrong, you should do:
         if (*dt_update && *dt_update == DT_TOUPDATE) {

With the current code, the device tree is updated all the time.

Another option would be to pass a valid pointer (!= NULL) only when DT update is 
required, this way you don't need the DT_TOUPDATE value. The caller would have 
to set the pointer accordingly. The advantage with this option is the caller is 
guaranteed that its variable is not touched by the callee when no device tree is 
requested. A simple boolean pointer would be enough without the need to this enum.


> +		ret = drmem_update_dt();
> +		if (ret)
> +			pr_warn("%s fail to update dt, but continue\n", __func__);
> +		else
> +			*dt_update = DT_UPDATED;
> +	}
>   
>   	__remove_memory(nid, base_addr, block_sz);
>   
> @@ -387,6 +403,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   	int lmbs_removed = 0;
>   	int lmbs_available = 0;
>   	int rc;
> +	enum dt_update_status dt_update = DT_NOUPDATE;
>   
>   	pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
>   
> @@ -409,7 +426,11 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   	}
>   
>   	for_each_drmem_lmb(lmb) {
> -		rc = dlpar_remove_lmb(lmb);
> +
> +		/* combine dt updating for all LMBs */
> +		if (lmbs_to_remove - lmbs_removed <= 1)
> +			dt_update = DT_TOUPDATE;
> +		rc = dlpar_remove_lmb(lmb, &dt_update);
>   		if (rc)
>   			continue;
>   
> @@ -424,13 +445,17 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   	}
>   
>   	if (lmbs_removed != lmbs_to_remove) {
> +		enum dt_update_status rollback_dt_update = DT_NOUPDATE;
> +
>   		pr_err("Memory hot-remove failed, adding LMB's back\n");
>   
>   		for_each_drmem_lmb(lmb) {
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
>   
> -			rc = dlpar_add_lmb(lmb);
> +			if (--lmbs_removed == 0 && dt_update == DT_UPDATED)
> +				rollback_dt_update = DT_TOUPDATE;
> +			rc = dlpar_add_lmb(lmb, &rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to add LMB back, drc index %x\n",
>   				       lmb->drc_index);
> @@ -458,6 +483,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   
>   static int dlpar_memory_remove_by_index(u32 drc_index)
>   {
> +	enum dt_update_status dt_update = DT_TOUPDATE;
>   	struct drmem_lmb *lmb;
>   	int lmb_found;
>   	int rc;
> @@ -468,7 +494,7 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
>   	for_each_drmem_lmb(lmb) {
>   		if (lmb->drc_index == drc_index) {
>   			lmb_found = 1;
> -			rc = dlpar_remove_lmb(lmb);
> +			rc = dlpar_remove_lmb(lmb, &dt_update);
>   			if (!rc)
>   				dlpar_release_drc(lmb->drc_index);
>   
> @@ -490,6 +516,7 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
>   
>   static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   {
> +	enum dt_update_status dt_update = DT_NOUPDATE;
>   	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
>   	int lmbs_available = 0;
>   	int rc;
> @@ -519,7 +546,9 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>   			continue;
>   
> -		rc = dlpar_remove_lmb(lmb);
> +		if (lmb == end_lmb)
> +			dt_update = DT_TOUPDATE;
> +		rc = dlpar_remove_lmb(lmb, &dt_update);
>   		if (rc)
>   			break;
>   
> @@ -527,14 +556,16 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   	}
>   
>   	if (rc) {
> -		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
> +		enum dt_update_status rollback_dt_update = DT_NOUPDATE;
>   
> +		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
>   
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
> -
> -			rc = dlpar_add_lmb(lmb);
> +			if (lmb == end_lmb && dt_update == DT_UPDATED)
> +				rollback_dt_update = DT_TOUPDATE;
> +			rc = dlpar_add_lmb(lmb, &rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to add LMB, drc index %x\n",
>   				       lmb->drc_index);
> @@ -572,7 +603,7 @@ static inline int dlpar_memory_remove(struct pseries_hp_errorlog *hp_elog)
>   {
>   	return -EOPNOTSUPP;
>   }
> -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> +static int dlpar_remove_lmb(struct drmem_lmb *lmb, bool dt_update)
>   {
>   	return -EOPNOTSUPP;
>   }
> @@ -591,10 +622,11 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   }
>   #endif /* CONFIG_MEMORY_HOTREMOVE */
>   
> -static int dlpar_add_lmb(struct drmem_lmb *lmb)
> +static int dlpar_add_lmb(struct drmem_lmb *lmb,
> +		enum dt_update_status *dt_update)
>   {
>   	unsigned long block_sz;
> -	int rc;
> +	int rc, ret;
>   
>   	if (lmb->flags & DRCONF_MEM_ASSIGNED)
>   		return -EINVAL;
> @@ -607,6 +639,13 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   
>   	lmb_set_nid(lmb);
>   	lmb->flags |= DRCONF_MEM_ASSIGNED;
> +	if (*dt_update) {
> +		ret = drmem_update_dt();
> +		if (ret)
> +			pr_warn("%s fail to update dt, but continue\n", __func__);
> +		else
> +			*dt_update = DT_UPDATED;
> +	}
>   
>   	block_sz = memory_block_size_bytes();
>   
> @@ -616,6 +655,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   		invalidate_lmb_associativity_index(lmb);
>   		lmb_clear_nid(lmb);
>   		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> +		if (*dt_update == DT_UPDATED)
> +			drmem_update_dt();
>   		return rc;
>   	}
>   
> @@ -627,7 +668,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   		invalidate_lmb_associativity_index(lmb);
>   		lmb_clear_nid(lmb);
>   		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> -
> +		if (*dt_update == DT_UPDATED) {
> +			ret = drmem_update_dt();
> +			if (ret)
> +				pr_warn("%s fail to update dt during rollback, but continue\n", __func__);
> +		}
>   		__remove_memory(nid, base_addr, block_sz);
>   	}
>   
> @@ -636,6 +681,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   
>   static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   {
> +	enum dt_update_status dt_update = DT_NOUPDATE;
>   	struct drmem_lmb *lmb;
>   	int lmbs_available = 0;
>   	int lmbs_added = 0;
> @@ -666,7 +712,9 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   		if (rc)
>   			continue;
>   
> -		rc = dlpar_add_lmb(lmb);
> +		if (lmbs_to_add - lmbs_added <= 1)
> +			dt_update = DT_TOUPDATE;
> +		rc = dlpar_add_lmb(lmb, &dt_update);
>   		if (rc) {
>   			dlpar_release_drc(lmb->drc_index);
>   			continue;
> @@ -683,13 +731,18 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   	}
>   
>   	if (lmbs_added != lmbs_to_add) {
> +		enum dt_update_status rollback_dt_update = DT_NOUPDATE;
> +
>   		pr_err("Memory hot-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb(lmb) {
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
>   
> -			rc = dlpar_remove_lmb(lmb);
> +			if (--lmbs_added == 0 && dt_update == DT_UPDATED)
> +				rollback_dt_update = DT_TOUPDATE;
> +
> +			rc = dlpar_remove_lmb(lmb, &rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to remove LMB, drc index %x\n",
>   				       lmb->drc_index);
> @@ -716,6 +769,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   
>   static int dlpar_memory_add_by_index(u32 drc_index)
>   {
> +	enum dt_update_status dt_update = DT_TOUPDATE;
>   	struct drmem_lmb *lmb;
>   	int rc, lmb_found;
>   
> @@ -727,7 +781,7 @@ static int dlpar_memory_add_by_index(u32 drc_index)
>   			lmb_found = 1;
>   			rc = dlpar_acquire_drc(lmb->drc_index);
>   			if (!rc) {
> -				rc = dlpar_add_lmb(lmb);
> +				rc = dlpar_add_lmb(lmb, &dt_update);
>   				if (rc)
>   					dlpar_release_drc(lmb->drc_index);
>   			}
> @@ -750,6 +804,7 @@ static int dlpar_memory_add_by_index(u32 drc_index)
>   
>   static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   {
> +	enum dt_update_status dt_update = DT_NOUPDATE;
>   	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
>   	int lmbs_available = 0;
>   	int rc;
> @@ -783,7 +838,9 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   		if (rc)
>   			break;
>   
> -		rc = dlpar_add_lmb(lmb);
> +		if (lmb == end_lmb)
> +			dt_update = DT_TOUPDATE;
> +		rc = dlpar_add_lmb(lmb, &dt_update);
>   		if (rc) {
>   			dlpar_release_drc(lmb->drc_index);
>   			break;
> @@ -796,10 +853,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> +			enum dt_update_status rollback_dt_update = DT_NOUPDATE;
> +
>   			if (!drmem_lmb_reserved(lmb))
>   				continue;
>   
> -			rc = dlpar_remove_lmb(lmb);
> +			if (lmb == end_lmb && dt_update == DT_UPDATED)
> +				rollback_dt_update = DT_TOUPDATE;
> +			rc = dlpar_remove_lmb(lmb, &rollback_dt_update);
>   			if (rc)
>   				pr_err("Failed to remove LMB, drc index %x\n",
>   				       lmb->drc_index);
> @@ -879,9 +940,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
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

