Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD44E1AA1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 08:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLpkt6v25z3bNy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 18:08:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n69hibcg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n69hibcg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLpk46HqZz2x9Q
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 18:08:11 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22JNj1aF018087; 
 Sun, 20 Mar 2022 07:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=A0eg8b4O6k1NtRGuYufdR9QIIZsm6T9Qq009pDIYFX4=;
 b=n69hibcgmrdo3LgwRx6+tGoz1/TjWxhFmoAJF9YtO1cMh4G0XOJwwv+1d7RikkpzYFOb
 P5rxu63u3MKueOfyrxEq67ST08YY17Wfa5ws3PIYRxzcLJfxy5jiYSraSkOoaApKGcXZ
 YJJLk2H5y2lJhegqVjrKzSOxf8RjcdEeBTDrkSgA82RVCtqhk/0Ds0/aYWx3dh1lRMBq
 4FaHSsto7OAxfNfjk6CZCtXkjbDFI5RTCpErFhA3zYpNvXb0tjF4f7Sp6DbQI6v7tGOR
 RkyF1yiayG3cZN96ed/9b8u1+wR8n+0kLiwmoI9tEMrkxrW+0R5TN6q1xUUHGV1L6ZcJ 4w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ews4duyhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Mar 2022 07:08:02 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22K74CY2015557;
 Sun, 20 Mar 2022 07:08:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3ew6t8hfwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Mar 2022 07:08:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22K77uCa35389842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Mar 2022 07:07:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1765A4040;
 Sun, 20 Mar 2022 07:07:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02316A404D;
 Sun, 20 Mar 2022 07:07:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.34.150])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 20 Mar 2022 07:07:55 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH] powerpc/pseries: Fix use after free in
 remove_phb_dynamic()
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220318034219.1188008-1-mpe@ellerman.id.au>
Date: Sun, 20 Mar 2022 12:37:54 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A815387-773D-413C-B0AE-2630F434FA8C@linux.ibm.com>
References: <20220318034219.1188008-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bfFbJZrWk70385KgjpPj25DVFhmOyEko
X-Proofpoint-GUID: bfFbJZrWk70385KgjpPj25DVFhmOyEko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-20_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203200051
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
Cc: linuxppc-dev@lists.ozlabs.org, zdai@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 18-Mar-2022, at 9:12 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
> To avoid it, we can take a reference to the host_bridge->dev until =
we're
> done using phb. Then when we drop the reference the phb will be freed.
>=20
> Fixes: 2dd9c11b9d4d ("powerpc/pseries: use =
pci_host_bridge.release_fn() to kfree(phb)")
> Reported-by: David Dai <zdai@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> =E2=80=94
Verified successfully with 5.17.0-rc8-00061-g34e047aa16c0 + patch.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Without this patch:

# drmgr -c phb -s "PHB 18" -r -d 5
[  178.107171] rpaphp: RPA HOT Plug PCI Controller Driver version: 0.1
[  178.107429] rpaphp: Slot [U78D8.ND0.FGD003M-P0-C2-C0] registered
[  178.107578] rpaphp: Slot [U78D8.ND0.FGD003M-P0-C3-C0] registered
[  178.107721] rpaphp: Slot [U78D8.ND0.FGD003M-P0-C4-C0] registered
[  178.196960] pci_bus 0012:01: busn_res: [bus 01-ff] is released
[  178.197040] BUG: Unable to handle kernel data access on read at =
0x6b6b6b6b6b6b6ba3
[  178.197045] Faulting instruction address: 0xc000000000181068
[  178.197049] Oops: Kernel access of bad area, sig: 11 [#1]
[  178.197051] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[  178.197056] Modules linked in: rpadlpar_io rpaphp dm_mod nft_fib_inet =
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 =
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 rfkill bonding ip_set tls nf_tables =
nfnetlink sunrpc pseries_rng drm drm_panel_orientation_quirks xfs =
libcrc32c sr_mod sd_mod cdrom t10_pi sg ibmvscsi scsi_transport_srp =
ibmveth xts vmx_crypto fuse
[  178.197086] CPU: 15 PID: 10565 Comm: drmgr Not tainted =
5.17.0-rc8-00061-g34e047aa16c0 #1
[  178.197091] NIP:  c000000000181068 LR: c000000000181060 CTR: =
0000000000000000
[  178.197094] REGS: c00000002af5b700 TRAP: 0380   Not tainted  =
(5.17.0-rc8-00061-g34e047aa16c0)
[  178.197097] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
24088220  XER: 20040003
[  178.197105] CFAR: c000000000f60564 IRQMASK: 0=20
[  178.197105] GPR00: c000000000181060 c00000002af5b9a0 c000000002a78c00 =
c000000002b79d50=20
[  178.197105] GPR04: 0000000000000000 c00c00000015b348 c00c000000030288 =
0000000000000000=20
[  178.197105] GPR08: 00000000000000ff 0000000000000100 6b6b6b6b6b6b6b6b =
0000000000008000=20
[  178.197105] GPR12: c000000000260940 c000000a5ffedb00 0000000000000000 =
0000000107a8f0f0=20
[  178.197105] GPR16: 0000000000000006 0000000000000003 0000000000000002 =
0000000000000004=20
[  178.197105] GPR20: 0000000000000005 0000000107a8ede8 0000000107a8c5a8 =
c000000002abae85=20
[  178.197105] GPR24: 0000000000000000 0000000000000001 c00000000cabd078 =
c00000000c50ac00=20
[  178.197105] GPR28: 0000000000000000 c000000a851cac00 c00000000c501c00 =
c00000000c501d38=20
[  178.197139] NIP [c000000000181068] release_resource+0x38/0xf0
[  178.197146] LR [c000000000181060] release_resource+0x30/0xf0
[  178.197149] Call Trace:
[  178.197151] [c00000002af5b9a0] [c0000000008c4814] =
pci_remove_bus+0xf4/0x110 (unreliable)
[  178.197156] [c00000002af5b9d0] [c00000000011a018] =
remove_phb_dynamic+0x178/0x190
[  178.197161] [c00000002af5ba50] [c0080000086f09e8] =
dlpar_remove_slot+0x1d0/0x250 [rpadlpar_io]
[  178.197166] [c00000002af5baf0] [c0080000086f0b5c] =
remove_slot_store+0xa4/0x160 [rpadlpar_io]
[  178.197170] [c00000002af5bb80] [c00000000088a6dc] =
kobj_attr_store+0x2c/0x50
[  178.197174] [c00000002af5bba0] [c0000000006b19e4] =
sysfs_kf_write+0x64/0x80
[  178.197179] [c00000002af5bbc0] [c0000000006b0e0c] =
kernfs_fop_write_iter+0x1bc/0x2b0
[  178.197183] [c00000002af5bc10] [c0000000005816a4] =
new_sync_write+0x124/0x1c0
[  178.197187] [c00000002af5bcb0] [c000000000585954] =
vfs_write+0x2c4/0x390
[  178.197190] [c00000002af5bd00] [c000000000585d24] =
ksys_write+0x84/0x140
[  178.197194] [c00000002af5bd50] [c000000000037024] =
system_call_exception+0x254/0x550
[  178.197198] [c00000002af5be10] [c00000000000bfe8] =
system_call_vectored_common+0xe8/0x278
[  178.197203] --- interrupt: 3000 at 0x7fffa7118774
[  178.197206] NIP:  00007fffa7118774 LR: 0000000000000000 CTR: =
0000000000000000
[  178.197208] REGS: c00000002af5be80 TRAP: 3000   Not tainted  =
(5.17.0-rc8-00061-g34e047aa16c0)
[  178.197211] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44084404  XER: 00000000
[  178.197220] IRQMASK: 0=20
[  178.197220] GPR00: 0000000000000004 00007ffff50a4ae0 00007fffa7227100 =
0000000000000006=20
[  178.197220] GPR04: 0000000140744930 0000000000000006 0000000000000000 =
0000000000000001=20
[  178.197220] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  178.197220] GPR12: 0000000000000000 00007fffa733b100 0000000000000000 =
0000000107a8f0f0=20
[  178.197220] GPR16: 0000000000000006 0000000000000003 0000000000000002 =
0000000000000004=20
[  178.197220] GPR20: 0000000000000005 0000000107a8ede8 0000000107a8c5a8 =
0000000107a8d3a0=20
[  178.197220] GPR24: 0000000000000006 0000000107a8b3c0 0000000140744930 =
0000000000000006=20
[  178.197220] GPR28: 0000000000000006 00000001407202a0 0000000140744930 =
0000000000000006=20
[  178.197251] NIP [00007fffa7118774] 0x7fffa7118774
[  178.197254] LR [0000000000000000] 0x0
[  178.197255] --- interrupt: 3000
[  178.197257] Instruction dump:
[  178.197259] 7c0802a6 60000000 7c0802a6 fbe1fff8 7c7f1b78 3c620010 =
38631150 f8010010=20
[  178.197265] f821ffd1 48ddf4dd 60000000 e95f0028 <e92a0038> 2c290000 =
41820028 7c3f4840=20
[  178.197273] ---[ end trace 0000000000000000 ]---

With the patch applied both add and remove operation works correctly.

# lsslot -c phb | grep 18
PHB 18    /pci@800000020000012 U78D8.ND0.FGD003M-P0-C2-C0
# drmgr -c phb -s "PHB 18" -r -d 5

########## Mar 20 02:58:53 2022 ##########
drmgr: -c phb -s PHB 18 -r -d 5=20
Validating PHB DLPAR capability...yes.
Getting node types 0x00000010
=E2=80=A6=E2=80=A6..
Retrieving hotplug nodes
hp adapter status for U78D8.ND0.FGD003M-P0-C2-C0 is 0
setting hp adapter status to UNCONFIG adapter for =
U78D8.ND0.FGD003M-P0-C2-C0
hp adapter status for U78D8.ND0.FGD003M-P0-C2-C0 is 0
performing kernel op for PHB 18, file is =
/sys/bus/pci/slots/control/remove_slot
Removing device-tree node /proc/device-tree/pci@800000020000012
Removing device-tree node =
/proc/device-tree/interrupt-controller@800000025000012
Releasing drc index 0x20000012
get-sensor for 20000012: 0, 1
Setting isolation state to 'isolate'
Setting allocation state to 'alloc unusable'
get-sensor for 20000012: 0, 2
drc_index 20000012 sensor-state: 2
Resource is not available to the partition.
########## Mar 20 02:58:54 2022 ##########
# lsslot -c phb | grep 18=20
#  drmgr -c phb -s "PHB 18" -a -d 5

########## Mar 20 03:00:16 2022 ##########
drmgr: -c phb -s PHB 18 -a -d 5=20
Validating PHB DLPAR capability...yes.
Getting node types 0x00000010

=E2=80=A6..
get-sensor for 22010012: 0, 0
performing kernel op for PHB 18, file is =
/sys/bus/pci/slots/control/add_slot
########## Mar 20 03:00:19 2022 ##########
# lsslot -c phb | grep 18
PHB 18    /pci@800000020000012 U78D8.ND0.FGD003M-P0-C2-C0
#=20


- Sachin=
