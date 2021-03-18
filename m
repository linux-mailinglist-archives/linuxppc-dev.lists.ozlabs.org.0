Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A634070C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 14:43:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1SsD2rqRz3bsY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 00:43:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eQCepWVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eQCepWVv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Srm0cSQz301y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 00:42:47 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IDYIMa016073; Thu, 18 Mar 2021 09:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=llbZw672HXAWMdKoZ53VTh6wBWMu5Gei3giuBpOWfjk=;
 b=eQCepWVvp0RMug2Ibuu6/Zf4fE8YT5kYiwZzsoFdz/5dn9WnqYj5SQYZc1SeCagwny/V
 JiWDyorJ0Unp5q0o//2Vc7MDRCL4pr13Jq3z1CERA0gr1u0YpYLei8efscJwBqQapFzN
 Eqe+cFEvEHs+AX1visRfZPIw/Jnm3KHrJXyEFdxVxfbL+hkEiqKvS5fzCVKf2aG2dcbN
 fthsw+7cHz6FeXtZtzuJSGErpCFeIoGjGKQl5uaF2CzB33KBoP3xq13qmwzBRcbWFXre
 33TQuQ/J/nYT7FMJ88arEJE30j9Ny0wjsowbJMkf7dtsrPnBCOeafek6xJmG6Q/wDH2e ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37c102d4vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 09:42:43 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12IDYKOQ016288;
 Thu, 18 Mar 2021 09:42:42 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37c102d4uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 09:42:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12IDgN2L008745;
 Thu, 18 Mar 2021 13:42:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37b30p1ndg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 13:42:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12IDgbsY24314140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 13:42:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8A1552057;
 Thu, 18 Mar 2021 13:42:37 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id BB9F252050;
 Thu, 18 Mar 2021 13:42:36 +0000 (GMT)
Date: Thu, 18 Mar 2021 19:12:36 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: Advice needed on SMP regression after cpu_core_mask change
Message-ID: <20210318134236.GC2339179@linux.vnet.ibm.com>
References: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_07:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180099
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: aneesh.kumar@in.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Daniel Henrique Barboza <danielhb413@gmail.com> [2021-03-17 10:00:34]:

> Hello,
> 
> Patch 4bce545903fa ("powerpc/topology: Update topology_core_cpumask") introduced
> a regression in both upstream and RHEL downstream kernels [1]. The assumption made
> in the commit:
> 
> "Further analysis shows that cpu_core_mask and cpu_cpu_mask for any CPU would be
> equal on Power"
> 
> Doesn't seem to be true. After this commit, QEMU is now unable to set single NUMA
> node SMP topologies such as:
> 
> -smp 8,maxcpus=8,cores=2,threads=2,sockets=2

What does it mean for a NUMA to have more than one sockets?
If they are all part of the same node, there are at local distance to each
other. cache is per core. So what resources are shared by the Sockets that
are part of the same NUMA. And how does Userspace/ application make use of
the same.

Please don't mistake this as attempt to downplay your report but a honest
attempt to better understand the situation.

For example, if the socket denotes the hemisphere logic in P10, then can we
see if the coregroup feature can be used. "Coregroup" is suppose to mean a
set of cores within a NUMA that have some characteristics and there can be
multiple coregroups within a NUMA. We add that mostly to mimic hemisphere in
P10. However the number of coregroups in a NUMA is not exported to userspace
at this time.

However if each Socket is associated with a memory and node distance, then
should they be NUMA?

Can you provide me with the unique ibm,chip-ids in your 2 NUMA, 4 node case?
Does this cause an performance issues with the guest/application?

Till your report, I was under the impression that NUMAs == Sockets.

> 
> lscpu will give the following output in this case:
> 
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  4
> Socket(s):           1
> NUMA node(s):        1
> Model:               2.2 (pvr 004e 1202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   KVM
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> NUMA node0 CPU(s):   0-7
> 
> 
> This is happening because the macro cpu_cpu_mask(cpu) expands to
> cpumask_of_node(cpu_to_node(cpu)), which in turn expands to node_to_cpumask_map[node].
> node_to_cpumask_map is a NUMA array that maps CPUs to NUMA nodes (Aneesh is on CC to
> correct me if I'm wrong). We're now associating sockets to NUMA nodes directly.
> 
> If I add a second NUMA node then I can get the intended smp topology:
> 
> -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
> -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
> -numa node,memdev=mem1,cpus=4-7,nodeid=1 \
> 
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  2
> Socket(s):           2
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 1202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   KVM
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> NUMA node0 CPU(s):   0-3
> NUMA node1 CPU(s):   4-7
> 
> 
> However, if I try a single socket with multiple NUMA nodes topology, which is the case
> of Power10, e.g.:
> 
> 
> -smp 8,maxcpus=8,cores=4,threads=2,sockets=1
> -numa node,memdev=mem0,cpus=0-3,nodeid=0 \
> -numa node,memdev=mem1,cpus=4-7,nodeid=1 \
> 
> 
> This is the result:
> 
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              8
> On-line CPU(s) list: 0-7
> Thread(s) per core:  2
> Core(s) per socket:  2
> Socket(s):           2
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 1202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   KVM
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> NUMA node0 CPU(s):   0-3
> NUMA node1 CPU(s):   4-7
> 
> 
> This confirms my suspicions that, at this moment, we're making sockets == NUMA nodes.
> 
> 
> Cedric, the reason I'm CCing you is because this is related to ibm,chip-id. The commit
> after the one that caused the regression, 4ca234a9cbd7c3a65 ("powerpc/smp: Stop updating
> cpu_core_mask"), is erasing the code that calculated cpu_core_mask. cpu_core_mask, despite
> its shortcomings that caused its removal, was giving a precise SMP topology. And it was
> using physical_package_id/'ibm,chip-id' for that.
> 
> Checking in QEMU I can say that the ibm,chip-id calculation is the only place in the code
> that cares about cores per socket information. The kernel is now ignoring that, starting
> on 4bce545903fa, and now QEMU is unable to provide this info to the guest.
> 
> If we're not going to use ibm,chip-id any longer, which seems sensible given that PAPR does
> not declare it, we need another way of letting the guest know how much cores per socket
> we want.
> 
> 
> 
> [1] https://bugzilla.redhat.com/1934421
> 
> 
> 
> Thanks,
> 
> 
> DHB

-- 
Thanks and Regards
Srikar Dronamraju
