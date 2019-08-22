Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257B99B24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 19:24:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DrxQ56CFzDrfW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 03:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Drnx3FfdzDrFH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:17:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MHHdN7062331; Thu, 22 Aug 2019 13:17:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhvrc7dxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 13:17:50 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7MHHncP063137;
 Thu, 22 Aug 2019 13:17:49 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhvrc7dwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 13:17:49 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7MHG2li005540;
 Thu, 22 Aug 2019 17:17:49 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 2ug0ckj2sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 17:17:49 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MHHmNM35979532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 17:17:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB90028058;
 Thu, 22 Aug 2019 17:17:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D3372805E;
 Thu, 22 Aug 2019 17:17:48 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 17:17:48 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] powerpc/numa: Early request for home node
 associativity
In-Reply-To: <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
 <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
Date: Thu, 22 Aug 2019 12:17:48 -0500
Message-ID: <87ftltruf7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220157
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Currently the kernel detects if its running on a shared lpar platform
> and requests home node associativity before the scheduler sched_domains
> are setup. However between the time NUMA setup is initialized and the
> request for home node associativity, workqueue initializes its per node
> cpumask. The per node workqueue possible cpumask may turn invalid
> after home node associativity resulting in weird situations like
> workqueue possible cpumask being a subset of workqueue online cpumask.
>
> This can be fixed by requesting home node associativity earlier just
> before NUMA setup. However at the NUMA setup time, kernel may not be in
> a position to detect if its running on a shared lpar platform. So
> request for home node associativity and if the request fails, fallback
> on the device tree property.

I think this is generally sound at the conceptual level.


> However home node associativity requires cpu's hwid which is set in
> smp_setup_pacas. Hence call smp_setup_pacas before numa_setup_cpus.

But this seems like it would negatively affect pacas' NUMA placements?

Would it be less risky to figure out a way to do "early" VPHN hcalls
before mem_topology_setup, getting the hwids from the cpu_to_phys_id
array perhaps?


> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 88b5157..7965d3b 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -461,6 +461,21 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>  	return nid;
>  }
>  
> +static int vphn_get_nid(unsigned long cpu)
> +{
> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
> +	long rc;
> +
> +	/* Use associativity from first thread for all siblings */

I don't understand how this comment corresponds to the code it
accompanies.


> +	rc = hcall_vphn(get_hard_smp_processor_id(cpu),
> +				VPHN_FLAG_VCPU, associativity);
> +
> +	if (rc == H_SUCCESS)
> +		return  associativity_to_nid(associativity);
                      ^^ extra space

> @@ -490,7 +505,18 @@ static int numa_setup_cpu(unsigned long lcpu)
>  			goto out;
>  	}
>  
> -	nid = of_node_to_nid_single(cpu);
> +	/*
> +	 * On a shared lpar, the device tree might not have the correct node
> +	 * associativity.  At this time lppaca, or its __old_status field

Sorry but I'm going to quibble with this phrasing a bit. On SPLPAR the
CPU nodes have no affinity information in the device tree at all. This
comment implies that they may have incorrect information, which is
AFAIK not the case.

