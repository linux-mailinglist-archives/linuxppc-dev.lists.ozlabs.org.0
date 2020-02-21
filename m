Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A45F016863B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 19:17:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PKS52jhczDqnM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 05:17:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PKKT1Q4bzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 05:11:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LI4prY069425; Fri, 21 Feb 2020 13:11:35 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ya6e6uxxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 13:11:35 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01LI4uZS069932;
 Fri, 21 Feb 2020 13:11:35 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ya6e6uxxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 13:11:34 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LIAALs014932;
 Fri, 21 Feb 2020 18:11:34 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2y6897vqax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 18:11:34 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LIBXkJ11403976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 18:11:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D810B2066;
 Fri, 21 Feb 2020 18:11:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17D34B2064;
 Fri, 21 Feb 2020 18:11:33 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 18:11:32 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
In-Reply-To: <20200128221113.17158-1-cheloha@linux.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
Date: Fri, 21 Feb 2020 12:11:32 -0600
Message-ID: <8736b3u7xn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_06:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210138
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
Cc: Nathan Fontenont <ndfont@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott, I've owed you a follow-up on this for a couple weeks, sorry.

Beyond the issue of whether to remove the drmem_info->lmbs array, there
are some other things to address.

Scott Cheloha <cheloha@linux.ibm.com> writes:
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 3d76e1c388c2..a37cbe794cdd 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -88,6 +88,9 @@ static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
>  	return lmb->flags & DRMEM_LMB_RESERVED;
>  }
>  
> +struct drmem_lmb *drmem_find_lmb_by_base_addr(unsigned long);
> +struct drmem_lmb *drmem_find_lmb_by_drc_index(unsigned long);

Need identifiers for the function arguments here. checkpatch warns about
this. Also drc_index conventionally is handled as u32 in this code.


> +struct drmem_lmb *drmem_find_lmb_by_base_addr(unsigned long base_addr)
> +{
> +	return xa_load(&drmem_lmb_base_addr, base_addr);
> +}
> +
> +struct drmem_lmb *drmem_find_lmb_by_drc_index(unsigned long drc_index)
> +{
> +	return xa_load(&drmem_lmb_drc_index, drc_index);
> +}
> +
> +static int drmem_lmb_cache_for_lookup(struct drmem_lmb *lmb)

This is called only from __init functions, so it should be __init as well.


> +{
> +	void *ret;
> +
> +	ret = xa_store(&drmem_lmb_base_addr, lmb->base_addr, lmb,  GFP_KERNEL);
> +	if (xa_err(ret))
> +		return xa_err(ret);
> +
> +	ret = xa_store(&drmem_lmb_drc_index, lmb->drc_index, lmb, GFP_KERNEL);
> +	if (xa_err(ret))
> +		return xa_err(ret);
> +
> +	return 0;
> +}
> +
>  static u32 drmem_lmb_flags(struct drmem_lmb *lmb)
>  {
>  	/*
> @@ -364,6 +392,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
>  
>  	for_each_drmem_lmb(lmb) {
>  		read_drconf_v1_cell(lmb, &prop);
> +		if (drmem_lmb_cache_for_lookup(lmb) != 0)
> +			return;
>  		lmb_set_nid(lmb);
>  	}

Failing to record an lmb in the caches shouldn't be cause for silently
aborting this initialization. Future lookups against the caches (should
the system even boot) may fail, but the drmem_lmbs will still be
initialized correctly.

I'd say just ignore (or perhaps log once) xa_store() failures as long as
this code only runs at boot.


> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 50d68d21ddcc..23684d44549f 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -958,27 +958,21 @@ early_param("topology_updates", early_topology_updates);
>  static int hot_add_drconf_scn_to_nid(unsigned long scn_addr)
>  {
>  	struct drmem_lmb *lmb;
> -	unsigned long lmb_size;
> -	int nid = NUMA_NO_NODE;
> -
> -	lmb_size = drmem_lmb_size();
> -
> -	for_each_drmem_lmb(lmb) {
> -		/* skip this block if it is reserved or not assigned to
> -		 * this partition */
> -		if ((lmb->flags & DRCONF_MEM_RESERVED)
> -		    || !(lmb->flags & DRCONF_MEM_ASSIGNED))
> -			continue;
>  
> -		if ((scn_addr < lmb->base_addr)
> -		    || (scn_addr >= (lmb->base_addr + lmb_size)))
> -			continue;
> +	lmb = drmem_find_lmb_by_base_addr(scn_addr);
> +	if (lmb == NULL)
> +		return NUMA_NO_NODE;
>  
> -		nid = of_drconf_to_nid_single(lmb);
> -		break;
> -	}
> +	/*
> +	 * We can't use it if it is reserved or not assigned to
> +	 * this partition.
> +	 */
> +	if (lmb->flags & DRCONF_MEM_RESERVED)
> +		return NUMA_NO_NODE;
> +	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
> +		return NUMA_NO_NODE;
>  
> -	return nid;
> +	return of_drconf_to_nid_single(lmb);
>  }
>  
>  /*
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index c126b94d1943..29bd19831a9a 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -222,17 +222,10 @@ static int get_lmb_range(u32 drc_index, int n_lmbs,
>  			 struct drmem_lmb **start_lmb,
>  			 struct drmem_lmb **end_lmb)
>  {
> -	struct drmem_lmb *lmb, *start, *end;
> +	struct drmem_lmb *start, *end;
>  	struct drmem_lmb *last_lmb;
>  
> -	start = NULL;
> -	for_each_drmem_lmb(lmb) {
> -		if (lmb->drc_index == drc_index) {
> -			start = lmb;
> -			break;
> -		}
> -	}
> -
> +	start = drmem_find_lmb_by_drc_index(drc_index);
>  	if (!start)
>  		return -EINVAL;

The changes to hot_add_drconf_scn_to_nid() and get_lmb_range() look
correct to me.
