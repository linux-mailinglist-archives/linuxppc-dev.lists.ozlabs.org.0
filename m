Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1834314
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:23:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J61B1R9xzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 19:23:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J5rC04gSzDqHj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 19:15:54 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5497YRw021801
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Jun 2019 05:15:52 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swmk13ske-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 05:15:51 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 4 Jun 2019 10:15:49 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 10:15:46 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x549FjjW58720350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jun 2019 09:15:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F347A405B;
 Tue,  4 Jun 2019 09:15:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BD78A4054;
 Tue,  4 Jun 2019 09:15:44 +0000 (GMT)
Received: from [9.109.244.70] (unknown [9.109.244.70])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jun 2019 09:15:44 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_5062A1FE-9AB2-4A0A-92C2-DB3F6773A804"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [POWERPC][next-20190603] Boot failure : Kernel BUG at mm/vmalloc.c:470
Date: Tue, 4 Jun 2019 14:45:43 +0530
To: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19060409-4275-0000-0000-0000033C5452
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060409-4276-0000-0000-0000384C6211
Message-Id: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=638 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040061
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
Cc: linux-mm@kvack.org, "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_5062A1FE-9AB2-4A0A-92C2-DB3F6773A804
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

While booting linux-next [next-20190603] on a POWER9 LPAR following
BUG is encountered and the boot fails.

If I revert the following 2 patches I no longer see this BUG message

07031d37b2f9 ( mm/vmalloc.c: switch to WARN_ON() and move it under =
unlink_va() )
728e0fbf263e ( mm/vmalloc.c: get rid of one single unlink_va() when =
merge )

[    1.130734] ------------[ cut here ]------------
[    1.130745] kernel BUG at mm/vmalloc.c:470!
[    1.130753] Oops: Exception in kernel mode, sig: 5 [#1]
[    1.130761] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    1.130768] Modules linked in: ibmvscsi(+) ibmveth scsi_transport_srp
[    1.130781] CPU: 23 PID: 127 Comm: kworker/23:0 Not tainted =
5.2.0-rc3-next-20190603 #1
[    1.130796] Workqueue: events do_free_init
[    1.130803] NIP:  c0000000003bcc48 LR: c0000000003bcbc4 CTR: =
c0000000003bc860
[    1.130812] REGS: c0000018ec7877e0 TRAP: 0700   Not tainted  =
(5.2.0-rc3-next-20190603)
[    1.130820] MSR:  800000010282b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 24008888  XER: 20040005
[    1.130837] CFAR: c0000000003bcc6c IRQMASK: 0
[    1.130837] GPR00: c0000000003bd0e4 c0000018ec787a70 c000000001929400 =
0000000000000001
[    1.130837] GPR04: c0000018e8d2e8f0 c0000018e8d2e8f0 c008000006570000 =
c008000006550000
[    1.130837] GPR08: c008000009670000 c0000018e8d0e098 c0000018e8d0e5f8 =
c0000018e8ca93f0
[    1.130837] GPR12: c0000000003bc860 c00000001ec4e200 c000000000160188 =
c0000018f4044d00
[    1.130837] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[    1.130837] GPR20: 0000000000000000 0000000000000000 c000000001485108 =
c0000000019620d8
[    1.130837] GPR24: c000000001962464 0000000000000800 0000000000000001 =
0000000000001800
[    1.130837] GPR28: c000000001ccc0a8 c000000001ccc080 c0000018e8d2e8b8 =
c0000018e8d2e8d8
[    1.130899] NIP [c0000000003bcc48] __free_vmap_area+0xf8/0x480
[    1.130906] LR [c0000000003bcbc4] __free_vmap_area+0x74/0x480
[    1.130912] Call Trace:
[    1.130916] [c0000018ec787a70] [c0000000003bcf70] =
__free_vmap_area+0x420/0x480 (unreliable)
[    1.130924] [c0000018ec787ac0] [c0000000003bd0e4] =
__purge_vmap_area_lazy+0x114/0x1e0
[    1.130932] [c0000018ec787b10] [c0000000003bef44] =
_vm_unmap_aliases+0x1a4/0x210
[    1.130939] [c0000018ec787b90] [c0000000003c1c48] __vunmap+0xe8/0x220
[    1.130946] [c0000018ec787c20] [c00000000021102c] =
module_memfree+0x3c/0x50
[    1.130953] [c0000018ec787c40] [c0000000002110ac] =
do_free_init+0x6c/0xa0
[    1.130964] [c0000018ec787c70] [c000000000156df0] =
process_one_work+0x260/0x520
[    1.130976] [c0000018ec787d10] [c000000000157138] =
worker_thread+0x88/0x5f0
[    1.130985] [c0000018ec787db0] [c000000000160328] kthread+0x1a8/0x1b0
[    1.130996] [c0000018ec787e20] [c00000000000ba54] =
ret_from_kernel_thread+0x5c/0x68
[    1.131004] Instruction dump:
[    1.131011] e9292c90 2fa90000 419e0378 e8fe0000 e8de0008 60000000 =
e909ffe8 e949ffe0
[    1.131021] 7fa74040 409c0014 7faa3040 409c002c <0fe00000> 60000000 =
7faa3040 409cfff4
[    1.131032] ---[ end trace b0b43434aedbb78e ]=E2=80=94

Have attached the boot log for reference.

Thanks
-Sachin



--Apple-Mail=_5062A1FE-9AB2-4A0A-92C2-DB3F6773A804
Content-Disposition: attachment;
	filename=next-20190603.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="next-20190603.log"
Content-Transfer-Encoding: quoted-printable

[84348.251113]=20kexec_core:=20Starting=20new=20kernel=0A[84348.271197]=20=
kexec:=20waiting=20for=20cpu=2036=20(physical=2036)=20to=20enter=201=20=
state=0A[84348.271208]=20kexec:=20waiting=20for=20cpu=201=20(physical=20=
1)=20to=20enter=202=20state=0A[84348.272736]=20kexec:=20Starting=20=
switchover=20sequence.=0AI'm=20in=20purgatory=0A[=20=20=20=200.000000]=20=
hash-mmu:=20Page=20sizes=20from=20device-tree:=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D12:=20shift=3D12,=20sllp=3D0x0000,=20=
avpnm=3D0x00000000,=20tlbiel=3D1,=20penc=3D0=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D12:=20shift=3D16,=20sllp=3D0x0000,=20=
avpnm=3D0x00000000,=20tlbiel=3D1,=20penc=3D7=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D12:=20shift=3D24,=20sllp=3D0x0000,=20=
avpnm=3D0x00000000,=20tlbiel=3D1,=20penc=3D56=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D16:=20shift=3D16,=20sllp=3D0x0110,=20=
avpnm=3D0x00000000,=20tlbiel=3D1,=20penc=3D1=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D16:=20shift=3D24,=20sllp=3D0x0110,=20=
avpnm=3D0x00000000,=20tlbiel=3D1,=20penc=3D8=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D24:=20shift=3D24,=20sllp=3D0x0100,=20=
avpnm=3D0x00000001,=20tlbiel=3D0,=20penc=3D0=0A[=20=20=20=200.000000]=20=
hash-mmu:=20base_shift=3D34:=20shift=3D34,=20sllp=3D0x0120,=20=
avpnm=3D0x000007ff,=20tlbiel=3D0,=20penc=3D3=0A[=20=20=20=200.000000]=20=
Using=201TB=20segments=0A[=20=20=20=200.000000]=20hash-mmu:=20=
Initializing=20hash=20mmu=20with=20SLB=0A[=20=20=20=200.000000]=20Linux=20=
version=205.2.0-rc3-next-20190603=20=
(root@ltczep10-lp4.aus.stglabs.ibm.com)=20(gcc=20version=208.2.1=20=
20180905=20(Red=20Hat=208.2.1-3)=20(GCC))=20#1=20SMP=20Tue=20Jun=204=20=
01:04:57=20CDT=202019=0A[=20=20=20=200.000000]=20Found=20initrd=20at=20=
0xc000000003780000:0xc000000004f31731=0A[=20=20=20=200.000000]=20Using=20=
pSeries=20machine=20description=0A[=20=20=20=200.000000]=20printk:=20=
bootconsole=20[udbg0]=20enabled=0A[=20=20=20=200.000000]=20Partition=20=
configured=20for=2040=20cpus.=0A[=20=20=20=200.000000]=20CPU=20maps=20=
initialized=20for=208=20threads=20per=20core=0A[=20=20=20=200.000000]=20=
-----------------------------------------------------=0A[=20=20=20=20=
0.000000]=20phys_mem_size=20=20=20=20=20=3D=200x1900000000=0A[=20=20=20=20=
0.000000]=20dcache_bsize=20=20=20=20=20=20=3D=200x80=0A[=20=20=20=20=
0.000000]=20icache_bsize=20=20=20=20=20=20=3D=200x80=0A[=20=20=20=20=
0.000000]=20cpu_features=20=20=20=20=20=20=3D=200x0000c07f8f5f91a7=0A[=20=
=20=20=200.000000]=20=20=20possible=20=20=20=20=20=20=20=20=3D=20=
0x0000fbffcf5fb1a7=0A[=20=20=20=200.000000]=20=20=20always=20=20=20=20=20=
=20=20=20=20=20=3D=200x00000003800081a1=0A[=20=20=20=200.000000]=20=
cpu_user_features=20=3D=200xdc0065c2=200xefe00000=0A[=20=20=20=20=
0.000000]=20mmu_features=20=20=20=20=20=20=3D=200x7c006001=0A[=20=20=20=20=
0.000000]=20firmware_features=20=3D=200x00000017c45bfc57=0A[=20=20=20=20=
0.000000]=20hash-mmu:=20ppc64_pft_size=20=20=20=20=3D=200x1e=0A[=20=20=20=
=200.000000]=20hash-mmu:=20htab_hash_mask=20=20=20=20=3D=200x7fffff=0A[=20=
=20=20=200.000000]=20hash-mmu:=20kernel=20vmalloc=20start=20=20=20=3D=20=
0xc008000000000000=0A[=20=20=20=200.000000]=20hash-mmu:=20kernel=20IO=20=
start=20=20=20=20=20=20=20=20=3D=200xc00a000000000000=0A[=20=20=20=20=
0.000000]=20hash-mmu:=20kernel=20vmemmap=20start=20=20=20=3D=20=
0xc00c000000000000=0A[=20=20=20=200.000000]=20=
-----------------------------------------------------=0A[=20=20=20=20=
0.000000]=20numa:=20=20=20NODE_DATA=20[mem=200x18ffe98980-0x18ffe9ffff]=0A=
[=20=20=20=200.000000]=20rfi-flush:=20fallback=20displacement=20flush=20=
available=0A[=20=20=20=200.000000]=20rfi-flush:=20mttrig=20type=20flush=20=
available=0A[=20=20=20=200.000000]=20count-cache-flush:=20full=20=
software=20flush=20sequence=20enabled.=0A[=20=20=20=200.000000]=20=
stf-barrier:=20eieio=20barrier=20available=0A[=20=20=20=200.000000]=20=
PPC64=20nvram=20contains=2015360=20bytes=0A[=20=20=20=200.000000]=20=
barrier-nospec:=20using=20ORI=20speculation=20barrier=0A[=20=20=20=20=
0.000000]=20Zone=20ranges:=0A[=20=20=20=200.000000]=20=20=20Normal=20=20=20=
[mem=200x0000000000000000-0x00000018ffffffff]=0A[=20=20=20=200.000000]=20=
=20=20Device=20=20=20empty=0A[=20=20=20=200.000000]=20Movable=20zone=20=
start=20for=20each=20node=0A[=20=20=20=200.000000]=20Early=20memory=20=
node=20ranges=0A[=20=20=20=200.000000]=20=20=20node=20=20=200:=20[mem=20=
0x0000000000000000-0x00000018ffffffff]=0A[=20=20=20=200.000000]=20=
Initmem=20setup=20node=200=20[mem=20=
0x0000000000000000-0x00000018ffffffff]=0A[=20=20=20=200.000000]=20=
percpu:=20Embedded=2011=20pages/cpu=20s629912=20r0=20d90984=20u1048576=0A=
[=20=20=20=200.000000]=20node[0]=20zonelist:=200:Normal=20=0A[=20=20=20=20=
0.000000]=20Built=201=20zonelists,=20mobility=20grouping=20on.=20=20=
Total=20pages:=201636800=0A[=20=20=20=200.000000]=20Policy=20zone:=20=
Normal=0A[=20=20=20=200.000000]=20Kernel=20command=20line:=20=
root=3DUUID=3D8b2c60d2-4da6-4873-b9ac-6b332055a0f2=20ro=20=0A[=20=20=20=20=
0.000000]=20Memory:=20104635840K/104857600K=20available=20(12416K=20=
kernel=20code,=201792K=20rwdata,=206976K=20rodata,=204992K=20init,=20=
3847K=20bss,=20221760K=20reserved,=200K=20cma-reserved)=0A[=20=20=20=20=
0.000000]=20random:=20get_random_u64=20called=20from=20=
cache_random_seq_create+0x98/0x1f0=20with=20crng_init=3D0=0A[=20=20=20=20=
0.000000]=20SLUB:=20HWalign=3D128,=20Order=3D0-3,=20MinObjects=3D0,=20=
CPUs=3D40,=20Nodes=3D32=0A[=20=20=20=200.000000]=20ftrace:=20allocating=20=
31579=20entries=20in=2012=20pages=0A[=20=20=20=200.000000]=20rcu:=20=
Hierarchical=20RCU=20implementation.=0A[=20=20=20=200.000000]=20rcu:=20=09=
RCU=20restricting=20CPUs=20from=20NR_CPUS=3D2048=20to=20nr_cpu_ids=3D40.=0A=
[=20=20=20=200.000000]=20rcu:=20RCU=20calculated=20value=20of=20=
scheduler-enlistment=20delay=20is=2010=20jiffies.=0A[=20=20=20=20=
0.000000]=20rcu:=20Adjusting=20geometry=20for=20rcu_fanout_leaf=3D16,=20=
nr_cpu_ids=3D40=0A[=20=20=20=200.000000]=20NR_IRQS:=20512,=20nr_irqs:=20=
512,=20preallocated=20irqs:=2016=0A[=20=20=20=200.000000]=20rcu:=20=09=
Offload=20RCU=20callbacks=20from=20CPUs:=20(none).=0A[=20=20=20=20=
0.000001]=20time_init:=2056=20bit=20decrementer=20(max:=20=
7fffffffffffff)=0A[=20=20=20=200.000066]=20clocksource:=20timebase:=20=
mask:=200xffffffffffffffff=20max_cycles:=200x761537d007,=20max_idle_ns:=20=
440795202126=20ns=0A[=20=20=20=200.000175]=20clocksource:=20timebase=20=
mult[1f40000]=20shift[24]=20registered=0A[=20=20=20=200.000303]=20=
Console:=20colour=20dummy=20device=2080x25=0A[=20=20=20=200.000354]=20=
printk:=20console=20[hvc0]=20enabled=0A[=20=20=20=200.000354]=20printk:=20=
console=20[hvc0]=20enabled=0A[=20=20=20=200.000401]=20printk:=20=
bootconsole=20[udbg0]=20disabled=0A[=20=20=20=200.000401]=20printk:=20=
bootconsole=20[udbg0]=20disabled=0A[=20=20=20=200.000496]=20pid_max:=20=
default:=2040960=20minimum:=20320=0A[=20=20=20=200.000650]=20LSM:=20=
Security=20Framework=20initializing=0A[=20=20=20=200.000740]=20Yama:=20=
becoming=20mindful.=0A[=20=20=20=200.000762]=20SELinux:=20=20=
Initializing.=0A[=20=20=20=200.000926]=20***=20VALIDATE=20SELinux=20***=0A=
[=20=20=20=200.002919]=20Dentry=20cache=20hash=20table=20entries:=20=
8388608=20(order:=2010,=2067108864=20bytes)=0A[=20=20=20=200.003909]=20=
Inode-cache=20hash=20table=20entries:=204194304=20(order:=209,=20=
33554432=20bytes)=0A[=20=20=20=200.003975]=20Mount-cache=20hash=20table=20=
entries:=20131072=20(order:=204,=201048576=20bytes)=0A[=20=20=20=20=
0.004015]=20Mountpoint-cache=20hash=20table=20entries:=20131072=20=
(order:=204,=201048576=20bytes)=0A[=20=20=20=200.004330]=20***=20=
VALIDATE=20proc=20***=0A[=20=20=20=200.004590]=20***=20VALIDATE=20=
cgroup1=20***=0A[=20=20=20=200.004596]=20***=20VALIDATE=20cgroup2=20***=0A=
[=20=20=20=200.005137]=20EEH:=20pSeries=20platform=20initialized=0A[=20=20=
=20=200.005147]=20POWER9=20performance=20monitor=20hardware=20support=20=
registered=0A[=20=20=20=200.005185]=20rcu:=20Hierarchical=20SRCU=20=
implementation.=0A[=20=20=20=200.005979]=20smp:=20Bringing=20up=20=
secondary=20CPUs=20...=0A[=20=20=20=200.016355]=20smp:=20Brought=20up=20=
1=20node,=2040=20CPUs=0A[=20=20=20=200.016365]=20numa:=20Node=200=20=
CPUs:=200-39=0A[=20=20=20=200.016369]=20Using=20small=20cores=20at=20SMT=20=
level=0A[=20=20=20=200.016372]=20Using=20shared=20cache=20scheduler=20=
topology=0A[=20=20=20=200.018337]=20devtmpfs:=20initialized=0A[=20=20=20=20=
0.033076]=20clocksource:=20jiffies:=20mask:=200xffffffff=20max_cycles:=20=
0xffffffff,=20max_idle_ns:=2019112604462750000=20ns=0A[=20=20=20=20=
0.033092]=20futex=20hash=20table=20entries:=2016384=20(order:=205,=20=
2097152=20bytes)=0A[=20=20=20=200.033653]=20NET:=20Registered=20protocol=20=
family=2016=0A[=20=20=20=200.033799]=20audit:=20initializing=20netlink=20=
subsys=20(disabled)=0A[=20=20=20=200.033864]=20audit:=20type=3D2000=20=
audit(1559629150.030:1):=20state=3Dinitialized=20audit_enabled=3D0=20=
res=3D1=0A[=20=20=20=200.034221]=20Kprobe=20smoke=20test:=20started=0A[=20=
=20=20=200.048644]=20Kprobe=20smoke=20test:=20passed=20successfully=0A[=20=
=20=20=200.048730]=20cpuidle:=20using=20governor=20menu=0A[=20=20=20=20=
0.048942]=20pstore:=20Registered=20nvram=20as=20persistent=20store=20=
backend=0A[=20=20=20=200.055525]=20PCI:=20Probing=20PCI=20hardware=0A[=20=
=20=20=200.055531]=20EEH:=20No=20capable=20adapters=20found=0A[=20=20=20=20=
0.055625]=20pseries-rng:=20Registering=20arch=20random=20hook.=0A[=20=20=20=
=200.056923]=20HugeTLB=20registered=2016.0=20MiB=20page=20size,=20=
pre-allocated=200=20pages=0A[=20=20=20=200.056928]=20HugeTLB=20=
registered=2016.0=20GiB=20page=20size,=20pre-allocated=200=20pages=0A[=20=
=20=20=200.313749]=20cryptd:=20max_cpu_qlen=20set=20to=201000=0A[=20=20=20=
=200.315681]=20alg:=20No=20test=20for=20lzo-rle=20(lzo-rle-generic)=0A[=20=
=20=20=200.315800]=20alg:=20No=20test=20for=20lzo-rle=20(lzo-rle-scomp)=0A=
[=20=20=20=200.319635]=20vgaarb:=20loaded=0A[=20=20=20=200.319719]=20=
SCSI=20subsystem=20initialized=0A[=20=20=20=200.319757]=20usbcore:=20=
registered=20new=20interface=20driver=20usbfs=0A[=20=20=20=200.319768]=20=
usbcore:=20registered=20new=20interface=20driver=20hub=0A[=20=20=20=20=
0.319930]=20usbcore:=20registered=20new=20device=20driver=20usb=0A[=20=20=
=20=200.319958]=20pps_core:=20LinuxPPS=20API=20ver.=201=20registered=0A[=20=
=20=20=200.319962]=20pps_core:=20Software=20ver.=205.3.6=20-=20Copyright=20=
2005-2007=20Rodolfo=20Giometti=20<giometti@linux.it>=0A[=20=20=20=20=
0.319970]=20PTP=20clock=20support=20registered=0A[=20=20=20=200.320175]=20=
EDAC=20MC:=20Ver:=203.0.0=0A[=20=20=20=200.320346]=20NetLabel:=20=
Initializing=0A[=20=20=20=200.320350]=20NetLabel:=20=20domain=20hash=20=
size=20=3D=20128=0A[=20=20=20=200.320354]=20NetLabel:=20=20protocols=20=3D=
=20UNLABELED=20CIPSOv4=20CALIPSO=0A[=20=20=20=200.320368]=20NetLabel:=20=20=
unlabeled=20traffic=20allowed=20by=20default=0A[=20=20=20=200.320562]=20=
clocksource:=20Switched=20to=20clocksource=20timebase=0A[=20=20=20=20=
0.335258]=20VFS:=20Disk=20quotas=20dquot_6.6.0=0A[=20=20=20=200.335289]=20=
VFS:=20Dquot-cache=20hash=20table=20entries:=208192=20(order=200,=20=
65536=20bytes)=0A[=20=20=20=200.335312]=20***=20VALIDATE=20hugetlbfs=20=
***=0A[=20=20=20=200.336931]=20random:=20fast=20init=20done=0A[=20=20=20=20=
0.337531]=20NET:=20Registered=20protocol=20family=202=0A[=20=20=20=20=
0.337722]=20tcp_listen_portaddr_hash=20hash=20table=20entries:=2065536=20=
(order:=204,=201048576=20bytes)=0A[=20=20=20=200.337849]=20TCP=20=
established=20hash=20table=20entries:=20524288=20(order:=206,=204194304=20=
bytes)=0A[=20=20=20=200.338962]=20TCP=20bind=20hash=20table=20entries:=20=
65536=20(order:=204,=201048576=20bytes)=0A[=20=20=20=200.339076]=20TCP:=20=
Hash=20tables=20configured=20(established=20524288=20bind=2065536)=0A[=20=
=20=20=200.339131]=20UDP=20hash=20table=20entries:=2065536=20(order:=20=
5,=202097152=20bytes)=0A[=20=20=20=200.339359]=20UDP-Lite=20hash=20table=20=
entries:=2065536=20(order:=205,=202097152=20bytes)=0A[=20=20=20=20=
0.339658]=20NET:=20Registered=20protocol=20family=201=0A[=20=20=20=20=
0.339666]=20NET:=20Registered=20protocol=20family=2044=0A[=20=20=20=20=
0.339671]=20PCI:=20CLS=200=20bytes,=20default=20128=0A[=20=20=20=20=
0.339705]=20Trying=20to=20unpack=20rootfs=20image=20as=20initramfs...=0A=
[=20=20=20=200.705596]=20Freeing=20initrd=20memory:=2024256K=0A[=20=20=20=
=200.708415]=20IOMMU=20table=20initialized,=20virtual=20merging=20=
enabled=0A[=20=20=20=200.722241]=20hv-24x7:=20read=201530=20catalog=20=
entries,=20created=20537=20event=20attrs=20(0=20failures),=20275=20descs=0A=
[=20=20=20=200.723581]=20workingset:=20timestamp_bits=3D38=20=
max_order=3D21=20bucket_order=3D0=0A[=20=20=20=200.724976]=20zbud:=20=
loaded=0A[=20=20=20=200.726758]=20NET:=20Registered=20protocol=20family=20=
38=0A[=20=20=20=200.726764]=20Key=20type=20asymmetric=20registered=0A[=20=
=20=20=200.726768]=20Asymmetric=20key=20parser=20'x509'=20registered=0A[=20=
=20=20=200.726777]=20Block=20layer=20SCSI=20generic=20(bsg)=20driver=20=
version=200.4=20loaded=20(major=20246)=0A[=20=20=20=200.726922]=20io=20=
scheduler=20mq-deadline=20registered=0A[=20=20=20=200.726927]=20io=20=
scheduler=20kyber=20registered=0A[=20=20=20=200.726974]=20io=20scheduler=20=
bfq=20registered=0A[=20=20=20=200.727705]=20atomic64_test:=20passed=0A[=20=
=20=20=200.727771]=20shpchp:=20Standard=20Hot=20Plug=20PCI=20Controller=20=
Driver=20version:=200.4=0A[=20=20=20=200.727776]=20PowerPC=20PowerNV=20=
PCI=20Hotplug=20Driver=20version:=200.1=0A[=20=20=20=200.728152]=20=
Serial:=208250/16550=20driver,=204=20ports,=20IRQ=20sharing=20enabled=0A=
[=20=20=20=200.728431]=20Non-volatile=20memory=20driver=20v1.3=0A[=20=20=20=
=200.728467]=20Linux=20agpgart=20interface=20v0.103=0A[=20=20=20=20=
0.728754]=20rdac:=20device=20handler=20registered=0A[=20=20=20=20=
0.728802]=20hp_sw:=20device=20handler=20registered=0A[=20=20=20=20=
0.728806]=20emc:=20device=20handler=20registered=0A[=20=20=20=20=
0.728923]=20alua:=20device=20handler=20registered=0A[=20=20=20=20=
0.728957]=20libphy:=20Fixed=20MDIO=20Bus:=20probed=0A[=20=20=20=20=
0.729019]=20ehci_hcd:=20USB=202.0=20'Enhanced'=20Host=20Controller=20=
(EHCI)=20Driver=0A[=20=20=20=200.729030]=20ehci-pci:=20EHCI=20PCI=20=
platform=20driver=0A[=20=20=20=200.729040]=20ohci_hcd:=20USB=201.1=20=
'Open'=20Host=20Controller=20(OHCI)=20Driver=0A[=20=20=20=200.729050]=20=
ohci-pci:=20OHCI=20PCI=20platform=20driver=0A[=20=20=20=200.729058]=20=
uhci_hcd:=20USB=20Universal=20Host=20Controller=20Interface=20driver=0A[=20=
=20=20=200.729093]=20usbcore:=20registered=20new=20interface=20driver=20=
usbserial_generic=0A[=20=20=20=200.729101]=20usbserial:=20USB=20Serial=20=
support=20registered=20for=20generic=0A[=20=20=20=200.729160]=20=
mousedev:=20PS/2=20mouse=20device=20common=20for=20all=20mice=0A[=20=20=20=
=200.729280]=20rtc-generic=20rtc-generic:=20registered=20as=20rtc0=0A[=20=
=20=20=200.729745]=20nx_compress_pseries=20ibm,compression-v1:=20=
nx842_OF_upd:=20max_sync_size=20new:65536=20old:0=0A[=20=20=20=20=
0.729753]=20nx_compress_pseries=20ibm,compression-v1:=20nx842_OF_upd:=20=
max_sync_sg=20new:510=20old:0=0A[=20=20=20=200.729760]=20=
nx_compress_pseries=20ibm,compression-v1:=20nx842_OF_upd:=20max_sg_len=20=
new:4080=20old:0=0A[=20=20=20=200.729830]=20alg:=20No=20test=20for=20842=20=
(842-nx)=0A[=20=20=20=200.730811]=20hidraw:=20raw=20HID=20events=20=
driver=20(C)=20Jiri=20Kosina=0A[=20=20=20=200.730849]=20usbcore:=20=
registered=20new=20interface=20driver=20usbhid=0A[=20=20=20=200.730853]=20=
usbhid:=20USB=20HID=20core=20driver=0A[=20=20=20=200.730946]=20=
drop_monitor:=20Initializing=20network=20drop=20monitor=20service=0A[=20=20=
=20=200.731047]=20Initializing=20XFRM=20netlink=20socket=0A[=20=20=20=20=
0.731211]=20NET:=20Registered=20protocol=20family=2010=0A[=20=20=20=20=
0.731589]=20Segment=20Routing=20with=20IPv6=0A[=20=20=20=200.731613]=20=
NET:=20Registered=20protocol=20family=2017=0A[=20=20=20=200.731680]=20=
mpls_gso:=20MPLS=20GSO=20support=0A[=20=20=20=200.732435]=20Running=20=
instruction=20emulation=20self-tests=20...=0A[=20=20=20=200.732442]=20=
emulate_step_test:=20ld=20=20=20=20=20=20=20=20=20=20=20=20=20:=20PASS=0A=
[=20=20=20=200.732446]=20emulate_step_test:=20lwz=20=20=20=20=20=20=20=20=
=20=20=20=20:=20PASS=0A[=20=20=20=200.732450]=20emulate_step_test:=20=
lwzx=20=20=20=20=20=20=20=20=20=20=20:=20PASS=0A[=20=20=20=200.732454]=20=
emulate_step_test:=20std=20=20=20=20=20=20=20=20=20=20=20=20:=20PASS=0A[=20=
=20=20=200.732459]=20emulate_step_test:=20ldarx=20/=20stdcx.=20:=20PASS=0A=
[=20=20=20=200.732465]=20emulate_step_test:=20lfsx=20=20=20=20=20=20=20=20=
=20=20=20:=20PASS=0A[=20=20=20=200.732469]=20emulate_step_test:=20stfsx=20=
=20=20=20=20=20=20=20=20=20:=20PASS=0A[=20=20=20=200.732473]=20=
emulate_step_test:=20lfdx=20=20=20=20=20=20=20=20=20=20=20:=20PASS=0A[=20=
=20=20=200.732476]=20emulate_step_test:=20stfdx=20=20=20=20=20=20=20=20=20=
=20:=20PASS=0A[=20=20=20=200.732481]=20emulate_step_test:=20lvx=20=20=20=20=
=20=20=20=20=20=20=20=20:=20PASS=0A[=20=20=20=200.732485]=20=
emulate_step_test:=20stvx=20=20=20=20=20=20=20=20=20=20=20:=20PASS=0A[=20=
=20=20=200.732490]=20emulate_step_test:=20lxvd2x=20=20=20=20=20=20=20=20=20=
:=20PASS=0A[=20=20=20=200.732494]=20emulate_step_test:=20stxvd2x=20=20=20=
=20=20=20=20=20:=20PASS=0A[=20=20=20=200.732499]=20emulate_step_test:=20=
nop=20=20=20=20=20=20=20=20=20=20=20=20:=20R0=20=3D=20LONG_MAX=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732505]=20=
emulate_step_test:=20add=20=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN,=20RB=20=3D=20LONG_MIN=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732511]=20=
emulate_step_test:=20add=20=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732516]=20=
emulate_step_test:=20add=20=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MAX,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732522]=20=
emulate_step_test:=20add=20=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
ULONG_MAX,=20RB=20=3D=20ULONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732528]=20emulate_step_test:=20=
add=20=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20ULONG_MAX,=20RB=20=
=3D=200x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20PASS=0A[=20=20=20=200.732533]=20emulate_step_test:=20add=20=
=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20=
INT_MIN=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20PASS=0A[=20=20=20=200.732539]=20emulate_step_test:=20add=20=20=20=
=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MAX=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
PASS=0A[=20=20=20=200.732545]=20emulate_step_test:=20add=20=20=20=20=20=20=
=20=20=20=20=20=20:=20RA=20=3D=20INT_MAX,=20RB=20=3D=20INT_MAX=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=
=20=20=200.732550]=20emulate_step_test:=20add=20=20=20=20=20=20=20=20=20=20=
=20=20:=20RA=20=3D=20UINT_MAX,=20RB=20=3D=20UINT_MAX=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=20=
0.732556]=20emulate_step_test:=20add=20=20=20=20=20=20=20=20=20=20=20=20=
:=20RA=20=3D=20UINT_MAX,=20RB=20=3D=200x1=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=20=
0.732562]=20emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=20:=20=
RA=20=3D=20LONG_MIN,=20RB=20=3D=20LONG_MIN=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732568]=20=
emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732573]=20=
emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MAX,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732579]=20=
emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
ULONG_MAX,=20RB=20=3D=20ULONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732584]=20emulate_step_test:=20=
add.=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20ULONG_MAX,=20RB=20=3D=20=
0x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20PASS=0A[=20=20=20=200.732590]=20emulate_step_test:=20add.=20=20=20=
=20=20=20=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MIN=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
PASS=0A[=20=20=20=200.732596]=20emulate_step_test:=20add.=20=20=20=20=20=20=
=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MAX=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=
=20=200.732601]=20emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=
=20:=20RA=20=3D=20INT_MAX,=20RB=20=3D=20INT_MAX=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=20=
0.732607]=20emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=20:=20=
RA=20=3D=20UINT_MAX,=20RB=20=3D=20UINT_MAX=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732613]=20=
emulate_step_test:=20add.=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
UINT_MAX,=20RB=20=3D=200x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732619]=20=
emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN,=20RB=20=3D=20LONG_MIN=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732624]=20=
emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732630]=20=
emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MAX,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732636]=20=
emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
ULONG_MAX,=20RB=20=3D=20ULONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732641]=20emulate_step_test:=20=
addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20ULONG_MAX,=20RB=20=3D=20=
0x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20PASS=0A[=20=20=20=200.732647]=20emulate_step_test:=20addc=20=20=20=
=20=20=20=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MIN=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
PASS=0A[=20=20=20=200.732652]=20emulate_step_test:=20addc=20=20=20=20=20=20=
=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MAX=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=
=20=200.732658]=20emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=
=20:=20RA=20=3D=20INT_MAX,=20RB=20=3D=20INT_MAX=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=20=
0.732664]=20emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20=
RA=20=3D=20UINT_MAX,=20RB=20=3D=20UINT_MAX=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732669]=20=
emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
UINT_MAX,=20RB=20=3D=200x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732675]=20=
emulate_step_test:=20addc=20=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN=20|=20INT_MIN,=20RB=20=3D=20LONG_MIN=20|=20INT_MIN=20=20=20PASS=0A=
[=20=20=20=200.732680]=20emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=
=20=20:=20RA=20=3D=20LONG_MIN,=20RB=20=3D=20LONG_MIN=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=20=
0.732686]=20emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20:=20=
RA=20=3D=20LONG_MIN,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732692]=20=
emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MAX,=20RB=20=3D=20LONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732697]=20=
emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
ULONG_MAX,=20RB=20=3D=20ULONG_MAX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732703]=20emulate_step_test:=20=
addc.=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20ULONG_MAX,=20RB=20=3D=20=
0x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20PASS=0A[=20=20=20=200.732708]=20emulate_step_test:=20addc.=20=20=
=20=20=20=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MIN=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
PASS=0A[=20=20=20=200.732714]=20emulate_step_test:=20addc.=20=20=20=20=20=
=20=20=20=20=20:=20RA=20=3D=20INT_MIN,=20RB=20=3D=20INT_MAX=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=
=20=200.732720]=20emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20=
:=20RA=20=3D=20INT_MAX,=20RB=20=3D=20INT_MAX=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=20=
0.732725]=20emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20:=20=
RA=20=3D=20UINT_MAX,=20RB=20=3D=20UINT_MAX=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732731]=20=
emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
UINT_MAX,=20RB=20=3D=200x1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20PASS=0A[=20=20=20=200.732737]=20=
emulate_step_test:=20addc.=20=20=20=20=20=20=20=20=20=20:=20RA=20=3D=20=
LONG_MIN=20|=20INT_MIN,=20RB=20=3D=20LONG_MIN=20|=20INT_MIN=20=20=20PASS=0A=
[=20=20=20=200.732874]=20registered=20taskstats=20version=201=0A[=20=20=20=
=200.732914]=20zswap:=20loaded=20using=20pool=20lzo/zbud=0A[=20=20=20=20=
0.732960]=20pstore:=20Using=20crash=20dump=20compression:=20deflate=0A[=20=
=20=20=200.736153]=20Key=20type=20big_key=20registered=0A[=20=20=20=20=
0.738681]=20Key=20type=20encrypted=20registered=0A[=20=20=20=200.738700]=20=
ima:=20No=20TPM=20chip=20found,=20activating=20TPM-bypass!=0A[=20=20=20=20=
0.738705]=20ima:=20Allocated=20hash=20algorithm:=20sha256=0A[=20=20=20=20=
0.738718]=20No=20architecture=20policies=20found=0A[=20=20=20=20=
0.738731]=20evm:=20Initialising=20EVM=20extended=20attributes:=0A[=20=20=20=
=200.738734]=20evm:=20security.selinux=0A[=20=20=20=200.738737]=20evm:=20=
security.ima=0A[=20=20=20=200.738740]=20evm:=20security.capability=0A[=20=
=20=20=200.738743]=20evm:=20HMAC=20attrs:=200x1=0A[=20=20=20=200.738987]=20=
rtc-generic=20rtc-generic:=20setting=20system=20clock=20to=20=
2019-06-04T06:19:10=20UTC=20(1559629150)=0A[=20=20=20=200.740414]=20=
Freeing=20unused=20kernel=20memory:=204992K=0A[=20=20=20=200.740419]=20=
This=20architecture=20does=20not=20have=20kernel=20memory=20protection.=0A=
[=20=20=20=200.740424]=20Run=20/init=20as=20init=20process=0A[=20=20=20=20=
0.754661]=20systemd[1]:=20systemd=20239=20running=20in=20system=20mode.=20=
(+PAM=20+AUDIT=20+SELINUX=20+IMA=20-APPARMOR=20+SMACK=20+SYSVINIT=20=
+UTMP=20+LIBCRYPTSETUP=20+GCRYPT=20+GNUTLS=20+ACL=20+XZ=20+LZ4=20=
+SECCOMP=20+BLKID=20+ELFUTILS=20+KMOD=20+IDN2=20-IDN=20+PCRE2=20=
default-hierarchy=3Dlegacy)=0A[=20=20=20=200.754843]=20systemd[1]:=20=
Detected=20architecture=20ppc64-le.=0A[=20=20=20=200.754849]=20=
systemd[1]:=20Running=20in=20initial=20RAM=20disk.=0A=0AWelcome=20to=20=
Red=20Hat=20Enterprise=20Linux=208.0=20Beta=20(Ootpa)=20=
dracut-049-10.git20190115.el8=20(Initramfs)!=0A=0A[=20=20=20=200.764525]=20=
systemd[1]:=20Set=20hostname=20to=20<ltczep10-lp4.aus.stglabs.ibm.com>.=0A=
[=20=20=20=200.813003]=20random:=20systemd:=20uninitialized=20urandom=20=
read=20(16=20bytes=20read)=0A[=20=20=20=200.813105]=20systemd[1]:=20=
Listening=20on=20Journal=20Socket=20(/dev/log).=0A[=20=20OK=20=20]=20=
Listening=20on=20Journal=20Socket=20(/dev/log).=0A[=20=20=20=200.813308]=20=
random:=20systemd:=20uninitialized=20urandom=20read=20(16=20bytes=20=
read)=0A[=20=20=20=200.813319]=20systemd[1]:=20Reached=20target=20Swap.=0A=
[=20=20OK=20=20]=20Reached=20target=20Swap.=0A[=20=20=20=200.813447]=20=
random:=20systemd:=20uninitialized=20urandom=20read=20(16=20bytes=20=
read)=0A[=20=20=20=200.813498]=20systemd[1]:=20Listening=20on=20udev=20=
Kernel=20Socket.=0A[=20=20OK=20=20]=20Listening=20on=20udev=20Kernel=20=
Socket.=0A[=20=20=20=200.813625]=20systemd[1]:=20Reached=20target=20=
Local=20File=20Systems.=0A[=20=20OK=20=20]=20Reached=20target=20Local=20=
File=20Systems.=0A[=20=20=20=200.813825]=20systemd[1]:=20Listening=20on=20=
Journal=20Socket.=0A[=20=20OK=20=20]=20Listening=20on=20Journal=20=
Socket.=0A[=20=20=20=200.815758]=20systemd[1]:=20Starting=20Setup=20=
Virtual=20Console...=0A=20=20=20=20=20=20=20=20=20Starting=20Setup=20=
Virtual=20Console...=0A=20=20=20=20=20=20=20=20=20Starting=20Create=20=
Volatile=20Files=20and=20Directories...=0A=20=20=20=20=20=20=20=20=20=
Starting=20Apply=20Kernel=20Variables...=0A[=20=20OK=20=20]=20Reached=20=
target=20Timers.=0A=20=20=20=20=20=20=20=20=20Starting=20Create=20list=20=
of=20required=20st=E2=80=A6ce=20nodes=20for=20the=20current=20kernel...=0A=
[=20=20OK=20=20]=20Reached=20target=20Slices.=0A=20=20=20=20=20=20=20=20=20=
Starting=20Journal=20Service...=0A[=20=20OK=20=20]=20Listening=20on=20=
udev=20Control=20Socket.=0A[=20=20OK=20=20]=20Reached=20target=20=
Sockets.=0A[=20=20OK=20=20]=20Started=20Create=20list=20of=20required=20=
sta=E2=80=A6vice=20nodes=20for=20the=20current=20kernel.=0A[=20=20OK=20=20=
]=20Started=20Create=20Volatile=20Files=20and=20Directories.=0A[=20=20OK=20=
=20]=20Started=20Apply=20Kernel=20Variables.=0A=20=20=20=20=20=20=20=20=20=
Starting=20Create=20Static=20Device=20Nodes=20in=20/dev...=0A[=20=20OK=20=
=20]=20Started=20Create=20Static=20Device=20Nodes=20in=20/dev.=0A[=20=20=
OK=20=20]=20Started=20Journal=20Service.=0A[=20=20OK=20=20]=20Started=20=
Setup=20Virtual=20Console.=0A=20=20=20=20=20=20=20=20=20Starting=20=
dracut=20cmdline=20hook...=0A[=20=20OK=20=20]=20Started=20dracut=20=
cmdline=20hook.=0A=20=20=20=20=20=20=20=20=20Starting=20dracut=20=
pre-udev=20hook...=0A[=20=20OK=20=20]=20Started=20dracut=20pre-udev=20=
hook.=0A=20=20=20=20=20=20=20=20=20Starting=20udev=20Kernel=20Device=20=
Manager...=0A[=20=20OK=20=20]=20Started=20udev=20Kernel=20Device=20=
Manager.=0A=20=20=20=20=20=20=20=20=20Starting=20udev=20Coldplug=20all=20=
Devices...=0A=20=20=20=20=20=20=20=20=20Mounting=20Kernel=20=
Configuration=20File=20System...=0A[=20=20OK=20=20]=20Mounted=20Kernel=20=
Configuration=20File=20System.=0A[=20=20=20=201.046123]=20synth=20=
uevent:=20/devices/vio:=20failed=20to=20send=20uevent=0A[=20=20=20=20=
1.046134]=20vio=20vio:=20uevent:=20failed=20to=20send=20synthetic=20=
uevent=0A[=20=20=20=201.046181]=20synth=20uevent:=20/devices/vio/4000:=20=
failed=20to=20send=20uevent=0A[=20=20=20=201.046186]=20vio=204000:=20=
uevent:=20failed=20to=20send=20synthetic=20uevent=0A[=20=20=20=20=
1.046199]=20synth=20uevent:=20/devices/vio/4001:=20failed=20to=20send=20=
uevent=0A[=20=20=20=201.046204]=20vio=204001:=20uevent:=20failed=20to=20=
send=20synthetic=20uevent=0A[=20=20=20=201.046220]=20synth=20uevent:=20=
/devices/vio/4002:=20failed=20to=20send=20uevent=0A[=20=20=20=20=
1.046225]=20vio=204002:=20uevent:=20failed=20to=20send=20synthetic=20=
uevent=0A[=20=20=20=201.046238]=20synth=20uevent:=20/devices/vio/4004:=20=
failed=20to=20send=20uevent=0A[=20=20=20=201.046243]=20vio=204004:=20=
uevent:=20failed=20to=20send=20synthetic=20uevent=0A[=20=20OK=20=20]=20=
Started=20udev=20Coldplug=20all=20Devices.=0A=20=20=20=20=20=20=20=20=20=
Starting=20dracut=20initqueue=20hook...=0A[=20=20OK=20=20]=20Reached=20=
target=20System=20Initialization.=0A=20=20=20=20=20=20=20=20=20Starting=20=
Show=20Plymouth=20Boot=20Screen...=0A[=20=20OK=20=20]=20Started=20Show=20=
Plymouth=20Boot=20Screen.=0A[=20=20OK=20=20]=20Reached=20target=20Paths.=0A=
[=20=20OK=20=20]=20Started=20Forward=20Password=20Requests=20to=20=
Plymouth=20Directory=20Watch.=0A[=20=20OK=20=20]=20Reached=20target=20=
Basic=20System.=0A[=20=20=20=201.080244]=20ibmvscsi=2030000068:=20=
SRP_VERSION:=2016.a=0A[=20=20=20=201.089914]=20ibmveth=2030000002=20=
env2:=20renamed=20from=20eth0=0A[=20=20=20=201.130734]=20------------[=20=
cut=20here=20]------------=0A[=20=20=20=201.130745]=20kernel=20BUG=20at=20=
mm/vmalloc.c:470!=0A[=20=20=20=201.130753]=20Oops:=20Exception=20in=20=
kernel=20mode,=20sig:=205=20[#1]=0A[=20=20=20=201.130761]=20LE=20=
PAGE_SIZE=3D64K=20MMU=3DHash=20SMP=20NR_CPUS=3D2048=20NUMA=20pSeries=0A[=20=
=20=20=201.130768]=20Modules=20linked=20in:=20ibmvscsi(+)=20ibmveth=20=
scsi_transport_srp=0A[=20=20=20=201.130781]=20CPU:=2023=20PID:=20127=20=
Comm:=20kworker/23:0=20Not=20tainted=205.2.0-rc3-next-20190603=20#1=0A[=20=
=20=20=201.130796]=20Workqueue:=20events=20do_free_init=0A[=20=20=20=20=
1.130803]=20NIP:=20=20c0000000003bcc48=20LR:=20c0000000003bcbc4=20CTR:=20=
c0000000003bc860=0A[=20=20=20=201.130812]=20REGS:=20c0000018ec7877e0=20=
TRAP:=200700=20=20=20Not=20tainted=20=20(5.2.0-rc3-next-20190603)=0A[=20=20=
=20=201.130820]=20MSR:=20=20800000010282b033=20=
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>=20=20CR:=2024008888=20=20XER:=20=
20040005=0A[=20=20=20=201.130837]=20CFAR:=20c0000000003bcc6c=20IRQMASK:=20=
0=20=0A[=20=20=20=201.130837]=20GPR00:=20c0000000003bd0e4=20=
c0000018ec787a70=20c000000001929400=200000000000000001=20=0A[=20=20=20=20=
1.130837]=20GPR04:=20c0000018e8d2e8f0=20c0000018e8d2e8f0=20=
c008000006570000=20c008000006550000=20=0A[=20=20=20=201.130837]=20GPR08:=20=
c008000009670000=20c0000018e8d0e098=20c0000018e8d0e5f8=20=
c0000018e8ca93f0=20=0A[=20=20=20=201.130837]=20GPR12:=20c0000000003bc860=20=
c00000001ec4e200=20c000000000160188=20c0000018f4044d00=20=0A[=20=20=20=20=
1.130837]=20GPR16:=200000000000000000=200000000000000000=20=
0000000000000000=200000000000000000=20=0A[=20=20=20=201.130837]=20GPR20:=20=
0000000000000000=200000000000000000=20c000000001485108=20=
c0000000019620d8=20=0A[=20=20=20=201.130837]=20GPR24:=20c000000001962464=20=
0000000000000800=200000000000000001=200000000000001800=20=0A[=20=20=20=20=
1.130837]=20GPR28:=20c000000001ccc0a8=20c000000001ccc080=20=
c0000018e8d2e8b8=20c0000018e8d2e8d8=20=0A[=20=20=20=201.130899]=20NIP=20=
[c0000000003bcc48]=20__free_vmap_area+0xf8/0x480=0A[=20=20=20=20=
1.130906]=20LR=20[c0000000003bcbc4]=20__free_vmap_area+0x74/0x480=0A[=20=20=
=20=201.130912]=20Call=20Trace:=0A[=20=20=20=201.130916]=20=
[c0000018ec787a70]=20[c0000000003bcf70]=20__free_vmap_area+0x420/0x480=20=
(unreliable)=0A[=20=20=20=201.130924]=20[c0000018ec787ac0]=20=
[c0000000003bd0e4]=20__purge_vmap_area_lazy+0x114/0x1e0=0A[=20=20=20=20=
1.130932]=20[c0000018ec787b10]=20[c0000000003bef44]=20=
_vm_unmap_aliases+0x1a4/0x210=0A[=20=20=20=201.130939]=20=
[c0000018ec787b90]=20[c0000000003c1c48]=20__vunmap+0xe8/0x220=0A[=20=20=20=
=201.130946]=20[c0000018ec787c20]=20[c00000000021102c]=20=
module_memfree+0x3c/0x50=0A[=20=20=20=201.130953]=20[c0000018ec787c40]=20=
[c0000000002110ac]=20do_free_init+0x6c/0xa0=0A[=20=20=20=201.130964]=20=
[c0000018ec787c70]=20[c000000000156df0]=20process_one_work+0x260/0x520=0A=
[=20=20=20=201.130976]=20[c0000018ec787d10]=20[c000000000157138]=20=
worker_thread+0x88/0x5f0=0A[=20=20=20=201.130985]=20[c0000018ec787db0]=20=
[c000000000160328]=20kthread+0x1a8/0x1b0=0A[=20=20=20=201.130996]=20=
[c0000018ec787e20]=20[c00000000000ba54]=20=
ret_from_kernel_thread+0x5c/0x68=0A[=20=20=20=201.131004]=20Instruction=20=
dump:=0A[=20=20=20=201.131011]=20e9292c90=202fa90000=20419e0378=20=
e8fe0000=20e8de0008=2060000000=20e909ffe8=20e949ffe0=20=0A[=20=20=20=20=
1.131021]=207fa74040=20409c0014=207faa3040=20409c002c=20<0fe00000>=20=
60000000=207faa3040=20409cfff4=20=0A[=20=20=20=201.131032]=20---[=20end=20=
trace=20b0b43434aedbb78e=20]---=0A[=20=20=20=201.133448]=20=0A[=20=20=20=20=
2.133462]=20Kernel=20panic=20-=20not=20syncing:=20Fatal=20exception=0A[=20=
=20=20=202.141765]=20WARNING:=20CPU:=2023=20PID:=20127=20at=20=
drivers/tty/vt/vt.c:4234=20do_unblank_screen+0x190/0x250=0A[=20=20=20=20=
2.141775]=20Modules=20linked=20in:=20ibmvscsi(+)=20ibmveth=20=
scsi_transport_srp=0A[=20=20=20=202.141785]=20CPU:=2023=20PID:=20127=20=
Comm:=20kworker/23:0=20Tainted:=20G=20=20=20=20=20=20D=20=20=20=20=20=20=20=
=20=20=20=205.2.0-rc3-next-20190603=20#1=0A[=20=20=20=202.141796]=20=
Workqueue:=20events=20do_free_init=0A[=20=20=20=202.141802]=20NIP:=20=20=
c0000000007718a0=20LR:=20c00000000077188c=20CTR:=20c000000000c06d30=0A[=20=
=20=20=202.141810]=20REGS:=20c0000018ec7872c0=20TRAP:=200700=20=20=20=
Tainted:=20G=20=20=20=20=20=20D=20=20=20=20=20=20=20=20=20=20=20=20=
(5.2.0-rc3-next-20190603)=0A[=20=20=20=202.141818]=20MSR:=20=20=
8000000000021033=20<SF,ME,IR,DR,RI,LE>=20=20CR:=2028002242=20=20XER:=20=
2004000c=0A[=20=20=20=202.141830]=20CFAR:=20c0000000001b54e8=20IRQMASK:=20=
3=20=0A[=20=20=20=202.141830]=20GPR00:=20c00000000077188c=20=
c0000018ec787550=20c000000001929400=200000000000000000=20=0A[=20=20=20=20=
2.141830]=20GPR04:=200000000000000003=20c0000018e392e00e=20=
0000000000001dd7=20c0000018ec787490=20=0A[=20=20=20=202.141830]=20GPR08:=20=
c0000000017e3258=200000000000000000=200000000000000000=20=
c0000018ec78730f=20=0A[=20=20=20=202.141830]=20GPR12:=200000000028002448=20=
c00000001ec4e200=20c000000000160188=20c0000018f4044d00=20=0A[=20=20=20=20=
2.141830]=20GPR16:=200000000000000000=200000000000000000=20=
0000000000000000=200000000000000000=20=0A[=20=20=20=202.141830]=20GPR20:=20=
0000000000000000=200000000000000000=20c000000001485108=20=
c0000000019620d8=20=0A[=20=20=20=202.141830]=20GPR24:=20c000000001962464=20=
0000000000000800=20c0000000017f3b20=200000000000001800=20=0A[=20=20=20=20=
2.141830]=20GPR28:=20c000000001b066c0=20c000000001b06698=20=
0000000000000000=20c000000001c15100=20=0A[=20=20=20=202.141899]=20NIP=20=
[c0000000007718a0]=20do_unblank_screen+0x190/0x250=0A[=20=20=20=20=
2.141906]=20LR=20[c00000000077188c]=20do_unblank_screen+0x17c/0x250=0A[=20=
=20=20=202.141912]=20Call=20Trace:=0A[=20=20=20=202.141917]=20=
[c0000018ec787550]=20[c0000000007718bc]=20do_unblank_screen+0x1ac/0x250=20=
(unreliable)=0A[=20=20=20=202.141928]=20[c0000018ec7875d0]=20=
[c00000000012b504]=20panic+0x1dc/0x408=0A[=20=20=20=202.141937]=20=
[c0000018ec787670]=20[c00000000002db70]=20oops_end+0x1b0/0x1c0=0A[=20=20=20=
=202.141945]=20[c0000018ec7876f0]=20[c0000000000307a0]=20=
program_check_exception+0x2c0/0x3c0=0A[=20=20=20=202.141954]=20=
[c0000018ec787770]=20[c000000000008f54]=20=
program_check_common+0x154/0x160=0A[=20=20=20=202.141965]=20---=20=
interrupt:=20700=20at=20__free_vmap_area+0xf8/0x480=0A[=20=20=20=20=
2.141965]=20=20=20=20=20LR=20=3D=20__free_vmap_area+0x74/0x480=0A[=20=20=20=
=202.141976]=20[c0000018ec787a70]=20[c0000000003bcf70]=20=
__free_vmap_area+0x420/0x480=20(unreliable)=0A[=20=20=20=202.141985]=20=
[c0000018ec787ac0]=20[c0000000003bd0e4]=20=
__purge_vmap_area_lazy+0x114/0x1e0=0A[=20=20=20=202.141995]=20=
[c0000018ec787b10]=20[c0000000003bef44]=20_vm_unmap_aliases+0x1a4/0x210=0A=
[=20=20=20=202.142004]=20[c0000018ec787b90]=20[c0000000003c1c48]=20=
__vunmap+0xe8/0x220=0A[=20=20=20=202.142012]=20[c0000018ec787c20]=20=
[c00000000021102c]=20module_memfree+0x3c/0x50=0A[=20=20=20=202.142020]=20=
[c0000018ec787c40]=20[c0000000002110ac]=20do_free_init+0x6c/0xa0=0A[=20=20=
=20=202.142029]=20[c0000018ec787c70]=20[c000000000156df0]=20=
process_one_work+0x260/0x520=0A[=20=20=20=202.142038]=20=
[c0000018ec787d10]=20[c000000000157138]=20worker_thread+0x88/0x5f0=0A[=20=
=20=20=202.142046]=20[c0000018ec787db0]=20[c000000000160328]=20=
kthread+0x1a8/0x1b0=0A[=20=20=20=202.142054]=20[c0000018ec787e20]=20=
[c00000000000ba54]=20ret_from_kernel_thread+0x5c/0x68=0A[=20=20=20=20=
2.142062]=20Instruction=20dump:=0A[=20=20=20=202.142067]=204e800020=20=
60000000=2060000000=2060000000=207c0802a6=20f8010090=204ba43c51=20=
60000000=20=0A[=20=20=20=202.142078]=20813f0000=207d231b78=202f830000=20=
409e0034=20<0fe00000>=20e8010090=207c0803a6=204bfffeac=20=0A[=20=20=20=20=
2.142090]=20---[=20end=20trace=20b0b43434aedbb78f=20]---=0A[=20=20=20=20=
2.142097]=20Rebooting=20in=2010=20seconds..=0A=0A=

--Apple-Mail=_5062A1FE-9AB2-4A0A-92C2-DB3F6773A804--

