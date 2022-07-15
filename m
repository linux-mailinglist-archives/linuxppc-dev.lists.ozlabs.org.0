Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16F5761DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 14:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkrVQ21fgz3cCc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 22:37:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VdnGppwc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VdnGppwc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkrTg33QHz3c1G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 22:37:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FC5bCe007742;
	Fri, 15 Jul 2022 12:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=QFI4HdS5nW/1YwyxtYgBSYN97hNea2MFZvGZ9zsBmzc=;
 b=VdnGppwcp5owmt3EeyuSxwElSzptvsdvlIYUJcsNlkTWoglXut3snwucW8wm9ror1+gN
 cAeU7F+wBB1cl7LuOBrMoYLiIBXO30yn1NYj7KJEuC7mLtKlqKgBCoknw2ZAzjq4o1Iu
 X6flkD9SBcfM9UQ+8KvOIS6UjrTj08cxG2/tXq2w+VfgLVBN10TtabJLOmBcsIl9ufFj
 /ouA3dlXZ1WTHaO3MCxJ75pSymmpHqG2tRhF0NW9g7UGwgCH8HqlPjTpn7lr1viiiNUo
 J+E65XtT/DsSOm0hwdZRWFdVhGLXJYBQQ8BEmuGqa4W2MPNf/ztAxY+B2NOSTb1SvaS2 Zg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb7xm0sv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 12:37:07 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26FCaQaB022883;
	Fri, 15 Jul 2022 12:37:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma02fra.de.ibm.com with ESMTP id 3hama9h8r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 12:37:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26FCb3Pm24772888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Jul 2022 12:37:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E34742045;
	Fri, 15 Jul 2022 12:37:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 850784203F;
	Fri, 15 Jul 2022 12:37:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.10])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 15 Jul 2022 12:37:02 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: Kernel crash(block/null_blk) while running blktests (block/10)
Message-Id: <9CCFA12F-603C-4C70-844F-83B5C9580BAB@linux.ibm.com>
Date: Fri, 15 Jul 2022 18:07:01 +0530
To: linux-block@vger.kernel.org, vincent.fu@samsung.com
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kC0omlGdZvdtU_noWsp7e5qdn6foHXs3
X-Proofpoint-ORIG-GUID: kC0omlGdZvdtU_noWsp7e5qdn6foHXs3
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=978
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207150050
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running blktests[*] (block/10) on a IBM Power server booted with
5.19.0-rc6-next-20220714 following crash is seen:

[ 9089.636612] null_blk: disk nullb30 created
[ 9089.640752] null_blk: disk nullb31 created
[ 9089.640759] null_blk: module loaded
[ 9134.099371] Kernel attempted to read user page (0) - exploit attempt? (u=
id: 0)
[ 9134.099396] BUG: Kernel NULL pointer dereference on read at 0x00000000
[ 9134.099401] Faulting instruction address: 0xc0080000064b254c
[ 9134.099407] Oops: Kernel access of bad area, sig: 11 [#1]
[ 9134.099411] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
[ 9134.099417] Modules linked in: null_blk(E+) xfs(E) dm_delay(E) overlay(E=
) dm_thin_pool(E) dm_persistent_data(E) dm_bio_prison(E) dm_flakey(E) dm_sn=
apshot(E) dm_bufio(E) dm_zero(E) loop(E) dm_mod(E) nft_fib_inet(E) nft_fib_=
ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_=
reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntr=
ack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) ip_set(E) bonding(E) rfkill(E) t=
ls(E) nf_tables(E) libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_c=
rypto(E) ext4(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) sg(E) lpfc=
(E) nvmet_fc(E) nvmet(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) nvme_=
fc(E) nvme(E) nvme_fabrics(E) nvme_core(E) t10_pi(E) scsi_transport_fc(E) c=
rc64_rocksoft(E) crc64(E) tg3(E) ipmi_devintf(E) ipmi_msghandler(E) fuse(E)=
 [last unloaded: null_blk]
[ 9134.099502] CPU: 26 PID: 2910448 Comm: modprobe Tainted: G            E =
     5.19.0-rc6-next-20220714 #2
[ 9134.099510] NIP:  c0080000064b254c LR: c0080000064b907c CTR: c0080000064=
b8e80
[ 9134.099515] REGS: c000000091573600 TRAP: 0300   Tainted: G            E =
      (5.19.0-rc6-next-20220714)
[ 9134.099520] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24222=
424  XER: 00000000
[ 9134.099534] CFAR: c00000000000c9dc DAR: 0000000000000000 DSISR: 40000000=
 IRQMASK: 0=20
[ 9134.099534] GPR00: c0080000064b907c c0000000915738a0 c0080000064e8100 00=
00000000000000=20
[ 9134.099534] GPR04: c0080000064e18e0 0000000000000cc0 0000000000000040 ff=
ffffffffffffff=20
[ 9134.099534] GPR08: 0000000000000058 0000000000000001 0000000000000001 00=
000000000168a9=20
[ 9134.099534] GPR12: c0080000064b8e80 c00000001ec20700 c000000091573d00 00=
0001000c370950=20
[ 9134.099534] GPR16: 000000000000ff20 c008000006243060 c008000006240000 00=
00000000003078=20
[ 9134.099534] GPR20: 0000000000000001 c000000091573bc0 c0080000064e1488 00=
00000000000000=20
[ 9134.099534] GPR24: 0000000000000000 c000000002960e40 c000000002960e70 c0=
080000064e1480=20
[ 9134.099534] GPR28: 0000000000000000 ffffffffffffffff c0080000064e1880 c0=
080000064e02a8=20
[ 9134.099598] NIP [c0080000064b254c] null_init_tag_set+0x74/0x180 [null_bl=
k]
[ 9134.099610] LR [c0080000064b907c] null_init+0x1fc/0x354 [null_blk]
[ 9134.099619] Call Trace:
[ 9134.099622] [c0000000915738a0] [c0000000915738e0] 0xc0000000915738e0 (un=
reliable)
[ 9134.099630] [c0000000915738c0] [c0080000064b907c] null_init+0x1fc/0x354 =
[null_blk]
[ 9134.099640] [c000000091573960] [c000000000011ff4] do_one_initcall+0x64/0=
x300
[ 9134.099650] [c000000091573a30] [c0000000002365bc] do_init_module+0x6c/0x=
2d0
[ 9134.099659] [c000000091573ab0] [c000000000239a54] load_module+0x1ed4/0x2=
290
[ 9134.099667] [c000000091573c90] [c00000000023a170] __do_sys_finit_module+=
0xe0/0x180
[ 9134.099675] [c000000091573db0] [c000000000032e7c] system_call_exception+=
0x17c/0x350
[ 9134.099683] [c000000091573e10] [c00000000000c53c] system_call_common+0xe=
c/0x270
[ 9134.099692] --- interrupt: c00 at 0x7fffa0edf164
[ 9134.099696] NIP:  00007fffa0edf164 LR: 00000001212e04fc CTR: 00000000000=
00000
[ 9134.099701] REGS: c000000091573e80 TRAP: 0c00   Tainted: G            E =
      (5.19.0-rc6-next-20220714)
[ 9134.099706] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 282=
22244  XER: 00000000
[ 9134.099720] IRQMASK: 0=20
[ 9134.099720] GPR00: 0000000000000161 00007fffe62a6870 00007fffa0fb7300 00=
00000000000003=20
[ 9134.099720] GPR04: 000001000c370ec0 0000000000000000 0000000000000003 00=
00000000000000=20
[ 9134.099720] GPR08: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[ 9134.099720] GPR12: 0000000000000000 00007fffa14bca50 0000000000040000 00=
0001000c370950=20
[ 9134.099720] GPR16: 000001000c370950 0000000000000020 000001000c370950 00=
00000000000000=20
[ 9134.099720] GPR20: 0000000000000000 000000000000003a 000001000c370cb0 00=
0000000000003a=20
[ 9134.099720] GPR24: 00000001212eb068 000001000c370950 0000000000000000 00=
0001000c370dc0=20
[ 9134.099720] GPR28: 000001000c370ec0 0000000000040000 0000000000000000 00=
0001000c370cb0=20
[ 9134.099779] NIP [00007fffa0edf164] 0x7fffa0edf164
[ 9134.099783] LR [00000001212e04fc] 0x1212e04fc
[ 9134.099787] --- interrupt: c00
[ 9134.099790] Instruction dump:
[ 9134.099793] 7d0907b4 2ea90000 409600ec 814a0150 91440044 e9430000 e8ea01=
3e 39000058=20
[ 9134.099804] 39400001 90e40050 9104004c 91440058 <e9030000> 89480163 2f8a=
0000 419e0010=20
[ 9134.099817] ---[ end trace 0000000000000000 ]---
[ 9134.116174]=20
[ 9135.116180] Kernel panic - not syncing: Fatal exception

This regression was introduced in 5.19.0-rc6-next-20220713, next-20220712
build was good.

Git bisect leads me to following patch -

commit 37ae152c7a0d
     null_blk: add configfs variables for 2 options

Reverting this patch allows me to run the blktests to completion.

- Sachin

[*] -> https://github.com/osandov/blktests/=
