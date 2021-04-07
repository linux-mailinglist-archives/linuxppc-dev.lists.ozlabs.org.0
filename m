Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24035356F68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 16:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFnXD6n63z30RJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 00:56:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D/kCU8X1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D/kCU8X1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFnWl659Mz2yZ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 00:55:47 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137EXU36044165; Wed, 7 Apr 2021 10:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=1bwHD9URy/4hElStjM6dag7u8DX1yY4nlXxLsVM1eJs=;
 b=D/kCU8X1QsEMEukpsvjrxNHuL+VP29a1EWYBcwaMxOishLmV85xUxGhj7/B5wLFOLugB
 eZyTkgWsNvn60KqXrt/leMryizeu0/TWvzd5QQfufPQ5oFXYfvn13vllhBMfSXW367tI
 JTzDMdaMW5I+LMFjfFf29qv5xygGMxx5cW+EHGD/0gIEQWBUE6vf5FCTr8e9j/6crDvw
 PP6JMgehbZuvgp3Pmd9MlFW/mCgzPznCqD38dwIgonZAWvbJ0uV99D1zzPXm1Vjcyz53
 7U4uocgms+JDg09AKvHDvBTgZdfghKmZr47BHF6o5iq2teCA8Z2sKgjNgLkm3tTv5fP2 kg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rwf0k106-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 10:55:39 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137ErES8030466;
 Wed, 7 Apr 2021 14:55:39 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 37rvs17nan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 14:55:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137EtcnF33030618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 14:55:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2834EAC059;
 Wed,  7 Apr 2021 14:55:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE5FAC05B;
 Wed,  7 Apr 2021 14:55:37 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 14:55:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v3] pseries: prevent free CPU ids to be reused on
 another node
In-Reply-To: <20210406182554.85197-1-ldufour@linux.ibm.com>
References: <20210406182554.85197-1-ldufour@linux.ibm.com>
Date: Wed, 07 Apr 2021 09:55:37 -0500
Message-ID: <87blaqkuty.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GgpCroGTG8WFn6oMrz1SgC1Zv1mRw2wR
X-Proofpoint-ORIG-GUID: GgpCroGTG8WFn6oMrz1SgC1Zv1mRw2wR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_08:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070103
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
Cc: cheloha@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Changes since V2, addressing Nathan's comments:
>  - Remove the retry feature
>  - Reduce the number of local variables (removing 'i')

I was more interested in not having two variables for NUMA nodes in the
function named 'node' and 'nid', hoping at least one of them could have
a more descriptive name. See below.

>  static int pseries_add_processor(struct device_node *np)
>  {
> -	unsigned int cpu;
> +	unsigned int cpu, node;
>  	cpumask_var_t candidate_mask, tmp;
> -	int err = -ENOSPC, len, nthreads, i;
> +	int err = -ENOSPC, len, nthreads, nid;
>  	const __be32 *intserv;
>  
>  	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
> @@ -163,9 +169,17 @@ static int pseries_add_processor(struct device_node *np)
>  	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
>  	zalloc_cpumask_var(&tmp, GFP_KERNEL);
>  
> +	/*
> +	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
> +	 * node id the added CPU belongs to.
> +	 */
> +	nid = of_node_to_nid(np);
> +	if (nid < 0 || !node_possible(nid))
> +		nid = first_online_node;
> +
>  	nthreads = len / sizeof(u32);
> -	for (i = 0; i < nthreads; i++)
> -		cpumask_set_cpu(i, tmp);
> +	for (cpu = 0; cpu < nthreads; cpu++)
> +		cpumask_set_cpu(cpu, tmp);
>  
>  	cpu_maps_update_begin();
>  
> @@ -173,6 +187,19 @@ static int pseries_add_processor(struct device_node *np)
>  
>  	/* Get a bitmap of unoccupied slots. */
>  	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
> +
> +	/*
> +	 * Remove free ids previously assigned on the other nodes. We can walk
> +	 * only online nodes because once a node became online it is not turned
> +	 * offlined back.
> +	 */
> +	for_each_online_node(node) {
> +		if (node == nid) /* Keep our node's recorded ids */
> +			continue;
> +		cpumask_andnot(candidate_mask, candidate_mask,
> +			       node_recorded_ids_map[node]);
> +	}
> +

e.g. change 'nid' to 'assigned_node' or similar, and I think this
becomes easier to follow.

Otherwise the patch looks fine to me now.
