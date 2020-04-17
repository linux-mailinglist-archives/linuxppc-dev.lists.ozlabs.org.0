Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B721AE0E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:20:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493fsx5w2qzDrbx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 01:20:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493fqd5lGLzDrbv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 01:18:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HF3cFj025852
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 11:18:18 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30fe1psxk7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 11:18:18 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Fri, 17 Apr 2020 16:17:36 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 Apr 2020 16:17:34 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03HFICmN51707904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 15:18:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA6C1A4051;
 Fri, 17 Apr 2020 15:18:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A077A405B;
 Fri, 17 Apr 2020 15:18:12 +0000 (GMT)
Received: from localhost (unknown [9.85.75.158])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Apr 2020 15:18:11 +0000 (GMT)
Date: Fri, 17 Apr 2020 20:48:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: POWER9 crash due to STRICT_KERNEL_RWX (WAS: Re: Linux-next POWER9
 NULL pointer NIP...)
To: Qian Cai <cai@lca.pw>, Russell Currey <ruscur@russell.cc>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
 <87eeszlb6u.fsf@mpe.ellerman.id.au>
 <0675B22E-8F32-432C-9378-FDE159DD1729@lca.pw>
 <20200407093054.3eb23e45@gandalf.local.home>
 <EA9F9A54-87BC-477A-BE8A-7D53F80C5223@lca.pw>
 <20200409101413.35d9c72d@gandalf.local.home>
 <06A2EA93-B730-4DB1-819F-D27E7032F0B3@lca.pw>
 <161662E3-5D9C-4C15-919C-CFEFE4CC35CB@lca.pw>
 <69F0448F-CA5B-497D-B8AF-2848175B9477@lca.pw>
 <1587106774.1oa2whm69m.naveen@linux.ibm.com>
 <AE9427F0-9C10-438B-8E57-3F1BF1834B9A@lca.pw>
In-Reply-To: <AE9427F0-9C10-438B-8E57-3F1BF1834B9A@lca.pw>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20041715-0016-0000-0000-000003064295
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041715-0017-0000-0000-0000336A4C57
Message-Id: <1587134631.z64z0frwv9.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_06:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=8
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170123
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
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai wrote:
>=20
>=20
>> On Apr 17, 2020, at 3:01 AM, Naveen N. Rao <naveen.n.rao@linux.ibm.com> =
wrote:
>>=20
>> Hi Qian,
>>=20
>> Qian Cai wrote:
>>> OK, reverted the commit,
>>> c55d7b5e6426 (=E2=80=9Cpowerpc: Remove STRICT_KERNEL_RWX incompatibilit=
y with RELOCATABLE=E2=80=9D)
>>> or set STRICT_KERNEL_RWX=3Dn fixed the crash below and also mentioned i=
n this thread,
>>> https://lore.kernel.org/lkml/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.p=
w/
>>=20
>> Do you see any errors logged in dmesg when you see the crash?  STRICT_KE=
RNEL_RWX changes how patch_instruction() works, so it would be interesting =
to see if there are any ftrace-related errors thrown before the crash.
>=20
> Yes, looks like there is a warning right after,
>=20
> echo function > /sys/kernel/debug/tracing/current_tracer
> echo nop > /sys/kernel/debug/tracing/current_tracer
>=20
> and just before the crash,
>=20
> [ T3454] ftrace-powerpc: Unexpected call sequence at 00000000de85f044: 48=
003d1d 7c0802a6
> [   56.870472][ T3454] ------------[ cut here ]------------
> [   56.870500][ T3454] WARNING: CPU: 52 PID: 3454 at kernel/trace/ftrace.=
c:2026 ftrace_bug+0x104/0x310
> [   56.870527][ T3454] Modules linked in: kvm_hv kvm ses enclosure scsi_t=
ransport_sas ip_tables x_tables xfs sd_mod i40e firmware_class aacraid dm_m=
irror dm_region_hash dm_log dm_mod
> [   56.870592][ T3454] CPU: 52 PID: 3454 Comm: nip.sh Not tainted 5.7.0-r=
c1-next-20200416 #4
> [   56.870627][ T3454] NIP:  c0000000002a3ae4 LR: c0000000002a47fc CTR: c=
0000000002436f0
> [   56.870661][ T3454] REGS: c00000069a9ef710 TRAP: 0700   Not tainted  (=
5.7.0-rc1-next-20200416)
> [   56.870697][ T3454] MSR:  900000000282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,=
DR,RI,LE>  CR: 28228222  XER: 00000000
> [   56.870748][ T3454] CFAR: c0000000002a3a2c IRQMASK: 0=20
> [   56.870748][ T3454] GPR00: c0000000002a47fc c00000069a9ef9a0 c00000000=
12f9000 ffffffffffffffea=20
> [   56.870748][ T3454] GPR04: c0002004e2160438 c0000007fedf0ad8 000000006=
14ca19d 0000000000000007=20
> [   56.870748][ T3454] GPR08: 0000000000000003 0000000000000000 000000000=
0000000 0000000000000002=20
> [   56.870748][ T3454] GPR12: 0000000000004000 c0000007fffd5600 000000004=
0000000 0000000139ae9798=20
> [   56.870748][ T3454] GPR16: 0000000139ae9724 0000000139a86968 000000013=
9a1f230 0000000139aed568=20
> [   56.870748][ T3454] GPR20: 00000001402af8b0 0000000000000009 000000013=
9a996e8 00007fffc9186d94=20
> [   56.870748][ T3454] GPR24: 0000000000000000 c00000069a9efc00 c00000000=
132cd00 c00000069a9efc40=20
> [   56.870748][ T3454] GPR28: c0000000011c29e8 0000000000000001 c0002004e=
2160438 c008000009321a64=20
> [   56.870969][ T3454] NIP [c0000000002a3ae4] ftrace_bug+0x104/0x310
> ftrace_bug at kernel/trace/ftrace.c:2026
> [   56.870995][ T3454] LR [c0000000002a47fc] ftrace_modify_all_code+0x16c=
/0x210
> ftrace_modify_all_code at kernel/trace/ftrace.c:2672
> [   56.871034][ T3454] Call Trace:
> [   56.871057][ T3454] [c00000069a9ef9a0] [4bffff899a9efa00] 0x4bffff899a=
9efa00 (unreliable)
> [   56.871086][ T3454] [c00000069a9efa20] [c0000000002a47fc] ftrace_modif=
y_all_code+0x16c/0x210
> [   56.871125][ T3454] [c00000069a9efa50] [c000000000061b68] arch_ftrace_=
update_code+0x18/0x30
> [   56.871162][ T3454] [c00000069a9efa70] [c0000000002a49c4] ftrace_run_u=
pdate_code+0x44/0xc0
> [   56.871199][ T3454] [c00000069a9efaa0] [c0000000002aa3c8] ftrace_start=
up+0xe8/0x1b0
> [   56.871236][ T3454] [c00000069a9efae0] [c0000000002aa4e0] register_ftr=
ace_function+0x50/0xc0
> [   56.871275][ T3454] [c00000069a9efb10] [c0000000002d0468] function_tra=
ce_init+0x98/0xd0
> [   56.871312][ T3454] [c00000069a9efb40] [c0000000002c75c0] tracing_set_=
tracer+0x350/0x640
> [   56.871349][ T3454] [c00000069a9efbe0] [c0000000002c7a90] tracing_set_=
trace_write+0x1e0/0x370
> [   56.871388][ T3454] [c00000069a9efd00] [c00000000052094c] __vfs_write+=
0x3c/0x70
> [   56.871424][ T3454] [c00000069a9efd20] [c000000000523d4c] vfs_write+0x=
cc/0x200
> [   56.871461][ T3454] [c00000069a9efd70] [c0000000005240ec] ksys_write+0=
x7c/0x140
> [   56.871498][ T3454] [c00000069a9efdc0] [c000000000038a94] system_call_=
exception+0x114/0x1e0
> [   56.871535][ T3454] [c00000069a9efe20] [c00000000000c870] system_call_=
common+0xf0/0x278
> [   56.871570][ T3454] Instruction dump:
> [   56.871592][ T3454] 7d908120 4e800020 60000000 2b890001 409effd4 3c62f=
f8b 38631958 4bf4491d=20
> [   56.871639][ T3454] 60000000 4bffffc0 60000000 fba10068 <0fe00000> 390=
00001 3ce20003 3d22fed7=20
> [   56.871685][ T3454] irq event stamp: 95388
> [   56.871708][ T3454] hardirqs last  enabled at (95387): [<c0000000001e4=
f94>] console_unlock+0x6a4/0x950
> [   56.871746][ T3454] hardirqs last disabled at (95388): [<c000000000009=
60c>] program_check_common_virt+0x2bc/0x310
> [   56.871785][ T3454] softirqs last  enabled at (91222): [<c000000000a21=
3c8>] __do_softirq+0x658/0x8d8
> [   56.871823][ T3454] softirqs last disabled at (91215): [<c00000000011b=
40c>] irq_exit+0x16c/0x1d0
> [   56.871859][ T3454] ---[ end trace 48f8445450a4e206 ]---
> [   56.871907][ T3454] ftrace failed to modify=20
> [   56.871913][ T3454] [<c008000009321a64>] show_sas_rphy_phy_identifier+=
0xc/0x60 [scsi_transport_sas]
> show_sas_rphy_phy_identifier at drivers/scsi/scsi_transport_sas.c:1221
> [   56.871969][ T3454]  actual:   1d:3d:00:48
> [   56.871996][ T3454] Setting ftrace call site to call ftrace function
> [   56.872020][ T3454] ftrace record flags: 80000001
> [   56.872054][ T3454]  (1) =20
> [   56.872054][ T3454]  expected tramp: c000000000061fac

Thanks. That confirms the problem.

In this particular case, we are unable to convert a module function to=20
call into ftrace_caller() since the _mcount() entry has not been nop-ed=20
out during module load. I suspect there might be another error/warning=20
earlier on indicating that failure. There are a few scenarios where we=20
are not propagating errors from patch_instruction() properly, so it is=20
possible that no errors were thrown previously. I will send a separate=20
set of patches to address that.

The reason for the original crash is a bit more subtle. On module load,=20
we patch _mcount() call sites of all the module functions with a nop. =20
However, with STRICT_KERNEL_RWX, one of these is failing. When that=20
happens, we end up continuing to call into _mcount(), which uses the=20
default module relocation stub, and not the special ftrace stub. The=20
default stub uses r2, which won't always be loaded with the module TOC=20
pointer with -mprofile-kernel. Instead, r2 likely points to the kernel=20
TOC, so we end up loading incorrect entries from the kernel TOC to=20
branch to. In all the traces we've seen so far, a kernel function has=20
called into a module function, wherein the module function does not set=20
up its own TOC (ext4_iomap_end(), find_free_cb()).

The core of the problem though is that patch_instruction() is failing in=20
certain scenarios. We need to find out why that is, and address that.

Russell,
You mentioned in the past that you identified an issue with=20
patch_instruction() during early boot:
http://lkml.kernel.org/r/c336400d5b7765eb72b3090cd9f8a3c57761d0b6.camel@rus=
sell.cc

Does that failure happen without STRICT_MODULE_RWX, with just=20
STRICT_KERNEL_RWX? That might be relevant here.


- Naveen

