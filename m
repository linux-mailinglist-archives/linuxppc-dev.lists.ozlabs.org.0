Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3111C0DE5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 07:52:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49D1bk3W3wzDrQP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 15:52:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49D1Z53tFmzDrPm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 15:50:37 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0415Vhxw062214; Fri, 1 May 2020 01:50:31 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30r828g29s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 01:50:31 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0415nt5O004653;
 Fri, 1 May 2020 05:50:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 30mcu736xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 05:50:30 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0415oT8311272566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 May 2020 05:50:29 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BDE9136063;
 Fri,  1 May 2020 05:50:29 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CAF613604F;
 Fri,  1 May 2020 05:50:28 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.178.206])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 May 2020 05:50:28 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id B327A2E30A9; Fri,  1 May 2020 11:20:23 +0530 (IST)
Date: Fri, 1 May 2020 11:20:23 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/5] Track and expose idle PURR and SPURR ticks
Message-ID: <20200501055023.GA24574@in.ibm.com>
References: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
 <04b5e2fa-089f-93c9-cde9-33a930455bb2@linux.ibm.com>
 <20200423100213.GA23192@in.ibm.com>
 <871ro5g0qb.fsf@mpe.ellerman.id.au>
 <20200430041612.GA25522@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430041612.GA25522@in.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-01_01:2020-04-30,
 2020-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005010035
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 30, 2020 at 09:46:13AM +0530, Gautham R Shenoy wrote:
> Hello Michael,
> > >
> > > Michael, could you please consider this for 5.8 ?
> > 
> > Yes. Has it been tested on KVM at all?
> 
> No. I haven't tested this on KVM. Will do that today.


The results on Shared LPAR and KVM are as follows:
---------------------------------------------------

The lparstat results on a Shared LPAR are consistent with that
observed on a dedicated LPAR when at least one of the threads of the
core is active. When all the threads are idle, the lparstat shows
incorrect idle percentage. But this is perhaps due to the fact that
the Hypervisor puts a completely idle core in some power-saving state
with runlatch turned off due to which PURR counts on the threads of a
core do not add up to the elapsed timebase ticks. The results are in
section A) below.

lparstat is not supported on KVM. However, I performed some basic
sanity checks on purr, spurr, idle_purr, and idle_spurr sysfs files
that show up after this patch series. When CPUs are offlined, the
idle_purr and idle_spurr sysfs files no longer show up, just like purr
and spurr sysfs files. The values of the counters monotonically
increase, except when the CPU is busy, in which case the idle_purr and
idle_spurr counts are stagnant as expected.

However, I don't think the even the values of PURR or SPURR make much
sense on KVM guest, since the Linux Hypervisor doesn't set additional
registers such as RWMR, except on POWER8, where the KVM sets RWMR
corresponding to the number of online threads in a vCORE before
dispatching the vcore. I haven't been able to test it on a POWER8
guest yet. The results on POWER9 are in section B) below.


A ) Shared LPAR
======================

1. When all the threads of the core are running a CPU-Hog

# ./lparstat -E 1 5
System Configuration
type=Shared mode=Capped smt=8 lcpu=6 mem=10362752 kB cpus=10 ent=6.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
100.00   0.00  2.90GHz[126%] 126.00   0.00
100.00   0.00  2.90GHz[126%] 126.00   0.00
100.00   0.00  2.90GHz[126%] 126.00   0.00
100.00   0.00  2.90GHz[126%] 126.00   0.00
100.01   0.00  2.90GHz[126%] 126.01   0.00

2. When 4 threads of a core are running CPU Hogs, with the remaining 4
threads idle.

# ./lparstat -E 1 5
System Configuration
type=Shared mode=Capped smt=8 lcpu=6 mem=10362752 kB cpus=10 ent=6.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
 81.06  18.94  2.97GHz[129%] 104.56  24.44
 81.05  18.95  2.97GHz[129%] 104.56  24.44
 81.06  18.95  2.97GHz[129%] 104.56  24.44
 81.06  18.95  2.97GHz[129%] 104.56  24.44
 81.05  18.95  2.97GHz[129%] 104.56  24.45

3. When 2 threads of a core are running CPU Hogs, with the other 6
threads idle.

# ./lparstat -E 1 5
System Configuration
type=Shared mode=Capped smt=8 lcpu=6 mem=10362752 kB cpus=10 ent=6.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
 65.21  34.79  3.13GHz[136%]  88.69  47.31
 65.20  34.81  3.13GHz[136%]  88.67  47.33
 64.25  35.76  3.13GHz[136%]  87.38  48.63
 63.68  36.31  3.13GHz[136%]  86.60  49.39
 63.55  36.45  3.13GHz[136%]  86.42  49.58
 

4. When a single thread of the core is running CPU Hog, remaining 7
threads are idle.
# ./lparstat -E 1 5
System Configuration
type=Shared mode=Capped smt=8 lcpu=6 mem=10362752 kB cpus=10 ent=6.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
 31.80  68.20  3.20GHz[139%]  44.20  94.80
 31.80  68.20  3.20GHz[139%]  44.20  94.81
 31.80  68.20  3.20GHz[139%]  44.20  94.80
 31.80  68.21  3.20GHz[139%]  44.20  94.81
 31.79  68.21  3.20GHz[139%]  44.19  94.81

5. When the LPAR is idle:

# ./lparstat -E 1 5
System Configuration
type=Shared mode=Capped smt=8 lcpu=6 mem=10362752 kB cpus=10 ent=6.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
  0.04   0.14  2.41GHz[105%]   0.04   0.15
  0.04   0.15  2.36GHz[102%]   0.04   0.15
  0.03   0.13  2.35GHz[102%]   0.03   0.14
  0.03   0.13  2.31GHz[100%]   0.03   0.13
  0.03   0.13  2.32GHz[101%]   0.03   0.14

In this case, the sum of the PURR values do not add up to the elapsed
TB. This is probably due to the Hypervisor putting the core into some
power-saving state with the runlatch turned off.

# ./purr_tb -t 8
Got threads_per_core = 8
CORE 0: 
		CPU 0 : Delta PURR : 85744 
		CPU 1 : Delta PURR : 113632 
		CPU 2 : Delta PURR : 78224 
		CPU 3 : Delta PURR : 68856 
		CPU 4 : Delta PURR : 78064 
		CPU 5 : Delta PURR : 60488 
		CPU 6 : Delta PURR : 77776 
		CPU 7 : Delta PURR : 59464 
Total Delta PURR : 622248 (Expected ~513156096)


B) KVM guest
==============================


vCPU idle:
-------------
Sampled every second when the KVM guest (1 socket, 2 cores, 4 threads,
vCPUs pinned) was idle. The value monotonically increase over time as
expected.


idle_purr:33128550
idle_spurr:3e3c775c
purr:d48181820
spurr:10295e8f28

idle_purr:331319f0
idle_spurr:3e3d56a4
purr:d481c4600
spurr:102964d3f0

idle_purr:331378c0
idle_spurr:3e3de58c
purr:d481faea0
spurr:102969f118

idle_purr:3313daa0
idle_spurr:3e3e77a4
purr:d4822c750
spurr:10296e9538

idle_purr:33143ab0
idle_spurr:3e3f093c
purr:d482608c0
spurr:1029737808

vCPU busy
---------------
Sampled every second on the same KVM guest, when the vCPU was running
a cpu-hog. The values of purr and spurr monotonically increase. And
the values of idle_purr and idle_spurr are stagnant as expected.

idle_purr:3335fca0
idle_spurr:3e71a774
purr:d5dd6bca0
spurr:1049fca1f0

idle_purr:3335fca0
idle_spurr:3e71a774
purr:d7c6f1c50
spurr:1077e12d40

idle_purr:3335fca0
idle_spurr:3e71a774
purr:d9b078720
spurr:10a5c5cc08

idle_purr:3335fca0
idle_spurr:3e71a774
purr:db99ef1d0
spurr:10d3a8eac0

idle_purr:3335fca0
idle_spurr:3e71a774
purr:dd8365c20
spurr:11018c0908


However, I don't think the even the values of PURR or SPURR make any
sense on KVM guest, since the Linux Hypervisor doesn't set additional
registers such as RWMR, except on POWER8, where the KVM sets RWMR
corresponding to the number of online threads in a vCORE before
dispatching the vcore.

On a POWER9 KVM guest:

When it is idle:

# ./purr_tb -t 4
Got threads_per_core = 4
CORE 0: 
		CPU 0 : Delta PURR : 2371632 
		CPU 1 : Delta PURR : 5056 
		CPU 2 : Delta PURR : 8016 
		CPU 3 : Delta PURR : 12688 
Total Delta PURR : 2397392 (Expected ~514567680)


When all the threads are running CPU Hogs:
# ./purr_tb -t 4
Got threads_per_core = 4
CORE 0: 
		CPU 0 : Delta PURR : 510742304 
		CPU 1 : Delta PURR : 510747696 
		CPU 2 : Delta PURR : 510740208 
		CPU 3 : Delta PURR : 510735200 
Total Delta PURR : 2042965408 (Expected ~512289792)

> 
> 
> > 
> > cheers
> 
--
Thanks and Regards
gautham.
