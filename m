Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F41926CA51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 09:51:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q5td1cTLzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 17:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q5rH4lCfzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 17:49:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6I7lIJA073970
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 03:49:30 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttm3qhd27-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 03:49:30 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 18 Jul 2019 08:49:28 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 08:49:25 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6I7nO7645482144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 07:49:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F39D94C044;
 Thu, 18 Jul 2019 07:49:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67C294C05A;
 Thu, 18 Jul 2019 07:49:22 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.42.31])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jul 2019 07:49:22 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v2] powerpc/nvdimm: Pick the nearby online node if the
 device node is not online
In-Reply-To: <CAOSf1CGvu9GNCNTD8zvvu3XHe9qzjTd7K+wxC98c6cUo5xFa6Q@mail.gmail.com>
References: <20190716090553.21870-1-aneesh.kumar@linux.ibm.com>
 <CAOSf1CGvu9GNCNTD8zvvu3XHe9qzjTd7K+wxC98c6cUo5xFa6Q@mail.gmail.com>
Date: Thu, 18 Jul 2019 13:19:20 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19071807-0012-0000-0000-00000333FB77
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071807-0013-0000-0000-0000216D7C60
Message-Id: <874l3jdbpb.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180089
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:

> On Tue, Jul 16, 2019 at 7:08 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> This is similar to what ACPI does. Nvdimm layer doesn't bring the SCM device
>> numa node online. Hence we need to make sure we always use an online node
>> as ndr_desc.numa_node. Otherwise this result in kernel crashes. The target
>> node is used by dax/kmem and that will bring up the numa node online correctly.
>>
>> Without this patch, we do hit kernel crash as below because we try to access
>> uninitialized NODE_DATA in different code paths.
>
> Right, so we're getting a crash due to libnvdimm (via devm_kmalloc)
> trying to to node local allocations to an offline node. Using a
> different node fixes that problem, but what else does changing
> ndr_desc.numa_node do?
>
>> cpu 0x0: Vector: 300 (Data Access) at [c0000000fac53170]
>>     pc: c0000000004bbc50: ___slab_alloc+0x120/0xca0
>>     lr: c0000000004bc834: __slab_alloc+0x64/0xc0
>>     sp: c0000000fac53400
>>    msr: 8000000002009033
>>    dar: 73e8
>>  dsisr: 80000
>>   current = 0xc0000000fabb6d80
>>   paca    = 0xc000000003870000   irqmask: 0x03   irq_happened: 0x01
>>     pid   = 7, comm = kworker/u16:0
>> Linux version 5.2.0-06234-g76bd729b2644 (kvaneesh@ltc-boston123) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #135 SMP Thu Jul 11 05:36:30 CDT 2019
>> enter ? for help
>> [link register   ] c0000000004bc834 __slab_alloc+0x64/0xc0
>> [c0000000fac53400] c0000000fac53480 (unreliable)
>> [c0000000fac53500] c0000000004bc818 __slab_alloc+0x48/0xc0
>> [c0000000fac53560] c0000000004c30a0 __kmalloc_node_track_caller+0x3c0/0x6b0
>> [c0000000fac535d0] c000000000cfafe4 devm_kmalloc+0x74/0xc0
>> [c0000000fac53600] c000000000d69434 nd_region_activate+0x144/0x560
>> [c0000000fac536d0] c000000000d6b19c nd_region_probe+0x17c/0x370
>> [c0000000fac537b0] c000000000d6349c nvdimm_bus_probe+0x10c/0x230
>> [c0000000fac53840] c000000000cf3cc4 really_probe+0x254/0x4e0
>> [c0000000fac538d0] c000000000cf429c driver_probe_device+0x16c/0x1e0
>> [c0000000fac53950] c000000000cf0b44 bus_for_each_drv+0x94/0x130
>> [c0000000fac539b0] c000000000cf392c __device_attach+0xdc/0x200
>> [c0000000fac53a50] c000000000cf231c bus_probe_device+0x4c/0xf0
>> [c0000000fac53a90] c000000000ced268 device_add+0x528/0x810
>> [c0000000fac53b60] c000000000d62a58 nd_async_device_register+0x28/0xa0
>> [c0000000fac53bd0] c0000000001ccb8c async_run_entry_fn+0xcc/0x1f0
>> [c0000000fac53c50] c0000000001bcd9c process_one_work+0x46c/0x860
>> [c0000000fac53d20] c0000000001bd4f4 worker_thread+0x364/0x5f0
>> [c0000000fac53db0] c0000000001c7260 kthread+0x1b0/0x1c0
>> [c0000000fac53e20] c00000000000b954 ret_from_kernel_thread+0x5c/0x68
>>
>> With the patch we get
>>
>>  # numactl -H
>> available: 2 nodes (0-1)
>> node 0 cpus:
>> node 0 size: 0 MB
>> node 0 free: 0 MB
>> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
>> node 1 size: 130865 MB
>> node 1 free: 129130 MB
>> node distances:
>> node   0   1
>>   0:  10  20
>>   1:  20  10
>>  # cat /sys/bus/nd/devices/region0/numa_node
>> 0
>>  # dmesg | grep papr_scm
>> [   91.332305] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Region registered with target node 2 and online node 0
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>> changes from V1:
>> * handle NUMA_NO_NODE
>>
>>  arch/powerpc/platforms/pseries/papr_scm.c | 30 +++++++++++++++++++++--
>>  1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index c8ec670ee924..b813bc92f35f 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -255,12 +255,32 @@ static const struct attribute_group *papr_scm_dimm_groups[] = {
>>         NULL,
>>  };
>>
>> +static inline int papr_scm_node(int node)
>> +{
>> +       int min_dist = INT_MAX, dist;
>> +       int nid, min_node;
>> +
>> +       if ((node == NUMA_NO_NODE) || node_online(node))
>> +               return node;
>> +
>> +       min_node = first_online_node;
>> +       for_each_online_node(nid) {
>> +               dist = node_distance(node, nid);
>> +               if (dist < min_dist) {
>> +                       min_dist = dist;
>> +                       min_node = nid;
>> +               }
>> +       }
>> +       return min_node;
>> +}
>> +
>>  static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>  {
>>         struct device *dev = &p->pdev->dev;
>>         struct nd_mapping_desc mapping;
>>         struct nd_region_desc ndr_desc;
>>         unsigned long dimm_flags;
>> +       int target_nid, online_nid;
>>
>>         p->bus_desc.ndctl = papr_scm_ndctl;
>>         p->bus_desc.module = THIS_MODULE;
>> @@ -299,8 +319,11 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>
>>         memset(&ndr_desc, 0, sizeof(ndr_desc));
>>         ndr_desc.attr_groups = region_attr_groups;
>> -       ndr_desc.numa_node = dev_to_node(&p->pdev->dev);
>> -       ndr_desc.target_node = ndr_desc.numa_node;
>> +       target_nid = dev_to_node(&p->pdev->dev);
>> +       online_nid = papr_scm_node(target_nid);
>> +       set_dev_node(&p->pdev->dev, online_nid);
>> +       ndr_desc.numa_node = online_nid;
>> +       ndr_desc.target_node = target_nid;
>
> Annoying question: Say I have two SCM regions with slightly different
> numa affinities and I online one, then the other. If the first is
> setup to be used as kmem could we have the target_node of the first
> being used as the online_node of the second? If so, what happens if I
> unbind kmem from the first region?

kmem, for now, doesn't allow to unregister the mem region. So this won't
happen. But when we start supporting hot unplugging memory added via
kmem, I would expect we continue to keep the SCM region 1 attached to
the node that had kmem before. 

>
> I'm mostly wondering if we need to set online_node to the nearest node
> with actual memory on it.
>
>>         ndr_desc.res = &p->res;
>>         ndr_desc.of_node = p->dn;
>>         ndr_desc.provider_data = p;
>> @@ -318,6 +341,9 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>                                 ndr_desc.res, p->dn);
>>                 goto err;
>>         }
>> +       if (target_nid != online_nid)
>> +               dev_info(dev, "Region registered with target node %d and online node %d",
>> +                        target_nid, online_nid);
>>
>>         return 0;
>>

There was a related question that Michael asked w.r.t how do we
define closest NUMA node if we have two NUMA nodes (say `x` and `y`)
with the same distance from the nvdimm region NUMA node. For now, we
pick the first one. But then that also means we lose the information
that nvdimm region access latency is going to be same from both nodes
`x` and `y`.

I guess if application want to find those detail, they will have to use
/sys/devices/system/node/nodeX/accessY/ introduced as part of 

08d9dbe72b1f8 ("node: Link memory nodes to their compute nodes")
 

-aneesh

