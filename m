Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5A16880C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 21:04:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PMqY4ZwPzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 07:04:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PMnG4BgZzDqkD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 07:02:26 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LJsPjZ140298; Fri, 21 Feb 2020 15:02:21 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubyss58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 15:02:21 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01LJtWPp142574;
 Fri, 21 Feb 2020 15:02:21 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubyss4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 15:02:20 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LK13bq014430;
 Fri, 21 Feb 2020 20:02:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 2y6897fjvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 20:02:19 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LK2I5E30736660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 20:02:18 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 703CB6A051;
 Fri, 21 Feb 2020 20:02:18 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55CE46A04D;
 Fri, 21 Feb 2020 20:02:18 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 20:02:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/drmem: accelerate
 memory_add_physaddr_to_nid() with LMB xarray
In-Reply-To: <20200221172901.1596249-2-cheloha@linux.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <20200221172901.1596249-2-cheloha@linux.ibm.com>
Date: Fri, 21 Feb 2020 14:02:18 -0600
Message-ID: <87r1ynso8l.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_07:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=1 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002210151
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
Cc: Nathan Fontenont <ndfont@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Michal Suchanek <msuchanek@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Scott Cheloha <cheloha@linux.ibm.com> writes:
> On PowerPC, memory_add_physaddr_to_nid() uses a linear search to find
> an LMB matching the given address.  This scales very poorly when there
> are many LMBs.  The poor scaling cripples drmem_init() during boot:
> lmb_set_nid(), which calls memory_add_physaddr_to_nid(), is called for
> each LMB.
>
> If we index each LMB in an xarray by its base address we can achieve
> O(log n) search during memory_add_physaddr_to_nid(), which scales much
> better.

Is O(log n) correct? I had thought lookup complexity depends on the
characteristics of the key.

Repeating some points from my comments on v1 below.


> +static int drmem_cache_lmb_for_lookup(struct drmem_lmb *lmb)

This is called only from __init functions, so it should be __init as well.

> +{
> +	void *ret;
> +
> +	ret = xa_store(&drmem_lmb_xa_base_addr, lmb->base_addr, lmb,
> +		       GFP_KERNEL);
> +	if (xa_is_err(ret))
> +		return xa_err(ret);
> +
> +	return 0;
> +}

[...]

> @@ -364,6 +383,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
>  
>  	for_each_drmem_lmb(lmb) {
>  		read_drconf_v1_cell(lmb, &prop);
> +		if (drmem_cache_lmb_for_lookup(lmb) != 0)
> +			return;
>  		lmb_set_nid(lmb);
>  	}
>  }
> @@ -411,6 +432,9 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
>  			lmb->aa_index = dr_cell.aa_index;
>  			lmb->flags = dr_cell.flags;
>  
> +			if (drmem_cache_lmb_for_lookup(lmb) != 0)
> +				return;
> +

Failing to record an lmb in the cache shouldn't be cause for silently
aborting this initialization. Future lookups against the caches (should
the system even boot) may fail, but the drmem_lmbs will still be
initialized correctly.

I'd say just ignore (or perhaps log once) xa_store() failures as long as
this code only runs at boot.


> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 3c7dec70cda0..0fd7963a991e 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -958,27 +958,18 @@ early_param("topology_updates", early_topology_updates);
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
> -
> -		if ((scn_addr < lmb->base_addr)
> -		    || (scn_addr >= (lmb->base_addr + lmb_size)))
> -			continue;
>  
> -		nid = of_drconf_to_nid_single(lmb);
> -		break;
> -	}
> +	lmb = drmem_find_lmb_by_base_addr(scn_addr);

It occurs to me that the old behavior here will succeed in looking up a
drmem_lmb if scn_addr is within it, while the new behavior is that the
given address must match the starting address of the drmem_lmb. I think
this is probably OK though?


> +	if (lmb == NULL)
> +		return NUMA_NO_NODE;
> +	
> +	/* can't use this block if it is reserved or not assigned to
> +	 * this partition */
> +	if ((lmb->flags & DRCONF_MEM_RESERVED)
> +	    || !(lmb->flags & DRCONF_MEM_ASSIGNED))
> +		return NUMA_NO_NODE;
>  
> -	return nid;
> +	return of_drconf_to_nid_single(lmb);
>  }

Otherwise I have no concerns about the changes to
hot_add_drconf_scn_to_nid.

Other than the minor points I've made here, this looks like a tidy
self-contained change to fix drmem initialization latency.
