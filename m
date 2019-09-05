Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39709AACC6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 22:08:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PWw814K5zDr5n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 06:08:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PWqP5r81zDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 06:04:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85K2C4J101293; Thu, 5 Sep 2019 16:04:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu8rm0nkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 16:04:09 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x85K3rT8106827;
 Thu, 5 Sep 2019 16:04:08 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu8rm0njb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 16:04:08 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x85K0BVN003423;
 Thu, 5 Sep 2019 20:04:07 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 2uu32ujm0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 20:04:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85K46R627263258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 20:04:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D76AC05B;
 Thu,  5 Sep 2019 20:04:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B18B1AC062;
 Thu,  5 Sep 2019 20:04:06 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 20:04:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/4] powerpc/numa: Early request for home node
 associativity
In-Reply-To: <20190829055023.6171-4-srikar@linux.vnet.ibm.com>
References: <20190829055023.6171-1-srikar@linux.vnet.ibm.com>
 <20190829055023.6171-4-srikar@linux.vnet.ibm.com>
Date: Thu, 05 Sep 2019 15:04:00 -0500
Message-ID: <87tv9qqzm7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050184
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
>
> While here, fix a problem where of_node_put could be called even when
> of_get_cpu_node was not successful.

of_node_put() handles NULL arguments, so this should not be necessary.

> +static int vphn_get_nid(unsigned long cpu, bool get_hwid)

[...]

> +static int numa_setup_cpu(unsigned long lcpu, bool get_hwid)

[...]

> @@ -528,7 +561,7 @@ static int ppc_numa_cpu_prepare(unsigned int cpu)
>  {
>  	int nid;
>  
> -	nid = numa_setup_cpu(cpu);
> +	nid = numa_setup_cpu(cpu, true);
>  	verify_cpu_node_mapping(cpu, nid);
>  	return 0;
>  }
> @@ -875,7 +908,7 @@ void __init mem_topology_setup(void)
>  	reset_numa_cpu_lookup_table();
>  
>  	for_each_present_cpu(cpu)
> -		numa_setup_cpu(cpu);
> +		numa_setup_cpu(cpu, false);
>  }

I'm open to other points of view here, but I would prefer two separate
functions, something like vphn_get_nid() for runtime and
vphn_get_nid_early() (which could be __init) for boot-time
initialization. Propagating a somewhat unexpressive boolean flag through
two levels of function calls in this code is unappealing...

Regardless, I have an annoying question :-) Isn't it possible that,
while Linux is calling vphn_get_nid() for each logical cpu in sequence,
the platform could change a virtual processor's node assignment,
potentially causing sibling threads to get different node assignments
and producing an incoherent topology (which then leads to sched domain
assertions etc)?

If so, I think more care is needed. The algorithm should make the vphn
call only once per cpu node, I think?
