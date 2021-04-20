Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 531FB365D6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 18:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPq6b2lQLz30Df
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 02:35:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SHdkrw1Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SHdkrw1Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPq626wJQz2xZn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 02:34:50 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KGWjaR054835; Tue, 20 Apr 2021 12:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IUtg0+4hWG5aS4RdGjsF1QVfg9KN8/bnOyB7liaM+LA=;
 b=SHdkrw1YQAfZoQTnXIIQApXlXQsYGaGTRZvXsxS5U2YuBjZB1MrQW7yzPh/evZ0Y+uLm
 VBDtcjW2BpA7p/y/iaXgirbHgtKGEob/1t5pGDlvyjhisZbNpnOfuSQZQEBGOMwzixda
 InGR9TsIbyDuvQVVmzKDOIT7y8hL6a/bpATMFAjPoM4G080KDzGel03VrcnTkXsD47n1
 JPv/9Tyl/JgEP4+VdAlT8X6+Ezl34YjzxmnpgVyOI/9CER5sQUNOtxSQXe2p8DmrvgUf
 KXg1WCy+GHBAM/n9xMYT6hngTbE9/RGMxxyScswZybJMkWK2vYVdaFXoBBfFuQ12Xumj Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3821xw9e7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 12:34:41 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13KGYcX7061685;
 Tue, 20 Apr 2021 12:34:40 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3821xw9e74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 12:34:40 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13KGBPU8003601;
 Tue, 20 Apr 2021 16:34:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 37yqa890mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 16:34:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13KGYZYj39780702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 16:34:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 449A911C050;
 Tue, 20 Apr 2021 16:34:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0473A11C058;
 Tue, 20 Apr 2021 16:34:35 +0000 (GMT)
Received: from pomme.local (unknown [9.145.78.35])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 16:34:34 +0000 (GMT)
Subject: Re: [PATCH v4] pseries: prevent free CPU ids to be reused on another
 node
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 nathanl@linux.ibm.com, Nick Piggin <npiggin@gmail.com>
References: <20210407153808.59993-1-ldufour@linux.ibm.com>
Message-ID: <b815f9a6-e4da-8c8e-f207-71c6d122fc40@linux.ibm.com>
Date: Tue, 20 Apr 2021 18:34:34 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210407153808.59993-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F4yx6vVpFunm0IIjudqWc0V-AfvlKYUE
X-Proofpoint-ORIG-GUID: XYPXZI_9I2pnhPVzSL9MH0_oBQwktKVL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_07:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104200117
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
Cc: cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 07/04/2021 à 17:38, Laurent Dufour a écrit :
> When a CPU is hot added, the CPU ids are taken from the available mask from
> the lower possible set. If that set of values was previously used for CPU
> attached to a different node, this seems to application like if these CPUs
> have migrated from a node to another one which is not expected in real
> life.
> 
> To prevent this, it is needed to record the CPU ids used for each node and
> to not reuse them on another node. However, to prevent CPU hot plug to
> fail, in the case the CPU ids is starved on a node, the capability to reuse
> other nodes’ free CPU ids is kept. A warning is displayed in such a case
> to warn the user.
> 
> A new CPU bit mask (node_recorded_ids_map) is introduced for each possible
> node. It is populated with the CPU onlined at boot time, and then when a
> CPU is hot plug to a node. The bits in that mask remain when the CPU is hot
> unplugged, to remind this CPU ids have been used for this node.
> 
> The effect of this patch can be seen by removing and adding CPUs using the
> Qemu monitor. In the following case, the first CPU from the node 2 is
> removed, then the first one from the node 1 is removed too. Later, the
> first CPU of the node 2 is added back. Without that patch, the kernel will
> numbered these CPUs using the first CPU ids available which are the ones
> freed when removing the second CPU of the node 0. This leads to the CPU ids
> 16-23 to move from the node 1 to the node 2. With the patch applied, the
> CPU ids 32-39 are used since they are the lowest free ones which have not
> been used on another node.
> 
> At boot time:
> [root@vm40 ~]# numactl -H | grep cpus
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
> node 1 cpus: 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
> 
> Vanilla kernel, after the CPU hot unplug/plug operations:
> [root@vm40 ~]# numactl -H | grep cpus
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
> node 1 cpus: 24 25 26 27 28 29 30 31
> node 2 cpus: 16 17 18 19 20 21 22 23 40 41 42 43 44 45 46 47
> 
> Patched kernel, after the CPU hot unplug/plug operations:
> [root@vm40 ~]# numactl -H | grep cpus
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
> node 1 cpus: 24 25 26 27 28 29 30 31
> node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
> 
> Changes since V3, addressing Nathan's comment:
>   - Rename the local variable named 'nid' into 'assigned_node'
> Changes since V2, addressing Nathan's comments:
>   - Remove the retry feature
>   - Reduce the number of local variables (removing 'i')
>   - Add comment about the cpu_add_remove_lock protecting the added CPU mask.
> Changes since V1 (no functional changes):
>   - update the test's output in the commit's description
>   - node_recorded_ids_map should be static
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

I did further LPM tests with this patch applied and not allowing fall back 
reusing free ids of another node is too strong.

This is easy to hit that limitation when a LPAR is running at the maximum number 
of CPU it is configured for and when a LPAR migration leads to new node activation.

For instance, consider a dedicated LPAR configured with a max of 32 CPUs (4 
cores SMT 8). At boot time, cpu_possible_mask is filled with CPU ids 0-31 in 
smp_setup_cpu_maps() by reading the DT property "/rtas/ibm,lrdr-capacity", so 
the higher CPU id for this LPAR is 31.

Departure box:
	node 0 : CPU 0-31
Arrival box:
	node 0 : CPU 0-15
	node 1 : CPU 16-31 << need to reuse ids from node 0

Visualizing the CPU ids would have a big impact as it is used in several places 
in the kernel as to index linear table.

But in the case the LPAR is migratable (DT property "ibm,migratable-partition" 
is present), we may set the higher CPU ids to NR_CPUS (usually 2048), to limit 
the case where CPU id has to be reused on a different node. Doing this will have 
impact on some data allocation done in the kernel when the size is based on 
num_possible_cpus.

Any better idea?

Thanks,
Laurent.

