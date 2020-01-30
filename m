Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27B14D965
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 11:59:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487cn03XgyzDqXd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 21:59:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487clG0VZtzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 21:57:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00UAs3SP061148; Thu, 30 Jan 2020 05:57:53 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xuagnvauh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2020 05:57:52 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00UAvAAp001155;
 Thu, 30 Jan 2020 10:57:51 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2xrda6k5md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2020 10:57:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00UAvph150856238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 10:57:51 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63D3C112066;
 Thu, 30 Jan 2020 10:57:51 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25BCF112061;
 Thu, 30 Jan 2020 10:57:51 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jan 2020 10:57:51 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 8FACD2E3006; Thu, 30 Jan 2020 16:27:47 +0530 (IST)
Date: Thu, 30 Jan 2020 16:27:47 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4] powerpc/smp: Use nid as fallback for package_id
Message-ID: <20200130105747.GD1988@in.ibm.com>
References: <20200129135121.24617-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129135121.24617-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_03:2020-01-28,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300079
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Srikar,



On Wed, Jan 29, 2020 at 07:21:21PM +0530, Srikar Dronamraju wrote:

[..snip..]

> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1185,10 +1185,34 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
>  	}
>  }
> 
> +int get_physical_package_id(int cpu)
> +{
> +	int ppid = cpu_to_chip_id(cpu);
> +
> +#ifdef CONFIG_PPC_SPLPAR
> +	/*
> +	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
> +	 * defined. Hence we would return the chip-id as the
> +	 * get_physical_package_id.
> +	 */
> +	if (ppid == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
> +		struct device_node *np = of_get_cpu_node(cpu, NULL);
> +
> +		if (np) {
> +			ppid = of_node_to_nid(np);
> +			of_node_put(np);
> +		}
> +	}
> +#endif /* CONFIG_PPC_SPLPAR */
> +
> +	return ppid;
> +}
> +EXPORT_SYMBOL_GPL(get_physical_package_id);
> +
>  static void add_cpu_to_masks(int cpu)
>  {
>  	int first_thread = cpu_first_thread_sibling(cpu);
> -	int chipid = cpu_to_chip_id(cpu);
> +	int ppid = get_physical_package_id(cpu);
>  	int i;
> 
>  	/*
> @@ -1217,11 +1241,11 @@ static void add_cpu_to_masks(int cpu)
>  	for_each_cpu(i, cpu_l2_cache_mask(cpu))
>  		set_cpus_related(cpu, i, cpu_core_mask);
> 
> -	if (chipid == -1)
> +	if (ppid == -1)
>  		return;

Can get_physical_package_id() return -1 ?

> 
>  	for_each_cpu(i, cpu_online_mask)
> -		if (cpu_to_chip_id(i) == chipid)
> +		if (get_physical_package_id(i) == ppid)
>  			set_cpus_related(cpu, i, cpu_core_mask);
>  }
> 
> -- 
> 2.18.1
>

--
Thanks and Regards
gautham.
