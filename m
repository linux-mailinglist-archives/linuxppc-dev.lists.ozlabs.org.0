Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1CAFFB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:14:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T56D415zzF3Kq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:14:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4Y84Zc4zF3Bc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:49:16 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgbn7188381; Wed, 11 Sep 2019 10:49:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxc00r18e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 10:49:09 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8BEgdqw188458;
 Wed, 11 Sep 2019 10:48:59 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxc00r13a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 10:48:59 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8BEe9D2028840;
 Wed, 11 Sep 2019 14:48:41 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2uv467bv35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 14:48:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEmerc54919494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:48:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EAB6BE056;
 Wed, 11 Sep 2019 14:48:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80988BE054;
 Wed, 11 Sep 2019 14:48:40 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:48:40 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 3/5] powerpc/numa: Use cpu node map of first sibling
 thread
In-Reply-To: <20190906135020.19772-4-srikar@linux.vnet.ibm.com>
References: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
 <20190906135020.19772-4-srikar@linux.vnet.ibm.com>
Date: Wed, 11 Sep 2019 09:48:34 -0500
Message-ID: <87lfuurirh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> @@ -467,15 +467,20 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>   */
>  static int numa_setup_cpu(unsigned long lcpu)
>  {
> -	int nid = NUMA_NO_NODE;
>  	struct device_node *cpu;
> +	int fcpu = cpu_first_thread_sibling(lcpu);
> +	int nid = NUMA_NO_NODE;
>  
>  	/*
>  	 * If a valid cpu-to-node mapping is already available, use it
>  	 * directly instead of querying the firmware, since it represents
>  	 * the most recent mapping notified to us by the platform (eg: VPHN).
> +	 * Since cpu_to_node binding remains the same for all threads in the
> +	 * core. If a valid cpu-to-node mapping is already available, for
> +	 * the first thread in the core, use it.
>  	 */
> -	if ((nid = numa_cpu_lookup_table[lcpu]) >= 0) {
> +	nid = numa_cpu_lookup_table[fcpu];
> +	if (nid >= 0) {
>  		map_cpu_to_node(lcpu, nid);
>  		return nid;
>  	}

Yes, we need to something like this to prevent a VPHN change that occurs
concurrently with onlining a core's threads from messing us up.

Is it a good assumption that the first thread of a sibling group will
have its mapping initialized first? I think the answer is yes for boot,
but hotplug... not so sure.


> @@ -496,6 +501,16 @@ static int numa_setup_cpu(unsigned long lcpu)
>  	if (nid < 0 || !node_possible(nid))
>  		nid = first_online_node;
>  
> +	/*
> +	 * Update for the first thread of the core. All threads of a core
> +	 * have to be part of the same node. This not only avoids querying
> +	 * for every other thread in the core, but always avoids a case
> +	 * where virtual node associativity change causes subsequent threads
> +	 * of a core to be associated with different nid.
> +	 */
> +	if (fcpu != lcpu)
> +		map_cpu_to_node(fcpu, nid);
> +

OK, I see that this somewhat addresses my concern above. But changing
this mapping for a remote cpu is unsafe except under specific
circumstances. I think this should first assert:

* numa_cpu_lookup_table[fcpu] == NUMA_NO_NODE
* cpu_online(fcpu) == false

to document and enforce the conditions that must hold for this to be OK.
