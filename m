Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B418841C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 13:28:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hXWQ5QwDzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hWm45B6nzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 22:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48hWm242QRz8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 22:53:54 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48hWm20W6vz9sT6; Tue, 17 Mar 2020 22:53:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48hWm01QNMz9sT2
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Mar 2020 22:53:51 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HBr2jJ055056
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Mar 2020 07:53:49 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yru545a24-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Mar 2020 07:53:49 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 17 Mar 2020 11:53:47 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 11:53:44 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HBrhHS51904728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 11:53:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1AE752059;
 Tue, 17 Mar 2020 11:53:43 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.32.136])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1963252050;
 Tue, 17 Mar 2020 11:53:41 +0000 (GMT)
Date: Tue, 17 Mar 2020 17:23:39 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: linux-mm@kvack.org
Subject: Re: Slub: Increased mem consumption on cpu,mem-less node powerpc guest
References: <20200317092624.GB22538@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317092624.GB22538@in.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20031711-0016-0000-0000-000002F28847
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031711-0017-0000-0000-000033560884
Message-Id: <20200317115339.GA26049@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_03:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxscore=0 mlxlogscore=885 priorityscore=1501 malwarescore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170049
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
Reply-To: bharata@linux.ibm.com
Cc: Andrew Morton <akpm@linux-foundation.org>, aneesh.kumar@linux.ibm.com,
 Pekka Enberg <penberg@kernel.org>, linuxppc-dev@ozlabs.org,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 17, 2020 at 02:56:28PM +0530, Bharata B Rao wrote:
> Case 1: 2 node NUMA, node0 empty
> ================================
> # numactl -H
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB
> node 1 cpus: 0 1 2 3 4 5 6 7
> node 1 size: 16294 MB
> node 1 free: 15453 MB
> node distances:
> node   0   1 
>   0:  10  40 
>   1:  40  10 
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 17dc00e33115..888e4d245444 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1971,10 +1971,8 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>  	void *object;
>  	int searchnode = node;
>  
> -	if (node == NUMA_NO_NODE)
> +	if (node == NUMA_NO_NODE || !node_present_pages(node))
>  		searchnode = numa_mem_id();
> -	else if (!node_present_pages(node))
> -		searchnode = node_to_mem_node(node);

For the above topology, I see this:

node_to_mem_node(1) = 1
node_to_mem_node(0) = 0
node_to_mem_node(NUMA_NO_NODE) = 0

Looks like the last two cases (returning memory-less node 0) is the
problem here?

Regards,
Bharata.

