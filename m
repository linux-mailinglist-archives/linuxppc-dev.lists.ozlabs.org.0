Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E71BD52B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:54:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bq5460whzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bq2n6mWMzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:52:49 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T6Xdxo027875; Wed, 29 Apr 2020 02:52:39 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh34a9es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 02:52:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03T6jicJ007888;
 Wed, 29 Apr 2020 06:52:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 30mcu6jqb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 06:52:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03T6qcNx51446232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 06:52:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB2D6A051;
 Wed, 29 Apr 2020 06:52:38 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D41CF6A054;
 Wed, 29 Apr 2020 06:52:37 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.54.241])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 06:52:37 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 14B542E301A; Wed, 29 Apr 2020 12:22:30 +0530 (IST)
Date: Wed, 29 Apr 2020 12:22:29 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/3] powerpc/numa: Prefer node id queried from vphn
Message-ID: <20200429065229.GA18304@in.ibm.com>
References: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
 <20200428093836.27190-3-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428093836.27190-3-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_01:2020-04-28,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290048
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
Cc: Michal Hocko <mhocko@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Srikar,

On Tue, Apr 28, 2020 at 03:08:35PM +0530, Srikar Dronamraju wrote:
> Node id queried from the static device tree may not
> be correct. For example: it may always show 0 on a shared processor.
> Hence prefer the node id queried from vphn and fallback on the device tree
> based node id if vphn query fails.
> 
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1:->v2:
> - Rebased to v5.7-rc3
> 
>  arch/powerpc/mm/numa.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b3615b7fdbdf..281531340230 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -719,20 +719,20 @@ static int __init parse_numa_properties(void)
>  	 */
>  	for_each_present_cpu(i) {
>  		struct device_node *cpu;
> -		int nid;
> -
> -		cpu = of_get_cpu_node(i, NULL);
> -		BUG_ON(!cpu);
> -		nid = of_node_to_nid_single(cpu);
> -		of_node_put(cpu);
> +		int nid = vphn_get_nid(i);
> 
>  		/*
>  		 * Don't fall back to default_nid yet -- we will plug
>  		 * cpus into nodes once the memory scan has discovered
>  		 * the topology.
>  		 */
> -		if (nid < 0)
> -			continue;


> +		if (nid == NUMA_NO_NODE) {
> +			cpu = of_get_cpu_node(i, NULL);
> +			if (cpu) {

Why are we not retaining the BUG_ON(!cpu) assert here ?

> +				nid = of_node_to_nid_single(cpu);
> +				of_node_put(cpu);
> +			}
> +		}

Is it possible at this point that both vphn_get_nid(i) and
of_node_to_nid_single(cpu) returns NUMA_NO_NODE ? If so,
should we still call node_set_online() below ?


>  		node_set_online(nid);
>  	}
> 
> -- 
> 2.20.1
> 
--
Thanks and Regards
gautham.
