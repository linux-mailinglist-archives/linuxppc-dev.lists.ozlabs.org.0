Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B23610D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLm9y1y6kz3byY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:12:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hyc5y4Ad;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Hyc5y4Ad; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLm9W4pj2z2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:12:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FH5reN093584; Thu, 15 Apr 2021 13:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=tI4JiFu4FyQykYXsyYqSOMJDF5gPW5FPlJ7iuj83CP8=;
 b=Hyc5y4AdnBhhmuvhyLIiZkRRxMHX4wwQ2Ny+Zn9XbTsJTyBMkE15sqkfeO/LZBQKFlvz
 7Qru85qIpj0+KqGQhRGWCrtY1vagEUwcVlkS2ymWzY7uFHXdsq6Hq5l+C1RXlHNcd4+Y
 3aHSzS4xrxueQDwmSROJslRwoyB6vslS6qBDhvQoOOE6X57ybGDTNhUiAE3H0VuoSMXx
 lG15AT2c7xwszeOL2U0H8nwVaxTwGNPqzSbd0HxT9lf89CDt2dxF+if2pcBf8EOvdxHk
 PiE/Ij63M0yNDhVEZ8/p+a7Knxd1EesH3s9lZW7u6bXWHGXoD3PU2xTvUoMG1XDkl9RK kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x5aprwmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:11:53 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FH693B095207;
 Thu, 15 Apr 2021 13:11:53 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x5aprwmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:11:53 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FHB1ZX020112;
 Thu, 15 Apr 2021 17:11:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 37uhcn7a9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 17:11:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FHBo3R46596832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 17:11:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B7B0136404;
 Thu, 15 Apr 2021 17:11:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AA0A13650E;
 Thu, 15 Apr 2021 17:11:39 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.57.176])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 17:11:39 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id ED9692E2E70; Thu, 15 Apr 2021 22:41:34 +0530 (IST)
Date: Thu, 15 Apr 2021 22:41:34 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Reintroduce cpu_core_mask
Message-ID: <20210415171134.GA16351@in.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t7d63j0fvlVfV0-p6mm_dJ-K7ytIhQEV
X-Proofpoint-ORIG-GUID: PZpmR5lVfKIraxiBtMfmKF-q59KAcbaE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_09:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150106
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

On Thu, Apr 15, 2021 at 05:39:32PM +0530, Srikar Dronamraju wrote:
 [..snip..]



> @@ -1485,12 +1486,36 @@ static void add_cpu_to_masks(int cpu)
>  	add_cpu_to_smallcore_masks(cpu);
> 
>  	/* In CPU-hotplug path, hence use GFP_ATOMIC */
> -	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
> +	ret = alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
>  	update_mask_by_l2(cpu, &mask);
> 
>  	if (has_coregroup_support())
>  		update_coregroup_mask(cpu, &mask);
> 
> +	if (chip_id == -1 || !ret) {
> +		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
> +		goto out;
> +	}
> +
> +	if (shared_caches)
> +		submask_fn = cpu_l2_cache_mask;
> +
> +	/* Update core_mask with all the CPUs that are part of submask */
> +	or_cpumasks_related(cpu, cpu, submask_fn, cpu_core_mask);
>

If coregroups exist, we can add the cpus of the coregroup to the
cpu_core_mask thereby reducing the scope of the for_each_cpu() search
below. This will still cut down the time on Baremetal systems
supporting coregroups.


> +	/* Skip all CPUs already part of current CPU core mask */
> +	cpumask_andnot(mask, cpu_online_mask, cpu_core_mask(cpu));
> +
> +	for_each_cpu(i, mask) {
> +		if (chip_id == cpu_to_chip_id(i)) {
> +			or_cpumasks_related(cpu, i, submask_fn, cpu_core_mask);
> +			cpumask_andnot(mask, mask, submask_fn(i));
> +		} else {
> +			cpumask_andnot(mask, mask, cpu_core_mask(i));
> +		}
> +	}
> +
> +out:
>  	free_cpumask_var(mask);
>  }
> 
> -- 
> 2.25.1
> 
