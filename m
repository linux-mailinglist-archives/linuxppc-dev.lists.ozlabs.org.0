Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0A26809C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 19:45:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqH241CS8zDqNt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 03:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathnaga@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UJZKy2mk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqH0J1xSGzDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 03:43:21 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08DHX57K118157; Sun, 13 Sep 2020 13:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=raGJKI+HRFvs4YXTZcQuyRCT/PKrNxwk6roMThBfvRQ=;
 b=UJZKy2mksVEVyQ1/bBumJ7TNYkAzG8GgFzLFJ75LR759wZrN+QJ2klZZdkIPeqCh1WTE
 NGR676cNJ+0JD51U0G980LCQGRdKp39zH7fbhsfGDX2d43Sviv/6RBIhnTwaxToshARI
 fG+uM4EXEJoVrC/usBAzGGR1i5KZJNvC56N1CAF06ENfVuCyag0s6gWpBTOmla8lqt5W
 T6Njr3bd5TgUY76bzxAKK69DlaCwl1gGQdN35UoGltCLIKKM1Ge1DIdV20Uws8YNdPPr
 khAItSc5J62HGgxewgf5oJguJ6PYFCIIWRpz4CgS15hVIO1UECa9MssQbjGVF6YkU0Md /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hn0ctygc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 13:43:07 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08DHY2X8119839;
 Sun, 13 Sep 2020 13:43:06 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33hn0ctyfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 13:43:06 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08DHh4W7013004;
 Sun, 13 Sep 2020 17:43:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 33hkfag327-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Sep 2020 17:43:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08DHh24X9699678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Sep 2020 17:43:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10A25A405B;
 Sun, 13 Sep 2020 17:43:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22906A4054;
 Sun, 13 Sep 2020 17:42:58 +0000 (GMT)
Received: from satheesh (unknown [9.85.80.111])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 13 Sep 2020 17:42:57 +0000 (GMT)
Date: Sun, 13 Sep 2020 23:12:54 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200913174254.GA561070@satheesh>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
 <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
 <87y2lgr0ic.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2lgr0ic.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-13_06:2020-09-10,
 2020-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009130160
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
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 09:55:23PM +1000, Michael Ellerman wrote:
> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > Current code assumes that cpumask of cpus sharing a l2-cache mask will
> > always be a superset of cpu_sibling_mask.
> >
> > Lets stop that assumption. cpu_l2_cache_mask is a superset of
> > cpu_sibling_mask if and only if shared_caches is set.
> 
> I'm seeing oopses with this:
> 
> [    0.117392][    T1] smp: Bringing up secondary CPUs ...
> [    0.156515][    T1] smp: Brought up 2 nodes, 2 CPUs
> [    0.158265][    T1] numa: Node 0 CPUs: 0
> [    0.158520][    T1] numa: Node 1 CPUs: 1
> [    0.167453][    T1] BUG: Unable to handle kernel data access on read at 0x8000000041228298
> [    0.167992][    T1] Faulting instruction address: 0xc00000000018c128
> [    0.168817][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.168964][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    0.169417][    T1] Modules linked in:
> [    0.170047][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #209
> [    0.170305][    T1] NIP:  c00000000018c128 LR: c00000000018c0cc CTR: c00000000004dce0
> [    0.170498][    T1] REGS: c00000007e343880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
> [    0.170602][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00000000
> [    0.170985][    T1] CFAR: c00000000018c288 IRQMASK: 0
> [    0.170985][    T1] GPR00: 0000000000000000 c00000007e343b10 c00000000173e400 0000000000004000
> [    0.170985][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000800 0000000000000000
> [    0.170985][    T1] GPR08: 0000000000000000 c00000000122c298 c00000003fffc000 c00000007fd05ce8
> [    0.170985][    T1] GPR12: c00000007e0119f8 c000000001930000 00000000ffff8ade 0000000000000000
> [    0.170985][    T1] GPR16: c00000007e3c0640 0000000000000917 c00000007e3c0658 0000000000000008
> [    0.170985][    T1] GPR20: c0000000015d0bb8 00000000ffff8ade c000000000f57400 c000000001817c28
> [    0.170985][    T1] GPR24: c00000000176dc80 c00000007e3c0890 c00000007e3cfe00 0000000000000000
> [    0.170985][    T1] GPR28: c000000001772310 c00000007e011900 c00000007e3c0800 0000000000000001
> [    0.172750][    T1] NIP [c00000000018c128] build_sched_domains+0x808/0x14b0
> [    0.172900][    T1] LR [c00000000018c0cc] build_sched_domains+0x7ac/0x14b0
> [    0.173186][    T1] Call Trace:
> [    0.173484][    T1] [c00000007e343b10] [c00000000018bfe8] build_sched_domains+0x6c8/0x14b0 (unreliable)
> [    0.173821][    T1] [c00000007e343c50] [c00000000018dcdc] sched_init_domains+0xec/0x130
> [    0.174037][    T1] [c00000007e343ca0] [c0000000010d59d8] sched_init_smp+0x50/0xc4
> [    0.174207][    T1] [c00000007e343cd0] [c0000000010b45c4] kernel_init_freeable+0x1b4/0x378
> [    0.174378][    T1] [c00000007e343db0] [c0000000000129fc] kernel_init+0x24/0x158
> [    0.174740][    T1] [c00000007e343e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
> [    0.175050][    T1] Instruction dump:
> [    0.175626][    T1] 554905ee 71480040 7d2907b4 4182016c 2c290000 3920006e 913e002c 41820034
> [    0.175841][    T1] 7c6307b4 e9300020 78631f24 7d58182a <7d2a482a> f93e0080 7d404828 314a0001
> [    0.178340][    T1] ---[ end trace 6876b88dd1d4b3bb ]---
> [    0.178512][    T1]
> [    1.180458][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> That's qemu:
> 
> qemu-system-ppc64 -nographic -vga none -M pseries -cpu POWER8 \
>   -kernel build~/vmlinux \
>   -m 2G,slots=2,maxmem=4G \
>   -object memory-backend-ram,size=1G,id=m0 \
>   -object memory-backend-ram,size=1G,id=m1 \
>   -numa node,nodeid=0,memdev=m0 \
>   -numa node,nodeid=1,memdev=m1 \
>   -smp 2,sockets=2,maxcpus=2  \

PowerKVM guest vCPUs does not yet have L2 and L3 cache elements
I had this bug raised some time ago, probably related?
https://bugs.launchpad.net/qemu/+bug/1774605


Regards,
-Satheesh.
> 
> 
> On mambo I get:
> 
> [    0.005069][    T1] smp: Bringing up secondary CPUs ...
> [    0.011656][    T1] smp: Brought up 2 nodes, 8 CPUs
> [    0.011682][    T1] numa: Node 0 CPUs: 0-3
> [    0.011709][    T1] numa: Node 1 CPUs: 4-7
> [    0.012015][    T1] BUG: arch topology borken
> [    0.012040][    T1]      the SMT domain not a subset of the CACHE domain
> [    0.012107][    T1] BUG: Unable to handle kernel data access on read at 0x80000001012e7398
> [    0.012142][    T1] Faulting instruction address: 0xc0000000001aa4f0
> [    0.012174][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.012206][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> [    0.012236][    T1] Modules linked in:
> [    0.012264][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #1
> [    0.012304][    T1] NIP:  c0000000001aa4f0 LR: c0000000001aa498 CTR: 0000000000000000
> [    0.012341][    T1] REGS: c0000000ef583880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
> [    0.012379][    T1] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00040000
> [    0.012439][    T1] CFAR: c0000000000101b0 IRQMASK: 0
> [    0.012439][    T1] GPR00: 0000000000000000 c0000000ef583b10 c0000000017fd000 0000000000004000
> [    0.012439][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000000 0000000000000000
> [    0.012439][    T1] GPR08: 0000000000000000 c0000000012eb398 c0000000ffffc000 0000000000000000
> [    0.012439][    T1] GPR12: 0000000000000020 c0000000019f0000 00000000ffff8ad1 0000000000000000
> [    0.012439][    T1] GPR16: c0000000ef068658 c0000000018d7ba8 0000000000000008 c000000001690bb8
> [    0.012439][    T1] GPR20: c00000000182dc80 c0000000ef06be90 00000000ffff8ad1 c000000001014aa8
> [    0.012439][    T1] GPR24: 0000000000000917 c0000000ef068e00 0000000000000000 c0000000ef06be00
> [    0.012439][    T1] GPR28: 0000000000000001 c0000000ef068640 c0000000ef4a1800 c000000001832310
> [    0.012774][    T1] NIP [c0000000001aa4f0] build_sched_domains+0x5c0/0x14f0
> [    0.012812][    T1] LR [c0000000001aa498] build_sched_domains+0x568/0x14f0
> [    0.012842][    T1] Call Trace:
> [    0.012872][    T1] [c0000000ef583b10] [c0000000001aa3b4] build_sched_domains+0x484/0x14f0 (unreliable)
> [    0.012922][    T1] [c0000000ef583c50] [c0000000001ac3d8] sched_init_domains+0xd8/0x120
> [    0.012966][    T1] [c0000000ef583ca0] [c0000000011962d0] sched_init_smp+0x50/0xc4
> [    0.013008][    T1] [c0000000ef583cd0] [c00000000117451c] kernel_init_freeable+0x1b4/0x378
> [    0.013051][    T1] [c0000000ef583db0] [c000000000012994] kernel_init+0x2c/0x158
> [    0.013092][    T1] [c0000000ef583e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
> [    0.013128][    T1] Instruction dump:
> [    0.013151][    T1] e93b003a 712a0040 552a05ee 418203c4 2c2a0000 3920006e 913b002c 41820034
> [    0.013206][    T1] 7c6307b4 e93d0020 78631f24 7d54182a <7d2a482a> f93b0080 7d404828 314a0001
> [    0.013267][    T1] ---[ end trace 1bf5f6f38a9fd096 ]---
> 
> 
> Did I miss a lead-up patch?
> 
> See here for what I have applied:
>   https://github.com/linuxppc/linux/commits/next-test
> 
> cheers
