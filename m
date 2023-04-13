Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E16E0BF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 12:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxxR22P2Kz3fSV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 20:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oUCWEgAS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oUCWEgAS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxxQ83kVrz3f4T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 20:58:24 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DABvQU032016;
	Thu, 13 Apr 2023 10:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IR8LKcKiw33wXth3I8yWVtlKKhdz/A2u+4Eh937TsV0=;
 b=oUCWEgASKVQHJCoE4e6jkx9a6xujiduh4/dCfaefU5n9i8D2td4XGoiy5tQiJX/Pxbz1
 w4ReIawpOjuo8syxyIVc5sImGLO1Cq88VcMFw6SUF3+6gjkrb0WAjDiaiMoRnis+3g3i
 U9N0pOtj5PZNbtJaPODd3TkqZDhZ2CrkjmZzNCG4Oo2Bawi5gbT8lKhbzHt8jT3NjDxk
 p6gXrhOIHMAJR/4zB6Y4Lr6S+gzBw23q2z6ftwc91f3kfC3NwpN0sSp+oUUC8CVbpt9p
 FAh8Y4OFbRrmc+7fJI4rpR29yzJM1d1KRXCiro6vAlOQ0/a3JQSuVQe02a1RmS3k2nuw 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxfs3sxr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 10:58:18 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DAv0A9015586;
	Thu, 13 Apr 2023 10:58:17 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxfs3sxqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 10:58:17 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33D8CEu5027956;
	Thu, 13 Apr 2023 10:58:16 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pu0jjhv8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 10:58:16 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33DAwEma65208820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Apr 2023 10:58:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF0F15803F;
	Thu, 13 Apr 2023 10:58:14 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCEDD58061;
	Thu, 13 Apr 2023 10:58:12 +0000 (GMT)
Received: from [9.211.115.174] (unknown [9.211.115.174])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Apr 2023 10:58:12 +0000 (GMT)
Message-ID: <00ac999d-4447-31db-f68e-3e0748d9f755@linux.vnet.ibm.com>
Date: Thu, 13 Apr 2023 16:28:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 00/17] powerpc: alternate queued spinlock
 implementation
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>
References: <20221126095932.1234527-1-npiggin@gmail.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pye5D6kVE-nAtoGNfodtrtUkVsjpCLAh
X-Proofpoint-ORIG-GUID: WF4CzoXdQhiPQ-2i-LfvcVtnclO8AHf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_06,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130091
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/26/22 3:29 PM, Nicholas Piggin wrote:
> This replaces the generic queued spinlock code (like s390 does) with
> our own implementation. There is an extra shim patch 1a to get the
> series to apply.
> 
> Generic PV qspinlock code is causing latency / starvation regressions on
> large systems that are resulting in hard lockups reported (mostly in
> pathoogical cases).  The generic qspinlock code has a number of issues
> important for powerpc hardware and hypervisors that aren't easily solved
> without changing code that would impact other architectures. Follow
> s390's lead and implement our own for now.
> 
> Issues for powerpc using generic qspinlocks:
> - The previous lock value should not be loaded with simple loads, and
>   need not be passed around from previous loads or cmpxchg results,
>   because powerpc uses ll/sc-style atomics which can perform more
>   complex operations that do not require this. powerpc implementations
>   tend to prefer loads use larx for improved coherency performance.
> - The queueing process should absolutely minimise the number of stores
>   to the lock word to reduce exclusive coherency probes, important for
>   large system scalability. The pending logic is counter productive
>   here.
> - Non-atomic unlock for paravirt locks is important (atomic instructions
>   tend to still be more expensive than x86 CPUs).
> - Yielding to the lock owner is important in the oversubscribed paravirt
>   case, which requires storing the owner CPU in the lock word.
> - More control of lock stealing for the paravirt case is important to
>   keep latency down on large systems.
> - The lock acquisition operation should always be made with a special
>   variant of atomic instructions with the lock hint bit set, including
>   (especially) in the queueing paths. This is more a matter of adding
>   more arch lock helpers so not an insurmountable problem for generic
>   code.
> 
> Thanks,
> Nick
> 
> Since v2:
> - Rebase the series on upstream and remove the 1a shim patch.
> - Squash in the RFC patches that avoid a few more cmpxchg patterns in
>   favour of more optimal larx/stcx implementations and allows the
>   non-stealing queueing case to be removed, significantly reducing
>   the queuing code.
> - Reword some changelogs.
> 
> Since v1:
> - Change most 'if (cond) return 1 ; return 0;'
> - Bug fix: was testing count == MAX, but reentrant NMIs could bring that
>   > MAX and crash.
> - Fix missing memory barrier lost in asm conversion patch.
> - Seperate the release barrier in publish_tail from the acquire barrier
>   in get_tail_qnode.
> - Moving a few minor things into their logically correct change.
> - Make encode_tail_cpu take a cpu argument to match get_tail_cpu.
> - Rename get_tail_cpu to decode_tail_cpu to match encode_tail_cpu.
> - Rename lock_set_locked to set_locked.
> - IS_ENABLED(x) ? 1 : 0 -> IS_ENABLED(x)
> - Fix some comments inside inline asm.
> - Change tunable names to lowercase.
> - Consolidate asm for trylock_clear_tail_cpu and trylock_with_tail_cpu
> - Restructure steal/wait loops to be more readable
> - Count a failed cmpxchg as an iteration in steal/wait loops to avoid
>   theoretical livelock/latency concern.
> 
> Nicholas Piggin (17):
>   powerpc/qspinlock: add mcs queueing for contended waiters
>   powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
>   powerpc/qspinlock: convert atomic operations to assembly
>   powerpc/qspinlock: allow new waiters to steal the lock before queueing
>   powerpc/qspinlock: theft prevention to control latency
>   powerpc/qspinlock: store owner CPU in lock word
>   powerpc/qspinlock: paravirt yield to lock owner
>   powerpc/qspinlock: implement option to yield to previous node
>   powerpc/qspinlock: allow stealing when head of queue yields
>   powerpc/qspinlock: allow propagation of yield CPU down the queue
>   powerpc/qspinlock: add ability to prod new queue head CPU
>   powerpc/qspinlock: allow lock stealing in trylock and lock fastpath
>   powerpc/qspinlock: use spin_begin/end API
>   powerpc/qspinlock: reduce remote node steal spins
>   powerpc/qspinlock: allow indefinite spinning on a preempted owner
>   powerpc/qspinlock: provide accounting and options for sleepy locks
>   powerpc/qspinlock: add compile-time tuning adjustments
> 
>  arch/powerpc/include/asm/qspinlock.h       | 130 ++-
>  arch/powerpc/include/asm/qspinlock_types.h |  63 +-
>  arch/powerpc/lib/qspinlock.c               | 985 ++++++++++++++++++++-
>  3 files changed, 1167 insertions(+), 11 deletions(-)
> 

Hi. 

we are observing hardlockup problems with queued spinlock on powerVM Shared Processor LPAR's(SPLPAR)
LPAR is configured with 320vcpu/160cpu. It is over-committed. 


Scenario: 
Bring up the system. create a CPU cgroup with 50% or 5% CPU bandwidth. Run strss-ng with 160 CPU stressor.
Issue is hit consistently on 5% CPU bandwidth allocation. Issue happens sometime with 50%. Issue was 
not observed when stress-ng is run without any cgroup during testing. Lockups are more easily hit, if
other SPLPAR are doing some work.
The same testing holds good in Dedicated LPAR. So this maybe specific to SPLPAR only.  


Lockup backtrace:
[ 2612.771144] watchdog: CPU 216 self-detected hard LOCKUP @ plpar_hcall_norets_notrace+0x18/0x2c
[ 2612.771158] watchdog: CPU 216 TB:119522648258051, last heartbeat TB:119516305262839 (12388ms ago) 
[ 2612.771160] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables bonding nfnetlink mlx5_ib pseries_rng ib_uverbs ib_core drm drm_panel_orientation_quirks xfs libcrc32c mlx5_core mlxfw nvme tls vmx_crypto nvme_core psample t10_pi dm_mirror dm_region_hash dm_log dm_mod fuse
[ 2612.771186] CPU: 216 PID: 0 Comm: swapper/216 Not tainted 6.2.0ssh+ #6           
[ 2612.771189] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.10 (MH1030_044) hv:phyp pSeries
[ 2612.771191] NIP:  c0000000000f2710 LR: c0000000000ae38c CTR: 0000000000000000
[ 2612.771193] REGS: c00000fffb4c7d60 TRAP: 0900   Not tainted  (6.2.0ssh+)         
[ 2612.771195] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24022222  XER: 00000000
[ 2612.771200] CFAR: 0000000000000000 IRQMASK: 1                                
[ 2612.771200] GPR00: 0000000024022222 c00000fffba47b30 c0000000017f0e00 0000000000000000
[ 2612.771200] GPR04: 0000000000000040 000000000000ebd9 0000000000000081 fffffffffffe0000
[ 2612.771200] GPR08: 0000000000000081 c00000fffbf49c80 0000000000000004 0000000044022222
[ 2612.771200] GPR12: 0000000000000000 c00000fffbee9c80 0000000000000001 c00000000125ef08
[ 2612.771200] GPR16: c00000739f6bd600 c000000002ac78d0 c000000002ac7058 000000000000ebd9
[ 2612.771200] GPR20: 0000000000000200 0000000000000000 fffffffffffe0000 0000000000000001
[ 2612.771200] GPR24: 0000000000000001 0000000000000001 c0000000021f1880 0000000000000001
[ 2612.771200] GPR28: 0000000000000032 c000000002ac7190 0000000000008081 c00000fff5a31f80
[ 2612.771217] NIP [c0000000000f2710] plpar_hcall_norets_notrace+0x18/0x2c      
[ 2612.771221] LR [c0000000000ae38c] queued_spin_lock_slowpath+0x52c/0x1190         
[ 2612.771225] Call Trace:                                                      
[ 2612.771226] [c00000fffba47c40] [c000000000f635c0] _raw_spin_lock+0x70/0x90   
[ 2612.771232] [c00000fffba47c60] [c000000000198f6c] raw_spin_rq_lock_nested+0x2c/0x100
[ 2612.771236] [c00000fffba47ca0] [c0000000001ba900] load_balance+0x5e0/0x9b0   
[ 2612.771239] [c00000fffba47e10] [c0000000001bbbc8] rebalance_domains+0x2e8/0x490
[ 2612.771242] [c00000fffba47ee0] [c000000000f63c8c] __do_softirq+0x15c/0x3dc   
[ 2612.771245] [c00000fffba47fe0] [c000000000017950] do_softirq_own_stack+0x40/0x60
[ 2612.771248] [c000007387c9f9b0] [c0000000001539e8] __irq_exit_rcu+0x158/0x190 
[ 2612.771251] [c000007387c9f9e0] [c000000000154520] irq_exit+0x20/0x40         
[ 2612.771253] [c000007387c9fa00] [c000000000028af4] timer_interrupt+0x174/0x320
[ 2612.771255] [c000007387c9fa60] [c000000000009f8c] decrementer_common_virt+0x28c/0x290


We did a git bisect between 6.1 and 6.2
Git bisect logs:
# git bisect log  
git bisect start
# good: [274d842fa1efd9449e62222c8896e0be11621f1f] powerpc/tlb: Add local flush for page given mm_struct and psize
git bisect good 274d842fa1efd9449e62222c8896e0be11621f1f
# bad: [0b2199841a7952d01a717b465df028b40b2cf3e9] powerpc/qspinlock: add compile-time tuning adjustments
git bisect bad 0b2199841a7952d01a717b465df028b40b2cf3e9
# good: [247f34f7b80357943234f93f247a1ae6b6c3a740] Linux 6.1-rc2
git bisect good 247f34f7b80357943234f93f247a1ae6b6c3a740
# good: [bd48287b2cf4cd6e95576db3a94fd2a7cdf9832d] powerpc/qspinlock: implement option to yield to previous node
git bisect good bd48287b2cf4cd6e95576db3a94fd2a7cdf9832d
# bad: [f61ab43cc1a6146d6eef7e0713a452c3677ad13e] powerpc/qspinlock: allow lock stealing in trylock and lock fastpath
git bisect bad f61ab43cc1a6146d6eef7e0713a452c3677ad13e
# bad: [28db61e207ea3890d286cff3141c1ce67346074d] powerpc/qspinlock: allow propagation of yield CPU down the queue
git bisect bad 28db61e207ea3890d286cff3141c1ce67346074d
# good: [b4c3cdc1a698a2f6168768d0bed4bf062723722e] powerpc/qspinlock: allow stealing when head of queue yields
git bisect good b4c3cdc1a698a2f6168768d0bed4bf062723722e
# first bad commit: [28db61e207ea3890d286cff3141c1ce67346074d] powerpc/qspinlock: allow propagation of yield CPU down the queue


Tried fiddling with these tunable available for qspinlock with their default values on the test system:

qspl_steal_spins = 256
qspl_head_spins = 256
qspl_pv_yield_owner = 1
qspl_pv_yield_prev = 1
qspl_pv_yield_allow_steal = 0
qspl_pv_yield_propagate_owner = 1

No lockup with qspl_pv_yield_propagate_owner = 0. But that would defeat the purpose of the queued spinlock. 
So tried with next one, i.e qspl_pv_yield_allow_steal = 1.  No lockup was seen. Likely we have to tune it for
powerVM or default values need to change based on the system? 
