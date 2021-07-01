Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E03B8EED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 10:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFs5p1MRBz3bms
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 18:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Efj1KZiA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Efj1KZiA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFs5L2D7Zz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 18:36:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1618WsgW056559; Thu, 1 Jul 2021 04:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m3lF4Ui3NyRYpA3M3VM1hXVtkH1lNerbjQa7e9yqn50=;
 b=Efj1KZiAULNC/OfYRyfS6v53JGw8sN91a9HNztdsTlfUGtGEi1roSd3rolsxCRR1b2CH
 oo2qiVWdjPchgMEfx6DxdVgxNAeUfqTE/SffQ6e+EvpnsltD9SHkDOgPZhgUFvDe6q/h
 kXHkEWOssxJUs6inXXInBFI7aO7BinNIutu/CXSLdBzDpz09PfMEF1a36StkCuoYCcIE
 zv7tHJyRjyb3jE+vCH71XPx9Tm9WW8M6KQZpCzq8WmgbZdf0PMlG20p+GI4ceay9UXqP
 hod6NDRa5wZbOolDJG7+nIykSy2caPRAIDUMRKrIvJ1aIGGhPmiLepnkS7LD2h1PMbW2 wA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h83av32n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 04:36:45 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1618Vb08020468;
 Thu, 1 Jul 2021 08:36:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 39duv8h6ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 08:36:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1618aeBP29491464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 08:36:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01525520D9;
 Thu,  1 Jul 2021 08:36:40 +0000 (GMT)
Received: from pomme.local (unknown [9.145.32.224])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B6CFC52098;
 Thu,  1 Jul 2021 08:36:39 +0000 (GMT)
Subject: Re: [PATCH v5] pseries/drmem: update LMBs after LPM
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
References: <20210517090606.56930-1-ldufour@linux.ibm.com>
Message-ID: <ef67e0e4-178b-5f4c-910a-a844aad2e5e4@linux.ibm.com>
Date: Thu, 1 Jul 2021 10:36:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210517090606.56930-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bfbnWGmc6aMihfYEdGEzokiB3kHEr0f7
X-Proofpoint-ORIG-GUID: bfbnWGmc6aMihfYEdGEzokiB3kHEr0f7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_06:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010058
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
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Do you mind taking this patch of 5.14?

Thanks,
Laurent.

Le 17/05/2021 à 11:06, Laurent Dufour a écrit :
> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
> updated by the hypervisor in the case the NUMA topology of the LPAR's
> memory is updated.
> 
> This is handled by the kernel, but the memory's node is not updated because
> there is no way to move a memory block between nodes from the Linux kernel
> point of view.
> 
> If later a memory block is added or removed, drmem_update_dt() is called
> and it is overwriting the DT node ibm,dynamic-reconfiguration-memory to
> match the added or removed LMB. But the LMB's associativity node has not
> been updated after the DT node update and thus the node is overwritten by
> the Linux's topology instead of the hypervisor one.
> 
> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
> updated to force an update of the LMB's associativity. However, ignore the
> call to that hook when the update has been triggered by drmem_update_dt().
> Because, in that case, the LMB tree has been used to set the DT property
> and thus it doesn't need to be updated back. Since drmem_update_dt() is
> called under the protection of the device_hotplug_lock and the hook is
> called in the same context, use a simple boolean variable to detect that
> call.
> 
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
> 
> V5:
>   - Reword the commit's description to address Nathan's comments.
> V4:
>   - Prevent the LMB to be updated back in the case the request came from the
>   LMB tree's update.
> V3:
>   - Check rd->dn->name instead of rd->dn->full_name
> V2:
>   - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
>   introducing a new hook mechanism.
> ---
>   arch/powerpc/include/asm/drmem.h              |  1 +
>   arch/powerpc/mm/drmem.c                       | 46 +++++++++++++++++++
>   .../platforms/pseries/hotplug-memory.c        |  4 ++
>   3 files changed, 51 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index bf2402fed3e0..4265d5e95c2c 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>   int __init
>   walk_drmem_lmbs_early(unsigned long node, void *data,
>   		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
> +void drmem_update_lmbs(struct property *prop);
>   #endif
>   
>   static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index 9af3832c9d8d..22197b18d85e 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -18,6 +18,7 @@ static int n_root_addr_cells, n_root_size_cells;
>   
>   static struct drmem_lmb_info __drmem_info;
>   struct drmem_lmb_info *drmem_info = &__drmem_info;
> +static bool in_drmem_update;
>   
>   u64 drmem_lmb_memory_max(void)
>   {
> @@ -178,6 +179,11 @@ int drmem_update_dt(void)
>   	if (!memory)
>   		return -1;
>   
> +	/*
> +	 * Set in_drmem_update to prevent the notifier callback to process the
> +	 * DT property back since the change is coming from the LMB tree.
> +	 */
> +	in_drmem_update = true;
>   	prop = of_find_property(memory, "ibm,dynamic-memory", NULL);
>   	if (prop) {
>   		rc = drmem_update_dt_v1(memory, prop);
> @@ -186,6 +192,7 @@ int drmem_update_dt(void)
>   		if (prop)
>   			rc = drmem_update_dt_v2(memory, prop);
>   	}
> +	in_drmem_update = false;
>   
>   	of_node_put(memory);
>   	return rc;
> @@ -307,6 +314,45 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
>   	return ret;
>   }
>   
> +/*
> + * Update the LMB associativity index.
> + */
> +static int update_lmb(struct drmem_lmb *updated_lmb,
> +		      __maybe_unused const __be32 **usm,
> +		      __maybe_unused void *data)
> +{
> +	struct drmem_lmb *lmb;
> +
> +	for_each_drmem_lmb(lmb) {
> +		if (lmb->drc_index != updated_lmb->drc_index)
> +			continue;
> +
> +		lmb->aa_index = updated_lmb->aa_index;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * Update the LMB associativity index.
> + *
> + * This needs to be called when the hypervisor is updating the
> + * dynamic-reconfiguration-memory node property.
> + */
> +void drmem_update_lmbs(struct property *prop)
> +{
> +	/*
> +	 * Don't update the LMBs if triggered by the update done in
> +	 * drmem_update_dt(), the LMB values have been used to the update the DT
> +	 * property in that case.
> +	 */
> +	if (in_drmem_update)
> +		return;
> +	if (!strcmp(prop->name, "ibm,dynamic-memory"))
> +		__walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
> +	else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
> +		__walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
> +}
>   #endif
>   
>   static int init_drmem_lmb_size(struct device_node *dn)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 8377f1f7c78e..672ffbee2e78 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct notifier_block *nb,
>   	case OF_RECONFIG_DETACH_NODE:
>   		err = pseries_remove_mem_node(rd->dn);
>   		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		if (!strcmp(rd->dn->name,
> +			    "ibm,dynamic-reconfiguration-memory"))
> +			drmem_update_lmbs(rd->prop);
>   	}
>   	return notifier_from_errno(err);
>   }
> 

