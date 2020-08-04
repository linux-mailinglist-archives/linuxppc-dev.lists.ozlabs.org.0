Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05023B607
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 09:49:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLRjc06GfzDqY0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 17:49:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLRgr6HFczDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 17:48:08 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0747WsJC015806; Tue, 4 Aug 2020 03:48:01 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32q1gyudk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 03:48:01 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0747dqFg014161;
 Tue, 4 Aug 2020 07:48:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 32n0193waa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 07:48:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0747lxYf53936586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 07:47:59 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50F556E050;
 Tue,  4 Aug 2020 07:47:59 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C26F56E04C;
 Tue,  4 Aug 2020 07:47:58 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.92.71])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 07:47:58 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 310492E2EE7; Tue,  4 Aug 2020 13:17:51 +0530 (IST)
Date: Tue, 4 Aug 2020 13:17:51 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] powerpc/powernv/cpufreq: Don't assume chip id is
 same as Linux node id
Message-ID: <20200804074751.GB8058@in.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <20200731112205.245716-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731112205.245716-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_02:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040050
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 31, 2020 at 04:52:05PM +0530, Aneesh Kumar K.V wrote:
> On PowerNV platforms we always have 1:1 mapping between chip ID and
> firmware group id. Use the helper to convert firmware group id to
> node id instead of directly using chip ID as Linux node id.
> 
> NOTE: This doesn't have any functional change. On PowerNV platforms
> we continue to have 1:1 mapping between firmware group id and
> Linux node id.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 8646eb197cd9..ca82b6ac0989 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -27,6 +27,7 @@
>  #include <asm/reg.h>
>  #include <asm/smp.h> /* Required for cpu_sibling_mask() in UP configs */
>  #include <asm/opal.h>
> +#include <asm/topology.h>
>  #include <linux/timer.h>
> 
>  #define POWERNV_MAX_PSTATES_ORDER  8
> @@ -1069,8 +1070,14 @@ static int init_chip_info(void)
>  	}
> 
>  	for (i = 0; i < nr_chips; i++) {
> +		unsigned int nid;
> +
>  		chips[i].id = chip[i];
> -		cpumask_copy(&chips[i].mask, cpumask_of_node(chip[i]));
> +		/*
> +		 * On powervn platforms firmware group id is same as chipd id.

But doesn't hurt to be safe :-)

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> +		 */
> +		nid = firmware_group_id_to_nid(chip[i]);
> +		cpumask_copy(&chips[i].mask, cpumask_of_node(nid));
>  		INIT_WORK(&chips[i].throttle, powernv_cpufreq_work_fn);
>  		for_each_cpu(cpu, &chips[i].mask)
>  			per_cpu(chip_info, cpu) =  &chips[i];
> -- 
> 2.26.2
> 
