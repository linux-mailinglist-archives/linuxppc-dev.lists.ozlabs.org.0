Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D028F8C75BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 14:14:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ulu2hQHe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg8DK2GqMz3frF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 22:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ulu2hQHe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg2rz2blCz3ck4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 18:12:50 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44G72Vx0018837;
	Thu, 16 May 2024 08:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jX+HvO+TODWCrUc/zo/e3h/xPUqqlxLY6EFb8uPx8nw=;
 b=Ulu2hQHeJnAV9n6AAfl1VU2oLWvMQ9JTM08i3WncZk07UvvYTuuFg4lySlrToPpbRvRo
 6IunFqfkf++VAqLhF/bhP1lGrJN03oxuOTK4sZsHgLdEQNBs0rJ0MOwhJLQ4V8uIUsJW
 96AFdfwm9jPWKAkz2TjE3vVJH3E0dgO5NhKO+xV7QlVa1wBZkdHNNy7dI5/oCnU8I8ez
 2W81Y9Kp83Y1DSsTJIfVS/hF4QnZDkUS33ZCLjIaRIGWBNWuKNGzuXucHAWo07E1xc2E
 CsZlKTvOSyj12WggBzReOr0Xdi6S61AwceZ+mkM5cuOntc53Uagm82mDSKl3GmHi6Auz Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5dd8868c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 08:12:43 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44G8Cg1J011650;
	Thu, 16 May 2024 08:12:42 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5dd88689-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 08:12:42 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44G5AQUr005504;
	Thu, 16 May 2024 08:12:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2nq30dv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 08:12:41 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44G8CZsh55837084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 08:12:37 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EF102004B;
	Thu, 16 May 2024 08:12:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 870FC20040;
	Thu, 16 May 2024 08:12:33 +0000 (GMT)
Received: from li-c9696b4c-3419-11b2-a85c-f9edc3bf8a84.in.ibm.com (unknown [9.109.198.160])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 08:12:33 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH 0/1] powerpc/numa: Make cpu/memory less numa-node online
Date: Thu, 16 May 2024 13:42:21 +0530
Message-ID: <20240516081230.3119651-1-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nMn4ToLKEQmIafJjExC8hr_CxScDuLSA
X-Proofpoint-ORIG-GUID: W3SV6fOPpP5tFbx4u_A_Bz_XgQ2RXCV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_03,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160057
X-Mailman-Approved-At: Thu, 16 May 2024 22:14:22 +1000
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
Cc: gjoyce@linux.ibm.com, srikar@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On NUMA aware system, we make a numa-node online only if that node is 
attached to cpu/memory. However it's possible that we have some PCI/IO 
device affinitized to a numa-node which is not currently online. In such 
case we set the numa-node id of the corresponding PCI device to -1 
(NUMA_NO_NODE). Not assigning the correct numa-node id to PCI device may 
impact the performance of such device. For instance, we have a multi 
controller NVMe disk where each controller of the disk is attached to 
different PHB (PCI host bridge). Each of these PHBs has numa-node id 
assigned during PCI enumeration. During PCI enumeration if we find that
the numa-node is not online then we set the numa-node id of the PHB to -1. 
If we create shared namespace and attach to multi controller NVMe disk 
then that namespace could be accessed through each controller and as each 
controller is connected to different PHBs, it's possible to access the 
same namespace using multiple PCI channel. While sending IO to a shared 
namespace, NVMe driver would calculate the optimal IO path using numa-node 
distance. However if the numa-node id is not correctly assigned to NVMe 
PCIe controller then it's possible that driver would calculate incorrect 
NUMA distance and hence select the non-optimal path for sending IO. If 
this happens then we could potentially observe the degraded IO performance.

Please find below the performance of a multi-controller NVMe disk w/ and 
w/o the proposed patch applied:

# lspci 
0524:28:00.0 Non-Volatile memory controller: KIOXIA Corporation NVMe SSD Controller CM7 2.5" (rev 01)
0584:28:00.0 Non-Volatile memory controller: KIOXIA Corporation NVMe SSD Controller CM7 2.5" (rev 01)

# nvme list -v 
Subsystem        Subsystem-NQN                                                                                    Controllers
---------------- ------------------------------------------------------------------------------------------------ ----------------
nvme-subsys1     nqn.2019-10.com.kioxia:KCM7DRUG1T92:3D60A04906N1                                                 nvme0, nvme1

Device   SN                   MN                                       FR       TxPort Asdress        Slot   Subsystem    Namespaces      
-------- -------------------- ---------------------------------------- -------- ------ -------------- ------ ------------ ----------------
nvme0    3D60A04906N1         1.6TB NVMe Gen4 U.2 SSD IV               REV.CAS2 pcie   0524:28:00.0          nvme-subsys1 nvme1n3
nvme1    3D60A04906N1         1.6TB NVMe Gen4 U.2 SSD IV               REV.CAS2 pcie   0584:28:00.0          nvme-subsys1 nvme1n3

Device       Generic      NSID       Usage                      Format           Controllers     
------------ ------------ ---------- -------------------------- ---------------- ----------------
/dev/nvme1n3 /dev/ng1n3   0x3          5.75  GB /   5.75  GB      4 KiB +  0 B   nvme0, nvme1

We can see above the nvme disk has two controllers nvme0 and nvme1.Both 
these controllers can be accessed from two different PCI channels (0524:28 
and 0584:28). 
I have also created a shared namespace (/dev/nvme1n3) which is connected 
behind controllers nvme0 and nvme1.

Test-1: Measure IO performance w/o proposed patch:
--------------------------------------------------
# numactl -H 
available: 1 nodes (0)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
node 0 size: 31565 MB
node 0 free: 28452 MB
node distances:
node   0 
  0:  10 

On this machine we only have node 0 online. 

# cat /sys/class/nvme/nvme1/numa_node 
-1
# cat /sys/class/nvme/nvme0/numa_node 
0 
# cat /sys/class/nvme-subsystem/nvme-subsys1/iopolicy 
numa

We can find above the numa node id assigned to nvme1 is -1, however, the 
numa node id assigned to nvme0 is 0. Also the iopolicy is set to numa.

Now we would run IO perf test and measure the performance:

# fio --filename=/dev/nvme1n3 --direct=1 --rw=randwrite  --bs=4k --ioengine=io_uring --iodepth=512 --runtime=60 --numjobs=4 --time_based --group_reporting --name=iops-test-job --eta-newline=1 --cpus_allowed=0-3 
iops-test-job: (g=0): rw=randwrite, bs=(R) 4096B-4096B, (W) 4096B-4096B, (T) 4096B-4096B, ioengine=io_uring, iodepth=512
...
fio-3.35
Starting 4 processes
[...]
[...]
iops-test-job: (groupid=0, jobs=4): err= 0: pid=5665: Tue Apr 30 04:07:31 2024
  write: IOPS=632k, BW=2469MiB/s (2589MB/s)(145GiB/60003msec); 0 zone resets
    slat (usec): min=2, max=10031, avg= 4.62, stdev= 5.40
    clat (usec): min=12, max=15687, avg=3233.58, stdev=877.78
     lat (usec): min=16, max=15693, avg=3238.19, stdev=879.06
    clat percentiles (usec):
     |  1.00th=[ 2868],  5.00th=[ 2900], 10.00th=[ 2900], 20.00th=[ 2900],
     | 30.00th=[ 2933], 40.00th=[ 2933], 50.00th=[ 2933], 60.00th=[ 2933],
     | 70.00th=[ 2933], 80.00th=[ 2966], 90.00th=[ 5604], 95.00th=[ 5669],
     | 99.00th=[ 5735], 99.50th=[ 5735], 99.90th=[ 5866], 99.95th=[ 6456],
     | 99.99th=[15533]
   bw (  MiB/s): min= 1305, max= 2739, per=99.94%, avg=2467.92, stdev=130.72, samples=476
   iops        : min=334100, max=701270, avg=631786.39, stdev=33464.48, samples=476
  lat (usec)   : 20=0.01%, 50=0.01%, 100=0.01%, 250=0.01%, 500=0.01%
  lat (usec)   : 750=0.01%, 1000=0.01%
  lat (msec)   : 2=0.01%, 4=88.87%, 10=11.10%, 20=0.02%
  cpu          : usr=37.15%, sys=62.78%, ctx=638, majf=0, minf=50
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.1%
     issued rwts: total=0,37932685,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=512

Run status group 0 (all jobs):
  WRITE: bw=2469MiB/s (2589MB/s), 2469MiB/s-2469MiB/s (2589MB/s-2589MB/s), io=145GiB (155GB), run=60003-60003msec

Disk stats (read/write):
  nvme0n3: ios=0/0, merge=0/0, ticks=0/0, in_queue=0, util=99.87%

While test is running we could enable trace event to capture and see 
the controller being used by driver to perform the IO.

# tail -5  /sys/kerenl/debug/tracing/trace
             fio-5665    [002] .....   508.635554: nvme_setup_cmd: nvme1: disk=nvme0c1n3, qid=3, cmdid=57856, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=748098, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5666    [000] .....   508.635554: nvme_setup_cmd: nvme1: disk=nvme0c1n3, qid=1, cmdid=8385, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=139215, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5667    [001] .....   508.635557: nvme_setup_cmd: nvme1: disk=nvme0c1n3, qid=2, cmdid=21440, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=815508, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5668    [003] .....   508.635558: nvme_setup_cmd: nvme1: disk=nvme0c1n3, qid=4, cmdid=33089, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=405932, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5665    [002] .....   508.635771: nvme_setup_cmd: nvme1: disk=nvme0c1n3, qid=3, cmdid=37376, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=497267, len=0, ctrl=0x0, dsmgmt=0, reftag=0)

From the above output we can notice that driver is using controller nvme1
 for performing IO however this IO path could be sub-optimal as the numa 
id assigned to nvme1 is -1 and so driver couldn't accurately calculate 
numa node distance for this controller wrt to the cpu node 0 where this 
test is running. Ideally, the driver could have used the nvme0 to perform 
IO for optimal IO path. 

In the fio/perf test result above we have got write IOPS 632k and 
BW 2589MB/s.

Test-2: Measure IO performance w/ proposed patch:
-------------------------------------------------
# numactl -H 
available: 3 nodes (0,2-3)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
node 0 size: 31565 MB
node 0 free: 28740 MB
node 2 cpus:
node 2 size: 0 MB
node 2 free: 0 MB
node distances:
node   0   2  
  0:  10  40 
  2:  40  10

# cat /sys/class/nvme/nvme0/numa_node
0
# cat /sys/class/nvme/nvme1/numa_node
2
# cat /sys/class/nvme-subsystem/nvme-subsys1/iopolicy
numa

We could now see above numa node id 2 is made online.The numa node 2 is 
cpu/memory less. The nvme1 controller is now assigned the numa node id 2. 

Let's run IO perf test and measure the performance:

# fio --filename=/dev/nvme1n3 --direct=1 --rw=randwrite  --bs=4k --ioengine=io_uring --iodepth=512 --runtime=60 --numjobs=4 --time_based --group_reporting --name=iops-test-job --eta-newline=1 --cpus_allowed=0-3 
iops-test-job: (g=0): rw=randwrite, bs=(R) 4096B-4096B, (W) 4096B-4096B, (T) 4096B-4096B, ioengine=io_uring, iodepth=512
...
fio-3.35
Starting 4 processes
[...]
[...]
iops-test-job: (groupid=0, jobs=4): err= 0: pid=5661: Tue Apr 30 04:33:46 2024
  write: IOPS=715k, BW=2792MiB/s (2928MB/s)(164GiB/60001msec); 0 zone resets
    slat (usec): min=2, max=10023, avg= 4.09, stdev= 4.40
    clat (usec): min=11, max=12874, avg=2859.70, stdev=109.44
     lat (usec): min=15, max=12878, avg=2863.78, stdev=109.54
    clat percentiles (usec):
     |  1.00th=[ 2737],  5.00th=[ 2835], 10.00th=[ 2835], 20.00th=[ 2835],
     | 30.00th=[ 2835], 40.00th=[ 2868], 50.00th=[ 2868], 60.00th=[ 2868],
     | 70.00th=[ 2868], 80.00th=[ 2868], 90.00th=[ 2900], 95.00th=[ 2900],
     | 99.00th=[ 2966], 99.50th=[ 2999], 99.90th=[ 3064], 99.95th=[ 3097],
     | 99.99th=[12780]
   bw (  MiB/s): min= 2656, max= 2834, per=100.00%, avg=2792.81, stdev= 4.73, samples=476
   iops        : min=680078, max=725670, avg=714959.61, stdev=1209.66, samples=476
  lat (usec)   : 20=0.01%, 50=0.01%, 100=0.01%, 250=0.01%, 500=0.01%
  lat (usec)   : 750=0.01%, 1000=0.01%
  lat (msec)   : 2=0.01%, 4=99.99%, 10=0.01%, 20=0.01%
  cpu          : usr=36.22%, sys=63.73%, ctx=838, majf=0, minf=50
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.1%
     issued rwts: total=0,42891699,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=512

Run status group 0 (all jobs):
  WRITE: bw=2792MiB/s (2928MB/s), 2792MiB/s-2792MiB/s (2928MB/s-2928MB/s), io=164GiB (176GB), run=60001-60001msec

Disk stats (read/write):
  nvme1n3: ios=0/0, merge=0/0, ticks=0/0, in_queue=0, util=99.87%

While test is running we could enable trace event to capture and see
the controller being used by driver to perform the IO.

# tail -5  /sys/kernel/debug/tracing/trace
             fio-5661    [000] .....   673.238805: nvme_setup_cmd: nvme0: disk=nvme0c0n3, qid=1, cmdid=61953, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=589070, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5664    [003] .....   673.238807: nvme_setup_cmd: nvme0: disk=nvme0c0n3, qid=4, cmdid=12802, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=1235913, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5661    [000] .....   673.238809: nvme_setup_cmd: nvme0: disk=nvme0c0n3, qid=1, cmdid=57858, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=798690, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5664    [003] .....   673.238814: nvme_setup_cmd: nvme0: disk=nvme0c0n3, qid=4, cmdid=37376, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=643839, len=0, ctrl=0x0, dsmgmt=0, reftag=0)
             fio-5661    [000] .....   673.238814: nvme_setup_cmd: nvme0: disk=nvme0c0n3, qid=1, cmdid=4608, nsid=3, flags=0x0, meta=0x0, cmd=(nvme_cmd_write slba=1319701, len=0, ctrl=0x0, dsmgmt=0, reftag=0)

We can notice above that driver is now using nvme0 for IO. As this test is 
running on cpu node 0 and the numa node id assigned to nvme0 is also 0, 
the nvme0 is the optimal IO path. With this patch, the driver is able to 
accurately calculate numa node distance and select nvme0 as optimal IO 
path. 

In the fio/perf test result above we have got write IOPS 715k and 
BW 2928MB/s.

Summary:
--------
In summary, after comparing both tests results, it's apparent 
that with the proposed patch driver could choose the optimal 
IO path when iopolicy is set to NUMA and we get the better 
IO performance. With the proposed patch we get ~12% of perf-
ormance improvment.

Nilay Shroff (1):
  powerpc/numa: Online a node if PHB is attached.

 arch/powerpc/mm/numa.c                     | 14 +++++++++++++-
 arch/powerpc/platforms/pseries/pci_dlpar.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.44.0
