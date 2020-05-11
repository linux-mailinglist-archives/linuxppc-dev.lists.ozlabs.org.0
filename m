Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7E61CE20C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 19:53:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LT7c1WdKzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 03:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LT156kztzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 03:47:53 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BHZtqx098804; Mon, 11 May 2020 13:47:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wry0nbd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 13:47:39 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04BHa3UB099843;
 Mon, 11 May 2020 13:47:38 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wry0nbcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 13:47:38 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04BHlbYA028935;
 Mon, 11 May 2020 17:47:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 30wm559yfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 17:47:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04BHlYSm64290822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 17:47:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EB434C046;
 Mon, 11 May 2020 17:47:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 933F54C044;
 Mon, 11 May 2020 17:47:32 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 11 May 2020 17:47:32 +0000 (GMT)
Date: Mon, 11 May 2020 23:17:31 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200511174731.GD1961@linux.vnet.ibm.com>
References: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
 <20200428093836.27190-4-srikar@linux.vnet.ibm.com>
 <20200428165912.ca1eadefbac56d740e6e8fd1@linux-foundation.org>
 <20200429014145.GD19958@linux.vnet.ibm.com>
 <20200429122211.GD28637@dhcp22.suse.cz>
 <20200430071820.GF19958@linux.vnet.ibm.com>
 <20200504093712.GL22838@dhcp22.suse.cz>
 <20200508130304.GA1961@linux.vnet.ibm.com>
 <3bfe7469-1d8c-baa4-6d9d-f4786492eaa8@redhat.com>
 <ce9d47bc-f92c-dd22-0d59-e8d59c913526@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ce9d47bc-f92c-dd22-0d59-e8d59c913526@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_08:2020-05-11,
 2020-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 suspectscore=2 mlxlogscore=999 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110137
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* David Hildenbrand <david@redhat.com> [2020-05-08 15:42:12]:

Hi David,

Thanks for the steps to tryout.

> > 
> > #! /bin/bash
> > sudo x86_64-softmmu/qemu-system-x86_64 \
> >     --enable-kvm \
> >     -m 4G,maxmem=20G,slots=2 \
> >     -smp sockets=2,cores=2 \
> >     -numa node,nodeid=0,cpus=0-1,mem=4G -numa node,nodeid=1,cpus=2-3,mem=0G \
> 
> Sorry, this line has to be
> 
> -numa node,nodeid=0,cpus=0-3,mem=4G -numa node,nodeid=1,mem=0G \
> 
> >     -kernel /home/dhildenb/git/linux/arch/x86_64/boot/bzImage \
> >     -append "console=ttyS0 rd.shell rd.luks=0 rd.lvm=0 rd.md=0 rd.dm=0" \
> >     -initrd /boot/initramfs-5.2.8-200.fc30.x86_64.img \
> >     -machine pc,nvdimm \
> >     -nographic \
> >     -nodefaults \
> >     -chardev stdio,id=serial \
> >     -device isa-serial,chardev=serial \
> >     -chardev socket,id=monitor,path=/var/tmp/monitor,server,nowait \
> >     -mon chardev=monitor,mode=readline
> > 
> > to get a cpu-less and memory-less node 1. Never tried with node 0.
> > 

I tried 

qemu-system-x86_64 -enable-kvm -m 4G,maxmem=20G,slots=2 -smp sockets=2,cores=2 -cpu host -numa node,nodeid=0,cpus=0-3,mem=4G -numa node,nodeid=1,mem=0G -vga none -nographic -serial mon:stdio /home/srikar/fedora.qcow2

and the resulting guest was.

[root@localhost ~]# numactl -H
available: 1 nodes (0)
node 0 cpus: 0 1 2 3
node 0 size: 3927 MB
node 0 free: 3316 MB
node distances:
node   0
  0:  10

[root@localhost ~]# lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       40 bits physical, 48 bits virtual
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  1
Core(s) per socket:  2
Socket(s):           2
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               46
Model name:          Intel(R) Xeon(R) CPU           X7560  @ 2.27GHz
Stepping:            6
CPU MHz:             2260.986
BogoMIPS:            4521.97
Virtualization:      VT-x
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            4096K
L3 cache:            16384K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc arch_perfmon rep_good nopl xtopology cpuid tsc_known_freq pni vmx ssse3 cx16 sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer hypervisor lahf_lm cpuid_fault pti ssbd ibrs ibpb tpr_shadow vnmi flexpriority ept vpid tsc_adjust arat umip arch_capabilities

[root@localhost ~]# cat /sys/devices/system/node/online
0
[root@localhost ~]# cat /sys/devices/system/node/possible
0-1

---------------------------------------------------------------------------------

I also tried

qemu-system-x86_64 -enable-kvm -m 4G,maxmem=20G,slots=2 -smp sockets=2,cores=2 -cpu host -numa node,nodeid=1,cpus=0-3,mem=4G -numa node,nodeid=0,mem=0G -vga none -nographic -serial mon:stdio /home/srikar/fedora.qcow2

and the resulting guest was.

[root@localhost ~]# numactl -H
available: 1 nodes (0)
node 0 cpus: 0 1 2 3
node 0 size: 3927 MB
node 0 free: 3316 MB
node distances:
node   0
  0:  10

[root@localhost ~]# lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       40 bits physical, 48 bits virtual
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  1
Core(s) per socket:  2
Socket(s):           2
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               46
Model name:          Intel(R) Xeon(R) CPU           X7560  @ 2.27GHz
Stepping:            6
CPU MHz:             2260.986
BogoMIPS:            4521.97
Virtualization:      VT-x
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            4096K
L3 cache:            16384K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc arch_perfmon rep_good nopl xtopology cpuid tsc_known_freq pni vmx ssse3 cx16 sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer hypervisor lahf_lm cpuid_fault pti ssbd ibrs ibpb tpr_shadow vnmi flexpriority ept vpid tsc_adjust arat umip arch_capabilities

[root@localhost ~]# cat /sys/devices/system/node/online
0
[root@localhost ~]# cat /sys/devices/system/node/possible
0-1

Even without my patch, both the combinations, I am still unable to see a
cpuless, memoryless node being online. And the interesting part being even
if I mark node 0 as cpuless,memoryless and node 1 as actual node, the system
somewhere marks node 0 as the actual node.

> 
> David / dhildenb
> 

-- 
Thanks and Regards
Srikar Dronamraju
