Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5E24808B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:26:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW3t80N4MzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 18:26:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xcj6qU19; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW3lr6lDbzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 18:21:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07I81i0k002144; Tue, 18 Aug 2020 04:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=V3V8h88uf/HcY7f1Au1kYUgrRNxDzt0Hs+jvp3qcTyo=;
 b=Xcj6qU19azyJLKrNv4vHHcdlIK1mAlYMpA0VTK334axg/bZjVxP9+vwFtvMkoz+zJ2pZ
 iJEPy6ZzkG8MryRPoOXI3/9uGgX85whHBTnv2D0SFgehR0GLHI0zNfKv1rMWQ40YaObw
 ihFU/KqjpZzW8MRuejDERbaAaL/a3Les2clXPFvspYg7KrtV5Id3ypmfRQytegyaQLIK
 vhm8N9+LQ6nrzeFpuTQWFR3YXzhBRLRgwsdzKgSgJwBe6dq9AUGM3wy4NFs5XkGCaGAc
 X3JqVD5MnIyJcVfkNrPYRe/P0U8dxXdZm26H777RVLfChyYc39rgzJCKRQd1NNNsEu8r DA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r71pyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 04:21:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I8FLvj020803;
 Tue, 18 Aug 2020 08:21:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3304ccb0qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Aug 2020 08:21:24 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07I8LJDm29753940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 08:21:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B5B0C6061;
 Tue, 18 Aug 2020 08:21:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4A45C6055;
 Tue, 18 Aug 2020 08:21:20 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.74.86])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 18 Aug 2020 08:21:20 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/numa: Introduce logical numa id
In-Reply-To: <20200817114908.GA32655@linux.vnet.ibm.com>
References: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
 <20200817105950.GA31352@linux.vnet.ibm.com>
 <15a2f88d-e609-cce9-a82c-321073b9574b@linux.ibm.com>
 <20200817114908.GA32655@linux.vnet.ibm.com>
Date: Tue, 18 Aug 2020 13:51:16 +0530
Message-ID: <87zh6s1i0z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-18_04:2020-08-18,
 2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=982 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180051
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-17 17:04:24]:
>
>> On 8/17/20 4:29 PM, Srikar Dronamraju wrote:
>> > * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-17 16:02:36]:
>> > 
>> > > We use ibm,associativity and ibm,associativity-lookup-arrays to derive the numa
>> > > node numbers. These device tree properties are firmware indicated grouping of
>> > > resources based on their hierarchy in the platform. These numbers (group id) are
>> > > not sequential and hypervisor/firmware can follow different numbering schemes.
>> > > For ex: on powernv platforms, we group them in the below order.
>> > > 
>> > >   *     - CCM node ID
>> > >   *     - HW card ID
>> > >   *     - HW module ID
>> > >   *     - Chip ID
>> > >   *     - Core ID
>> > > 
>> > > Based on ibm,associativity-reference-points we use one of the above group ids as
>> > > Linux NUMA node id. (On PowerNV platform Chip ID is used). This results
>> > > in Linux reporting non-linear NUMA node id and which also results in Linux
>> > > reporting empty node 0 NUMA nodes.
>> > > 
>> > > This can  be resolved by mapping the firmware provided group id to a logical Linux
>> > > NUMA id. In this patch, we do this only for pseries platforms considering the
>> > > firmware group id is a virtualized entity and users would not have drawn any
>> > > conclusion based on the Linux Numa Node id.
>> > > 
>> > > On PowerNV platform since we have historically mapped Chip ID as Linux NUMA node
>> > > id, we keep the existing Linux NUMA node id numbering.
>> > 
>> > I still dont understand how you are going to handle numa distances.
>> > With your patch, have you tried dlpar add/remove on a sparsely noded machine?
>> > 
>> 
>> We follow the same steps when fetching distance information. Instead of
>> using affinity domain id, we now use the mapped node id. The relevant hunk
>> in the patch is
>> 
>> +	nid = affinity_domain_to_nid(&domain);
>> 
>>  	if (nid > 0 &&
>> -		of_read_number(associativity, 1) >= distance_ref_points_depth) {
>> +	    of_read_number(associativity, 1) >= distance_ref_points_depth) {
>>  		/*
>>  		 * Skip the length field and send start of associativity array
>>  		 */
>> 
>> I haven't tried dlpar add/remove. I don't have a setup to try that. Do you
>> see a problem there?
>> 
>
> Yes, I think there can be 2 problems.
>
> 1. distance table may be filled with incorrect data.
> 2. numactl -H distance table shows symmetric data, the symmetric nature may
> be lost.
>

After discussing with srikar to understand these concern better, below
are the conclusions.

1) There is no corruption of node distance. We do handle node distance
correctly. But the numactl -H output can be such that we won't find the
numa nodes with a higher number to be further away from node 0. ie. We can
find output like below.

node  0  1   2  3
  0:  10  40  40 20
  1:  40  10  40 40
  2:  40  40  10 40
  3:  20  40  40 10

Here node 3 is closer to node 0  Than node 1 and 2. I am not sure this
is going to break any userspace.

2) We can find node number changing if we do a DLPAR add of memory/cpu
and reboot. ie, we boot with resource domain id 4 and 6 and then later
add resources from domain 5. In this above case, we will have node 0,1
and 2 mapping domain id 4, 6, 5. On reboot, we can map them such that

node 0 -> 4
node 1 -> 5
node 2 -> 6

I guess this is still ok because we are running in a virtualized
environment and node numbers to domain id are never guaranteed to be he
same across reboot.

-aneesh
