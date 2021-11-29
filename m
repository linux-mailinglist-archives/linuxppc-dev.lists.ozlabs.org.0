Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D9460F22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2bpF37X3z3c4y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:00:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fPYsyB7a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fPYsyB7a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2bnV5HKvz2xDH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 17:59:42 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AT6pXme020668; 
 Mon, 29 Nov 2021 06:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 subject : message-id : date : cc : to : mime-version; s=pp1;
 bh=50drAgPyQI24gS/xQ0Ti5cxDdJqJAxg88qKEUaGUq9s=;
 b=fPYsyB7aIcfeOoQ6fkvPL/4f9Tj9O8A0PaSNtZmKlu/O9il3ifO5dAzGdVTWqlcRjUM4
 y5Amey7dhedLm4k8h49eniDmNnSwGq1E9iw2gdmNpzKQOoFna1/vIW7VADdI52P434bz
 7E3SZGtEhG1IJA02DVJez58ICJFYxrZepJ3THSd8RjmlvCcq7ovMcGx+t3qfr2O/IhR6
 iFPcbeHE6ULe4IZao8LuN82BtrSNRF0pfGdlf5P1DWlR4h1T4NiKcfsGGL703nP6FRGZ
 0bynIDk+vZbRLAjlVkk6fbqPJoBz53N3uFJ4y6qzPB+qfe1gm6W5gP9Ai80Z77y6K5J+ OQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmsyc84ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 06:59:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AT6qQg7031056;
 Mon, 29 Nov 2021 06:59:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ckca9199k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 06:59:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AT6xVRP197248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 06:59:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1748F52089;
 Mon, 29 Nov 2021 06:59:31 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.37.93])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8E4ED52073;
 Mon, 29 Nov 2021 06:59:29 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_9862AEBE-2452-45C2-A05E-026F158CD5EC"
Subject: [linux-next] Read-only file system after boot (powerpc)
Message-Id: <87F94FF1-5D9D-475B-B083-C101DDB7A108@linux.vnet.ibm.com>
Date: Mon, 29 Nov 2021 12:29:28 +0530
To: linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kb2Y_nAO9XF3y1nTaKr3vQG3GhAjvW3-
X-Proofpoint-ORIG-GUID: Kb2Y_nAO9XF3y1nTaKr3vQG3GhAjvW3-
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_02,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290029
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_9862AEBE-2452-45C2-A05E-026F158CD5EC
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

With recent version of linux-next builds on IBM Power servers,
depending on file system used I have observed the file system is either
mounted read-only(ext4) or kernel fails to reach login prompt (with XFS).
In both cases following messages are seen during boot:

[    4.379474] sd 0:0:1:0: [sda] tag#25 FAILED Result: hostbyte=3DDID_OK dr=
iverbyte=3DDRIVER_OK cmd_age=3D0s
[    4.379479] sd 0:0:1:0: [sda] tag#25 Sense Key : Illegal Request [curren=
t]
[    4.379483] sd 0:0:1:0: [sda] tag#25 Add. Sense: Invalid field in cdb
[    4.379487] sd 0:0:1:0: [sda] tag#25 CDB: Write(10) 2a 08 00 db d7 36 00=
 00 01 00
[    4.379490] critical target error, dev sda, sector 115259824 op 0x1:(WRI=
TE) flags 0x69800 phys_seg 1 prio class 0

I first thought these might be due to failed drives, but started seeing them
on several servers. I have attached linux boot log (boot.log) for reference.

git bisect points to following commit:

f1880d26e517a3fe2fd0c32bcbe05e9230a441cf is the first bad commit
commit f1880d26e517a3fe2fd0c32bcbe05e9230a441cf
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Nov 24 07:28:56 2021 +0100

    blk-mq: cleanup request allocation

Reverting this patch helps.=20

# git bisect log
git bisect start
# bad: [f30a24ed97b401416118756fa35fbe5d28f999e3] Add linux-next specific f=
iles for 20211126
git bisect bad f30a24ed97b401416118756fa35fbe5d28f999e3
# good: [136057256686de39cc3a07c2e39ef6bc43003ff6] Linux 5.16-rc2
git bisect good 136057256686de39cc3a07c2e39ef6bc43003ff6
# good: [f7cdb85df9f5705849b31d44f4f02de4fd0d5f9e] Merge branch 'master' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git
git bisect good f7cdb85df9f5705849b31d44f4f02de4fd0d5f9e
# bad: [df829d7e3ea25733fab4682a3a7ed2339f55d926] Merge branch 'for-next' o=
f git://git.kernel.dk/linux-block.git
git bisect bad df829d7e3ea25733fab4682a3a7ed2339f55d926
# good: [bf0d7cde12d6913d21e790efeda122a1cf42c5c3] Merge branch 'drm-next' =
of https://gitlab.freedesktop.org/agd5f/linux
git bisect good bf0d7cde12d6913d21e790efeda122a1cf42c5c3
# good: [06cceaadd85112f6753fa46efd6538ac4bc0fed8] Merge branch 'for-linux-=
next-gt' of git://anongit.freedesktop.org/drm-intel
git bisect good 06cceaadd85112f6753fa46efd6538ac4bc0fed8
# good: [6c26b5054ce2b822856e32f1840d13f777c6f295] ASoC: SOF: Intel: add .a=
ck support for HDaudio platforms
git bisect good 6c26b5054ce2b822856e32f1840d13f777c6f295
# bad: [8b333e2b7f20a21c8bb969c1c05aa9c2d8c6f73f] Merge branch 'for-5.17/io=
_uring' into for-next
git bisect bad 8b333e2b7f20a21c8bb969c1c05aa9c2d8c6f73f
# good: [441a375d2002edb994eba4b39259c6d177714578] blk-ioprio: don't set bi=
o priority if not needed
git bisect good 441a375d2002edb994eba4b39259c6d177714578
# bad: [c895b784c699224d690c7dfbdcff309df82366e3] loop: don't hold lo_mutex=
 during __loop_clr_fd()
git bisect bad c895b784c699224d690c7dfbdcff309df82366e3
# good: [10e69ae57a1d4a026de15a9c9058c79ecd47e287] block: don't include blk=
-mq-sched.h in blk.h
git bisect good 10e69ae57a1d4a026de15a9c9058c79ecd47e287
# good: [65db5bdc941eab6e3d2adee483d1cb0ec70a39ad] block: don't include <li=
nux/idr.h> in blk.h
git bisect good 65db5bdc941eab6e3d2adee483d1cb0ec70a39ad
# bad: [f1880d26e517a3fe2fd0c32bcbe05e9230a441cf] blk-mq: cleanup request a=
llocation
git bisect bad f1880d26e517a3fe2fd0c32bcbe05e9230a441cf
# good: [b1d1d48b8b3a90b4eb28fe3222ca57c6266e211c] block: don't include <li=
nux/part_stat.h> in blk.h
git bisect good b1d1d48b8b3a90b4eb28fe3222ca57c6266e211c
# first bad commit: [f1880d26e517a3fe2fd0c32bcbe05e9230a441cf] blk-mq: clea=
nup request allocation
#

Thanks
-Sachin



--Apple-Mail=_9862AEBE-2452-45C2-A05E-026F158CD5EC
Content-Disposition: attachment;
	filename=boot.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="boot.log"
Content-Transfer-Encoding: quoted-printable

[=20=20746.085423]=20kexec_core:=20Starting=20new=20kernel=0A[=20=20=
746.105453]=20kexec:=20waiting=20for=20cpu=209=20(physical=209)=20to=20=
enter=201=20state=0A[=20=20746.105457]=20kexec:=20waiting=20for=20cpu=20=
17=20(physical=2017)=20to=20enter=201=20state=0A[=20=20746.105461]=20=
kexec:=20waiting=20for=20cpu=2019=20(physical=2019)=20to=20enter=201=20=
state=0A[=20=20746.105466]=20kexec:=20waiting=20for=20cpu=201=20=
(physical=201)=20to=20enter=202=20state=0A[=20=20746.105518]=20kexec:=20=
waiting=20for=20cpu=202=20(physical=202)=20to=20enter=202=20state=0A[=20=20=
746.105537]=20kexec:=20waiting=20for=20cpu=204=20(physical=204)=20to=20=
enter=202=20state=0A[=20=20746.105544]=20kexec:=20waiting=20for=20cpu=20=
5=20(physical=205)=20to=20enter=202=20state=0A[=20=20746.105551]=20=
kexec:=20waiting=20for=20cpu=206=20(physical=206)=20to=20enter=202=20=
state=0A[=20=20746.105562]=20kexec:=20waiting=20for=20cpu=207=20=
(physical=207)=20to=20enter=202=20state=0A[=20=20746.105569]=20kexec:=20=
waiting=20for=20cpu=2015=20(physical=2015)=20to=20enter=202=20state=0A[=20=
=20746.105573]=20kexec:=20waiting=20for=20cpu=2018=20(physical=2018)=20=
to=20enter=202=20state=0A[=20=20746.238320]=20kexec:=20Starting=20=
switchover=20sequence.=0AI'm=20in=20purgatory=0A[=20=20=20=200.000000]=20=
radix-mmu:=20Page=20sizes=20from=20device-tree:=0A[=20=20=20=200.000000]=20=
radix-mmu:=20Page=20size=20shift=20=3D=2012=20AP=3D0x0=0A[=20=20=20=20=
0.000000]=20radix-mmu:=20Page=20size=20shift=20=3D=2016=20AP=3D0x5=0A[=20=
=20=20=200.000000]=20radix-mmu:=20Page=20size=20shift=20=3D=2021=20=
AP=3D0x1=0A[=20=20=20=200.000000]=20radix-mmu:=20Page=20size=20shift=20=3D=
=2030=20AP=3D0x2=0A[=20=20=20=200.000000]=20Activating=20Kernel=20=
Userspace=20Execution=20Prevention=0A[=20=20=20=200.000000]=20Activating=20=
Kernel=20Userspace=20Access=20Prevention=0A[=20=20=20=200.000000]=20=
radix-mmu:=20Mapped=200x0000000000000000-0x0000000002600000=20with=20=
2.00=20MiB=20pages=20(exec)=0A[=20=20=20=200.000000]=20radix-mmu:=20=
Mapped=200x0000000002600000-0x0000001680000000=20with=202.00=20MiB=20=
pages=0A[=20=20=20=200.000000]=20lpar:=20Using=20radix=20MMU=20under=20=
hypervisor=0A[=20=20=20=200.000000]=20Linux=20version=20=
5.16.0-rc2-next-20211125=20(root@ltcden8-lp3.aus.stglabs.ibm.com)=20(gcc=20=
(GCC)=208.4.1=2020200928=20(Red=20Hat=208.4.1-1),=20GNU=20ld=20version=20=
2.30-93.el8)=20#1=20SMP=20Thu=20Nov=2025=2017:43:14=20EST=202021=0A[=20=20=
=20=200.000000]=20Found=20initrd=20at=20=
0xc0000000055a0000:0xc00000000912e2e4=0A[=20=20=20=200.000000]=20Using=20=
pSeries=20machine=20description=0A[=20=20=20=200.000000]=20printk:=20=
bootconsole=20[udbg0]=20enabled=0A[=20=20=20=200.000000]=20Partition=20=
configured=20for=2048=20cpus.=0A[=20=20=20=200.000000]=20CPU=20maps=20=
initialized=20for=208=20threads=20per=20core=0A[=20=20=20=200.000000]=20=
numa:=20Partition=20configured=20for=2032=20NUMA=20nodes.=0A[=20=20=20=20=
0.000000]=20-----------------------------------------------------=0A[=20=20=
=20=200.000000]=20phys_mem_size=20=20=20=20=20=3D=200x1680000000=0A[=20=20=
=20=200.000000]=20dcache_bsize=20=20=20=20=20=20=3D=200x80=0A[=20=20=20=20=
0.000000]=20icache_bsize=20=20=20=20=20=20=3D=200x80=0A[=20=20=20=20=
0.000000]=20cpu_features=20=20=20=20=20=20=3D=200x000c00eb8f5f9187=0A[=20=
=20=20=200.000000]=20=20=20possible=20=20=20=20=20=20=20=20=3D=20=
0x000ffbfbcf5fb187=0A[=20=20=20=200.000000]=20=20=20always=20=20=20=20=20=
=20=20=20=20=20=3D=200x0000000380008181=0A[=20=20=20=200.000000]=20=
cpu_user_features=20=3D=200xdc0065c2=200xaef60000=0A[=20=20=20=20=
0.000000]=20mmu_features=20=20=20=20=20=20=3D=200x3c007641=0A[=20=20=20=20=
0.000000]=20firmware_features=20=3D=200x0000019fc45bfc57=0A[=20=20=20=20=
0.000000]=20vmalloc=20start=20=20=20=20=20=3D=200xc008000000000000=0A[=20=
=20=20=200.000000]=20IO=20start=20=20=20=20=20=20=20=20=20=20=3D=20=
0xc00a000000000000=0A[=20=20=20=200.000000]=20vmemmap=20start=20=20=20=20=
=20=3D=200xc00c000000000000=0A[=20=20=20=200.000000]=20=
-----------------------------------------------------=0A[=20=20=20=20=
0.000000]=20numa:=20=20=20NODE_DATA=20[mem=200x167f6cc000-0x167f6d10ff]=0A=
[=20=20=20=200.000000]=20rfi-flush:=20fallback=20displacement=20flush=20=
available=0A[=20=20=20=200.000000]=20count-cache-flush:=20hardware=20=
flush=20enabled.=0A[=20=20=20=200.000000]=20link-stack-flush:=20software=20=
flush=20enabled.=0A[=20=20=20=200.000000]=20stf-barrier:=20eieio=20=
barrier=20available=0A[=20=20=20=200.000000]=20lpar:=20H_BLOCK_REMOVE=20=
supports=20base=20psize:0=20psize:0=20block=20size:8=0A[=20=20=20=20=
0.000000]=20PPC64=20nvram=20contains=2015360=20bytes=0A[=20=20=20=20=
0.000000]=20barrier-nospec:=20using=20ORI=20speculation=20barrier=0A[=20=20=
=20=200.000000]=20Zone=20ranges:=0A[=20=20=20=200.000000]=20=20=20Normal=20=
=20=20[mem=200x0000000000000000-0x000000167fffffff]=0A[=20=20=20=20=
0.000000]=20Movable=20zone=20start=20for=20each=20node=0A[=20=20=20=20=
0.000000]=20Early=20memory=20node=20ranges=0A[=20=20=20=200.000000]=20=20=
=20node=20=20=202:=20[mem=200x0000000000000000-0x000000167fffffff]=0A[=20=
=20=20=200.000000]=20Initmem=20setup=20node=202=20[mem=20=
0x0000000000000000-0x000000167fffffff]=0A[=20=20=20=200.000000]=20cpu=20=
32=20has=20no=20node=200=20or=20node-local=20memory=0A[=20=20=20=20=
0.000000]=20percpu:=20Embedded=2010=20pages/cpu=20s589848=20r0=20d65512=20=
u655360=0A[=20=20=20=200.000000]=20Fallback=20order=20for=20Node=202:=20=
2=20=0A[=20=20=20=200.000000]=20Built=201=20zonelists,=20mobility=20=
grouping=20on.=20=20Total=20pages:=201473120=0A[=20=20=20=200.000000]=20=
Policy=20zone:=20Normal=0A[=20=20=20=200.000000]=20Kernel=20command=20=
line:=20BOOT_IMAGE=3D/boot/vmlinuz-4.18.0-305.25.1.el8_4.ppc64le=20=
root=3D/dev/sda2=20ro=20selinux=3D0=20biosdevname=3D0=20=0A[=20=20=20=20=
0.000000]=20Unknown=20kernel=20command=20line=20parameters=20=
"BOOT_IMAGE=3D/boot/vmlinuz-4.18.0-305.25.1.el8_4.ppc64le=20=
biosdevname=3D0",=20will=20be=20passed=20to=20user=20space.=0A[=20=20=20=20=
0.000000]=20Dentry=20cache=20hash=20table=20entries:=208388608=20(order:=20=
10,=2067108864=20bytes,=20linear)=0A[=20=20=20=200.000000]=20Inode-cache=20=
hash=20table=20entries:=204194304=20(order:=209,=2033554432=20bytes,=20=
linear)=0A[=20=20=20=200.000000]=20mem=20auto-init:=20stack:off,=20heap=20=
alloc:off,=20heap=20free:off=0A[=20=20=20=200.000000]=20Memory:=20=
93929152K/94371840K=20available=20(13504K=20kernel=20code,=205696K=20=
rwdata,=204224K=20rodata,=204992K=20init,=202689K=20bss,=20442688K=20=
reserved,=200K=20cma-reserved)=0A[=20=20=20=200.000000]=20SLUB:=20=
HWalign=3D128,=20Order=3D0-3,=20MinObjects=3D0,=20CPUs=3D48,=20Nodes=3D32=0A=
[=20=20=20=200.000000]=20ftrace:=20allocating=2033830=20entries=20in=20=
13=20pages=0A[=20=20=20=200.000000]=20ftrace:=20allocated=2013=20pages=20=
with=203=20groups=0A[=20=20=20=200.000000]=20trace=20event=20string=20=
verifier=20disabled=0A[=20=20=20=200.000000]=20rcu:=20Hierarchical=20RCU=20=
implementation.=0A[=20=20=20=200.000000]=20rcu:=20=09RCU=20restricting=20=
CPUs=20from=20NR_CPUS=3D2048=20to=20nr_cpu_ids=3D48.=0A[=20=20=20=20=
0.000000]=20=09Rude=20variant=20of=20Tasks=20RCU=20enabled.=0A[=20=20=20=20=
0.000000]=20rcu:=20RCU=20calculated=20value=20of=20scheduler-enlistment=20=
delay=20is=2010=20jiffies.=0A[=20=20=20=200.000000]=20rcu:=20Adjusting=20=
geometry=20for=20rcu_fanout_leaf=3D16,=20nr_cpu_ids=3D48=0A[=20=20=20=20=
0.000000]=20NR_IRQS:=20512,=20nr_irqs:=20512,=20preallocated=20irqs:=20=
16=0A[=20=20=20=200.000000]=20xive:=20Using=20IRQ=20range=20=
[400000-40002f]=0A[=20=20=20=200.000000]=20xive:=20Interrupt=20handling=20=
initialized=20with=20spapr=20backend=0A[=20=20=20=200.000000]=20xive:=20=
Using=20priority=207=20for=20all=20interrupts=0A[=20=20=20=200.000000]=20=
xive:=20Using=2064kB=20queues=0A[=20=20=20=200.000000]=20rcu:=20=09=
Offload=20RCU=20callbacks=20from=20CPUs:=20(none).=0A[=20=20=20=20=
0.000000]=20random:=20get_random_u64=20called=20from=20=
start_kernel+0x9a0/0xc00=20with=20crng_init=3D0=0A[=20=20=20=200.000000]=20=
time_init:=2056=20bit=20decrementer=20(max:=207fffffffffffff)=0A[=20=20=20=
=200.000020]=20clocksource:=20timebase:=20mask:=200xffffffffffffffff=20=
max_cycles:=200x761537d007,=20max_idle_ns:=20440795202126=20ns=0A[=20=20=20=
=200.000051]=20clocksource:=20timebase=20mult[1f40000]=20shift[24]=20=
registered=0A[=20=20=20=200.000141]=20Console:=20colour=20dummy=20device=20=
80x25=0A[=20=20=20=200.000159]=20printk:=20console=20[hvc0]=20enabled=0A=
[=20=20=20=200.000159]=20printk:=20console=20[hvc0]=20enabled=0A[=20=20=20=
=200.000173]=20printk:=20bootconsole=20[udbg0]=20disabled=0A[=20=20=20=20=
0.000173]=20printk:=20bootconsole=20[udbg0]=20disabled=0A[=20=20=20=20=
0.000220]=20pid_max:=20default:=2049152=20minimum:=20384=0A[=20=20=20=20=
0.000270]=20LSM:=20Security=20Framework=20initializing=0A[=20=20=20=20=
0.000277]=20Yama:=20becoming=20mindful.=0A[=20=20=20=200.000377]=20=
Mount-cache=20hash=20table=20entries:=20131072=20(order:=204,=201048576=20=
bytes,=20linear)=0A[=20=20=20=200.000442]=20Mountpoint-cache=20hash=20=
table=20entries:=20131072=20(order:=204,=201048576=20bytes,=20linear)=0A=
[=20=20=20=200.001446]=20cblist_init_generic:=20Setting=20shift=20to=200=20=
and=20lim=20to=2048.=0A[=20=20=20=200.001470]=20POWER10=20performance=20=
monitor=20hardware=20support=20registered=0A[=20=20=20=200.001500]=20=
rcu:=20Hierarchical=20SRCU=20implementation.=0A[=20=20=20=200.002530]=20=
smp:=20Bringing=20up=20secondary=20CPUs=20...=0A[=20=20=20=200.009457]=20=
smp:=20Brought=20up=201=20node,=2032=20CPUs=0A[=20=20=20=200.009468]=20=
numa:=20Node=202=20CPUs:=200-31=0A[=20=20=20=200.009472]=20Big=20cores=20=
detected=20but=20using=20small=20core=20scheduling=0A[=20=20=20=20=
0.010476]=20devtmpfs:=20initialized=0A[=20=20=20=200.013295]=20=
clocksource:=20jiffies:=20mask:=200xffffffff=20max_cycles:=200xffffffff,=20=
max_idle_ns:=2019112604462750000=20ns=0A[=20=20=20=200.013303]=20futex=20=
hash=20table=20entries:=2016384=20(order:=205,=202097152=20bytes,=20=
linear)=0A[=20=20=20=200.013631]=20NET:=20Registered=20=
PF_NETLINK/PF_ROUTE=20protocol=20family=0A[=20=20=20=200.013761]=20=
audit:=20initializing=20netlink=20subsys=20(disabled)=0A[=20=20=20=20=
0.013811]=20audit:=20type=3D2000=20audit(1637880836.010:1):=20=
state=3Dinitialized=20audit_enabled=3D0=20res=3D1=0A[=20=20=20=20=
0.013855]=20thermal_sys:=20Registered=20thermal=20governor=20=
'fair_share'=0A[=20=20=20=200.013857]=20thermal_sys:=20Registered=20=
thermal=20governor=20'step_wise'=0A[=20=20=20=200.013940]=20cpuidle:=20=
using=20governor=20menu=0A[=20=20=20=200.014099]=20pstore:=20Registered=20=
nvram=20as=20persistent=20store=20backend=0A[=20=20=20=200.014464]=20=
EEH:=20pSeries=20platform=20initialized=0A[=20=20=20=200.017933]=20=
software=20IO=20TLB:=20tearing=20down=20default=20memory=20pool=0A[=20=20=
=20=200.017991]=20PCI:=20Probing=20PCI=20hardware=0A[=20=20=20=20=
0.017995]=20EEH:=20No=20capable=20adapters=20found:=20recovery=20=
disabled.=0A[=20=20=20=200.018046]=20pseries-rng:=20Registering=20arch=20=
random=20hook.=0A[=20=20=20=200.018868]=20kprobes:=20kprobe=20=
jump-optimization=20is=20enabled.=20All=20kprobes=20are=20optimized=20if=20=
possible.=0A[=20=20=20=200.018982]=20HugeTLB=20registered=202.00=20MiB=20=
page=20size,=20pre-allocated=200=20pages=0A[=20=20=20=200.018986]=20=
HugeTLB=20registered=201.00=20GiB=20page=20size,=20pre-allocated=200=20=
pages=0A[=20=20=20=200.019388]=20iommu:=20Default=20domain=20type:=20=
Translated=20=0A[=20=20=20=200.019391]=20iommu:=20DMA=20domain=20TLB=20=
invalidation=20policy:=20strict=20mode=20=0A[=20=20=20=200.019426]=20=
vgaarb:=20loaded=0A[=20=20=20=200.019517]=20SCSI=20subsystem=20=
initialized=0A[=20=20=20=200.019540]=20usbcore:=20registered=20new=20=
interface=20driver=20usbfs=0A[=20=20=20=200.019547]=20usbcore:=20=
registered=20new=20interface=20driver=20hub=0A[=20=20=20=200.019557]=20=
usbcore:=20registered=20new=20device=20driver=20usb=0A[=20=20=20=20=
0.019614]=20EDAC=20MC:=20Ver:=203.0.0=0A[=20=20=20=200.019789]=20=
NetLabel:=20Initializing=0A[=20=20=20=200.019792]=20NetLabel:=20=20=
domain=20hash=20size=20=3D=20128=0A[=20=20=20=200.019794]=20NetLabel:=20=20=
protocols=20=3D=20UNLABELED=20CIPSOv4=20CALIPSO=0A[=20=20=20=200.019806]=20=
NetLabel:=20=20unlabeled=20traffic=20allowed=20by=20default=0A[=20=20=20=20=
0.019922]=20clocksource:=20Switched=20to=20clocksource=20timebase=0A[=20=20=
=20=200.025391]=20VFS:=20Disk=20quotas=20dquot_6.6.0=0A[=20=20=20=20=
0.025420]=20VFS:=20Dquot-cache=20hash=20table=20entries:=208192=20(order=20=
0,=2065536=20bytes)=0A[=20=20=20=200.026912]=20NET:=20Registered=20=
PF_INET=20protocol=20family=0A[=20=20=20=200.027074]=20IP=20idents=20=
hash=20table=20entries:=20262144=20(order:=205,=202097152=20bytes,=20=
linear)=0A[=20=20=20=200.028922]=20tcp_listen_portaddr_hash=20hash=20=
table=20entries:=2065536=20(order:=204,=201048576=20bytes,=20linear)=0A[=20=
=20=20=200.029073]=20TCP=20established=20hash=20table=20entries:=20=
524288=20(order:=206,=204194304=20bytes,=20linear)=0A[=20=20=20=20=
0.029721]=20TCP=20bind=20hash=20table=20entries:=2065536=20(order:=204,=20=
1048576=20bytes,=20linear)=0A[=20=20=20=200.029796]=20TCP:=20Hash=20=
tables=20configured=20(established=20524288=20bind=2065536)=0A[=20=20=20=20=
0.029863]=20UDP=20hash=20table=20entries:=2065536=20(order:=205,=20=
2097152=20bytes,=20linear)=0A[=20=20=20=200.030035]=20UDP-Lite=20hash=20=
table=20entries:=2065536=20(order:=205,=202097152=20bytes,=20linear)=0A[=20=
=20=20=200.030261]=20NET:=20Registered=20PF_UNIX/PF_LOCAL=20protocol=20=
family=0A[=20=20=20=200.030269]=20PCI:=20CLS=200=20bytes,=20default=20=
128=0A[=20=20=20=200.030321]=20Trying=20to=20unpack=20rootfs=20image=20=
as=20initramfs...=0A[=20=20=20=200.031209]=20IOMMU=20table=20=
initialized,=20virtual=20merging=20enabled=0A[=20=20=20=200.031232]=20=
vio_register_device_node:=20node=20lid=20missing=20'reg'=0A[=20=20=20=20=
0.039823]=20vas:=20GZIP=20feature=20is=20available=0A[=20=20=20=20=
0.040906]=20hv-24x7:=20read=20548=20catalog=20entries,=20created=20387=20=
event=20attrs=20(0=20failures),=20387=20descs=0A[=20=20=20=200.042154]=20=
random:=20fast=20init=20done=0A[=20=20=20=200.043427]=20Initialise=20=
system=20trusted=20keyrings=0A[=20=20=20=200.043474]=20workingset:=20=
timestamp_bits=3D38=20max_order=3D21=20bucket_order=3D0=0A[=20=20=20=20=
0.044583]=20zbud:=20loaded=0A[=20=20=20=200.054702]=20NET:=20Registered=20=
PF_ALG=20protocol=20family=0A[=20=20=20=200.054708]=20Key=20type=20=
asymmetric=20registered=0A[=20=20=20=200.054711]=20Asymmetric=20key=20=
parser=20'x509'=20registered=0A[=20=20=20=200.054739]=20Block=20layer=20=
SCSI=20generic=20(bsg)=20driver=20version=200.4=20loaded=20(major=20248)=0A=
[=20=20=20=200.054800]=20io=20scheduler=20mq-deadline=20registered=0A[=20=
=20=20=200.054804]=20io=20scheduler=20kyber=20registered=0A[=20=20=20=20=
0.055427]=20atomic64_test:=20passed=0A[=20=20=20=200.055484]=20shpchp:=20=
Standard=20Hot=20Plug=20PCI=20Controller=20Driver=20version:=200.4=0A[=20=
=20=20=200.055766]=20Serial:=208250/16550=20driver,=204=20ports,=20IRQ=20=
sharing=20enabled=0A[=20=20=20=200.055944]=20Non-volatile=20memory=20=
driver=20v1.3=0A[=20=20=20=200.055966]=20Linux=20agpgart=20interface=20=
v0.103=0A[=20=20=20=200.792017]=20Freeing=20initrd=20memory:=2060928K=0A=
[=20=20=20=202.210070]=20tpm_ibmvtpm=2030000003:=20CRQ=20initialization=20=
completed=0A[=20=20=20=203.293244]=20rdac:=20device=20handler=20=
registered=0A[=20=20=20=203.293279]=20hp_sw:=20device=20handler=20=
registered=0A[=20=20=20=203.293282]=20emc:=20device=20handler=20=
registered=0A[=20=20=20=203.293317]=20alua:=20device=20handler=20=
registered=0A[=20=20=20=203.293389]=20libphy:=20Fixed=20MDIO=20Bus:=20=
probed=0A[=20=20=20=203.293422]=20ehci_hcd:=20USB=202.0=20'Enhanced'=20=
Host=20Controller=20(EHCI)=20Driver=0A[=20=20=20=203.293431]=20ehci-pci:=20=
EHCI=20PCI=20platform=20driver=0A[=20=20=20=203.293439]=20ohci_hcd:=20=
USB=201.1=20'Open'=20Host=20Controller=20(OHCI)=20Driver=0A[=20=20=20=20=
3.293446]=20ohci-pci:=20OHCI=20PCI=20platform=20driver=0A[=20=20=20=20=
3.293451]=20uhci_hcd:=20USB=20Universal=20Host=20Controller=20Interface=20=
driver=0A[=20=20=20=203.293482]=20usbcore:=20registered=20new=20=
interface=20driver=20usbserial_generic=0A[=20=20=20=203.293487]=20=
usbserial:=20USB=20Serial=20support=20registered=20for=20generic=0A[=20=20=
=20=203.293529]=20mousedev:=20PS/2=20mouse=20device=20common=20for=20all=20=
mice=0A[=20=20=20=203.293592]=20rtc-generic=20rtc-generic:=20registered=20=
as=20rtc0=0A[=20=20=20=203.293614]=20rtc-generic=20rtc-generic:=20=
setting=20system=20clock=20to=202021-11-25T22:53:59=20UTC=20(1637880839)=0A=
[=20=20=20=203.293677]=20xcede:=20xcede_record_size=20=3D=2010=0A[=20=20=20=
=203.293679]=20xcede:=20Record=200=20:=20hint=20=3D=201,=20latency=20=3D=20=
0x1800=20tb=20ticks,=20Wake-on-irq=20=3D=201=0A[=20=20=20=203.293682]=20=
xcede:=20Record=201=20:=20hint=20=3D=202,=20latency=20=3D=200x3c00=20tb=20=
ticks,=20Wake-on-irq=20=3D=200=0A[=20=20=20=203.293685]=20cpuidle:=20=
Skipping=20the=202=20Extended=20CEDE=20idle=20states=0A[=20=20=20=20=
3.293688]=20cpuidle:=20Fixed=20up=20CEDE=20exit=20latency=20to=2012=20us=0A=
[=20=20=20=203.294007]=20nx_compress_pseries=20ibm,compression-v1:=20=
nx842_OF_upd:=20max_sync_size=20new:65536=20old:0=0A[=20=20=20=20=
3.294011]=20nx_compress_pseries=20ibm,compression-v1:=20nx842_OF_upd:=20=
max_sync_sg=20new:510=20old:0=0A[=20=20=20=203.294014]=20=
nx_compress_pseries=20ibm,compression-v1:=20nx842_OF_upd:=20max_sg_len=20=
new:4080=20old:0=0A[=20=20=20=203.294066]=20hid:=20raw=20HID=20events=20=
driver=20(C)=20Jiri=20Kosina=0A[=20=20=20=203.294136]=20usbcore:=20=
registered=20new=20interface=20driver=20usbhid=0A[=20=20=20=203.294138]=20=
usbhid:=20USB=20HID=20core=20driver=0A[=20=20=20=203.294154]=20=
drop_monitor:=20Initializing=20network=20drop=20monitor=20service=0A[=20=20=
=20=203.294215]=20Initializing=20XFRM=20netlink=20socket=0A[=20=20=20=20=
3.294287]=20NET:=20Registered=20PF_INET6=20protocol=20family=0A[=20=20=20=
=203.294518]=20Segment=20Routing=20with=20IPv6=0A[=20=20=20=203.294526]=20=
In-situ=20OAM=20(IOAM)=20with=20IPv6=0A[=20=20=20=203.294541]=20NET:=20=
Registered=20PF_PACKET=20protocol=20family=0A[=20=20=20=203.294545]=20=
mpls_gso:=20MPLS=20GSO=20support=0A[=20=20=20=203.295360]=20registered=20=
taskstats=20version=201=0A[=20=20=20=203.295652]=20Loading=20compiled-in=20=
X.509=20certificates=0A[=20=20=20=203.321787]=20alg:=20No=20test=20for=20=
pkcs1pad(rsa,sha1)=20(pkcs1pad(rsa-generic,sha1))=0A[=20=20=20=20=
3.322307]=20Loaded=20X.509=20cert=20'Build=20time=20autogenerated=20=
kernel=20key:=20a96e41fe8abe22973b3db4ce94407f58bbb54cf8'=0A[=20=20=20=20=
3.322533]=20zswap:=20loaded=20using=20pool=20lzo/zbud=0A[=20=20=20=20=
3.323590]=20pstore:=20Using=20crash=20dump=20compression:=20deflate=0A[=20=
=20=20=203.323623]=20alg:=20No=20test=20for=20842=20(842-nx)=0A[=20=20=20=
=203.330619]=20Freeing=20unused=20kernel=20image=20(initmem)=20memory:=20=
4992K=0A[=20=20=20=203.389947]=20Run=20/init=20as=20init=20process=0A[=20=
=20=20=203.395115]=20systemd[1]:=20systemd=20239=20(239-45.el8_4.3)=20=
running=20in=20system=20mode.=20(+PAM=20+AUDIT=20+SELINUX=20+IMA=20=
-APPARMOR=20+SMACK=20+SYSVINIT=20+UTMP=20+LIBCRYPTSETUP=20+GCRYPT=20=
+GNUTLS=20+ACL=20+XZ=20+LZ4=20+SECCOMP=20+BLKID=20+ELFUTILS=20+KMOD=20=
+IDN2=20-IDN=20+PCRE2=20default-hierarchy=3Dlegacy)=0A[=20=20=20=20=
3.395220]=20systemd[1]:=20Detected=20architecture=20ppc64-le.=0A[=20=20=20=
=203.395224]=20systemd[1]:=20Running=20in=20initial=20RAM=20disk.=0A=0A=
Welcome=20to=20=1B[0;31mRed=20Hat=20Enterprise=20Linux=208.4=20(Ootpa)=20=
dracut-049-135.git20210121.el8=20(Initramfs)=1B[0m!=0A=0A[=20=20=20=20=
3.430244]=20systemd[1]:=20Set=20hostname=20to=20=
<ltcden8-lp3.aus.stglabs.ibm.com>.=0A[=20=20=20=203.460184]=20random:=20=
systemd:=20uninitialized=20urandom=20read=20(16=20bytes=20read)=0A[=20=20=
=20=203.460205]=20systemd[1]:=20Reached=20target=20Timers.=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Reached=20target=20Timers.=0A[=20=20=20=203.460309]=20=
random:=20systemd:=20uninitialized=20urandom=20read=20(16=20bytes=20=
read)=0A[=20=20=20=203.460350]=20systemd[1]:=20Listening=20on=20udev=20=
Kernel=20Socket.=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20on=20=
udev=20Kernel=20Socket.=0A[=20=20=20=203.460387]=20random:=20systemd:=20=
uninitialized=20urandom=20read=20(16=20bytes=20read)=0A[=20=20=20=20=
3.460442]=20systemd[1]:=20Listening=20on=20Journal=20Socket.=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Listening=20on=20Journal=20Socket.=0A[=20=20=20=20=
3.461708]=20systemd[1]:=20Starting=20Load=20Kernel=20Modules...=0A=20=20=20=
=20=20=20=20=20=20Starting=20Load=20Kernel=20Modules...=0A[=20=20=20=20=
3.462248]=20systemd[1]:=20Starting=20Create=20list=20of=20required=20=
static=20device=20nodes=20for=20the=20current=20kernel...=0A=20=20=20=20=20=
=20=20=20=20Starting=20Create=20list=20of=20required=20st=E2=80=A6ce=20=
nodes=20for=20the=20current=20kernel...=0A[=20=20=20=203.462786]=20=
systemd[1]:=20Started=20Hardware=20RNG=20Entropy=20Gatherer=20Daemon.=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Hardware=20RNG=20Entropy=20=
Gatherer=20Daemon.=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20on=20=
Journal=20Socket=20(/dev/log).=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Listening=20on=20udev=20Control=20Socket.=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Started=20Memstrack=20Anylazing=20Service.=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Reached=20target=20Local=20File=20Systems.=0A=20=20=20=20=
=20=20=20=20=20Starting=20Create=20Volatile=20Files=20and=20=
Directories...=0A=20=20=20=20=20=20=20=20=20Starting=20Journal=20=
Service...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20=
Sockets.=0A=20=20=20=20=20=20=20=20=20Starting=20Setup=20Virtual=20=
Console...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20=
Slices.=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Swap.=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Create=20list=20of=20=
required=20sta=E2=80=A6vice=20nodes=20for=20the=20current=20kernel.=0A=20=
=20=20=20=20=20=20=20=20Starting=20Create=20Static=20Device=20Nodes=20in=20=
/dev...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Create=20Volatile=20=
Files=20and=20Directories.=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Create=20Static=20Device=20Nodes=20in=20/dev.=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Started=20Journal=20Service.=0A[=20=20=20=203.493404]=20fuse:=20=
init=20(API=20version=207.36)=0A[=20=20=20=203.493745]=20random:=20crng=20=
init=20done=0A[=20=20=20=203.493750]=20random:=207=20urandom=20=
warning(s)=20missed=20due=20to=20ratelimiting=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Started=20Load=20Kernel=20Modules.=0A=20=20=20=20=20=20=20=20=20=
Starting=20Apply=20Kernel=20Variables...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=
=20Started=20Apply=20Kernel=20Variables.=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=
=20Started=20Setup=20Virtual=20Console.=0A=20=20=20=20=20=20=20=20=20=
Starting=20dracut=20cmdline=20hook...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Started=20dracut=20cmdline=20hook.=0A=20=20=20=20=20=20=20=20=20Starting=20=
dracut=20pre-udev=20hook...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
dracut=20pre-udev=20hook.=0A=20=20=20=20=20=20=20=20=20Starting=20udev=20=
Kernel=20Device=20Manager...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
udev=20Kernel=20Device=20Manager.=0A=20=20=20=20=20=20=20=20=20Starting=20=
udev=20Coldplug=20all=20Devices...=0A=20=20=20=20=20=20=20=20=20Mounting=20=
Kernel=20Configuration=20File=20System...=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Mounted=20Kernel=20Configuration=20File=20System.=0A[=20=20=20=20=
3.602251]=20synth=20uevent:=20/devices/vio:=20failed=20to=20send=20=
uevent=0A[=20=20=20=203.602262]=20vio=20vio:=20uevent:=20failed=20to=20=
send=20synthetic=20uevent=0A[=20=20=20=203.602308]=20synth=20uevent:=20=
/devices/vio/4000:=20failed=20to=20send=20uevent=0A[=20=20=20=20=
3.602311]=20vio=204000:=20uevent:=20failed=20to=20send=20synthetic=20=
uevent=0A[=20=20=20=203.602319]=20synth=20uevent:=20/devices/vio/4001:=20=
failed=20to=20send=20uevent=0A[=20=20=20=203.602322]=20vio=204001:=20=
uevent:=20failed=20to=20send=20synthetic=20uevent=0A[=20=20=20=20=
3.602330]=20synth=20uevent:=20/devices/vio/4002:=20failed=20to=20send=20=
uevent=0A[=20=20=20=203.602333]=20vio=204002:=20uevent:=20failed=20to=20=
send=20synthetic=20uevent=0A[=20=20=20=203.602341]=20synth=20uevent:=20=
/devices/vio/4004:=20failed=20to=20send=20uevent=0A[=20=20=20=20=
3.602343]=20vio=204004:=20uevent:=20failed=20to=20send=20synthetic=20=
uevent=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20udev=20Coldplug=20=
all=20Devices.=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20=
System=20Initialization.=0A=20=20=20=20=20=20=20=20=20Starting=20Show=20=
Plymouth=20Boot=20Screen...=0A=20=20=20=20=20=20=20=20=20Starting=20=
dracut=20initqueue=20hook...=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Show=20Plymouth=20Boot=20Screen.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Reached=20target=20Paths.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Forward=20Password=20Requests=20to=20Plymouth=20Directory=20Watch.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Basic=20System.=0A=0A=
[=20=20=20=203.638759]=20ibmveth=2030000002=20net0:=20renamed=20from=20=
eth0=0A[=20=20=20=203.641153]=20ibmvscsi=2030000067:=20SRP_VERSION:=20=
16.a=0A[=20=20=20=207.480046]=20ibmvscsi=2030000067:=20SRP_VERSION:=20=
16.a=0A[=20=20=20=207.480121]=20ibmvscsi=2030000067:=20Maximum=20ID:=20=
64=20Maximum=20LUN:=2032=20Maximum=20Channel:=203=0A[=20=20=20=20=
7.480126]=20scsi=20host0:=20IBM=20POWER=20Virtual=20SCSI=20Adapter=20=
1.5.9=0A[=20=20=20=207.480283]=20ibmvscsi=2030000067:=20partner=20=
initialization=20complete=0A[=20=20=20=207.480305]=20ibmvscsi=20=
30000067:=20host=20srp=20version:=2016.a,=20host=20partition=20=
ltcden8-vios1=20(100),=20OS=203,=20max=20io=20262144=0A[=20=20=20=20=
7.480331]=20ibmvscsi=2030000067:=20Client=20reserve=20enabled=0A[=20=20=20=
=207.480335]=20ibmvscsi=2030000067:=20sent=20SRP=20login=0A[=20=20=20=20=
7.480351]=20ibmvscsi=2030000067:=20SRP_LOGIN=20succeeded=0A[=20=20=20=20=
7.510262]=20scsi=200:0:1:0:=20Direct-Access=20=20=20=20=20AIX=20=20=20=20=
=20=20VDASD=20=20=20=20=20=20=20=20=20=20=20=200001=20PQ:=200=20ANSI:=20=
3=0A[=20=20=20=207.536843]=20scsi=200:0:1:0:=20Attached=20scsi=20generic=20=
sg0=20type=200=0A[=20=20=20=207.546617]=20sd=200:0:1:0:=20[sda]=20=
26214400=204096-byte=20logical=20blocks:=20(107=20GB/100=20GiB)=0A[=20=20=
=20=207.546643]=20sd=200:0:1:0:=20[sda]=20Write=20Protect=20is=20off=0A[=20=
=20=20=207.546668]=20sd=200:0:1:0:=20[sda]=20Cache=20data=20unavailable=0A=
[=20=20=20=207.546673]=20sd=200:0:1:0:=20[sda]=20Assuming=20drive=20=
cache:=20write=20through=0A[=20=20=20=207.547944]=20=20sda:=20sda1=20=
sda2=20sda3=0A[=20=20=20=207.548211]=20sd=200:0:1:0:=20[sda]=20Attached=20=
SCSI=20disk=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Found=20device=20VDASD=20=
2.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Initrd=20=
Root=20Device.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20dracut=20=
initqueue=20hook.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20=
target=20Remote=20File=20Systems=20(Pre).=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Reached=20target=20Remote=20File=20Systems.=0A=0A=20=20=20=20=20=
=20=20=20=20Starting=20File=20System=20Check=20on=20/dev/sda2...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20File=20System=20Check=20on=20=
/dev/sda2.=0A=0A=20=20=20=20=20=20=20=20=20Mounting=20/sysroot...=0A=0A[=20=
=20=20=208.256766]=20EXT4-fs=20(sda2):=20mounted=20filesystem=20with=20=
ordered=20data=20mode.=20Opts:=20(null).=20Quota=20mode:=20none.=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Mounted=20/sysroot.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Reached=20target=20Initrd=20Root=20File=20System.=0A=0A=
=20=20=20=20=20=20=20=20=20Starting=20Reload=20Configuration=20from=20=
the=20Real=20Root...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Reload=20Configuration=20from=20the=20Real=20Root.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Reached=20target=20Initrd=20File=20Systems.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Initrd=20Default=20=
Target.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20dracut=20pre-pivot=20=
and=20cleanup=20hook...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
dracut=20pre-pivot=20and=20cleanup=20hook.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20Cleaning=20Up=20and=20Shutting=20Down=20Daemons...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Timers.=0A=0A=20=20=20=
=20=20=20=20=20=20Starting=20Plymouth=20switch=20root=20service...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20dracut=20pre-pivot=20and=20=
cleanup=20hook.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20=
Remote=20File=20Systems.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20=
target=20Remote=20File=20Systems=20(Pre).=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Stopped=20dracut=20initqueue=20hook.=0A=0A[=1B[0;32m=20=20OK=20=
=20=1B[0m]=20Stopped=20target=20Initrd=20Default=20Target.=0A=0A[=1B[0;32m=
=20=20OK=20=20=1B[0m]=20Stopped=20target=20Initrd=20Root=20Device.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Basic=20System.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Paths.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Sockets.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Slices.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20System=20=
Initialization.=0A=0A=20=20=20=20=20=20=20=20=20Stopping=20udev=20Kernel=20=
Device=20Manager...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20=
Create=20Volatile=20Files=20and=20Directories.=0A=0A[=1B[0;32m=20=20OK=20=
=20=1B[0m]=20Stopped=20target=20Local=20File=20Systems.=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Stopped=20Apply=20Kernel=20Variables.=0A=0A[=1B[0;32m=
=20=20OK=20=20=1B[0m]=20Stopped=20udev=20Coldplug=20all=20Devices.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20Load=20Kernel=20Modules.=0A=0A=
=20=20=20=20=20=20=20=20=20Starting=20Setup=20Virtual=20Console...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Swap.=0A=0A[=1B[0;32m=
=20=20OK=20=20=1B[0m]=20Started=20Cleaning=20Up=20and=20Shutting=20Down=20=
Daemons.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Plymouth=20=
switch=20root=20service.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20=
udev=20Kernel=20Device=20Manager.=0A=0A=20=20=20=20=20=20=20=20=20=
Stopping=20Hardware=20RNG=20Entropy=20Gatherer=20Daemon...=0A=0A[=1B[0;32m=
=20=20OK=20=20=1B[0m]=20Stopped=20Create=20Static=20Device=20Nodes=20in=20=
/dev.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20Create=20list=20=
of=20required=20sta=E2=80=A6vice=20nodes=20for=20the=20current=20kernel.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20dracut=20pre-udev=20hook.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20dracut=20cmdline=20hook.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Closed=20udev=20Kernel=20Socket.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Closed=20udev=20Control=20Socket.=0A=0A=
=20=20=20=20=20=20=20=20=20Starting=20Cleanup=20udevd=20DB...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20Hardware=20RNG=20Entropy=20=
Gatherer=20Daemon.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Setup=20Virtual=20Console.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Started=20Cleanup=20udevd=20DB.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Reached=20target=20Switch=20Root.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20Switch=20Root...=0A=0A[=20=20=20=208.548125]=20printk:=20=
systemd:=2016=20output=20lines=20suppressed=20due=20to=20ratelimiting=0A=
[=20=20=20=208.620815]=20systemd[1]:=20systemd=20239=20(239-45.el8_4.3)=20=
running=20in=20system=20mode.=20(+PAM=20+AUDIT=20+SELINUX=20+IMA=20=
-APPARMOR=20+SMACK=20+SYSVINIT=20+UTMP=20+LIBCRYPTSETUP=20+GCRYPT=20=
+GNUTLS=20+ACL=20+XZ=20+LZ4=20+SECCOMP=20+BLKID=20+ELFUTILS=20+KMOD=20=
+IDN2=20-IDN=20+PCRE2=20default-hierarchy=3Dlegacy)=0A[=20=20=20=20=
8.620919]=20systemd[1]:=20Detected=20architecture=20ppc64-le.=0A=0A=0A=
Welcome=20to=20=1B[0;31mRed=20Hat=20Enterprise=20Linux=208.4=20=
(Ootpa)=1B[0m!=0A=0A=0A=0A[=20=20=20=208.621413]=20systemd[1]:=20Set=20=
hostname=20to=20<ltcden8-lp3.aus.stglabs.ibm.com>.=0A[=20=20=20=20=
8.724576]=20systemd[1]:=20systemd-journald.service:=20Succeeded.=0A[=20=20=
=20=208.725018]=20systemd[1]:=20initrd-switch-root.service:=20Succeeded.=0A=
[=20=20=20=208.725201]=20systemd[1]:=20Stopped=20Switch=20Root.=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20Switch=20Root.=0A=0A[=20=20=20=
=208.725435]=20systemd[1]:=20systemd-journald.service:=20Service=20has=20=
no=20hold-off=20time=20(RestartSec=3D0),=20scheduling=20restart.=0A[=20=20=
=20=208.725481]=20systemd[1]:=20systemd-journald.service:=20Scheduled=20=
restart=20job,=20restart=20counter=20is=20at=201.=0A[=20=20=20=20=
8.725535]=20systemd[1]:=20Stopped=20Journal=20Service.=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Stopped=20Journal=20Service.=0A=0A[=20=20=20=20=
8.726115]=20systemd[1]:=20Starting=20Journal=20Service...=0A=20=20=20=20=20=
=20=20=20=20Starting=20Journal=20Service...=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Created=20slice=20User=20and=20Session=20Slice.=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Started=20Forward=20Password=20Requests=20to=20Wall=20=
Directory=20Watch.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Create=20=
list=20of=20required=20st=E2=80=A6ce=20nodes=20for=20the=20current=20=
kernel...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20on=20=
Device-mapper=20event=20daemon=20FIFOs.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20Monitoring=20of=20LVM2=20mirrors=E2=80=A6ng=20dmeventd=20or=20=
progress=20polling...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20=
on=20LVM2=20poll=20daemon=20socket.=0A=0A=20=20=20=20=20=20=20=20=20=
Mounting=20POSIX=20Message=20Queue=20File=20System...=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Listening=20on=20RPCbind=20Server=20Activation=20=
Socket.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20RPC=20=
Port=20Mapper.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Remount=20Root=20=
and=20Kernel=20File=20Systems...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Reached=20target=20Slices.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Listening=20on=20multipathd=20control=20socket.=0A=0A[=1B[0;32m=20=20OK=20=
=20=1B[0m]=20Listening=20on=20udev=20Control=20Socket.=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Created=20slice=20system-serial\x2dgetty.slice.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20Plymouth=20switch=20root=20=
service.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20=
Paths.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Set=20up=20automount=20=
Arbitrary=20Executab=E2=80=A6rmats=20File=20System=20Automount=20Point.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Local=20=
Encrypted=20Volumes.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Created=20=
slice=20system-sshd\x2dkeygen.slice.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Created=20slice=20system-getty.slice.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20Load=20Kernel=20Modules...=0A=0A=20=20=20=20=20=20=20=20=20=
Mounting=20Kernel=20Debug=20File=20System...=0A=0A[=20=20=20=208.734722]=20=
sd=200:0:1:0:=20[sda]=20tag#43=20FAILED=20Result:=20hostbyte=3DDID_OK=20=
driverbyte=3DDRIVER_OK=20cmd_age=3D0s=0A[=20=20=20=208.734729]=20sd=20=
0:0:1:0:=20[sda]=20tag#43=20Sense=20Key=20:=20Illegal=20Request=20=
[current]=20=0A[=20=20=20=208.734734]=20sd=200:0:1:0:=20[sda]=20tag#43=20=
Add.=20Sense:=20Invalid=20field=20in=20cdb=0A[=20=20=20=208.734738]=20sd=20=
0:0:1:0:=20[sda]=20tag#43=20CDB:=20Write(10)=202a=2008=2000=2000=2005=20=
00=2000=2000=2001=2000=0A[=20=20=20=208.734741]=20critical=20target=20=
error,=20dev=20sda,=20sector=2010240=20op=200x1:(WRITE)=20flags=20=
0x20800=20phys_seg=201=20prio=20class=200=0A[=20=20=20=208.734746]=20=
Buffer=20I/O=20error=20on=20dev=20sda2,=20logical=20block=200,=20lost=20=
sync=20page=20write=0A[=20=20=20=208.734755]=20EXT4-fs=20(sda2):=20I/O=20=
error=20while=20writing=20superblock=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Listening=20on=20Process=20Core=20Dump=20Socket.=0A=0A=20=20=20=20=20=20=20=
=20=20Activating=20swap=20=
/dev/disk/by-uuid/5=E2=80=A6f25-9964-45cf-90f0-0def90d8db29...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Switch=20Root.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20Initrd=20File=20=
Systems.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20target=20=
Initrd=20Root=20File=20System.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
Setup=20Virtual=20Console...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Listening=20on=20initctl=20Compatibility=20Named=20Pipe.=0A=0A=20=20=20=20=
=20=20=20=20=20Mounting=20Huge=20Pages=20File=20System...=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Listening=20on=20udev=20Kernel=20Socket.=0A=0A=20=20=
=20=20=20=20=20=20=20Starting=20udev=20Coldplug=20all=20Devices...=0A=0A=
[=20=20=20=208.740297]=20Adding=2010485696k=20swap=20on=20/dev/sda3.=20=20=
Priority:-2=20extents:1=20across:10485696k=20SSFS=0A[=1B[0;32m=20=20OK=20=
=20=1B[0m]=20Started=20Create=20list=20of=20required=20sta=E2=80=A6vice=20=
nodes=20for=20the=20current=20kernel.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=
=20Mounted=20POSIX=20Message=20Queue=20File=20System.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Started=20Load=20Kernel=20Modules.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Mounted=20Kernel=20Debug=20File=20System.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Mounted=20Huge=20Pages=20File=20=
System.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Apply=20Kernel=20=
Variables...=0A=0A=20=20=20=20=20=20=20=20=20Mounting=20FUSE=20Control=20=
File=20System...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Journal=20Service.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Activated=20=
swap=20/dev/disk/by-uuid/51c5ef25-9964-45cf-90f0-0def90d8db29.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Mounted=20FUSE=20Control=20File=20=
System.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Swap.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Apply=20Kernel=20=
Variables.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Setup=20=
Virtual=20Console.=0A=0A[=20=20=20=208.789934]=20synth=20uevent:=20=
/devices/vio:=20failed=20to=20send=20uevent=0A[=20=20=20=208.789941]=20=
vio=20vio:=20uevent:=20failed=20to=20send=20synthetic=20uevent=0A[=20=20=20=
=208.790074]=20synth=20uevent:=20/devices/vio/4000:=20failed=20to=20send=20=
uevent=0A[=20=20=20=208.790077]=20vio=204000:=20uevent:=20failed=20to=20=
send=20synthetic=20uevent=0A[=20=20=20=208.790086]=20synth=20uevent:=20=
/devices/vio/4001:=20failed=20to=20send=20uevent=0A[=20=20=20=20=
8.790088]=20vio=204001:=20uevent:=20failed=20to=20send=20synthetic=20=
uevent=0A[=20=20=20=208.790097]=20synth=20uevent:=20/devices/vio/4002:=20=
failed=20to=20send=20uevent=0A[=20=20=20=208.790099]=20vio=204002:=20=
uevent:=20failed=20to=20send=20synthetic=20uevent=0A[=20=20=20=20=
8.790107]=20synth=20uevent:=20/devices/vio/4004:=20failed=20to=20send=20=
uevent=0A[=20=20=20=208.790109]=20vio=204004:=20uevent:=20failed=20to=20=
send=20synthetic=20uevent=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
udev=20Coldplug=20all=20Devices.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20udev=20Wait=20for=20Complete=20Device=20Initialization...=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20Remount=20Root=20and=20=
Kernel=20File=20Systems.=0A=0ASee=20'systemctl=20status=20=
systemd-remount-fs.service'=20for=20details.=0A=0A=20=20=20=20=20=20=20=20=
=20Starting=20Load/Save=20Random=20Seed...=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20Flush=20Journal=20to=20Persistent=20Storage...=0A=0A=20=20=20=20=
=20=20=20=20=20Starting=20Create=20Static=20Device=20Nodes=20in=20=
/dev...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Load/Save=20=
Random=20Seed.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Create=20=
Static=20Device=20Nodes=20in=20/dev.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20udev=20Kernel=20Device=20Manager...=0A=0A[=1B[0;32m=20=20OK=20=
=20=1B[0m]=20Started=20Flush=20Journal=20to=20Persistent=20Storage.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20udev=20Kernel=20Device=20=
Manager.=0A=0A[=20=20=20=208.997307]=20pseries_rng:=20Registering=20IBM=20=
pSeries=20RNG=20driver=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Monitoring=20of=20LVM2=20mirrors,=E2=80=A6sing=20dmeventd=20or=20=
progress=20polling.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
udev=20Wait=20for=20Complete=20Device=20Initialization.=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Reached=20target=20Local=20File=20Systems=20(Pre).=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Local=20File=20=
Systems.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Tell=20Plymouth=20To=20=
Write=20Out=20Runtime=20Data...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
Restore=20/run/initramfs=20on=20shutdown...=0A=0A=20=20=20=20=20=20=20=20=
=20Starting=20Create=20Volatile=20Files=20and=20Directories...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Restore=20/run/initramfs=20=
on=20shutdown.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Tell=20=
Plymouth=20To=20Write=20Out=20Runtime=20Data.=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Started=20Create=20Volatile=20Files=20and=20Directories.=0A=0A=20=
=20=20=20=20=20=20=20=20Starting=20RPC=20Bind...=0A=0A=20=20=20=20=20=20=20=
=20=20Mounting=20RPC=20Pipe=20File=20System...=0A=0A=20=20=20=20=20=20=20=
=20=20Starting=20Security=20Auditing=20Service...=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20Security=20Auditing=20=
Service.=0A=0ASee=20'systemctl=20status=20auditd.service'=20for=20=
details.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Update=20UTMP=20=
about=20System=20Boot/Shutdown...=0A=0A[=1B[0;1;31mFAILED=1B[0m]=20=
Failed=20to=20start=20Update=20UTMP=20about=20System=20Boot/Shutdown.=0A=0A=
See=20'systemctl=20status=20systemd-update-utmp.service'=20for=20=
details.=0A=0A[=1B[0;1;33mDEPEND=1B[0m]=20Dependency=20failed=20for=20=
Update=20UTMP=20about=20System=20Runlevel=20Changes.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Reached=20target=20System=20Initialization.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20daily=20update=20of=20the=20=
root=20trust=20anchor=20for=20DNSSEC.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=
=20Started=20Run=20system=20activity=20accounting=20tool=20every=2010=20=
minutes.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20on=20=
Open-iSCSI=20iscsid=20Socket.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Started=20Daily=20Cleanup=20of=20Temporary=20Directories.=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Listening=20on=20SSSD=20Kerberos=20Cache=20Manager=20=
responder=20socket.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Generate=20summary=20of=20yesterday's=20process=20accounting.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20dnf=20makecache=20--timer.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20on=20D-Bus=20System=20=
Message=20Bus=20Socket.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20=
on=20Open-iSCSI=20iscsiuio=20Socket.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Reached=20target=20Sockets.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Reached=20target=20Basic=20System.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20Hardware=20RNG=20Entropy=20Gatherer=20Wake=20threshold=20=
service...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20VDO=20volume=20=
services...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20ppc64-diag=20=
rtas_errd=20(platform=20error=20handling)=20Service...=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Started=20D-Bus=20System=20Message=20Bus.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20irqbalance=20daemon.=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20NTP=20client/server.=0A=
=0ASee=20'systemctl=20status=20chronyd.service'=20for=20details.=0A=0A=20=
=20=20=20=20=20=20=20=20Starting=20Network=20Manager...=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Started=20libstoragemgmt=20plug-in=20server=20=
daemon.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Resets=20System=20=
Activity=20Logs...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Self=20=
Monitoring=20and=20Reporting=20Technology=20(SMART)=20Daemon...=0A=0A=20=20=
=20=20=20=20=20=20=20Starting=20Authorization=20Manager...=0A=0A=20=20=20=
=20=20=20=20=20=20Starting=20System=20Security=20Services=20Daemon...=0A=0A=
=20=20=20=20=20=20=20=20=20Starting=20ABRT=20Automated=20Bug=20Reporting=20=
Tool...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20=
sshd-keygen.target.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20RPC=20=
Bind.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Hardware=20RNG=20=
Entropy=20Gatherer=20Wake=20threshold=20service.=0A=0A[=1B[0;32m=20=20OK=20=
=20=1B[0m]=20Started=20ppc64-diag=20rtas_errd=20(platform=20error=20=
handling)=20Service.=0A=0A[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20=
start=20Resets=20System=20Activity=20Logs.=0A=0ASee=20'systemctl=20=
status=20sysstat.service'=20for=20details.=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Started=20Hardware=20RNG=20Entropy=20Gatherer=20Daemon.=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20System=20Security=20=
Services=20Daemon.=0A=0ASee=20'systemctl=20status=20sssd.service'=20for=20=
details.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20User=20=
and=20Group=20Name=20Lookups.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
Login=20Service...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Self=20=
Monitoring=20and=20Reporting=20Technology=20(SMART)=20Daemon.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Network=20Manager.=0A=0A=20=20=
=20=20=20=20=20=20=20Starting=20Network=20Manager=20Wait=20Online...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20Network.=0A=0A=20=20=
=20=20=20=20=20=20=20Starting=20GSSAPI=20Proxy=20Daemon...=0A=0A=20=20=20=
=20=20=20=20=20=20Starting=20Dynamic=20System=20Tuning=20Daemon...=0A=0A=20=
=20=20=20=20=20=20=20=20Starting=20Logout=20off=20all=20iSCSI=20sessions=20=
on=20shutdown...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Enable=20=
periodic=20update=20of=20entitlement=20certificates....=0A=0A=20=20=20=20=
=20=20=20=20=20Starting=20OpenSSH=20server=20daemon...=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Started=20Logout=20off=20all=20iSCSI=20sessions=20=
on=20shutdown.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Enable=20=
periodic=20update=20of=20entitlement=20certificates..=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Started=20Login=20Service.=0A=0A[=1B[0;1;31mFAILED=1B[0m=
]=20Failed=20to=20start=20Hostname=20Service.=0A=0ASee=20'systemctl=20=
status=20systemd-hostnamed.service'=20for=20details.=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20GSSAPI=20Proxy=20=
Daemon.=0A=0ASee=20'systemctl=20status=20gssproxy.service'=20for=20=
details.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20OpenSSH=20=
server=20daemon.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
Authorization=20Manager.=0A=0A[=20=20=20=209.429535]=20RPC:=20Registered=20=
named=20UNIX=20socket=20transport=20module.=0A[=20=20=20=209.429543]=20=
RPC:=20Registered=20udp=20transport=20module.=0A[=20=20=20=209.429546]=20=
RPC:=20Registered=20tcp=20transport=20module.=0A[=20=20=20=209.429548]=20=
RPC:=20Registered=20tcp=20NFSv4.1=20backchannel=20transport=20module.=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Mounted=20RPC=20Pipe=20File=20System.=0A=
=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20ppc64-diag=20rtas_errd=20=
(platform=20error=20handling)=20Service.=0A=0A=20=20=20=20=20=20=20=20=20=
Starting=20ppc64-diag=20rtas_errd=20(platform=20error=20handling)=20=
Service...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20target=20=
rpc_pipefs.target.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20=
target=20NFS=20client=20services.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Started=20ppc64-diag=20rtas_errd=20(platform=20error=20handling)=20=
Service.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20ABRT=20=
Automated=20Bug=20Reporting=20Tool.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Stopped=20System=20Security=20Services=20Daemon.=0A=0A=20=20=20=20=20=20=20=
=20=20Starting=20System=20Security=20Services=20Daemon...=0A=0A[=1B[0;32m=20=
=20OK=20=20=1B[0m]=20Started=20ABRT=20Xorg=20log=20watcher.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Creates=20ABRT=20problems=20=
from=20coredumpctl=20messages.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Started=20ABRT=20kernel=20log=20watcher.=0A=0A[=1B[0;1;31mFAILED=1B[0m]=20=
Failed=20to=20start=20System=20Security=20Services=20Daemon.=0A=0ASee=20=
'systemctl=20status=20sssd.service'=20for=20details.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Stopped=20ppc64-diag=20rtas_errd=20(platform=20error=20=
handling)=20Service.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
ppc64-diag=20rtas_errd=20(platform=20error=20handling)=20Service...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20ppc64-diag=20rtas_errd=20=
(platform=20error=20handling)=20Service.=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Started=20VDO=20volume=20services.=0A=0A[=1B[0;1;31mFAILED=1B[0m=
]=20Failed=20to=20start=20Dynamic=20System=20Tuning=20Daemon.=0A=0ASee=20=
'systemctl=20status=20tuned.service'=20for=20details.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Stopped=20ppc64-diag=20rtas_errd=20(platform=20error=20=
handling)=20Service.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
ppc64-diag=20rtas_errd=20(platform=20error=20handling)=20Service...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20System=20Security=20Services=20=
Daemon.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20System=20Security=20=
Services=20Daemon...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20=
ppc64-diag=20rtas_errd=20(platform=20error=20handling)=20Service.=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20System=20Security=20=
Services=20Daemon.=0A=0ASee=20'systemctl=20status=20sssd.service'=20for=20=
details.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20System=20=
Security=20Services=20Daemon.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
System=20Security=20Services=20Daemon...=0A=0A[=1B[0;32m=20=20OK=20=20=
=1B[0m]=20Stopped=20ppc64-diag=20rtas_errd=20(platform=20error=20=
handling)=20Service.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
ppc64-diag=20rtas_errd=20(platform=20error=20handling)=20Service...=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20ppc64-diag=20rtas_errd=20=
(platform=20error=20handling)=20Service.=0A=0A[=1B[0;1;31mFAILED=1B[0m]=20=
Failed=20to=20start=20System=20Security=20Services=20Daemon.=0A=0ASee=20=
'systemctl=20status=20sssd.service'=20for=20details.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Stopped=20System=20Security=20Services=20Daemon.=0A=0A=20=
=20=20=20=20=20=20=20=20Starting=20System=20Security=20Services=20=
Daemon...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20ppc64-diag=20=
rtas_errd=20(platform=20error=20handling)=20Service.=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20ppc64-diag=20=
rtas_err=E2=80=A6(platform=20error=20handling)=20Service.=0A=0ASee=20=
'systemctl=20status=20rtas_errd.service'=20for=20details.=0A=0A=
[=1B[0;1;31mFAILED=1B[0m]=20Failed=20to=20start=20System=20Security=20=
Services=20Daemon.=0A=0ASee=20'systemctl=20status=20sssd.service'=20for=20=
details.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Stopped=20System=20=
Security=20Services=20Daemon.=0A=0A[=1B[0;1;31mFAILED=1B[0m]=20Failed=20=
to=20start=20System=20Security=20Services=20Daemon.=0A=0ASee=20=
'systemctl=20status=20sssd.service'=20for=20details.=0A=0A[=1B[0m=1B[0;31m=
*=20=20=20=20=20=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=
Manager=20Wait=20Online=20(7s=20/=20no=20limit)=0A=
=1B[K[=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=20=1B[0m]=20A=20start=20job=20=
is=20running=20for=20Network=20Manager=20Wait=20Online=20(8s=20/=20no=20=
limit)=0A=1B[K[=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20Manager=20Wait=20Online=20=
(8s=20/=20no=20limit)=0A=1B[K[=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=
=20=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20Manager=20=
Wait=20Online=20(9s=20/=20no=20limit)=0A=1B[K[=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20Manager=20Wait=20Online=20(9s=20/=20no=20=
limit)=0A=1B[K[=20=20=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20=
Online=20(10s=20/=20no=20limit)=0A=1B[K[=20=20=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m]=20A=20start=20job=20is=20running=20for=20=
Network=20=E2=80=A6nager=20Wait=20Online=20(10s=20/=20no=20limit)=0A=1B[K[=
=20=20=20=20=20=1B[0;31m*=1B[0m]=20A=20start=20job=20is=20running=20for=20=
Network=20=E2=80=A6nager=20Wait=20Online=20(11s=20/=20no=20limit)=0A=1B[K[=
=20=20=20=20=1B[0;31m*=1B[0;1;31m*=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(12s=20/=20no=20=
limit)=0A=1B[K[=20=20=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20=
Online=20(12s=20/=20no=20limit)=0A=1B[K[=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(13s=20/=20no=20=
limit)=0A=1B[K[=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20=
Online=20(13s=20/=20no=20limit)=0A=1B[K[=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;=
31m*=20=20=20=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=
=E2=80=A6nager=20Wait=20Online=20(14s=20/=20no=20limit)=0A=
=1B[K[=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=20=1B[0m]=20A=20start=20job=20=
is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(15s=20/=20=
no=20limit)=0A=1B[K[=1B[0m=1B[0;31m*=20=20=20=20=20=1B[0m]=20A=20start=20=
job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20=
(15s=20/=20no=20limit)=0A=1B[K[=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=20=
=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20=
Wait=20Online=20(16s=20/=20no=20limit)=0A=
=1B[K[=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=1B[0m]=20A=20start=20=
job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20=
(16s=20/=20no=20limit)=0A=1B[K[=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=
=20=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nag=
er=20Wait=20Online=20(17s=20/=20no=20limit)=0A=1B[K[=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(17s=20/=20no=20=
limit)=0A=1B[K[=20=20=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20=
Online=20(18s=20/=20no=20limit)=0A=1B[K[=20=20=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m]=20A=20start=20job=20is=20running=20for=20=
Network=20=E2=80=A6nager=20Wait=20Online=20(19s=20/=20no=20limit)=0A=1B[K[=
=20=20=20=20=20=1B[0;31m*=1B[0m]=20A=20start=20job=20is=20running=20for=20=
Network=20=E2=80=A6nager=20Wait=20Online=20(19s=20/=20no=20limit)=0A=1B[K[=
=20=20=20=20=1B[0;31m*=1B[0;1;31m*=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(20s=20/=20no=20=
limit)=0A=1B[K[=20=20=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20=
Online=20(20s=20/=20no=20limit)=0A=1B[K[=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(21s=20/=20no=20=
limit)=0A=1B[K[=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=1B[0m]=20=
A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20=
Online=20(21s=20/=20no=20limit)=0A=1B[K[=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;=
31m*=20=20=20=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=
=E2=80=A6nager=20Wait=20Online=20(22s=20/=20no=20limit)=0A=
=1B[K[=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=20=1B[0m]=20A=20start=20job=20=
is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(22s=20/=20=
no=20limit)=0A=1B[K[=1B[0m=1B[0;31m*=20=20=20=20=20=1B[0m]=20A=20start=20=
job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20=
(23s=20/=20no=20limit)=0A=1B[K[=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=20=
=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nager=20=
Wait=20Online=20(23s=20/=20no=20limit)=0A=
=1B[K[=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=20=20=1B[0m]=20A=20start=20=
job=20is=20running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20=
(24s=20/=20no=20limit)=0A=1B[K[=20=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=
=20=1B[0m]=20A=20start=20job=20is=20running=20for=20Network=20=E2=80=A6nag=
er=20Wait=20Online=20(24s=20/=20no=20limit)=0A=1B[K[=20=20=
=1B[0;31m*=1B[0;1;31m*=1B[0m=1B[0;31m*=20=1B[0m]=20A=20start=20job=20is=20=
running=20for=20Network=20=E2=80=A6nager=20Wait=20Online=20(25s=20/=20no=20=
limit)=0A=1B[K[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Network=20=
Manager=20Wait=20Online.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Reached=20=
target=20Network=20is=20Online.=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Reached=20target=20Remote=20File=20Systems=20(Pre).=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Reached=20target=20Remote=20File=20Systems.=0A=0A=20=20=
=20=20=20=20=20=20=20Starting=20Permit=20User=20Sessions...=0A=0A=20=20=20=
=20=20=20=20=20=20Starting=20Performance=20Metrics=20Collector=20=
Daemon...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Notify=20NFS=20=
peers=20of=20a=20restart...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
System=20Logging=20Service...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
hybrid=20virtual=20network=20scan=20and=20config...=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Started=20Permit=20User=20Sessions.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Started=20Notify=20NFS=20peers=20of=20a=20restart.=0A=0A=
[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20System=20Logging=20Service.=0A=
=0A=20=20=20=20=20=20=20=20=20Starting=20Network=20Manager=20Script=20=
Dispatcher=20Service...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Listening=20=
on=20Load/Save=20RF=20Kill=20Switch=20Status=20/dev/rfkill=20Watch.=0A=0A=
=20=20=20=20=20=20=20=20=20Starting=20Hold=20until=20boot=20process=20=
finishes=20up...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20Started=20Job=20=
spooling=20tools.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Terminate=20=
Plymouth=20Boot=20Screen...=0A=0A[=1B[0;32m=20=20OK=20=20=1B[0m]=20=
Started=20Command=20Scheduler.=0A=0A[=1B[0;1;31mFAILED=1B[0m]=20Failed=20=
to=20start=20Performance=20Metrics=20Collector=20Daemon.=0A=0ASee=20=
'systemctl=20status=20pmcd.service'=20for=20details.=0A=0A[=1B[0;32m=20=20=
OK=20=20=1B[0m]=20Started=20Network=20Manager=20Script=20Dispatcher=20=
Service.=0A=0A=20=20=20=20=20=20=20=20=20Starting=20Performance=20=
Metrics=20Inference=20Engine...=0A=0A=20=20=20=20=20=20=20=20=20Starting=20=
Performance=20Metrics=20Archive=20Logger...=0A=0A=0A=0ARed=20Hat=20=
Enterprise=20Linux=208.4=20(Ootpa)=0AKernel=205.16.0-rc2-next-20211125=20=
on=20an=20ppc64le=0A=

--Apple-Mail=_9862AEBE-2452-45C2-A05E-026F158CD5EC--

