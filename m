Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC92236FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7PR509GyzDrMm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 18:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7PP659xzzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:27:06 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H812vN171014; Fri, 17 Jul 2020 04:27:00 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32b61kbm9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:27:00 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H8OWdL010415;
 Fri, 17 Jul 2020 08:27:00 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 327529qfxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 08:27:00 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H8Qwul39321876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 08:26:58 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98BA8124053;
 Fri, 17 Jul 2020 08:26:58 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 459C8124052;
 Fri, 17 Jul 2020 08:26:58 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.61.65])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 08:26:58 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 111A92E3026; Fri, 17 Jul 2020 13:56:53 +0530 (IST)
Date: Fri, 17 Jul 2020 13:56:53 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 10/11] powerpc/smp: Implement cpu_to_coregroup_id
Message-ID: <20200717082652.GF32531@in.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-11-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-11-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_04:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170059
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
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 10:06:23AM +0530, Srikar Dronamraju wrote:
> Lookup the coregroup id from the associativity array.
> 
> If unable to detect the coregroup id, fallback on the core id.
> This way, ensure sched_domain degenerates and an extra sched domain is
> not created.
> 
> Ideally this function should have been implemented in
> arch/powerpc/kernel/smp.c. However if its implemented in mm/numa.c, we
> don't need to find the primary domain again.
> 
> If the device-tree mentions more than one coregroup, then kernel
> implements only the last or the smallest coregroup, which currently
> corresponds to the penultimate domain in the device-tree.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: Michael Ellerman <michaele@au1.ibm.com>
> Cc: Nick Piggin <npiggin@au1.ibm.com>
> Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@linux.ibm.com>
> Cc: Anton Blanchard <anton@au1.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index d9ab9da85eab..4e85564ef62a 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1697,6 +1697,23 @@ static const struct proc_ops topology_proc_ops = {
> 
>  int cpu_to_coregroup_id(int cpu)
>  {
> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
> +	int index;
> +

It would be good to have an assert here to ensure that we are calling
this function only when coregroups are enabled.

Else, we may end up returning the penultimate index which maps to the
chip-id.



> +	if (cpu < 0 || cpu > nr_cpu_ids)
> +		return -1;
> +
> +	if (!firmware_has_feature(FW_FEATURE_VPHN))
> +		goto out;
> +
> +	if (vphn_get_associativity(cpu, associativity))
> +		goto out;
> +
> +	index = of_read_number(associativity, 1);
> +	if ((index > min_common_depth + 1) && coregroup_enabled)
> +		return of_read_number(&associativity[index - 1], 1);
> +
> +out:
>  	return cpu_to_core_id(cpu);
>  }
> 
> -- 
> 2.17.1
> 
